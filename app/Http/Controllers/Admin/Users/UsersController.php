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
     * get all users
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        return $this->sendResponse(User::withTrashed()->with('role')->get(), 'success');
    }
    /**
     * create a user
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request){
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['user'] = $user;
        return $this->sendResponse($success, 'User create successfully.');
    }
    /**
     * update a user
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id){
        $mdl = new User();
        $success = $mdl->where('id',$id)->update($request->all());
        return $this->sendResponse($success, 'User create successfully.');
    }
    /**
     * delete a user
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
        return $this->sendResponse(User::destroy($id), 'success');
    }
    /**
     * restore a user
     *
     * @return \Illuminate\Http\Response
     */
    public function restore($id){
        return $this->sendResponse(User::withTrashed()->where('id',$id)->restore(), 'success');
    }
    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request){
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
                $success['defaultUrl'] = '/company';
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
    public function register(Request $request){
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
        $success['user'] = $user;
        return $this->sendResponse($success, 'User register successfully.');
    }
}