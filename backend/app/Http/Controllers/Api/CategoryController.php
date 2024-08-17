<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Category;
use Image;

class CategoryController extends Controller
{
    function store(Request $request) {
        $this->validate($request, [
            'title' => 'required|string|unique:categories',
            'image' => 'required'
        ]);

        $data = [
            'title' => $request->title,
            'slug' => Str::slug($request->title, '-'),
        ];
        if (isset($request->image)) {
            $image = $request->image;
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];

            $image_name = Str::random(10) . "." . $ext;
            $img = Image::make($image)->resize(384, 420);
            $upload_path = 'images/categories/';
            $image_url = $upload_path . $image_name;
            $img->save($image_url);
            $data['image'] = $image_url;
        }
        Category::create($data);
        return response()->json(['message' => 'Category successfully added']);
    }

    function index() {
        $categories = Category::all();
        return response()->json($categories);
    }

    function fewCategories() {
        $categories = Category::take(5)->get();
        return response()->json($categories);
    }

    function show($id) {
        $category = Category::where('id', $id)->first();
        return response()->json($category);
    }

    function update(Request $request, $id) {
         $this->validate($request, [
            'title' => 'required|string'
        ]);

        $data = [
            'title' => $request->title,
            'slug' => Str::slug($request->title, '-'),
        ];
        if (isset($request->image)) {
            $image = $request->image;
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];

            $image_name = Str::random(10) . "." . $ext;
            $img = Image::make($image)->resize(384, 420);
            $upload_path = 'images/categories/';
            $image_url = $upload_path . $image_name;
            $success = $img->save($image_url);
            $data['image'] = $image_url;
            if ($success) {
                $category = Category::where('id', $id)->first();
                if (isset($category->image)) {
                    unlink($category->image);
                }
            }
        }
        Category::where('id', $id)->update($data);
        return response()->json(['message' => 'Category successfully updated']);
    }
}
