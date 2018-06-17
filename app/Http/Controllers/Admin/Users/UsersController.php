<?php


namespace App\Http\Controllers\Admin\Users;


use Illuminate\Http\Request;
use App\Http\Controllers\MainController as MainController;
use App\User;
use Illuminate\Support\Facades\Auth;
use Validator;


class UsersController extends MainController
{
    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
       $validator = Validator::make($request->all(), [
           'email' => 'required|email',
           'password' => 'required',
       ]);

       if($validator->fails()){
            return $this->sendError('Wrong username or password.', $validator->errors());       
       }

       if(Auth::attempt(['email'=>$request->email,'password'=>$request->password])){
            $user = Auth::user();
            $success['user'] = $user;
            $success['defaultUrl'] = '/';
            if($user->role == 'ADMIN')
                $success['defaultUrl'] = '/items';
            $success['token'] = $user->createToken('app')->accessToken;
            return $this->sendResponse($success, 'User logged in successfully.');
       }
       else
            return $this->sendError('Wrong username or password.', $validator->errors());       
        
    }
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);


        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }


        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('app')->accessToken;
        $success['name'] =  $user->name;


        return $this->sendResponse($success, 'User register successfully.');
    }
}