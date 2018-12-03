<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Chapter 14. Smarty成员方法 | Smarty</title>
    <meta name="description" content="Chapter 14. Smarty成员方法">
    <meta name="keywords" content="chapter, 14, smarty, ">
    <style type="text/css" media="screen">
    @import "css/screen/global.css";
    @import "css/typography.css";
    </style>
    
    <!--[if lt IE 7]>
    <style type="text/css" media="screen">
    @import "css/screen/fix_ie.css";
    </style>
    <![endif]-->
    
    <!--[if IE 7]>
    <style type="text/css" media="screen">
    @import "css/screen/fix_ie7.css";
    </style>
    <![endif]-->
    
    <link rel="stylesheet" type="text/css" media="print" href="css/typography.css">
    <link rel="stylesheet" type="text/css" media="print" href="css/print/global.css">
    <link rel="stylesheet" type="text/css" media="screen" href="js/bbedit.css">
    
    <script type="text/javascript" src="../../../www.google.com/jsapi_91823002"></script>
    <script type="text/javascript" src="../../../ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="../../../ajax.googleapis.com/ajax/libs/jqueryui/1.8.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/jquery.bbedit.min.js"></script>
    
    <link href="js/prettify/prettify.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/prettify/prettify.js"></script>    
    
    <script type="text/JavaScript"> 
     $(document).ready(function(){
       prettyPrint();
              $("#commentFormBodyText").bbedit({
           highlight: true,
           enableSmileybar: false,
           tags: 'b,i,url,code,quote'
       });
       $("#commentPreviewText").hide();
       $("#commentPostedText").hide();
       $("#commentBusyIcon").hide();
       $("#commentForm").submit(function() { return false; });
       $("#commentFormPreviewButton").click(function(){
         $("#commentBusyIcon").show();
         $.post("/comments/preview", { body: $("#commentFormBodyText").val(), author: $("#commentFormAuthorText").val() },
            function(data){
              var options = {};
              if($("#commentPreviewText").is(":visible")) {
                $("#commentPreviewText").hide('blind',options,500,function() {
                  $("#commentPreviewText").html(data);
                  $("#commentPreviewText").show('blind',options,500,function() {
                    $("#commentBusyIcon").hide();
                  });                  
                });
              } else {
                $("#commentPreviewText").html(data);
                $("#commentPreviewText").show('blind',options,500,function() {
                  $("#commentBusyIcon").hide();
                });                  
              }
            });
       }); 
       $("#commentFormPostButton").click(function(){
         $("#commentBusyIcon").show();
         $.post("/comments/post", { body: $("#commentFormBodyText").val(), author: $("#commentFormAuthorText").val(), page_id: $("#commentFormPageID").val(), email: $("#commentFormEmailText").val(), challenge: $("#commentFormChallengeText").val(), obf: $("#commentFormChallengeObf").val()},
            function(data){
              var options = {};
              $("#commentPostedText").html(data);
              if($("#commentPreviewText").is(":visible")) {
                $("#commentPreviewText").hide('blind',options,500,function() {
                  $("#commentPostedText").show('blind',options,500,function() {
                    $("#commentBusyIcon").hide();
                    $("#commentFormPostButton").attr('disabled','true'); 
                    $("#commentFormPreviewButton").attr('disabled','true'); 
                  });
                });
              } else {
                $("#commentPostedText").show('blind',options,500,function() {
                  $("#commentBusyIcon").hide();
                  $("#commentFormPostButton").attr('disabled','true'); 
                  $("#commentFormPreviewButton").attr('disabled','true'); 
                });
              }                  
            });
       });
            });
          function clearDefaultandCSS(el) {
     	if (el.defaultValue==el.value) el.value = ""
     	// If Dynamic Style is supported, clear the style
     	if (el.style) el.style.cssText = ""
     }
         </script>
    
    <script type="text/javascript" src="js/smarty.js"></script>
  	<script type="text/javascript" src="../../../partner.googleadservices.com/gampad/google_service.js"> 
  	</script> 
  	<script type="text/javascript"> 
  	  GS_googleAddAdSenseService("ca-pub-8878956630941543");
  	  GS_googleEnableAllServices();
  	</script> 
  	<script type="text/javascript"> 
  	  GA_googleAddSlot("ca-pub-8878956630941543", "smarty_footer");
  	  GA_googleAddSlot("ca-pub-8878956630941543", "smarty_left_box");
  	  GA_googleAddSlot("ca-pub-8878956630941543", "smarty_right_skyscraper");
  	  GA_googleAddSlot("ca-pub-8878956630941543", "smarty_top_banner");
  	</script> 
  	<script type="text/javascript"> 
  	  GA_googleFetchAds();
  	</script>
  </head>
  <body>
  <a class="skiplink" accesskey="S" href="index.htm">返回导航菜单</a>
  <div id="wrapper">
      <div id="header">
        <div id="header_logo">
          <div id="logo"><a href="../../index.htm"><img src="../../images/logo_print.gif" width="249" height="74" alt="Smarty Template Engine"></a></div>
        </div>
        <div id="header_ad" style="float: right;">
      		<script type="text/javascript"> 
      		  GA_googleFillSlot("smarty_footer");
      		</script>
      	</div>
        <div class="clear"></div>
      </div>
      <div id="nav">
        <ul class="nav navHorz">
		  		  		  		  		  		              		<li><a href="../../index.htm" accesskey="1">Home</a></li>
					  		              		<li><a href="../../download/index.htm" >Download</a></li>
					  		              		<li><a href="../../documentation/index.htm" accesskey="6">Documentation</a></li>
					  		              		<li><a href="../../../smarty.incutio.com/query_B576CE4C" >FAQ</a></li>
					  		              		<li><a href="../../forums/index.htm" >Forum</a></li>
					  		              		<li><a href="../../mailinglists/index.htm" >Mailing Lists</a></li>
					          </ul>
        
        <form action="../../search/index.htm" method="get">
          <p>
            <input type="text" name="q" size="30" value="Search..." accesskey="4" class="field" onclick="smarty.removeDefaultValue(this, 'Search...');" onfocus="smarty.removeDefaultValue(this, 'Search...');" onblur="smarty.restoreDefaultValue(this, 'Search...');">
            in
            <select name="show" class="field">
              <optgroup label="Documentation">
                <option value="manual-en">English</option>
                <option value="manual-de">German</option>
                <option value="manual-es">Spanish</option>
                <option value="manual-fr">French</option>
                <option value="manual-it">Italian</option>
                <option value="manual-ja">Japanese</option>
                <option value="manual-pt_BR">Portuguese</option>
                <option value="manual-ru">Russian</option>
              </optgroup>
              <optgroup label="Mailing Lists">
                <option value="smarty-general-list">General</option>
                <option value="smarty-dev-list">Development</option>
              </optgroup>
            </select>
            <input type="image" src="../../images/search.png" alt="Submit Search" class="button">
          </p>
        </form>
        <div class="clear"></div>
      </div>
     
      <div class="col colSecondary">
        <div class="box box1">
          <h1 class="boxHead">Get Smarty</h1>
          <ul class="nav navVert"
            ><li><a href="../../download/index.htm">Download</a></li
          ></ul>
        </div>
        
        <div class="box box1">
          <h1 class="boxHead">About Smarty</h1>
          <ul class="nav navVert"
          ><li><a href="../../about_smarty/index.htm">All About Smarty</a></li
            ><li><a href="../../why_use/index.htm">Why use it?</a></li
              ><li><a href="../../use_cases/index.htm">Use Cases and Work Flow</a></li
            ><li><a href="../../syntax_comparison/index.htm">Syntax Comparison</a></li
            ><li><a href="../../inheritance/index.htm">Template Inheritance</a></li
            ><li><a href="../../best_practices/index.htm">Best Practices</a></li
            ><li><a href="../../crash_course/index.htm">Crash Course</a></li
            ><li><a href="../../v3_overview/index.htm">Version 3 Overview</a></li
            ><li><a href="../../forums/viewforum_98ED2CF7.php">Testimonials</a></li
              ><li><a href="../../../smarty.incutio.com/query_B3046D2B">Sites Using Smarty</a></li
          ></ul>
        </div>
        
        <div class="box box1">
          <h1 class="boxHead">Resources</h1>
          <ul class="nav navVert"
          ><li><a href="../../../smarty-php.googlecode.com/svn/trunk/distribution/SMARTY_2_BC_NOTES.txt">Smarty 2-&gt;3 upgrade notes</a></li
            ><li><a href="../../../smarty-php.googlecode.com/svn/trunk/distribution/README/index.htm">README (from distro)</a></li
          ><li><a href="../../quick_install/index.htm">Quick Install</a></li
	      ><li><a href="../../documentation/index.htm">Documentation</a></li
		  ><li><a href="../../forums/index.htm">Discussion Forums</a></li
	      ><li><a href="../../sampleapp1/index.htm">Example App</a></li
          ><li><a href="irc_F08802D1">IRC (chat)</a></li
          ><li><a href="../../mailinglists/index.htm">Mailing Lists</a></li
          ><li><a href="../../../smarty.incutio.com/index.htm">Community Wiki</a></li
          ><li><a href="../../../smarty.incutio.com/query_B576CE4C">FAQ (wiki)</a></li
          ><li><a href="../../forums/viewforum_4EBD8F8F.php" accesskey="5">FAQ (forums)</a></li
          ><li><a href="../../../www.jdoqocy.com/click-4355642-10718312_A21397F0">Hire Smarty Developers</a></li
          ></ul>
        </div>
        <div class="box box1">
          <h1 class="boxHead">Links</h1>
          <ul class="nav navVert"
          ><li><a href="../../../www.php.net/index.htm">www.php.net</a></li
            ><li><a href="../../../www.phpinsider.com/index.htm">www.phpinsider.com</a></li
          ></ul>
        </div>

        <div class="box box1" id="smartyIcons">
          <h1 class="boxHead">Smarty Icon</h1>
          <div align="center" class="boxContent">
            <p style="text-align: left">You may use the Smarty logo according to the <a href="../../copyright/index.htm">trademark notice</a>.</p>
            <p>
              <img src="../../images/icons/smarty_icon.gif" width="88" height="31" alt="Smarty Template Engine">
              <img src="../../images/icons/smarty-80x15.png" width="80" height="15" alt="Smarty Template Engine">
            </p>
            <p style="text-align: left">
              For sponsorship, advertising, news or other inquiries, contact us at: <script type="text/javascript" language="javascript">
{document.write(String.fromCharCode(60,97,32,104,114,101,102,61,34,109,97,105,108,116,111,58,119,101,98,109,97,115,116,101,114,64,115,109,97,114,116,121,46,110,101,116,34,32,62,119,101,98,109,97,115,116,101,114,64,115,109,97,114,116,121,46,110,101,116,60,47,97,62))}
</script>

            </p>
            <p>
              Check reviews of PHP <a href="../../../www.webhostingbreak.com/list/php-web-hosting/index.htm">Web Hosting</a>, compatible with Smarty Templates
            </p>
      			<p>
                	<script type="text/javascript"> 
      			  GA_googleFillSlot("smarty_left_box");
      			</script>
      			</p>
          </div>
        </div>        

      </div><!-- end colSecondary -->
      
      <div class="col colMain" id="mainContent">
      
<div class="navheader">
<table width="100%" summary="Navigation header">
<tr><th colspan="3" align="center">Chapter 14. Smarty成员方法</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="variable.use.sub.dirs.tpl">Prev</a> </td>
<th width="60%" align="center">Part III. 程序开发者篇</th>
<td width="20%" align="right"> <a accesskey="n" href="api.add.config.dir.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="chapter" title="Chapter 14. Smarty成员方法">
<div class="titlepage"><div><div><h2 class="title">
<a name="api.functions"></a>Chapter 14. Smarty成员方法</h2></div></div></div>
<div class="toc">
<p><b>Table of Contents</b></p>
<dl>
<dt>
<span class="refentrytitle"><a href="api.add.config.dir.tpl">addConfigDir()</a></span><span class="refpurpose"> — 增加一个配置文件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.add.plugins.dir.tpl">addPluginsDir()</a></span><span class="refpurpose"> — 增加一个插件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.add.template.dir.tpl">addTemplateDir()</a></span><span class="refpurpose"> — 增加一个模板文件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.append.tpl">append()</a></span><span class="refpurpose"> — 把值追加到数组。</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.append.by.ref.tpl">appendByRef()</a></span><span class="refpurpose"> — 引用追加</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.assign.tpl">assign()</a></span><span class="refpurpose"> — 赋值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.assign.by.ref.tpl">assignByRef()</a></span><span class="refpurpose"> — 引用赋值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.all.assign.tpl">clearAllAssign()</a></span><span class="refpurpose"> — 清除全部赋值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.all.cache.tpl">clearAllCache()</a></span><span class="refpurpose"> — 清除全部缓存</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.assign.tpl">clearAssign()</a></span><span class="refpurpose"> — 清除赋值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.cache.tpl">clearCache()</a></span><span class="refpurpose"> — 清除缓存</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.compiled.tpl.tpl">clearCompiledTemplate()</a></span><span class="refpurpose"> — 清除模板编译文件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.config.tpl">clearConfig()</a></span><span class="refpurpose"> — 清除配置</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.compile.all.config.tpl">compileAllConfig()</a></span><span class="refpurpose"> — 编译全部配置文件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.compile.all.templates.tpl">compileAllTemplates()</a></span><span class="refpurpose"> — 编译全部模板</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.config.load.tpl">configLoad()</a></span><span class="refpurpose"> — 载入预配置的变量</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.create.data.tpl">createData()</a></span><span class="refpurpose"> — 创建数据对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.create.template.tpl">createTemplate()</a></span><span class="refpurpose"> — 创建模板对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.disable.security.tpl">disableSecurity()</a></span><span class="refpurpose"> — 关闭安全检查</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.display.tpl">display()</a></span><span class="refpurpose"> — 显示</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.enable.security.tpl">enableSecurity()</a></span><span class="refpurpose"> — 开启安全检查</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.fetch.tpl">fetch()</a></span><span class="refpurpose"> — 取得输出内容</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.cache.dir.tpl">getCacheDir()</a></span><span class="refpurpose"> — 取得缓存目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.compile.dir.tpl">getCompileDir()</a></span><span class="refpurpose"> — 取得编译目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.config.dir.tpl">getConfigDir()</a></span><span class="refpurpose"> — 取得配置文件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.config.vars.tpl">getConfigVars()</a></span><span class="refpurpose"> — 取得预配置变量</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.plugins.dir.tpl">getPluginsDir()</a></span><span class="refpurpose"> — 取得插件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.registered.object.tpl">getRegisteredObject()</a></span><span class="refpurpose"> — 获取已注册对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.tags.tpl">getTags()</a></span><span class="refpurpose"> — 取得模板标签</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.template.dir.tpl">getTemplateDir()</a></span><span class="refpurpose"> — 取得模板目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.template.vars.tpl">getTemplateVars()</a></span><span class="refpurpose"> — 取得变量值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.is.cached.tpl">isCached()</a></span><span class="refpurpose"> — 检查模板是否已经缓存</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.load.filter.tpl">loadFilter()</a></span><span class="refpurpose"> — 载入过滤插件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.mute.expected.errors.tpl">Smarty::muteExpectedErrors()</a></span><span class="refpurpose"> — 忽略脚本警告信息</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.cacheresource.tpl">registerCacheResource()</a></span><span class="refpurpose"> — 注册缓存资源</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.class.tpl">registerClass()</a></span><span class="refpurpose"> — 注册类</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.default.plugin.handler.tpl">registerDefaultPluginHandler()</a></span><span class="refpurpose"> — 注册默认插件处理器</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.filter.tpl">registerFilter()</a></span><span class="refpurpose"> — 注册过滤器</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.plugin.tpl">registerPlugin()</a></span><span class="refpurpose"> — 注册插件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.object.tpl">registerObject()</a></span><span class="refpurpose"> — 注册对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.resource.tpl">registerResource()</a></span><span class="refpurpose"> — 注册资源</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.cache.dir.tpl">setCacheDir()</a></span><span class="refpurpose"> — 设置缓存目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.compile.dir.tpl">setCompileDir()</a></span><span class="refpurpose"> — 设置编译目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.config.dir.tpl">setConfigDir()</a></span><span class="refpurpose"> — 设置配置目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.plugins.dir.tpl">setPluginsDir()</a></span><span class="refpurpose"> — 设置插件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.template.dir.tpl">setTemplateDir()</a></span><span class="refpurpose"> — 设置模板目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.template.exists.tpl">templateExists()</a></span><span class="refpurpose"> — 检查模板是否存在</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.cacheresource.tpl">unregisterCacheResource()</a></span><span class="refpurpose"> — 注销缓存资源</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.filter.tpl">unregisterFilter()</a></span><span class="refpurpose"> — 注销过滤器</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.plugin.tpl">unregisterPlugin</a></span><span class="refpurpose"> — 注销插件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.object.tpl">unregisterObject()</a></span><span class="refpurpose"> — 注销对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.resource.tpl">unregisterResource()</a></span><span class="refpurpose"> — 注销资源</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.test.install.tpl">testInstall()</a></span><span class="refpurpose"> — 测试Smarty安装</span>
</dt>
</dl>
</div>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
    参见<a class="link" href="advanced.features.template.settings.tpl" title="修改模板设置"><code class="varname">改变模板设置</code></a>
	来了解如何在模板中使用这些函数。
 </p>
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="variable.use.sub.dirs.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="smarty.for.programmers.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="api.add.config.dir.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">$use_sub_dirs </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> addConfigDir()</td>
</tr>
</table>
</div>

		
		  <div class="comments">
      
                  <div id="commentHeader"><strong>Comments</strong></div>
          <div class="commentInfo">
          
                                <div class="commentWrapperEven">
              <div class="commentBody"><emphasis>No comments for this page.</emphasis></div>
            </div>          
                    </div>
          <div id="commentFormWrapper">
            <div id="commentFormHeader"><strong>Post a Comment</strong></div>
            <div id="commentFormElements">
            <form id="commentForm" method="post" action="../../comments/post/index.htm">
              <div id="commentText" style="font-style: italic; color:#f00">All comments are moderated. Support questions are ignored, use the <a href="../../forums/index.htm">forums</a> instead.</div>
              <div id="commentFormAuthor">Author: <input id="commentFormAuthorText" type="text" name="author" size="40" value="anonymous" style="color: grey" onFocus="clearDefaultandCSS(this)"></div>
              <div id="commentFormEmail">Email: <input id="commentFormEmailText" type="text" name="email" size="30" value="your@email.com" style="color: grey" onFocus="clearDefaultandCSS(this)"> <span style="font-style: italic">(not shown)</span></div>
              
              <div id="commentFormChallenge">What is 13 plus 12? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="b7f3ab9e1826b021476d60a33fc9135d">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/api.functions.tpl">
            </form>
            </div>
          </div>
          <div id="commentPreviewText">
          </div>
          <div id="commentPostedText">
          </div>
              
      </div>
      
      </div><!-- end colMain -->
      
      <div class="col colAdditional" align="left">
        <div id="skyscraper">
    		<script type="text/javascript"> 
    		  GA_googleFillSlot("smarty_right_skyscraper");
    		</script>
    		</div>
  		  <div class="box box1" id="smartySponsors">
          <h1 class="boxHead">Sponsors <a href="../../sponsors/index.htm">[info]</a></h1>
          <div class="boxContent">
						  <a href="../../../www.hostdone.com/index.htm">Cheap Website Hosting</a> <span style="font-size: .7em">@hostdone.com</span><br>
						  <a href="../../../www.activecampaign.com/index.htm">email marketing</a> <span style="font-size: .7em">@ActiveCampaign</span><br>
						  <a href="../../../www.broadbandgenie.co.uk/deals/index.htm">broadband deals</a> <span style="font-size: .7em">@BroadbandGenie</span><br>
						  <a href="../../../www.pass-guaranteed.com/index.htm">I.T Certification Exams</a> <span style="font-size: .7em">@pass-guaranteed.com</span><br>
						  <a href="../../../www.firsttrycertify.com/index.htm">Certification Practice Tests</a> <span style="font-size: .7em">@firsttrycertify.com</span><br>
						  <a href="../../../www.ace-it-certifications.com/index.htm">Certification Practice Exam Questions</a> <span style="font-size: .7em">@ace-it-certifications.com</span><br>
						  <a href="../../../www.broadbandspeed.co.uk/index.htm">Broadband Speed Test</a> <span style="font-size: .7em">@broadbandspeed.co.uk</span><br>
						  <a href="../../../www.americaint.com/index.htm">bulk email software</a> <span style="font-size: .7em">@americaint.com</span><br>
						  <a href="../../../www.aspnethosting.co.uk/index.htm">ASP.NET hosting</a> <span style="font-size: .7em">@aspnethosting.co.uk</span><br>
			          </div>
        </div>
      </div><!-- end colAdditional -->    
      <div class="clear"></div>
    </div><!-- end wrapper -->

  <div id="footer">
    <div id="colTopFooter">
      <a href="../../credits/index.htm" class="rightMar">credits</a>
      <a href="../../copyright/index.htm" accesskey="8" class="rightMar">copyright</a>
      <a href="../../accessibility/index.htm" accesskey="0">accessibility</a>
    </div>
    <p>Smarty Copyright &copy; 2002 &ndash; 2012 New Digital Group, Inc. All rights reserved.</p>
    <p>This page generated in 0.02922 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
  </div>    
<script src="../../../www.google-analytics.com/urchin.js" type="text/javascript"> 
</script> 
<script type="text/javascript"> 
_uacct = "UA-638513-4";
urchinTracker();
</script>
<script type="text/javascript">
    var GoSquared={};
    GoSquared.acct = "GSN-138769-Y";
    (function(w){
        function gs(){
            w._gstc_lt=+(new Date); var d=document;
            var g = d.createElement("script"); g.type = "text/javascript"; g.async = true; g.src = "../../../d1l6p2sc9645hc.cloudfront.net/tracker.js";
            var s = d.getElementsByTagName("script")[0]; s.parentNode.insertBefore(g, s);
        }
        w.addEventListener?w.addEventListener("load",gs,false):w.attachEvent("onload",gs);
    })(window);
</script>
</body>
</html>
