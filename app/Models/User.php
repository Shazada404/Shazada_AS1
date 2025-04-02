<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class User extends Model
{
    /**
     * Get the comments for the blog post.
     */
    public function reservation(): HasMany
    {
        return $this->hasMany(Reservation::class);
    }
}
