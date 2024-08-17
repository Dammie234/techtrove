<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Str;
use Image;

class ProductController extends Controller
{
    function index() {
        $products = Product::orderBy('id', 'desc')->get();
        return response()->json($products);
    }

    function store(Request $request) {
        $this->validate($request, [
            'category' => 'required|string',
            'name' => 'required|string|unique:products',
            'price' => 'required',
            'sku' => 'required|string',
            'qty' => 'required|numeric',
            'short_description' => 'required|string',
            'description' => 'required|string',
            'additional_information' => 'required|string'
        ]);

        $data = [
            'category_id' => $request->category,
            'name' => $request->name,
            'slug' => Str::slug($request->name, '-'),
            'sku' => $request->sku,
            'qty' => $request->qty,
            'featured' => $request->featured,
            'price' => $request->price,
            'sales_price' => $request->sales_price,
            'short_description' => $request->short_description,
            'description' => $request->description,
            'additional_information' => $request->additional_information,
            'counts' => 0
        ];
         if (isset($request->image)) {
            $image = $request->image;
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];

            $image_name = Str::random(10) . "." . $ext;
            $img = Image::make($image)->resize(580, 670);
            $upload_path = 'images/products/';
            $image_url = $upload_path . $image_name;
            $img->save($image_url);
            $data['image'] = $image_url;
        }

        Product::create($data);
        $category = Category::where('id', $request->category)->first();
        Category::where('id', $request->category)->update([
            'counts' => $category->counts++
        ]);
        return response()->json(['message' => 'Product successfully added']);
    }

    function show($id) {
        $product = Product::where('id', $id)->first();
        return response()->json($product);
    }

    function update(Request $request, $id) {
        $this->validate($request, [
            'category' => 'required|string',
            'name' => 'required|string',
            'price' => 'required',
            'sku' => 'required|string',
            'qty' => 'required|numeric',
            'short_description' => 'required|string',
            'description' => 'required|string',
            'additional_information' => 'required|string'
        ]);

        $data = [
            'category_id' => $request->category,
            'name' => $request->name,
            'slug' => Str::slug($request->name, '-'),
            'sku' => $request->sku,
            'qty' => $request->qty,
            'price' => $request->price,
            'featured' => $request->featured,
            'sales_price' => $request->sales_price,
            'short_description' => $request->short_description,
            'description' => $request->description,
            'additional_information' => $request->additional_information
        ];
         if (isset($request->image)) {
            $image = $request->image;
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];

            $image_name = Str::random(10) . "." . $ext;
            $img = Image::make($image)->resize(580, 670);
            $upload_path = 'images/products/';
            $image_url = $upload_path . $image_name;
            $img->save($image_url);
            $success = $data['image'] = $image_url;
            if($success){
                $product = Product::where('id', $id)->first();
                if($product->image){
                    unlink($product->image);
                }
            }
        }

        Product::where('id', $id)->update($data);
        return response()->json(['message' => 'Product successfully updated']);
    }

    function destroy($id) {
        $product = Product::where('id', $id)->first();
        if($product->image){
            unlink($product->image);
        }
        Product::where('id', $id)->delete();
        return response()->json(['message' => 'Product successfully deleted']);
    }
}
