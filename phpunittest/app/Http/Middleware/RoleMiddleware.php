<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;


class RoleMiddleware
{
    public function handle(Request $request, Closure $next, $role)
    {
        if (!auth()->user()->roles->pluck('name')->contains($role)) {
            abort(403, 'Unauthorized');
        }

        return $next($request);
    }
}
