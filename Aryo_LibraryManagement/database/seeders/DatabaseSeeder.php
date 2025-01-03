<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        User::factory()->create([
            'name' => 'Admin',
            'username' => 'Admin',
            'email' => 'admin@gmail.com',
            'password' => '12345678',
            'level' => 'admin',
        ]);
        User::factory()->create([
            'name' => 'Librarian',
            'username' => 'Librarian',
            'email' => 'librarian@gmail.com',
            'password' => '12345678',
            'level' => 'librarian',
        ]);
        User::factory()->create([
            'name' => 'Student',
            'username' => 'Student',
            'email' => 'student@gmail.com',
            'password' => '12345678',
            'level' => 'student',
        ]);
        User::factory()->create([
            'name' => 'Lecturer',
            'username' => 'Lecturer',
            'email' => 'lecturer@gmail.com',
            'password' => '12345678',
            'level' => 'lecturer',
        ]);
        User::factory()->create([
            'name' => 'General',
            'username' => 'General',
            'email' => 'general@gmail.com',
            'password' => '12345678',
            'level' => 'general',
        ]);
    }
}
