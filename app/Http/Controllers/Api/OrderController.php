<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function store(Request $request){
        $request->validate([
            'customer_name' => 'required|string',
            'customer_phone' => 'required|string',
            'shipping_address' => 'required|string',
            'payment_method' => 'required|string'
        ]);

        $sessionId = $request->session()->getId();
        $cart = Cart::where('session_id', $sessionId)->get();

        if($cart->isEmpty()){
            return response()->json(['message' => 'Cart is empty']);
        }

        //Check stock

        foreach ($cart as $item){
            if($item->product->stock < $item->quantity){
                return response()->json(['message' => 'Product out of stock']);
            }
        }

        // Calculate total
        $total = $cart->sum(fn($item) => $item->product->price * $item->quantity);

        //Create order
        $order = Order::create([
            'order_number' => 'ORD-'. Str::random(6). '-' . time(),
            'customer_name' => $request->customer_name,
            'customer_phone' => $request->customer_phone,
            'shipping_address' => $request->shipping_address,
            'total' => $total,
            'payment_method' => $request->payment_method,
            'status' => 'pending',
        ]);

        // Create order items & reduce stock
        foreach ($cart as $item){
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $item->product_id,
                'quantity' => $item->quantity,
                'price' => $item->product->price,
            ]);

            //Reduce stock
            $product = $item->product;
            $product->stock -= $item->quantity;
            $product->save();
        }

        //Clear cart
        Cart::where('session_id', $sessionId)->delete();
        return response()->json([
            'message' => 'Order created',
            'order' => $order
        ]);
    }


    public function index(Request $request)
    {
        $phone = $request->phone;
        if(!$phone){
            return response()->json([
                'error' => 'Phone number is required'
            ],400);
        }

        $order = Order::where('customer_phone', $phone)->orderBy('created_at', 'desc')->get();
        return response()->json([
            'order' => $order
        ]);
    }

    public function show($id)
    {
        $order = Order::with('items.product')->findOrFail($id);
        return response()->json($order);
    }
}
