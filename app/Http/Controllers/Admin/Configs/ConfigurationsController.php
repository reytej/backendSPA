<?php
namespace App\Http\Controllers\Admin\Configs;
use Illuminate\Http\Request;
use App\Http\Controllers\MainController as MainController;
use App\Model\Admin\RolesModel;

use Validator;

class ConfigurationsController extends MainController
{
    /**
     * getting configurations
     *
     * @return \Illuminate\Http\Response
     */
    public function getConfigurations(Request $request)
    {
        $configs = array();
        $roleMDL = new RolesModel;
        $roleRes = $roleMDL->getPages($request->role);
        $configs['pages'] = explode(',',$roleRes->pages);
        return $this->sendResponse($configs, 'Configs Loaded');
    }
}