<?php

namespace App\Filament\Widgets;

use App\Models\Contact;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends StatsOverviewWidget
{
    protected static ?int $sort = 1;

    protected function getStats(): array
    {
        // Today
        $todayOrders = Order::whereDate('created_at', today())->count();
        $todayRevenue = Order::whereDate('created_at', today())->sum('total');

        // Yesterday
        $yesterdayOrders = Order::whereDate('created_at', today()->subDay())->count();
        $yesterdayRevenue = Order::whereDate('created_at', today()->subDay())->sum('total');

        // Total sales (sum of all product price × quantity from all completed orders)
        $totalSales = OrderItem::whereHas('order', function($query) {
            $query->where('status', 'completed');
        })->get()->sum(fn($item) => $item->price * $item->quantity);

        // Calculate percentage changes
        $ordersChange = $yesterdayOrders > 0
            ? round(($todayOrders - $yesterdayOrders) / $yesterdayOrders * 100)
            : 0;

        $revenueChange = $yesterdayRevenue > 0
            ? round(($todayRevenue - $yesterdayRevenue) / $yesterdayRevenue * 100)
            : 0;

        return [
            Stat::make('Today Orders', $todayOrders)
                ->description($ordersChange >= 0 ? "↑ {$ordersChange}% vs yesterday" : "↓ " . abs($ordersChange) . "% vs yesterday")
                ->descriptionIcon($ordersChange >= 0 ? 'heroicon-m-arrow-trending-up' : 'heroicon-m-arrow-trending-down')
                ->color($ordersChange >= 0 ? 'success' : 'danger')
                ->chart([7, 2, 10, 3, 15, 4, 17]),

            Stat::make('Today Revenue', '$' . number_format($todayRevenue, 2))
                ->description($revenueChange >= 0 ? "↑ {$revenueChange}% vs yesterday" : "↓ " . abs($revenueChange) . "% vs yesterday")
                ->descriptionIcon($revenueChange >= 0 ? 'heroicon-m-arrow-trending-up' : 'heroicon-m-arrow-trending-down')
                ->color($revenueChange >= 0 ? 'success' : 'danger')
                ->chart([3, 5, 8, 12, 9, 7, 11]),

            Stat::make('Total Sales', '$' . number_format($totalSales, 2))
                ->description('All time sales from completed orders')
                ->descriptionIcon('heroicon-m-currency-dollar')
                ->color('success'),

            Stat::make('Total Products', Product::count())
                ->description('Products in store')
                ->descriptionIcon('heroicon-m-shopping-bag')
                ->color('success')
                ->chart([7, 2, 10, 3, 15, 4, 17]),

            Stat::make('Unread Messages', Contact::where('is_read', false)->count())
                ->description('New contact messages')
                ->descriptionIcon('heroicon-m-envelope')
                ->color('danger'),
        ];
    }
}
