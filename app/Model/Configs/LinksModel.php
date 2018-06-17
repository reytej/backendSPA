<?php

namespace App\Model\Configs;

use Illuminate\Database\Eloquent\Model;

class LinksModel extends Model
{
	protected $table = 'links';

    function getLinks(){
    	$linksRes = $this->orderBy('type','ASC')->orderBy('order','ASC')->get();
    	$links = array();
    	$main = array();
    	$sub = array();
    	foreach ($linksRes as $res) {
    		if($res->type == 'main'){
    			$main[] = $res;
    		}
    		else
    			$sub[] = $res;
    	}
    	foreach ($main as $mn) {
			$children = array();
			foreach ($sub as $sb) {
				if($sb->parent == $mn->code){
					$subChildren = array();
					foreach ($sub as $sb2) {
						if($sb2->parent == $sb->code){
							$subChildren[$sb2->code] = array('code' => $sb2->code, 'icon' => $sb2->icon, 'name' => $sb2->name, 'url' => $sb2->url);
						}
					}
					$children[$sb->code] = array('code' => $sb->code,'name' => $sb->name, 'icon' => $sb->icon, 'url' => $sb->url,'children' => $subChildren);
				}
			}
			$links[$mn->code] = array('code' => $mn->code, 'name' => $mn->name, 'url' => $mn->url, 'children' => $children);
    	}
    	return $links;
    }
}
