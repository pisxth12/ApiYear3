<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $settings = [
            ['key' => 'phone', 'value' => '012 345 678'],
            ['key' => 'site_name', 'value' => 'Mongkol'],

            ['key' => 'email', 'value' => 'info@mongkolshop.com'],
            ['key' => 'address', 'value' => 'Phnom Penh, Cambodia'],
            ['key' => 'facebook', 'value' => 'https://facebook.com/mongkolshop'],
            ['key' => 'telegram', 'value' => 'https://t.me/mongkolshop'],
            ['key' => 'copyright', 'value' => '© 2024 Mongkol Phone Shop'],
            ['key' => 'location', 'value' => 'Phnom Penh'],

            ['key' => 'business_hours_monday_friday', 'value' => '9am - 6pm'],
            ['key' => 'business_hours_saturday', 'value' => '10am - 4pm'],
            ['key' => 'business_hours_sunday', 'value' => 'Closed'],
        ];
        foreach ($settings as $setting) {
            Setting::create($setting);
        }
    }
}
