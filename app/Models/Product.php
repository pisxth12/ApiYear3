<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Product extends Model
{
    use HasFactory;
    protected $table = 'products';

    protected $fillable = [
        'name',
        'slug',
        'sku',
        'category_id',
        'brand_id',
        'price',
        'sale_price',
        'stock',
        'description',
        'image',
        'specifications',
        'is_active',
        'is_featured',
    ];


    protected static function boot()
    {
        parent::boot();

        static::creating(function ($product) {
            if (!$product->sku) {
                $product->sku = 'PRD-' . strtoupper(Str::random(8));
            }
        });
    }
    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }


    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }
}
