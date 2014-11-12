-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 11 月 12 日 12:11
-- 服务器版本: 5.5.16
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `2010mobi`
--

-- --------------------------------------------------------

--
-- 表的结构 `pet_ad_list`
--

CREATE TABLE IF NOT EXISTS `pet_ad_list` (
  `adid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '广告名称',
  `auid` int(11) NOT NULL COMMENT '广告位ID',
  `type` tinyint(1) NOT NULL COMMENT '1图片|2html|3右下角弹出|4全屏',
  `url` varchar(255) NOT NULL COMMENT '跳转地址',
  `body` text NOT NULL COMMENT '广告具体内容',
  `ga` text COMMENT '谷歌ga统计代码',
  `time_date_limit` char(21) DEFAULT NULL COMMENT '广告投放日期：例如2012-04-05-2012-04-20，用char存放起始和结束日期用“|”分隔',
  `time_area_limit` varchar(600) DEFAULT NULL COMMENT '广告投放时间段如，8:00-12：00用json存放多个时间段',
  `is_show` tinyint(1) NOT NULL DEFAULT '0',
  `weight` int(10) NOT NULL DEFAULT '10',
  PRIMARY KEY (`adid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_ad_unit`
--

CREATE TABLE IF NOT EXISTS `pet_ad_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '广告位置',
  `adesc` varchar(255) NOT NULL COMMENT '位置描述',
  `img` varchar(255) NOT NULL COMMENT '广告位置截图',
  `orders` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统投放位',
  `is_show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `pet_ad_unit`
--

INSERT INTO `pet_ad_unit` (`id`, `title`, `adesc`, `img`, `orders`, `system`, `is_show`) VALUES
(1, '首页右侧底部广告', '首页右侧底部广告', '1.jpg', 1, 1, 1),
(2, '首页顶部广告位', '首页顶部广告位', '2.jpg', 2, 1, 1),
(3, '发现频道广告位', '发现频道广告位', '3.jpg', 4, 1, 1),
(4, '推荐频道顶部广告位', '推荐频道顶部广告位', '4.jpg', 3, 1, 1),
(5, '用户主页右侧广告位', '用户主页右侧广告位', '5.jpg', 5, 1, 1),
(6, '用户主页详情页广告位', '用户主页详情页广告位', '6.jpg', 6, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pet_attachments`
--

CREATE TABLE IF NOT EXISTS `pet_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bid` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  `blogdesc` varchar(50) NOT NULL COMMENT '描述',
  `filesize` int(10) unsigned NOT NULL,
  `mime` varchar(20) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `pet_attachments`
--

INSERT INTO `pet_attachments` (`id`, `bid`, `path`, `blogdesc`, `filesize`, `mime`, `uid`, `time`) VALUES
(1, 1, 'attachs/14/11/12/1/0739456740.jpg', 'u=3138455356,2020125103&fm=23&gp=0.jpg', 31995, 'jpg', 1, 1415774385),
(2, 2, 'attachs/14/11/12/2/1040508855.jpg', '3b87e950352ac65ca27fff72f9f2b21193138abd.jpg', 100732, 'jpg', 1, 1415785250);

-- --------------------------------------------------------

--
-- 表的结构 `pet_blog`
--

CREATE TABLE IF NOT EXISTS `pet_blog` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1文字2音乐3照片4视频5链接 ',
  `tag` char(30) NOT NULL COMMENT '分类',
  `title` char(50) DEFAULT NULL,
  `body` text NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0草稿 1通过 -1临时ID',
  `hitcount` int(10) DEFAULT '0' COMMENT '点击量',
  `feedcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '动作统计',
  `replaycount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论回复数',
  `noreply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '不允许评论',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  KEY `tag` (`tag`),
  KEY `uid` (`uid`),
  KEY `top` (`top`),
  KEY `open` (`open`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `pet_blog`
--

INSERT INTO `pet_blog` (`bid`, `uid`, `top`, `type`, `tag`, `title`, `body`, `open`, `hitcount`, `feedcount`, `replaycount`, `noreply`, `time`) VALUES
(1, 1, 0, 1, '', '我的小狗', '[attribute]a:1:{i:0;s:28:"attachs/14/11/12/1/t_0739456740.jpg";}[/attribute]<a href="attachs/14/11/12/1/0739456740.jpg"><img src="attachs/14/11/12/1/t_0739456740.jpg" class="feedimg" alt="" /></a>', 1, 2, 0, 0, 0, 1415774389),
(2, 1, 0, 1, '', '我的小狗', '[attribute]a:1:{i:0;s:28:"attachs/14/11/12/2/t_1040508855.jpg";}[/attribute]<a href="attachs/14/11/12/2/1040508855.jpg"><img src="attachs/14/11/12/2/t_1040508855.jpg" class="feedimg" height="281" width="579" alt="" /></a>', 1, 2, 0, 0, 0, 1415785257);

-- --------------------------------------------------------

--
-- 表的结构 `pet_cache`
--

CREATE TABLE IF NOT EXISTS `pet_cache` (
  `cachename` varchar(100) NOT NULL,
  `cachevalue` text,
  PRIMARY KEY (`cachename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pet_cache`
--

INSERT INTO `pet_cache` (`cachename`, `cachevalue`) VALUES
('ybconfig', '1715778964s:1913:"a:48:{s:11:"addimg_type";s:20:"jpg|png|jpge|bmp|gif";s:13:"addimg_upsize";s:8:"10485760";s:9:"cookiekey";s:0:"";s:9:"cookiepre";s:0:"";s:9:"guestMode";s:1:"1";s:14:"hotuser_switch";s:1:"1";s:12:"invite_count";s:1:"5";s:17:"invite_expiration";s:2:"10";s:13:"invite_switch";s:1:"0";s:11:"keep_domain";s:231:"www,ipetbaby,bbs,music,map,index,register,login,tag,now,admin,recommend,discovery,myfollow,mypost,mylikes,myreplays,mynotices,edit,logout,home,gomember,location,showinfo,about,copyright,call,service,privacy,custom,read,pm,user,site";s:10:"keep_email";s:14:"admin,ipetbaby";s:11:"keep_niname";s:69:"ipetbaby,admin,administrator,master,webmaster,email,username,password";s:8:"keep_rep";s:0:"";s:15:"loginCodeSwitch";s:1:"1";s:9:"mail_from";s:0:"";s:13:"mail_fromname";s:0:"";s:9:"mail_host";s:0:"";s:9:"mail_open";s:1:"0";s:9:"mail_port";s:0:"";s:8:"mail_pwd";s:0:"";s:9:"mail_user";s:0:"";s:18:"openlogin_qq_appid";s:0:"";s:19:"openlogin_qq_appkey";s:0:"";s:21:"openlogin_qq_callback";s:0:"";s:17:"openlogin_qq_open";s:1:"0";s:20:"openlogin_weib_appid";s:0:"";s:21:"openlogin_weib_appkey";s:0:"";s:23:"openlogin_weib_callback";s:0:"";s:19:"openlogin_weib_open";s:1:"0";s:16:"post_verify_http";s:0:"";s:19:"post_verify_keyword";s:0:"";s:18:"post_verify_switch";s:1:"0";s:15:"post_verify_url";s:0:"";s:13:"recomm_switch";s:1:"0";s:13:"regCodeSwitch";s:1:"1";s:12:"show_ajax_to";s:1:"4";s:14:"show_page_mode";s:1:"0";s:13:"show_page_num";s:2:"10";s:10:"site_count";s:0:"";s:9:"site_desc";s:81:"宠物宝宝-中国第一宠物社交平台,了解养护知识,分享养宠乐趣";s:8:"site_icp";s:0:"";s:12:"site_keyword";s:45:"宠物,宠物社交,宠物交友,宠物交流";s:10:"site_title";s:12:"宠物宝宝";s:13:"site_titlepre";s:33:"全国最好的宠物社交平台";s:12:"theme_upload";s:1:"1";s:16:"theme_uploadsize";s:7:"1048576";s:16:"theme_uploadtype";s:11:"jpg,png,gif";s:13:"wizard_switch";s:1:"1";}";'),
('ybmodel', '1715774332s:1859:"a:2:{s:5:"model";a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"6";}s:4:"data";a:5:{i:1;a:10:{s:2:"id";s:1:"1";s:4:"icon";s:4:"text";s:4:"name";s:6:"文字";s:9:"modelfile";s:14:"word.class.php";s:6:"status";s:1:"1";s:5:"mdesc";s:12:"发布文字";s:7:"version";s:3:"1.0";s:6:"author";s:6:"SYSTEM";s:7:"feedtpl";s:0:"";s:3:"cfg";s:143:"imguplod--1--是否开启图片上传\nimguploadsize--2048--图片上传尺寸不设置取全局\nimagetype--jpg|jpge|png|gif--图片上传类型";}i:2;a:10:{s:2:"id";s:1:"2";s:4:"icon";s:5:"music";s:4:"name";s:6:"音乐";s:9:"modelfile";s:15:"music.class.php";s:6:"status";s:1:"0";s:5:"mdesc";s:12:"发布音乐";s:7:"version";s:3:"1.0";s:6:"author";s:6:"SYSTEM";s:7:"feedtpl";s:0:"";s:3:"cfg";s:182:"enableurl--1--是否开启引用地址发布\r\nenableupload--1--是否开启上传发布\r\nuploadsize--5000--允许长传大小(KB)\r\nuploadtype--mp3|wma|mid|midi--允许上传的类型";}i:3;a:10:{s:2:"id";s:1:"3";s:4:"icon";s:5:"photo";s:4:"name";s:6:"图片";s:9:"modelfile";s:15:"photo.class.php";s:6:"status";s:1:"1";s:5:"mdesc";s:12:"发布图片";s:7:"version";s:3:"1.0";s:6:"author";s:6:"SYSTEM";s:7:"feedtpl";s:0:"";s:3:"cfg";s:115:"imagetype--jpg|jpge|png|gif--上传类型\r\nimagesize--20480--上传大小\r\nimagecount--20--每次最大上传数量";}i:4;a:10:{s:2:"id";s:1:"4";s:4:"icon";s:5:"video";s:4:"name";s:6:"视频";s:9:"modelfile";s:15:"video.class.php";s:6:"status";s:1:"1";s:5:"mdesc";s:12:"发布视频";s:7:"version";s:3:"1.0";s:6:"author";s:6:"SYSTEM";s:7:"feedtpl";s:0:"";s:3:"cfg";s:0:"";}i:6;a:10:{s:2:"id";s:1:"6";s:4:"icon";s:5:"movie";s:4:"name";s:6:"电影";s:9:"modelfile";s:15:"movie.class.php";s:6:"status";s:1:"0";s:5:"mdesc";s:12:"发布电影";s:7:"version";s:3:"1.0";s:6:"author";s:6:"SYSTEM";s:7:"feedtpl";s:0:"";s:3:"cfg";s:38:"enableurl--1--是否开启解析功能";}}}";'),
('custompageCate', '1715790376s:532:"a:3:{i:0;a:6:{s:2:"id";s:1:"1";s:4:"tags";s:5:"about";s:5:"title";s:12:"关于我们";s:7:"keyword";s:12:"关于我们";s:11:"description";s:12:"关于我们";s:6:"orders";s:1:"1";}i:1;a:6:{s:2:"id";s:1:"2";s:4:"tags";s:4:"help";s:5:"title";s:12:"使用帮助";s:7:"keyword";s:12:"使用帮助";s:11:"description";s:12:"使用帮助";s:6:"orders";s:1:"2";}i:2;a:6:{s:2:"id";s:1:"3";s:4:"tags";s:4:"call";s:5:"title";s:12:"联系我们";s:7:"keyword";s:12:"联系我们";s:11:"description";s:12:"联系我们";s:6:"orders";s:1:"3";}}";'),
('custompage_about', '1715790379s:290:"a:7:{s:2:"id";s:1:"1";s:4:"tags";s:5:"about";s:5:"title";s:12:"关于我们";s:7:"keyword";s:12:"关于我们";s:11:"description";s:12:"关于我们";s:6:"orders";s:1:"1";s:10:"cpage_body";a:1:{s:4:"body";s:75:" <h3>宠物宝贝</h3> <p>宠物宝贝是国内首个宠物社交平台</p>";}}";'),
('adunit', '1715773450s:1224:"a:6:{i:1;a:7:{s:2:"id";s:1:"1";s:5:"title";s:24:"首页右侧底部广告";s:5:"adesc";s:24:"首页右侧底部广告";s:3:"img";s:5:"1.jpg";s:6:"orders";s:1:"1";s:6:"system";s:1:"1";s:7:"is_show";s:1:"1";}i:2;a:7:{s:2:"id";s:1:"2";s:5:"title";s:21:"首页顶部广告位";s:5:"adesc";s:21:"首页顶部广告位";s:3:"img";s:5:"2.jpg";s:6:"orders";s:1:"2";s:6:"system";s:1:"1";s:7:"is_show";s:1:"1";}i:3;a:7:{s:2:"id";s:1:"3";s:5:"title";s:21:"发现频道广告位";s:5:"adesc";s:21:"发现频道广告位";s:3:"img";s:5:"3.jpg";s:6:"orders";s:1:"4";s:6:"system";s:1:"1";s:7:"is_show";s:1:"1";}i:4;a:7:{s:2:"id";s:1:"4";s:5:"title";s:27:"推荐频道顶部广告位";s:5:"adesc";s:27:"推荐频道顶部广告位";s:3:"img";s:5:"4.jpg";s:6:"orders";s:1:"3";s:6:"system";s:1:"1";s:7:"is_show";s:1:"1";}i:5;a:7:{s:2:"id";s:1:"5";s:5:"title";s:27:"用户主页右侧广告位";s:5:"adesc";s:27:"用户主页右侧广告位";s:3:"img";s:5:"5.jpg";s:6:"orders";s:1:"5";s:6:"system";s:1:"1";s:7:"is_show";s:1:"1";}i:6;a:7:{s:2:"id";s:1:"6";s:5:"title";s:30:"用户主页详情页广告位";s:5:"adesc";s:30:"用户主页详情页广告位";s:3:"img";s:5:"6.jpg";s:6:"orders";s:1:"6";s:6:"system";s:1:"1";s:7:"is_show";s:1:"1";}}";'),
('Ad_1', '1715790670s:4:"b:0;";'),
('Ad_2', '1715790670s:4:"b:0;";'),
('systag', '1715773573s:2504:"a:26:{i:0;a:4:{s:3:"cid";s:1:"1";s:8:"catename";s:6:"艺术";s:4:"sort";s:1:"1";s:4:"used";s:1:"0";}i:1;a:4:{s:3:"cid";s:1:"2";s:8:"catename";s:6:"时尚";s:4:"sort";s:1:"2";s:4:"used";s:1:"0";}i:2;a:4:{s:3:"cid";s:1:"3";s:8:"catename";s:6:"音乐";s:4:"sort";s:1:"3";s:4:"used";s:1:"0";}i:3;a:4:{s:3:"cid";s:1:"4";s:8:"catename";s:6:"摄影";s:4:"sort";s:1:"4";s:4:"used";s:1:"0";}i:4;a:4:{s:3:"cid";s:1:"5";s:8:"catename";s:6:"阅读";s:4:"sort";s:1:"5";s:4:"used";s:1:"0";}i:5;a:4:{s:3:"cid";s:1:"6";s:8:"catename";s:6:"动漫";s:4:"sort";s:1:"6";s:4:"used";s:1:"0";}i:6;a:4:{s:3:"cid";s:1:"7";s:8:"catename";s:6:"游戏";s:4:"sort";s:1:"7";s:4:"used";s:1:"0";}i:7;a:4:{s:3:"cid";s:1:"8";s:8:"catename";s:6:"随笔";s:4:"sort";s:1:"8";s:4:"used";s:1:"0";}i:8;a:4:{s:3:"cid";s:1:"9";s:8:"catename";s:6:"插画";s:4:"sort";s:1:"9";s:4:"used";s:1:"0";}i:9;a:4:{s:3:"cid";s:2:"10";s:8:"catename";s:6:"设计";s:4:"sort";s:2:"10";s:4:"used";s:1:"0";}i:10;a:4:{s:3:"cid";s:2:"11";s:8:"catename";s:6:"建筑";s:4:"sort";s:2:"11";s:4:"used";s:1:"0";}i:11;a:4:{s:3:"cid";s:2:"12";s:8:"catename";s:6:"创意";s:4:"sort";s:2:"12";s:4:"used";s:1:"0";}i:12;a:4:{s:3:"cid";s:2:"13";s:8:"catename";s:6:"猎图";s:4:"sort";s:2:"13";s:4:"used";s:1:"0";}i:13;a:4:{s:3:"cid";s:2:"14";s:8:"catename";s:6:"宠物";s:4:"sort";s:2:"14";s:4:"used";s:1:"0";}i:14;a:4:{s:3:"cid";s:2:"15";s:8:"catename";s:6:"汽车";s:4:"sort";s:2:"15";s:4:"used";s:1:"0";}i:15;a:4:{s:3:"cid";s:2:"16";s:8:"catename";s:6:"家居";s:4:"sort";s:2:"16";s:4:"used";s:1:"0";}i:16;a:4:{s:3:"cid";s:2:"17";s:8:"catename";s:9:"互联网";s:4:"sort";s:2:"17";s:4:"used";s:1:"0";}i:17;a:4:{s:3:"cid";s:2:"18";s:8:"catename";s:6:"旅行";s:4:"sort";s:2:"18";s:4:"used";s:1:"0";}i:18;a:4:{s:3:"cid";s:2:"19";s:8:"catename";s:6:"数码";s:4:"sort";s:2:"19";s:4:"used";s:1:"0";}i:19;a:4:{s:3:"cid";s:2:"20";s:8:"catename";s:6:"影视";s:4:"sort";s:2:"20";s:4:"used";s:1:"0";}i:20;a:4:{s:3:"cid";s:2:"21";s:8:"catename";s:6:"美食";s:4:"sort";s:2:"21";s:4:"used";s:1:"0";}i:21;a:4:{s:3:"cid";s:2:"22";s:8:"catename";s:6:"恋物";s:4:"sort";s:2:"22";s:4:"used";s:1:"0";}i:22;a:4:{s:3:"cid";s:2:"23";s:8:"catename";s:6:"趣味";s:4:"sort";s:2:"23";s:4:"used";s:1:"0";}i:23;a:4:{s:3:"cid";s:2:"24";s:8:"catename";s:6:"科学";s:4:"sort";s:2:"24";s:4:"used";s:1:"0";}i:24;a:4:{s:3:"cid";s:2:"25";s:8:"catename";s:6:"军事";s:4:"sort";s:2:"25";s:4:"used";s:1:"0";}i:25;a:4:{s:3:"cid";s:2:"26";s:8:"catename";s:6:"体育";s:4:"sort";s:2:"26";s:4:"used";s:1:"0";}}";'),
('recommend_shuffle_3', '1415877010s:2:"N;";'),
('myfollow_1', '1415788875s:4:"b:0;";'),
('findTagHotUser_d41d8cd98f00b204e9800998ecf8427e', '1415860330s:4:"b:0;";'),
('recommend_shuffle_all', '1415861771s:229:"a:1:{i:0;a:9:{s:3:"bid";s:1:"1";s:5:"title";s:12:"我的小狗";s:4:"body";b:0;s:4:"type";s:1:"1";s:3:"uid";s:1:"1";s:8:"username";s:0:"";s:5:"b_url";s:34:"/index.php?c=userblog&a=show&bid=1";s:3:"tag";s:0:"";s:3:"img";s:1:" ";}}";'),
('discoverTag_30', '1415861771s:4:"b:0;";'),
('Ad_3', '1715775371s:4:"b:0;";'),
('Ad_4', '1715775370s:4:"b:0;";'),
('findeUserTag_1', '1415871657s:4:"b:0;";'),
('custompage_help', '1715790076s:1869:"a:7:{s:2:"id";s:1:"2";s:4:"tags";s:4:"help";s:5:"title";s:12:"使用帮助";s:7:"keyword";s:12:"使用帮助";s:11:"description";s:12:"使用帮助";s:6:"orders";s:1:"2";s:10:"cpage_body";a:1:{s:4:"body";s:1653:" <h3>发布内容</h3> <p>登陆后点击右侧 文字链接，即可进入发布文字功能。可输入内容，并可插入单张图片</p> <h3>发布音乐</h3> <p>登陆后点击右侧 音乐，即可进入发布音乐功能。您可以选择网络音乐 和 本地上传两种方式。</p> <p>网络音乐引用地址可以输入虾米、雅燃音乐、音悦台、优酷、土豆、6间房、腾讯播客、新浪博客、56.com等诸多网站播放地址。 也可以直接粘贴网络后缀为mp3的歌曲。</p> <p>本地上传您可以上传本地的MP3文件，但请注意的是您需要拥有该媒体的著作权，也就是说您自己录或者制作的音乐皆可，但不能上传网络上不属于您的版权的音乐。如果被查出或举报或版权纠纷我们将不负任何责任，并且删除该媒体资源。</p> <h3>发布图片</h3> <p>您可以同时上传最多20张照片作为博客内容，并且也可以编写介绍。</p> <h3>发布视频</h3> <p>视频引用地址可以输入虾米、雅燃音乐、音悦台、优酷、土豆、6间房、腾讯播客、新浪博客、56.com等诸多网站播放地址。建议您可以将录制好的视频传至以上媒体然后填写引用地址。</p> <p>同时您也可以编写介绍</p> <h3>关于标签</h3> <p>不管发布任何内容您都需要填写至少一个标签，轻博内容将根据标签来进行区分。因此填写一个或多个合适的标签是非常不错的选择。</p> <h3>关注和喜欢</h3> <p>加为关注的用户将会在您的首页显示最新发布动态</p> <p>加为喜欢的博客可方便您在右侧导航中快速的查找</p> ";}}";'),
('custompage_call', '1715790382s:509:"a:7:{s:2:"id";s:1:"3";s:4:"tags";s:4:"call";s:5:"title";s:12:"联系我们";s:7:"keyword";s:12:"联系我们";s:11:"description";s:12:"联系我们";s:6:"orders";s:1:"3";s:10:"cpage_body";a:1:{s:4:"body";s:294:"<h3>交流群</h3> <p><a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=8a2125d4ee65d3dfaf05d5c3382bbaadc43c3e495d8d99e68c6776177ad8b06e"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="涿州房产群之吊炸天" title="涿州房产群之吊炸天"></a></p>";}}";'),
('Ad_6', '1715785265s:4:"b:0;";'),
('Ad_5', '1715785265s:4:"b:0;";');

-- --------------------------------------------------------

--
-- 表的结构 `pet_catetags`
--

CREATE TABLE IF NOT EXISTS `pet_catetags` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catename` varchar(20) NOT NULL,
  `sort` tinyint(10) unsigned NOT NULL COMMENT '排序',
  `used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有多少人用了这个标签',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `pet_catetags`
--

INSERT INTO `pet_catetags` (`cid`, `catename`, `sort`, `used`) VALUES
(1, '艺术', 1, 0),
(2, '时尚', 2, 0),
(3, '音乐', 3, 0),
(4, '摄影', 4, 0),
(5, '阅读', 5, 0),
(6, '动漫', 6, 0),
(7, '游戏', 7, 0),
(8, '随笔', 8, 0),
(9, '插画', 9, 0),
(10, '设计', 10, 0),
(11, '建筑', 11, 0),
(12, '创意', 12, 0),
(13, '猎图', 13, 0),
(14, '宠物', 14, 0),
(15, '汽车', 15, 0),
(16, '家居', 16, 0),
(17, '互联网', 17, 0),
(18, '旅行', 18, 0),
(19, '数码', 19, 0),
(20, '影视', 20, 0),
(21, '美食', 21, 0),
(22, '恋物', 22, 0),
(23, '趣味', 23, 0),
(24, '科学', 24, 0),
(25, '军事', 25, 0),
(26, '体育', 26, 0);

-- --------------------------------------------------------

--
-- 表的结构 `pet_cpage_body`
--

CREATE TABLE IF NOT EXISTS `pet_cpage_body` (
  `cid` int(10) unsigned NOT NULL,
  `body` text,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义页面,内容';

--
-- 转存表中的数据 `pet_cpage_body`
--

INSERT INTO `pet_cpage_body` (`cid`, `body`) VALUES
(1, ' <h3>宠物宝贝</h3> <p>宠物宝贝是国内首个宠物社交平台</p>'),
(2, ' <h3>发布内容</h3> <p>登陆后点击右侧 文字链接，即可进入发布文字功能。可输入内容，并可插入单张图片</p> <h3>发布音乐</h3> <p>登陆后点击右侧 音乐，即可进入发布音乐功能。您可以选择网络音乐 和 本地上传两种方式。</p> <p>网络音乐引用地址可以输入虾米、雅燃音乐、音悦台、优酷、土豆、6间房、腾讯播客、新浪博客、56.com等诸多网站播放地址。 也可以直接粘贴网络后缀为mp3的歌曲。</p> <p>本地上传您可以上传本地的MP3文件，但请注意的是您需要拥有该媒体的著作权，也就是说您自己录或者制作的音乐皆可，但不能上传网络上不属于您的版权的音乐。如果被查出或举报或版权纠纷我们将不负任何责任，并且删除该媒体资源。</p> <h3>发布图片</h3> <p>您可以同时上传最多20张照片作为博客内容，并且也可以编写介绍。</p> <h3>发布视频</h3> <p>视频引用地址可以输入虾米、雅燃音乐、音悦台、优酷、土豆、6间房、腾讯播客、新浪博客、56.com等诸多网站播放地址。建议您可以将录制好的视频传至以上媒体然后填写引用地址。</p> <p>同时您也可以编写介绍</p> <h3>关于标签</h3> <p>不管发布任何内容您都需要填写至少一个标签，轻博内容将根据标签来进行区分。因此填写一个或多个合适的标签是非常不错的选择。</p> <h3>关注和喜欢</h3> <p>加为关注的用户将会在您的首页显示最新发布动态</p> <p>加为喜欢的博客可方便您在右侧导航中快速的查找</p> '),
(3, '<h3>交流群</h3> <p><a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=8a2125d4ee65d3dfaf05d5c3382bbaadc43c3e495d8d99e68c6776177ad8b06e"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="涿州房产群之吊炸天" title="涿州房产群之吊炸天"></a></p>');

-- --------------------------------------------------------

--
-- 表的结构 `pet_cpage_cate`
--

CREATE TABLE IF NOT EXISTS `pet_cpage_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tags` varchar(30) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `orders` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags` (`tags`),
  KEY `order` (`orders`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='自定义页面,标题' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `pet_cpage_cate`
--

INSERT INTO `pet_cpage_cate` (`id`, `tags`, `title`, `keyword`, `description`, `orders`) VALUES
(3, 'call', '联系我们', '联系我们', '联系我们', 3),
(2, 'help', '使用帮助', '使用帮助', '使用帮助', 2),
(1, 'about', '关于我们', '关于我们', '关于我们', 1);

-- --------------------------------------------------------

--
-- 表的结构 `pet_feeds`
--

CREATE TABLE IF NOT EXISTS `pet_feeds` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parentkey` int(10) NOT NULL DEFAULT '0',
  `bid` int(10) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `uid` int(10) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '动态标题',
  `info` varchar(255) DEFAULT '' COMMENT '动态内容',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_findpwd`
--

CREATE TABLE IF NOT EXISTS `pet_findpwd` (
  `uid` int(10) NOT NULL,
  `token` char(32) NOT NULL,
  `time` int(10) NOT NULL,
  `mailsend` int(10) NOT NULL COMMENT '上次发送邮件时间',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='找回密码';

-- --------------------------------------------------------

--
-- 表的结构 `pet_follow`
--

CREATE TABLE IF NOT EXISTS `pet_follow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '谁',
  `touid` int(10) unsigned NOT NULL COMMENT '关注他',
  `linker` tinyint(1) NOT NULL COMMENT '互相关注',
  `time` int(10) NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`,`touid`),
  KEY `touid` (`touid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_invite`
--

CREATE TABLE IF NOT EXISTS `pet_invite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `inviteCode` char(32) NOT NULL COMMENT '邀请码',
  `exptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请码过期时间',
  PRIMARY KEY (`id`),
  KEY `inviteCode` (`inviteCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_invite_friend`
--

CREATE TABLE IF NOT EXISTS `pet_invite_friend` (
  `uid` int(10) NOT NULL,
  `touid` int(10) NOT NULL,
  PRIMARY KEY (`touid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请过的好友';

-- --------------------------------------------------------

--
-- 表的结构 `pet_likes`
--

CREATE TABLE IF NOT EXISTS `pet_likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `bid` int(10) unsigned NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_member`
--

CREATE TABLE IF NOT EXISTS `pet_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否开放',
  `email` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `salt` char(6) NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `domain` varchar(20) NOT NULL DEFAULT '',
  `local` varchar(20) DEFAULT NULL COMMENT '我所在',
  `blogtag` varchar(100) DEFAULT NULL,
  `sign` varchar(140) DEFAULT NULL,
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布数量',
  `flow` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注我的',
  `likenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '我喜欢的',
  `qq` char(12) NOT NULL DEFAULT '',
  `regtime` int(10) NOT NULL,
  `logtime` int(10) NOT NULL DEFAULT '0',
  `regip` char(16) NOT NULL DEFAULT '0',
  `logip` char(16) NOT NULL DEFAULT '0',
  `m_rep` tinyint(1) NOT NULL DEFAULT '1',
  `m_fow` tinyint(1) NOT NULL DEFAULT '1',
  `m_pm` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `domain` (`domain`),
  KEY `blogtag` (`blogtag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `pet_member`
--

INSERT INTO `pet_member` (`uid`, `admin`, `open`, `email`, `password`, `salt`, `username`, `domain`, `local`, `blogtag`, `sign`, `num`, `flow`, `likenum`, `qq`, `regtime`, `logtime`, `regip`, `logip`, `m_rep`, `m_fow`, `m_pm`) VALUES
(1, 1, 1, '420012223@qq.com', '0bcb626018194b7900eb6ec62db1eae8', 'X6j4oH', '', 'root', NULL, NULL, NULL, 2, 0, 0, '', 1415772187, 0, '127.0.0.1', '0', 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pet_memberex`
--

CREATE TABLE IF NOT EXISTS `pet_memberex` (
  `openid` char(32) NOT NULL COMMENT '登陆唯一id',
  `token` char(32) NOT NULL COMMENT '验证凭据',
  `secret` char(32) NOT NULL,
  `types` char(4) NOT NULL COMMENT '类型 QQ SINA W163',
  `uid` int(10) NOT NULL COMMENT '是否关联账户',
  `expires` int(10) NOT NULL COMMENT '是否过期',
  PRIMARY KEY (`openid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='开放登陆';

-- --------------------------------------------------------

--
-- 表的结构 `pet_models`
--

CREATE TABLE IF NOT EXISTS `pet_models` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `icon` varchar(50) NOT NULL COMMENT '图标或样式标示符',
  `name` varchar(50) NOT NULL,
  `modelfile` char(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `mdesc` varchar(255) NOT NULL,
  `version` varchar(10) NOT NULL,
  `author` varchar(20) DEFAULT 'SYSTEM',
  `feedtpl` text NOT NULL,
  `cfg` text NOT NULL COMMENT 'conf',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `pet_models`
--

INSERT INTO `pet_models` (`id`, `icon`, `name`, `modelfile`, `status`, `mdesc`, `version`, `author`, `feedtpl`, `cfg`) VALUES
(1, 'text', '文字', 'word.class.php', 1, '发布文字', '1.0', 'SYSTEM', '', 'imguplod--1--是否开启图片上传\nimguploadsize--2048--图片上传尺寸不设置取全局\nimagetype--jpg|jpge|png|gif--图片上传类型'),
(2, 'music', '音乐', 'music.class.php', 0, '发布音乐', '1.0', 'SYSTEM', '', 'enableurl--1--是否开启引用地址发布\r\nenableupload--1--是否开启上传发布\r\nuploadsize--5000--允许长传大小(KB)\r\nuploadtype--mp3|wma|mid|midi--允许上传的类型'),
(4, 'video', '视频', 'video.class.php', 1, '发布视频', '1.0', 'SYSTEM', '', ''),
(3, 'photo', '图片', 'photo.class.php', 1, '发布图片', '1.0', 'SYSTEM', '', 'imagetype--jpg|jpge|png|gif--上传类型\r\nimagesize--20480--上传大小\r\nimagecount--20--每次最大上传数量'),
(6, 'movie', '电影', 'movie.class.php', 0, '发布电影', '1.0', 'SYSTEM', '', 'enableurl--1--是否开启解析功能');

-- --------------------------------------------------------

--
-- 表的结构 `pet_mytags`
--

CREATE TABLE IF NOT EXISTS `pet_mytags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `tagid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagid` (`tagid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我收藏的Tag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_notice`
--

CREATE TABLE IF NOT EXISTS `pet_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '我',
  `sys` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1为回复 0为私信 2为通知',
  `foruid` int(10) unsigned NOT NULL COMMENT '谁搞我',
  `title` varchar(50) NOT NULL,
  `info` varchar(500) DEFAULT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `location` varchar(255) NOT NULL COMMENT '跳转位置',
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foruid` (`foruid`,`isread`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的通知' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_pm`
--

CREATE TABLE IF NOT EXISTS `pet_pm` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `touid` int(10) NOT NULL,
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `info` varchar(255) NOT NULL,
  `status` int(10) DEFAULT '0' COMMENT '删除标记',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `isnew` (`isnew`,`uid`),
  KEY `pminfo` (`uid`,`touid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_replay`
--

CREATE TABLE IF NOT EXISTS `pet_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `repuid` int(10) unsigned DEFAULT '0' COMMENT '回复某人',
  `msg` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_setting`
--

CREATE TABLE IF NOT EXISTS `pet_setting` (
  `name` varchar(25) NOT NULL,
  `val` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统设置';

--
-- 转存表中的数据 `pet_setting`
--

INSERT INTO `pet_setting` (`name`, `val`) VALUES
('site_title', '宠物宝宝'),
('site_desc', '宠物宝宝-中国第一宠物社交平台,了解养护知识,分享养宠乐趣'),
('site_count', ''),
('site_titlepre', '全国最好的宠物社交平台'),
('site_keyword', '宠物,宠物社交,宠物交友,宠物交流'),
('regCodeSwitch', '1'),
('loginCodeSwitch', '1'),
('invite_switch', '0'),
('recomm_switch', '0'),
('invite_count', '5'),
('invite_expiration', '10'),
('guestMode', '1'),
('theme_uploadsize', '1048576'),
('theme_upload', '1'),
('show_page_mode', '0'),
('show_ajax_to', '4'),
('show_page_num', '10'),
('hotuser_switch', '1'),
('wizard_switch', '1'),
('theme_uploadtype', 'jpg,png,gif'),
('addimg_upsize', '10485760'),
('addimg_type', 'jpg|png|jpge|bmp|gif'),
('keep_email', 'admin,ipetbaby'),
('keep_niname', 'ipetbaby,admin,administrator,master,webmaster,email,username,password'),
('keep_domain', 'www,ipetbaby,bbs,music,map,index,register,login,tag,now,admin,recommend,discovery,myfollow,mypost,mylikes,myreplays,mynotices,edit,logout,home,gomember,location,showinfo,about,copyright,call,service,privacy,custom,read,pm,user,site'),
('keep_rep', ''),
('site_icp', ''),
('cookiepre', ''),
('cookiekey', ''),
('mail_open', '0'),
('mail_host', ''),
('mail_port', ''),
('mail_user', ''),
('mail_pwd', ''),
('mail_from', ''),
('mail_fromname', ''),
('post_verify_switch', '0'),
('post_verify_url', ''),
('post_verify_http', ''),
('post_verify_keyword', ''),
('openlogin_qq_open', '0'),
('openlogin_qq_appid', ''),
('openlogin_qq_appkey', ''),
('openlogin_qq_callback', ''),
('openlogin_weib_open', '0'),
('openlogin_weib_appid', ''),
('openlogin_weib_appkey', ''),
('openlogin_weib_callback', '');

-- --------------------------------------------------------

--
-- 表的结构 `pet_skins`
--

CREATE TABLE IF NOT EXISTS `pet_skins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `skindir` varchar(255) NOT NULL COMMENT '主题位置',
  `name` varchar(50) NOT NULL COMMENT '主题名称',
  `author` varchar(50) NOT NULL COMMENT '主题作者',
  `uri` varchar(50) NOT NULL COMMENT '主题主页',
  `version` char(10) NOT NULL COMMENT '主题版本',
  `exclusive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为专属主题',
  `usenumber` int(10) DEFAULT '0' COMMENT '多少人用',
  `setup` text COMMENT '主题钩子',
  `open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统主题表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_tags`
--

CREATE TABLE IF NOT EXISTS `pet_tags` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `bid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `title` (`title`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_tags_blog`
--

CREATE TABLE IF NOT EXISTS `pet_tags_blog` (
  `tagid` int(10) NOT NULL COMMENT 'tagid',
  `uid` int(10) NOT NULL COMMENT 'uid',
  KEY `tagid` (`tagid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='根据某人设置的blogid 获得tagid';

-- --------------------------------------------------------

--
-- 表的结构 `pet_tags_system`
--

CREATE TABLE IF NOT EXISTS `pet_tags_system` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '标签',
  `num` int(10) unsigned DEFAULT '0' COMMENT '标签使用率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统整理标签表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pet_theme`
--

CREATE TABLE IF NOT EXISTS `pet_theme` (
  `uid` int(10) NOT NULL,
  `config` text,
  `setup` text,
  `css` text,
  `img1` varchar(255) DEFAULT NULL,
  `img2` varchar(255) DEFAULT NULL,
  `img3` varchar(255) DEFAULT NULL,
  `img4` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人主题表';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
