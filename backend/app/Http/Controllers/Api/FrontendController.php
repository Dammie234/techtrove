<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Category;
use App\Models\Product;

class FrontendController extends Controller
{
    function products() {
        $products = DB::table('products')
                        ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
                        ->select('categories.title as category', 'categories.slug as cat_slug', 'products.*')
                        ->orderBy('products.id', 'desc')
                        ->get();
        return response()->json($products);
    }

    function categoryProducts($slug) {
        $category = Category::where('slug', $slug)->first();
        $products = Product::where('category_id', $category->id)->orderBy('products.id', 'desc')->get();
        return response()->json(['category' => $category, 'products' => $products]);
    }

    function newProducts() {
        $products = DB::table('products')
                        ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
                        ->select('categories.title as category', 'categories.slug as cat_slug', 'products.*')
                        ->orderBy('products.id', 'desc')
                        ->take(4)
                        ->get();
        return response()->json($products);
    }

    function featuredProducts() {
        $products = DB::table('products')
                        ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
                        ->where('products.featured', true)
                        ->select('categories.title as category', 'categories.slug as cat_slug', 'products.*')
                        ->orderBy('products.id', 'desc')
                        ->take(4)
                        ->get();
        return response()->json($products);
    }

    function productDetails($slug) {
         $product = DB::table('products')
                        ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
                        ->select('categories.title as category', 'categories.slug as cat_slug', 'products.*')
                        ->where('products.slug', $slug)
                        ->first();
        return response()->json($product);
    }

    function searchProducts($search) {
        $products = DB::table('products')
                        ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
                        ->where('products.name', 'like', '%' . $search . '%')
                        ->select('categories.title as category', 'categories.slug as cat_slug', 'products.*')
                        ->get();
        return response()->json($products);
    }
}
