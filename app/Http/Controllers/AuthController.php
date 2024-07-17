<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function index() {
        return view('auth');
    }
    
    public function registerStore(Request $request) 
    {
        $request->session()->put('data-from', 'errorRegister');

        $messages = [
            'required' => ':attribute wajib diisi!',
            'min' => ':attribute harus diisi minimal :min karakter!',
            'max' => ':attribute harus diisi maksimal :max karakter!',
            'unique' => ':attribute sudah terdaftar, gunakan :attribute lain!',
            'email' => ':attribute tidak valid!',
        ];
        
        $request->validate([
            'nama' => 'required|min:3|max:255',
            'username' => ['required','min:3','max:255','unique:users'],
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8|max:255'
        ],$messages);

        $request->session()->pull('data-from', 'errorRegister');

        DB::table('users')->insert([
            'name' => $request->nama,
            'username' => $request->username,
            'email' => $request->email,
            'image' => 'default.jpg',
            'role_id' => 2,
            'is_active' => 2,
            'password' => Hash::make($request->password),
            'created_at' => date("Y-m-d h:i:s")
        ]);

        return redirect('/')->with('message','Berhasil Registrasi, tunggu persetujuan admin!');



    }

    public function loginStore(Request $request) 
    {
        
        $request->session()->put('data-from', 'errorLogin');

        $messages = [
            'required' => ':attribute wajib diisi!',
            'min' => ':attribute harus diisi minimal :min karakter!',
            'max' => ':attribute harus diisi maksimal :max karakter!',
        ];
        
        $request->validate([
            'emailAtauUsername' => ['required','min:3','max:255'],
            'passwordLogin' => 'required|min:8|max:255'
        ],$messages);

        $request->session()->pull('data-from', 'errorLogin');


        $data = User::where('email',$request->emailAtauUsername)->orWhere('username',$request->emailAtauUsername)->first();

        if ($data) {
            if($data->is_active == '2'){
                return redirect('/')->with('messageLogin','Akun Tidak Aktif, Silahkan Hubungi Admin.');
            }
            if (Hash::check($request->passwordLogin,$data->password)){
                $request->session()->regenerate();
                $request->session()->put('user_login', $data);
                return redirect('home/dashboard');
            } 
        }

        return redirect('/')->with('messageLogin','Gagal Login!');

    }

    public function logout(Request $request){
        $request->session()->flush();
        return redirect('/');
    }
}
