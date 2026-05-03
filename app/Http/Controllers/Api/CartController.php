<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\Request;
use SebastianBergmann\CodeCoverage\Report\Xml\Project;

class CartController extends Controller
{
    public function index(Request $request)
    {
        $sessionId = $request->session()->getId();

        $cartItems = Cart::with('product')->where('session_id', $sessionId)->get();

        $cart = $cartItems->map(fn ($cartItem) => [
            'id' => $cartItem->id,
            'quantity' => $cartItem->quantity,
            'product_id' => $cartItem->product_id,
            'slug' => $cartItem->product->slug,
            'product_name' => $cartItem->product->name,
            'product_image' => $cartItem->product->image ? asset('storage/' . $cartItem->product->image ) : null,
            'product_price' => $cartItem->product->price,
        ]);

        $total = $cartItems->sum(fn($item) => $item->product->price * $item->quantity);

        return response()->json([
            'cart' => $cart,
            'total' => $total,
            'count' => $cartItems->sum('quantity')
        ]);
    }


    public  function count(Request $request)
    {
        $sessionId = $request->session()->getId();
        $count = Cart::where('session_id', $sessionId)->sum('quantity');
        return response()->json($count);

    }
    public function store(Request $request){

        $request->validate([
            'product_id' => 'required',
            'quantity' => 'required',
        ]);

        $sessionId = $request->session()->getId();
        $product =  Product::find($request->product_id);



        $cartItem = Cart::where('session_id', $sessionId)->where('product_id', $request->product_id)->first();

        $currentQty = $cartItem ? $cartItem->quantity : 0;

        //Check stock
        if($product->stock < ($currentQty + $request->quantity)){
                return response()->json(['error' => 'Out of stock'], 400);
        }

        if($cartItem){
            $cartItem->quantity += $request->quantity;
            $cartItem->save();
        }else{
            $cartItem = Cart::create([
                'session_id' => $sessionId,
                'product_id' => $request->product_id,
                'quantity' => $request->quantity,
            ]);
        }

        return response()->json(['message' => 'Added to cart']);
    }
    public function update(Request $request, $id)
    {
        $request->validate(['quantity' => 'required|integer|min:1']);

        $cartItem = Cart::findOrFail($id);

        //check stock
        if($request->quantity > $cartItem->product->stock){
            return response()->json(['error' => 'Out of stock'], 400);
        }

        $cartItem->quantity = $request->quantity;
        $cartItem->save();
        return response()->json([
            'cart' => $cartItem,
            'message' => 'Quantity updated'
        ]);
    }

    public function destroy($id)
    {
        Cart::destroy($id);
        return response()->json(['message' => 'Removed from cart']);
    }

    public function clear(Request $request)
    {
        $sessionId = $request->session()->getId();
        Cart::where('session_id', $sessionId)->delete();
        return response()->json(['message' => 'Cart cleared']);
    }
}
