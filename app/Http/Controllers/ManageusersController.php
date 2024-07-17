<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class ManageusersController extends Controller
{
    public function index(Request $request)
    {
        $user_login = $request->session()->get('user_login');
        $countRequest = DB::table('request_kuliah')->count() + DB::table('request_ruang')->count() + DB::table('request_waktu')->count();
        
        $request_keyword = "";
        if($request->keyword){
            if (strtolower($request->keyword) == 'operator' || strtolower($request->keyword) == 'admin') {
                $role_id =  strtolower($request->keyword) == 'user' ? 2 : 1;
                $users = DB::table('users')->where('role_id', $role_id)->get();
            } else {
            $users = DB::table('users')->where('name', 'LIKE', "%{$request->keyword}%")->orWhere('email', 'LIKE', "%{$request->keyword}%")->orWhere('username', 'LIKE', "%{$request->keyword}%")->get();
            $request_keyword = $request->keyword;
            }
        } else {
            $users = DB::table('users')->get();
        }
        return view('manageusers.index', compact('users', 'user_login','request_keyword','countRequest'));
    }
    public function create(Request $request)
    {
        $user_login = $request->session()->get('user_login');
        $countRequest = DB::table('request_kuliah')->count() + DB::table('request_ruang')->count() + DB::table('request_waktu')->count();
        
        return view('manageusers.create', compact('user_login','countRequest'));
    }
    public function store(Request $request)
    {
        $messages = [
            'required' => ':attribute wajib diisi!',
            'min' => ':attribute harus diisi minimal :min karakter!',
            'max' => ':attribute harus diisi maksimal :max karakter!',
            'unique' => ':attribute sudah terdaftar, gunakan :attribute lain!',
            'email' => ':attribute tidak valid!',
            'confirmed' => ':attribute sesuaikan repeat password!',
        ];
        
        $request->validate([
            'nama' => 'required|min:3|max:255',
            'username' => ['required','min:3','max:255','unique:users'],
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8|max:255|confirmed'
        ],$messages);
        

        DB::table('users')->insert([
            'name' => $request->nama,
            'username' => $request->username,
            'email' => $request->email,
            'image' => 'default.jpg',
            'role_id' => $request->role_id,
            'is_active' => $request->is_active,
            'password' => Hash::make($request->password),
            'created_at' => date("Y-m-d h:i:s")
        ]);

        return redirect('/manageusers')->with('status', 'Data user Berhasil Ditambahkan!');
    }

    public function edit(Request $request, $id)
    {
        $user_login = $request->session()->get('user_login');
        $countRequest = DB::table('request_kuliah')->count() + DB::table('request_ruang')->count() + DB::table('request_waktu')->count();
        
        $user = DB::table('users')->where('id_user', $id)->first();
        return view('manageusers.edit', compact('user_login', 'user','countRequest'));
    }

    public function update(Request $request, $id)
    {

        // FORM VALIDATION
        $request->validate(
            [
                'nama' => 'required|min:3',
                'email' => 'required|email',
                'password' => 'confirmed'
            ],
            [
                'nama.required'         => 'Nama Lengkap wajib diisi',
                'nama.min'              => 'Nama lengkap minimal 3 karakter',
                'nama.max'              => 'Nama lengkap maksimal 35 karakter',
                'email.required'        => 'Email wajib diisi',
                'email.email'           => 'Email tidak valid',
                'password.confirmed'    => 'Password dan repeat password tidak sesuai'
            ]

        );

        DB::table('users')
        ->where('id_user', $id)
        ->update([
            'name' => $request->nama,
            'username' => $request->username,
            'email' => $request->email,
            'role_id' => $request->role_id,
            'is_active' => $request->is_active,
        ]);

        if($request->password){
            DB::table('users')
            ->where('id_user', $id)
            ->update([
                'password' => Hash::make($request->password)
            ]);
        }
        return redirect('/manageusers')->with('status', 'Data user berhasil diubah');
    }

    public function destroy($id)
    {
        $users = DB::table('users')->get();
        if(count($users) == 1){
            return redirect('/manageusers')->with('status', 'Minimal Tersisa Satu User!');
        };

        DB::table('users')->where('id_user', $id)->delete();
        return redirect('/manageusers')->with('status', 'Data user berhasil dihapus');
    }
}
