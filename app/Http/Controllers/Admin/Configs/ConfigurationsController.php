<?php
namespace App\Http\Controllers\Admin\Configs;
use Illuminate\Http\Request;
use App\Http\Controllers\MainController as MainController;
use App\Model\Configs\LinksModel;

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
        $linksMDL = new LinksModel();
        $configs['links'] = $linksMDL->getLinks();
        return $this->sendResponse($configs, 'Configs Loaded');
    }
}