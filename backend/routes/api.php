<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\FrontendController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\BillingController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::get('categories', [CategoryController::class, 'index']);
Route::get('few-categories', [CategoryController::class, 'fewCategories']);

Route::get('frontend-products', [FrontendController::class, 'products']);
Route::get('category-products/{slug}', [FrontendController::class, 'categoryProducts']);
Route::get('product-details/{slug}', [FrontendController::class, 'productDetails']);
Route::get('search-products/{search}', [FrontendController::class, 'searchProducts']);
Route::get('new-products', [FrontendController::class, 'newProducts']);
Route::get('featured-products', [FrontendController::class, 'featuredProducts']);

Route::get('add-to-cart/{product_id}/{key}', [CartController::class, 'addToCart']);
Route::get('add-product-to-cart/{product_id}/{qty}/{key}', [CartController::class, 'addProductToCart']);
Route::get('carts/{key}', [CartController::class, 'carts']);
Route::get('increment-cart/{product_id}/{key}', [CartController::class, 'incrementCart']);
Route::get('decrement-cart/{product_id}/{key}', [CartController::class, 'decrementCart']);
Route::get('remove-from-cart/{product_id}/{key}', [CartController::class, 'removeFromCart']);

Route::post('place-order', [BillingController::class, 'store']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('user', [AuthController::class, 'user']);
    Route::post('logout', [AuthController::class, 'logout']);

    Route::get('categories/{id}', [CategoryController::class, 'show']);
    Route::post('categories', [CategoryController::class, 'store']);
    Route::patch('categories/{id}', [CategoryController::class, 'update']);

    Route::get('products', [ProductController::class, 'index']);
    Route::post('products', [ProductController::class, 'store']);
    Route::get('products/{id}', [ProductController::class, 'show']);
    Route::patch('products/{id}', [ProductController::class, 'update']);
    Route::delete('products/{id}', [ProductController::class, 'destroy']);

    Route::get('billings', [BillingController::class, 'index']);
    Route::get('billings/{id}', [BillingController::class, 'show']);
    Route::get('orders/{id}', [BillingController::class, 'orders']);
    Route::get('approve-billing/{id}', [BillingController::class, 'approveBilling']);
    Route::get('my-billings', [BillingController::class, 'myBillings']);

});

