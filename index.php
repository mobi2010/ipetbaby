<?php
/////////////////////////////////////////////////////////////////
//宠物宝贝-宠物社交平台, Copyright (C)   2010 - 2011  ipetbaby.com 
//EMAIL:nxfte@qq.com QQ:234027573    
//$Id: index.php 29 2011-10-14 05:54:29Z anythink $


define('APP_PATH',dirname(__FILE__));
define('IN_APP',TRUE);
define('SP_PATH',APP_PATH.'/init');
if(!is_file(APP_PATH.'/config.php')){header('Location:install/');}

if(isset($_REQUEST['ssid'])){session_id($_REQUEST['ssid']);}
require(APP_PATH.'/config.php');
$spConfig["view"]["config"]["template_dir"] = 'tplv2';
require(SP_PATH.'/init.php');
header('Content-type: text/html; charset=utf-8');


spRun();
?>