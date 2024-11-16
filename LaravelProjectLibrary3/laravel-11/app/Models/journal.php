<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Journal extends Model
{
    use HasFactory;

    protected $table = 'journals';

    protected $fillable = [
        'title',
        'author',
        'category',
        'publication_date',
        'description',
        'is_accessible',
    ];

    const ACCESSIBLE_REQUESTED = 'requested';
    const ACCESSIBLE_GRANTED = 'granted';
    const ACCESSIBLE_DENIED = 'denied';

    public function getIsAccessibleAttribute($value)
    {
        return ucfirst($value);
    }
}
