<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Redirect;
use Session;
use DB;

use Illuminate\Http\Request;

class MainController extends Controller
{
    public function LoginFunction(Request $request){

        $this->validate($request, [
            'username' => 'required',
            'password' => 'required',
        ]);


        $user_entered_username =  $request->username;
        $user_entered_password =  $request->password;

        $username_from_db = "";
        $password_from_db = "";

        $user = DB::select( DB::raw("SELECT username, password FROM user_account"));

        foreach($user as $u){

            $username_from_db = $u->username;
            $password_from_db = $u->password;

        }

        if($user_entered_username == $username_from_db && Hash::check($user_entered_password, $password_from_db)){

            Session::put('Session_Type', 'Admin');
            Session::put('Session_Value', $username_from_db);

            $session_type = Session::get('Session_Type');
            $session_value = Session::get('Session_Value');


            if($session_type == 'Admin'){

                return Redirect::to("/view_dashboard_home");
            }


        }else{

            return Redirect::to("/")->withErrors(['The username or password is incorrect']);
        }

    }

    public function ViewDashboardHome(){

        $session_type = Session::get('Session_Type');
        $session_value = Session::get('Session_Value');

        if($session_type == "Admin"){

            $Data =  DB::table('data')->orderBy('auto_id', 'DESC')->paginate(500);
            return view('dashboard_home')->with(['Page_Type' => 'Without Face Mask', 'All_Data' => $Data]);

        }else{

            return Redirect::to('/');
        }
    }

    public function ViewSettings(){

        $session_type = Session::get('Session_Type');
        $session_value = Session::get('Session_Value');

        if($session_type == "Admin"){

            $langData =  DB::table('language')->get();

            $lang = "";


            foreach($langData as $u){

                $lang = $u->lang;

            }

            return view('settings')->with(['Page_Type' => 'Settings','lang'=>$lang]);

        }else{

            return Redirect::to('/');
        }

    }

    public function ChangeLanguage(Request $request){

        $session_type = Session::get('Session_Type');
        $session_value = Session::get('Session_Value');

        if($session_type == "Admin"){

            $this->validate($request, [
                'language' => 'required'
            ]);

            $language = strtolower($request->language);


            if(DB::table('language')->update(['lang' => "$language"])){

                return Redirect::to('/settings');


            }

        }else{

            return Redirect::to('/');
        }

    }

    public function ChangePassword(Request $request){

        $session_type = Session::get('Session_Type');
        $session_value = Session::get('Session_Value');

        if($session_type == "Admin"){

            $this->validate($request, [
                'current_password' => 'required',
                'new_password' => 'required',
                'con_password' => 'required',
            ]);


            $user_entered_current_password = $request->current_password;
            $user_entered_new_password = $request->new_password;
            $user_entered_confirm_password = $request->con_password;

            $password_from_server_hash = "";

            if($user_entered_new_password == $user_entered_confirm_password){

                $user_account_data =  DB::table('user_account')->get();

                foreach($user_account_data as $u){

                   $password_from_server_hash = $u->password;

                }

                if(Hash::check($user_entered_current_password, $password_from_server_hash)){

                    $user_entered_new_password_hash = Hash::make($user_entered_new_password);

                    if(DB::table('user_account')->update(['password' => "$user_entered_new_password_hash"])){

                        return Redirect::to('/settings');


                    }

                }else{

                    return Redirect::to("/settings")->withErrors(['The current password is wrong']);
                }


            }else{

                return Redirect::to("/settings")->withErrors(['Confirm password does not match']);

            }


        }else{

            return Redirect::to('/');
        }

    }


    public function DeleteData($auto_id, $filename){

        $session_type = Session::get('Session_Type');
        $session_value = Session::get('Session_Value');

        if($session_type == "Admin"){

            if(DB::table('data')->where(['auto_id' => "$auto_id"])->delete()){

                try {

                    $target_file = public_path().'/image_data/'.$filename;
                    unlink($target_file);

                } catch (\Exception $e) {


                }


                return Redirect::to('/view_dashboard_home');
            }

        }else{

            return Redirect::to('/');
        }

    }

    public function Logout(){
        Session::flush();
        return Redirect('/');
    }
    
}
