[1mdiff --git a/app/Models/Category.php b/app/Models/Category.php[m
[1mindex 6a8a406..7a60d0c 100644[m
[1m--- a/app/Models/Category.php[m
[1m+++ b/app/Models/Category.php[m
[36m@@ -3,8 +3,15 @@[m
 namespace App\Models;[m
 [m
 use Illuminate\Database\Eloquent\Model;[m
[32m+[m[32muse Illuminate\Database\Eloquent\Relations\HasMany;[m
 [m
 class Category extends Model[m
 {[m
[31m-    //[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Get the comments for the blog post.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function products(): HasMany[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->hasMany(Product::class);[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/app/Models/City.php b/app/Models/City.php[m
[1mindex 8ffe98a..4b96246 100644[m
[1m--- a/app/Models/City.php[m
[1m+++ b/app/Models/City.php[m
[36m@@ -3,8 +3,15 @@[m
 namespace App\Models;[m
 [m
 use Illuminate\Database\Eloquent\Model;[m
[32m+[m[32muse Illuminate\Database\Eloquent\Relations\HasMany;[m
 [m
 class City extends Model[m
 {[m
[31m-    //[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Get the comments for the blog post.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function restaurants(): HasMany[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->hasMany(Restaurant::class);[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/app/Models/Product.php b/app/Models/Product.php[m
[1mindex 7fb8e6b..619f278 100644[m
[1m--- a/app/Models/Product.php[m
[1m+++ b/app/Models/Product.php[m
[36m@@ -3,8 +3,20 @@[m
 namespace App\Models;[m
 [m
 use Illuminate\Database\Eloquent\Model;[m
[32m+[m[32muse Illuminate\Database\Eloquent\Relations\BelongsTo;[m
 [m
 class Product extends Model[m
 {[m
[31m-    //[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Get the post that owns the comment.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function restaurant(): BelongsTo[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->belongsTo(Restaurant::class);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public function category(): BelongsTo[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->belongsTo(Category::class);[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/app/Models/Reservation.php b/app/Models/Reservation.php[m
[1mindex ddd63f7..5d387af 100644[m
[1m--- a/app/Models/Reservation.php[m
[1m+++ b/app/Models/Reservation.php[m
[36m@@ -3,8 +3,20 @@[m
 namespace App\Models;[m
 [m
 use Illuminate\Database\Eloquent\Model;[m
[32m+[m[32muse Illuminate\Database\Eloquent\Relations\BelongsTo;[m
 [m
 class Reservation extends Model[m
 {[m
[31m-    //[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Get the post that owns the comment.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function user(): BelongsTo[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->belongsTo(User::class);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public function restaurant(): BelongsTo[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->belongsTo(Restaurant::class);[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/app/Models/Restaurant.php b/app/Models/Restaurant.php[m
[1mindex a2189c7..95a9930 100644[m
[1m--- a/app/Models/Restaurant.php[m
[1m+++ b/app/Models/Restaurant.php[m
[36m@@ -3,8 +3,25 @@[m
 namespace App\Models;[m
 [m
 use Illuminate\Database\Eloquent\Model;[m
[32m+[m[32muse Illuminate\Database\Eloquent\Relations\BelongsTo;[m
[32m+[m[32muse Illuminate\Database\Eloquent\Relations\HasMany;[m
 [m
 class Restaurant extends Model[m
 {[m
[31m-    //[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Get the post that owns the comment.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function products(): HasMany[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->hasMany(Product::class);[m
[32m+[m[32m    }[m
[32m+[m[32m    public function reservations(): HasMany[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->hasMany(Reservation::class);[m
[32m+[m[32m    }[m
[32m+[m[32m    public function city(): BelongsTo[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->belongsTo(City::class);[m
[32m+[m[32m    }[m
 }[m
[41m+[m
[1mdiff --git a/app/Models/User.php b/app/Models/User.php[m
[1mindex 52227df..9f1a0c5 100644[m
[1m--- a/app/Models/User.php[m
[1m+++ b/app/Models/User.php[m
[36m@@ -3,8 +3,15 @@[m
 namespace App\Models;[m
 [m
 use Illuminate\Database\Eloquent\Model;[m
[32m+[m[32muse Illuminate\Database\Eloquent\Relations\HasMany;[m
 [m
 class User extends Model[m
 {[m
[31m-    //[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Get the comments for the blog post.[m
[32m+[m[32m     */[m
[32m+[m[32m    public function reservations(): HasMany[m
[32m+[m[32m    {[m
[32m+[m[32m        return $this->hasMany(Reservation::class);[m
[32m+[m[32m    }[m
 }[m
[1mdiff --git a/database/.gitignore b/database/.gitignore[m
[1mindex 9b19b93..e6742ec 100644[m
[1m--- a/database/.gitignore[m
[1m+++ b/database/.gitignore[m
[36m@@ -1 +1 @@[m
[31m-*.sqlite*[m
[32m+[m[32m#*.sqlite*[m
[1mdiff --git a/database/migrations/2025_03_31_144826_create_users_table.php b/database/migrations/2025_03_31_184928_create_users_table.php[m
[1msimilarity index 100%[m
[1mrename from database/migrations/2025_03_31_144826_create_users_table.php[m
[1mrename to database/migrations/2025_03_31_184928_create_users_table.php[m
[1mdiff --git a/database/migrations/2025_03_31_145752_create_cities_table.php b/database/migrations/2025_03_31_185004_create_cities_table.php[m
[1msimilarity index 100%[m
[1mrename from database/migrations/2025_03_31_145752_create_cities_table.php[m
[1mrename to database/migrations/2025_03_31_185004_create_cities_table.php[m
[1mdiff --git a/database/migrations/2025_03_31_150319_create_restaurants_table.php b/database/migrations/2025_03_31_185027_create_restaurants_table.php[m
[1msimilarity index 100%[m
[1mrename from database/migrations/2025_03_31_150319_create_restaurants_table.php[m
[1mrename to database/migrations/2025_03_31_185027_create_restaurants_table.php[m
[1mdiff --git a/database/migrations/2025_03_31_151027_create_categories_table.php b/database/migrations/2025_03_31_185055_create_categories_table.php[m
[1msimilarity index 100%[m
[1mrename from database/migrations/2025_03_31_151027_create_categories_table.php[m
[1mrename to database/migrations/2025_03_31_185055_create_categories_table.php[m
[1mdiff --git a/database/migrations/2025_03_31_151223_create_products_table.php b/database/migrations/2025_03_31_185125_create_products_table.php[m
[1msimilarity index 100%[m
[1mrename from database/migrations/2025_03_31_151223_create_products_table.php[m
[1mrename to database/migrations/2025_03_31_185125_create_products_table.php[m
[1mdiff --git a/database/migrations/2025_03_31_152152_create_reservations_table.php b/database/migrations/2025_03_31_185301_create_reservations_table.php[m
[1msimilarity index 100%[m
[1mrename from database/migrations/2025_03_31_152152_create_reservations_table.php[m
[1mrename to database/migrations/2025_03_31_185301_create_reservations_table.php[m
