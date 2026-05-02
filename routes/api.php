<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ContactController;
use App\Http\Controllers\Api\SettingController;


// Products
Route::get('products', [ProductController::class, 'index']);
Route::get('/featured', [ProductController::class, 'featured']);
Route::get('products/{slug}', [ProductController::class, 'show']);
Route::get('categories', [ProductController::class, 'categories']);
Route::get('brands', [ProductController::class, 'brands']);
Route::get('banners', [ProductController::class, 'banners']);

// Cart
Route::get('cart', [CartController::class, 'index']);
Route::get('cart/count', [CartController::class, 'count']);
Route::post('cart/add', [CartController::class, 'store']);
Route::put('cart/{id}', [CartController::class, 'update']);
Route::delete('cart/{id}', [CartController::class, 'destroy']);
Route::delete('cart', [CartController::class, 'clear']);

// Orders
Route::post('orders', [OrderController::class, 'store']);
Route::get('orders', [OrderController::class, 'index']);
Route::get('orders/{id}', [OrderController::class, 'show']);

//Contact
Route::post('/contact', [ContactController::class, 'store']);


//Settings
Route::get('settings', [SettingController::class, 'index']);
Route::get('settings/{key}', [SettingController::class, 'show']);
