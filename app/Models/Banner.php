<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    use HasFactory;
    protected $table = 'banners';
    protected $fillable = ['title','subtitle', 'type', 'url', 'start_date', 'end_date', 'image', 'button_text', 'sort_order', 'is_active'];
}
