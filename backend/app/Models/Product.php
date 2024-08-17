<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = ['category_id', 'name', 'slug', 'short_description', 'price', 'sales_price', 'qty', 'featured', 'sku', 'description', 'additional_information', 'image', 'counts'];
}
