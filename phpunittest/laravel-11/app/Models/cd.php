<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cd extends Model
{
    use HasFactory;

    protected $table = 'cds';

    protected $fillable = [
        'title',
        'author',
        'category',
        'publication_date',
        'description',
        'is_accessible',
    ];

    public function isAccessible()
    {
        return $this->is_accessible === 'granted';
    }
}
