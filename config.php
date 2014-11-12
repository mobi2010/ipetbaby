<?php
defined('IN_APP') or die('Access Denied.');
define('APP_NAME','/');


///需要设置是否为2级目录， 头像 和上传flash 需要调用那2个地址
/*系统公用配置文件位置*
/*安装日期 2014年 11月 12日 13:54*/

$spConfig = array(

	 'mode' => 'debug',  //系统启动模式 debug 调试模式 release 部署模式
	 'dispatcher_error' => "err404();", // 定义处理路由错误的函数
	 'encodestring' =>'8f280689565ccd39ea0758a18176559e',
	  "db" => array(
		  'host' => 'localhost', // 数据库地址
		  'login' => 'root',
		  'password' => '',
		  'database' => '2010mobi',
		  'prefix'  => 'pet_',
		  'db_driver_path' => SP_PATH.'/Drivers/mysql.php',
 	 ),
 	 'launch' => array(
		 
		'function_access' => array(array('spAccessCache','db')),
	 ),
  	 'ext' => array(
	 	 	// 以下是Url_ReWrite的设置
	 		'spUrlRewrite' => array(
				'hide_default' => true, // 隐藏默认的main/index名称，但这前提是需要隐藏的默认动作是无GET参数的
				'suffix' => '',
				'sep' =>'/',
				'map' => array(
					 'index' => 'main@index',
					 'recommend'=>'main@recommend',
					 'discovery'=>'main@discovery',
					 'now'      =>'main@now',
       				 'register' => 'main@reg', 
					 'login' => 'main@login',
					 'tag' => 'blog@tag',
					 'info' =>'site@index',
					 'myfollow'=>'user@myfollow',
					 'mypost'=>'user@mypost',
					 'mylikes'=>'user@mylikes',
					 'myreplays'=>'user@myreplay',
					 'mynotices'=>'user@mynotice',
					 'edit' => 'add@edit',
					 'logout' => 'main@logout',
					 'custom'=>'userblog@customize',
					 'read' =>'userblog@show', //显示博客
					 '@' => 'userblog@index',   //泛解析
     			),
				'args' => array(
					   'gomember' => array('uid'),
					   'read' => array('bid','domain','uid'),
					   'mylikes'=>array('page'), //我喜欢的默认参数
					   'info' =>array('page'),
					   '@' => array('domain','uid')     //泛解析参数
   				 ),
			),
			'aUpload' => array( //上传
				'savepath' => APP_PATH , //保存的绝对位置
				'savedir'  => 'attachs', //相对位置
				'tmppath' => APP_PATH .'/attachs/tmp',  //上传临时位置必须存在
				'filetype' => 'jpg,png,gif,bmp,rar,zip,mp3,wma,mid,doc,pdf',
				'filesize' =>4194304, //4M
				'fileinput' =>'filedata' ,//默认文件上传域
				'dirtype' => 4,  //文件夹保存格式
				'imgresize' => TRUE,  //图片文件自动创建缩略图
				'imgmask'   => TRUE,  //图片自动加水银
				'imgmasksrc' => SP_PATH.'/Extensions/font/logo.png', //水印文字
				'imgresizew' => 500, //缩略图比例宽度
			),
			'spVerifyCode' => array( //验证码扩展
				'width' => 60, //验证码宽度
				'height' => 32, //验证码高度
				'length' => 4, //验证码字符长度
				'bgcolor' => '#FFFFFF', //背景色
				'noisenum' => 50, //图像噪点数量
				'fontsize' => 22, //字体大小
				'fontfile' => 'font/font.ttf', //字体文件
				'format' => 'gif', //验证码输出图片格式
			),


	 ),


);

?>