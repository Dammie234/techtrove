<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Cart;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
     function addToCart($product_id, $key) {
        $product = Product::where('id', $product_id)->first();

        $carts = Cart::where(['key' => $key, 'product_id' => $product_id])->get();
        if (count($carts) != 0) {
            Cart::where('key', $key)->delete();
        }
        $data = [
             'product_id' => $product_id,
            'quantity' => 1,
            'price' => $product->sales_price,
            'sub_total' => $product->sales_price,
            'key' => $key
        ];

        Cart::create($data);
        return response(['message' => "Successfully Added"]);
    }
    function addProductToCart($product_id, $qty, $key)  {
        $product = Product::where('id', $product_id)->first();
        $data = [
             'product_id' => $product_id,
            'quantity' => $qty,
            'price' => $product->sales_price,
            'sub_total' => $product->sales_price * $qty,
            'key' => $key
        ];
        $carts = Cart::where(['key' => $key, 'product_id' => $product_id])->get();
        if (count($carts) == 0) {
            Cart::create($data);
            return response(['message' => "Successfully Added"]);
        }else{
            return response(['message' => "Product Already Added"], Response::HTTP_BAD_REQUEST);
        }
    }
    function carts($key) {

         $carts = DB::table('carts')
                    ->leftJoin('products', 'products.id', '=', 'carts.product_id')
                    ->where('carts.key', $key)
                    ->select('products.name', 'products.image', 'products.slug', 'carts.*')
                    ->get();
        return response()->json($carts);
    }
    function incrementCart( $product_id, $key) {
        $cart = Cart::where(['product_id' => $product_id, 'key' => $key])->first();
        $sub_total = $cart->sub_total + $cart->price;
        Cart::where(['product_id' => $product_id, 'key' => $key])->update([
            'quantity' => $cart->quantity + 1,
            'sub_total' => $sub_total
        ]);
        return response(['message' => 'Cart successfully updated']);
    }
    function decrementCart($product_id, $key) {

        $cart = Cart::where(['product_id' => $product_id, 'key' => $key])->first();
        if ($cart->quantity > 1) {
            $sub_total = $cart->sub_total - $cart->price;
            Cart::where(['product_id' => $product_id, 'key' => $key])->update([
                'quantity' => $cart->quantity - 1,
                'sub_total' => $sub_total
            ]);
            return response(['message' => 'Cart successfully updated']);
        } else {
             return response(['message' => 'Cart was not successfully updated']);
        }
    }
    function removeFromCart( $product_id, $key) {

         Cart::where(['product_id' => $product_id, 'key' => $key])->delete();
         return response(['message' => 'Product successfully removed from cart']);
    }
}
