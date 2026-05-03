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
        $sessionId = $request->session()->getId();

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
            'session_id' => $sessionId,
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
        $sessionId = $request->session()->getId();

        $orders = Order::where('session_id', $sessionId)
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json(['order' => $orders]);
    }

    public function show($id)
    {
        $order = Order::findOrFail($id);

        $orderData = [
            'id' => $order->id,
            'order_number' => $order->order_number,
            'created_at' => $order->created_at,
            'customer_name' => $order->customer_name,
            'customer_phone' => $order->customer_phone,
            'shipping_address' => $order->shipping_address,
            'total' => $order->total,
            'payment_method' => $order->payment_method,
            'status' => $order->status,
            'items' => $order->items->map(function($item) {
                return [
                    'id' => $item->id,
                    'quantity' => $item->quantity,
                    'price' => $item->price,
                    'product' => $item->product ? [
                        'id' => $item->product->id,
                        'name' => $item->product->name,
                        'image' => $item->product->image ? asset('storage/' . $item->product->image) : null,
                        'slug' => $item->product->slug,
                    ] : null
                ];
            })
        ];

        return response()->json($orderData);
    }
}
