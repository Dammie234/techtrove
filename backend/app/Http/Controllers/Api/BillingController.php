<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Billing;
use Illuminate\Support\Str;
use Image;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderMail;
use App\Mail\AdminOrderMail;
use App\Models\Cart;
use App\Models\Order;
use App\Mail\ApproveBillingMail;
use Illuminate\Support\Facades\Auth;

class BillingController extends Controller
{
    function store(Request $request)  {
        $this->validate($request, [
            'lastname' => 'required|string',
            'firstname' => 'required|string',
            'country' => 'required|string',
            'street_address' => 'required|string',
            'city' => 'required|string',
            'state' => 'required|string',
            'postal_code' => 'required|string',
            'phone' => 'required|string',
            'email' => 'required|string'
        ]);
        $data = [
            'lastname' => $request->lastname,
            'firstname' => $request->firstname,
            'company_name' => $request->company_name,
            'country' => $request->country,
            'street_address' => $request->street_address,
            'city' => $request->city,
            'state' => $request->state,
            'postal_code' => $request->postal_code,
            'phone' => $request->phone,
            'email' => $request->email,
            'total' => $request->total,
            'payment_type' => $request->payment_type,
            'delivery_fee' => $request->delivery_fee,
            'notes' => $request->notes
        ];
        if (isset($request->payment_image)) {
            $image = $request->payment_image;
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];

            $image_name = Str::random(10) . "." . $ext;
            $img = Image::make($image)->resize(600, 600);
            $upload_path = 'images/payment_slips/';
            $image_url = $upload_path . $image_name;
            $img->save($image_url);
            $data['payment_image'] = $image_url;
        }
        $billing = Billing::create($data);
        $key = $request->key;
        $carts = Cart::where('key', $key)->get();
        foreach ($carts as $cart) {
            Order::create([
                'billing_id' => $billing->id,
                'product_id' => $cart->product_id,
                'quantity' => $cart->quantity,
                'price' => $cart->price,
                'sub_total' => $cart->sub_total
            ]);
        }
         Cart::where('key', $key)->delete();
        // send mail
        $orders = DB::table('orders')
                    ->leftJoin('products', 'products.id', '=', 'orders.product_id')
                    ->where('orders.billing_id', $billing->id)
                    ->select('products.name', 'products.image', 'orders.*')
                    ->get();
        $data = [
            'name' => $request->lastname . ' ' . $request->firstname,
            'orders' => $orders,
            'duration' => $request->duration,
            'delivery_fee' => $request->delivery_fee,
            'total' => $request->total
        ];
        $email = 'lollies@yahoo.com';
        Mail::to($request->email)->send(new OrderMail($data));
        Mail::to($email)->send(new AdminOrderMail($data));

        if (isset($request->password)) {
            $user = User::where('email', $request->email)->first();
            if (!$user) {
                User::create([
                    'name' => $request->firstname . ' ' . $request->lastname,
                    'email' => $request->email,
                    'role' => 2,
                    'password' => Hash::make($request->password)
                ]);

                return response()->json(['message' => 'Billing successfully created. Waiting for approval. Account also created.']);
            }
        }

        return response()->json(['message' => 'Billing successfully created. Waiting for approval']);

    }

    function index() {
        $billings = Billing::orderBy('id', 'desc')->get();
        return response()->json($billings);
    }
    function show($id){
        $billing = Billing::where('id', $id)->first();
        return response()->json($billing);
    }
    function orders($id) {
        $orders = DB::table('orders')
                    ->leftJoin('products', 'products.id', '=', 'orders.product_id')
                    ->where('orders.billing_id', $id)
                    ->select('products.name', 'products.image', 'orders.*')
                    ->get();
        return response()->json($orders);
    }

    function approveBilling($id) {
        Billing::where('id', $id)->update([
            'payment_approval' => true
        ]);

        $billing = Billing::where('id', $id)->first();
        // send mail
        $orders = DB::table('orders')
                    ->leftJoin('products', 'products.id', '=', 'orders.product_id')
                    ->where('orders.billing_id', $billing->id)
                    ->select('products.name', 'products.image', 'orders.*')
                    ->get();
        $data = [
            'name' => $billing->lastname . ' ' . $billing->firstname,
            'orders' => $orders,
            'delivery_fee' => $billing->delivery_fee,
            'total' => $billing->total
        ];

        Mail::to($billing->email)->send(new ApproveBillingMail($data));
        return response()->json(['message' => 'Payment successfully approved']);
    }

    function myBillings() {
        $user = Auth::user();
        $billings = Billing::where('email', $user->email)->orderBy('id', 'desc')->get();

        return response()->json($billings);
    }
}
