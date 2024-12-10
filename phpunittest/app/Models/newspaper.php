<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Newspaper extends Model
{
    use HasFactory;

    protected $table = 'newspapers';

    protected $fillable = [
        'title',
        'publisher',
        'publication_date',
        'status',
    ];

    const STATUS_AVAILABLE = 'available';
    const STATUS_STORED = 'stored';

    public function getStatusAttribute($value)
    {
        return ucfirst($value);
    }

}
