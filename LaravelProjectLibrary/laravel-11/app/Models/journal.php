<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class journal extends Model
{
    use HasFactory;
    protected $fillable = [
        'book_title',
        'book_author',
        'book_publisher',
        'publish_date',
        'ISBN',
    ];
}
