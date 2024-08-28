<?php

use App\Http\Controllers\CultureController;

Route::post('/api/cultures', [CultureController::class, 'store']);
