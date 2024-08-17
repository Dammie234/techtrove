<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Billing extends Model
{
    use HasFactory;
    protected $fillable = ['lastname', 'firstname', 'company_name', 'country', 'street_address', 'city', 'state', 'postal_code', 'phone', 'email', 'total', 'payment_type', 'delivery_fee', 'notes', 'payment_approval', 'delivered', 'payment_image'];
}
