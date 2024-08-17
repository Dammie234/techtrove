<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Cookie;

class AuthController extends Controller
{
    function register(Request $request) {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:8'
        ]);
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);
        return $user;
    }
    function login(Request $request) {
        if(!Auth::attempt($request->only('email', 'password'))){
            return response([
                'message' => 'You have provided invalid credentials'
            ], Response::HTTP_UNAUTHORIZED);
        }
        $user = Auth::user();

        $token = $user->createToken('token')->plainTextToken;

        $cookie = cookie('jwt', $token, 60 * 24); // 1 day
        return response([
            'message' => 'You have successfully sign in'
        ])->withCookie($cookie);
    }
    function user()  {
        return Auth::user();
    }
    function logout() {
        $cookie = Cookie::forget('jwt');
        return response([
            'message' => 'Success'
        ])->withCookie($cookie);
    }
}
