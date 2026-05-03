<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $products = Product::where('is_active', 1);

        //Filter by category
        if($request->category_id) {
            $products = $products->where('category_id', $request->category_id);
        }
        //Filter brand id
        if($request->brand_id) {
            $products = $products->where('brand_id', $request->brand_id);
        }

        //search
        if($request->search) {
            $products = $products->where('name', 'like', '%' . $request->search . '%');
        }

        $products = $products->get()->map(function ($product) {
            return [
                'id' => $product->id,
                'name' => $product->name,
                'slug' => $product->slug,
                'price' => $product->price,
                'sale_price' => $product->sale_price,
                'image' => $product->image ? asset('storage/' . $product->image) : null,
            ];
        });


        return response()->json($products);
    }

    public function topProducts()
    {
        $products = Product::where('is_active', 1)
            ->select('id', 'name', 'slug', 'image')
            ->whereHas('orderItems', function($query) {
                $query->whereHas('order', function($q) {
                    $q->where('status', 'completed');
                });
            })
            ->withSum(['orderItems as total_sold' => function($query) {
                $query->whereHas('order', function($q) {
                    $q->where('status', 'completed');
                });
            }], 'quantity')
            ->orderBy('total_sold', 'desc')
            ->take(4)
            ->get()
            ->map(function ($product) {
                 $product->image = $product->image ? asset('storage/' . $product->image) : null;
                 return $product;
            });

        return $products;
    }

    public function relatedProducts($productId)
    {
        $product = Product::findOrFail($productId);
        $related = Product::where('is_active',1)
            ->select('id', 'name', 'slug', 'image', 'price', 'sale_price')
            ->where('id', '!=', $productId)
            ->where('category_id', $product->category_id)
            ->limit(8)
            ->get()
            ->map(function ($product) {
                $product->image = $product->image ? asset('storage/' . $product->image) : null;
                return $product;
            });
        return $related;
    }

    public function featured(Request $request)
    {
        $products = Product::where('is_active', 1)
            ->where('is_featured', 1)
            ->take(8)
            ->get()
            ->map(function ($product) {
                return [
                    'id' => $product->id,
                    'slug' => $product->slug,
                    'name' => $product->name,
                    'description' => $product->description,
                    'price' => $product->price,
                    'sale_price' => $product->sale_price,
                    'image' => $product->image ? asset('storage/' . $product->image) : null,
                ];
            });

        return response()->json([
            'success' => true,
            'data' => $products
        ]);
    }

    // Single product
    public function show(string $slug)
    {
        $product = Product::with(['category', 'brand'])
            ->where('slug', $slug)
            ->where('is_active', 1)
            ->first();

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        $product->image = $product->image ? asset('storage/' . $product->image) : null;

        if ($product->category && $product->category->image) {
            $product->category->image = asset('storage/' . $product->category->image);
        }

        // Also fix brand logo
        if ($product->brand && $product->brand->logo) {
            $product->brand->logo = asset('storage/' . $product->brand->logo);
        }

        return response()->json($product);
    }
    // Categories
    public function categories()
    {
        $categories = Category::where('is_active', true)->get();
        return response()->json($categories);
    }

    // Brands
    public function brands()
    {
        $brands = Brand::where('is_active', true)->get();
        return response()->json($brands);
    }


    //Banner

    public function banners()
    {
        $banners = Banner::where('is_active', true)
            ->where(function ($q){
                $q->whereNull('start_date')->orWhere('start_date', '<=', now());
            })->where(function ($q){
                $q->whereNull('end_date')->orWhere('end_date', '>=', now());
            })
            ->orderBy('sort_order')
            ->get()
            ->map(function ($banner) {
                return [
                    'id' => $banner->id,
                    'title' => $banner->title,
                    'subtitle' => $banner->subtitle,
                    'image_url' => url('/storage/' . $banner->image),
                    'url' => $banner->url,
                    'button_text' => $banner->button_text,
                    'type' => $banner->type
                ];
            });
        return response()->json($banners);
    }
}
