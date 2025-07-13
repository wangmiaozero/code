<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{$smarty} 保留变量 | Smarty</title>
    <meta name="description" content="{$smarty} 保留变量">
    <meta name="keywords" content=", ldelim, smarty, rdelim, ">
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
<tr><th colspan="3" align="center">{$smarty} 保留变量</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="language.config.variables.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 4. 变量</th>
<td width="20%" align="right"> <a accesskey="n" href="language.modifiers.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="{$smarty} 保留变量">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="language.variables.smarty"></a>{$smarty} 保留变量</h2></div></div></div>
<p>
 可以通过PHP的保留变量
 <em class="parameter"><code>{$smarty}</code></em>来访问一些环境变量。
 下面是这些变量的列表：
 </p>
<div class="sect2" title="页面请求变量">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.request"></a>页面请求变量</h3></div></div></div>
<p>
   <a class="ulink" href="../../../www.php.net/reserved.variables" target="_top">页面请求变量
   </a>如<code class="literal">$_GET</code>, <code class="literal">$_POST</code>,
   <code class="literal">$_COOKIE</code>, <code class="literal">$_SERVER</code>,
   <code class="literal">$_ENV</code> 和 <code class="literal">$_SESSION</code>
   可以通过下面的方式来使用：
  </p>
<div class="example">
<a name="id409887"></a><p class="title"><b>Example 4.8. 显示页面请求变量</b></p>
<div class="example-contents"><pre class="programlisting">

{* display value of page from URL ($_GET) http://www.example.com/index.php?page=foo *}
{$smarty.get.page}

{* display the variable "page" from a form ($_POST['page']) *}
{$smarty.post.page}

{* display the value of the cookie "username" ($_COOKIE['username']) *}
{$smarty.cookies.username}

{* display the server variable "SERVER_NAME" ($_SERVER['SERVER_NAME'])*}
{$smarty.server.SERVER_NAME}

{* display the system environment variable "PATH" *}
{$smarty.env.PATH}

{* display the php session variable "id" ($_SESSION['id']) *}
{$smarty.session.id}

{* display the variable "username" from merged get/post/cookies/server/env *}
{$smarty.request.username}

   </pre></div>
</div>
<br class="example-break"><div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
   由于历史愿意，<em class="parameter"><code>{$SCRIPT_NAME}</code></em>变量会作为
   <em class="parameter"><code>{$smarty.server.SCRIPT_NAME}</code></em>的缩写。
   </p>
<pre class="programlisting">

&lt;a href="{$SCRIPT_NAME}?page=smarty"&gt;click me&lt;/a&gt;
&lt;a href="{$smarty.server.SCRIPT_NAME}?page=smarty"&gt;click me&lt;/a&gt;

</pre>
</div>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
  虽然Smarty提供了较方便直接访问PHP超全局变量的方法，但必须谨慎使用。
  直接访问超全局变量会弄乱应用程序底层代码和模板语法。
  最佳的实践是从PHP将需要的变量对模板进行赋值再使用。
  </p>
</div>
</div>
<div class="sect2" title="{$smarty.now}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.now"></a>{$smarty.now}</h3></div></div></div>
<p>
   当前的<a class="ulink" href="../../../www.php.net/function.time" target="_top">时间戳</a>
   可以通过<em class="parameter"><code>{$smarty.now}</code></em>来获取。
   时间戳是从1970年1月1日开始计算到当前的秒数。
   当前时间戳可以被<a class="link" href="language.modifier.date.format.tpl" title="date_format"><code class="varname">date_format</code>
   </a>修饰器使用并显示。
   注意：在每次使用该变量时都会调用<a class="ulink" href="../../../www.php.net/function.time" target="_top"><code class="varname">time()</code></a>函数。
   比如说一个程序花了三秒来执行，在开头和结束时都调用了<em class="parameter"><code>$smarty.now</code></em>，那么这两个数值将差三秒。
  </p>
<div class="informalexample"><pre class="programlisting">

{* use the date_format modifier to show current date and time *}
{$smarty.now|date_format:'%Y-%m-%d %H:%M:%S'}

   </pre></div>
<p>
  </p>
</div>
<div class="sect2" title="{$smarty.const}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.const"></a>{$smarty.const}</h3></div></div></div>
<p>
  直接访问PHP的常量。参见 <a class="link" href="smarty.constants.tpl" title="Chapter 12. 常量">smarty 常量</a>.
   </p>
<div class="informalexample"><pre class="programlisting">

&lt;?php
// the constant defined in php
define('MY_CONST_VAL','CHERRIES');
?&gt;

</pre></div>
<p>在模板中显示常量</p>
<div class="informalexample"><pre class="programlisting">

{$smarty.const.MY_CONST_VAL}

</pre></div>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
	虽然Smarty有较方便直接访问PHP常量的方法。
	但这通常会弄乱应用程序底层代码和模板语法。
	最佳的实践是从PHP将需要的变量对模板进行赋值再使用。
</p>
</div>
</div>
<div class="sect2" title="{$smarty.capture}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.capture"></a>{$smarty.capture}</h3></div></div></div>
<p>
  Smarty内置函数<a class="link" href="language.function.capture.tpl" title="{capture}">
   <code class="varname">{capture}..{/capture}</code></a>可以捕获其中的代码输出。
   通过<em class="parameter"><code>{$smarty.capture}</code></em>变量可以使用这些输出的代码。
    参见<a class="link" href="language.function.capture.tpl" title="{capture}">
    <code class="varname">{capture}</code></a>函数。
  </p>
</div>
<div class="sect2" title="{$smarty.config}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.config"></a>{$smarty.config}</h3></div></div></div>
<p>
   <em class="parameter"><code>{$smarty.config}</code></em>变量可以获取
   <a class="link" href="language.config.variables.tpl" title="从配置文件获取的变量">配置变量</a>。
   <em class="parameter"><code>{$smarty.config.foo}</code></em>可获取设置变量的
   <em class="parameter"><code>{#foo#}</code></em>。参见
   <a class="link" href="language.function.config.load.tpl" title="{config_load}">{config_load}</a>。
  </p>
</div>
<div class="sect2" title="{$smarty.section}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.loops"></a>{$smarty.section}</h3></div></div></div>
<p>
   <em class="parameter"><code>{$smarty.section}</code></em>变量是<a class="link" href="language.function.section.tpl" title="{section},{sectionelse}"><code class="varname">{section}</code></a>
   循环中的属性。
  它提供了一些很有用的值，如
  <code class="varname">.first</code>, <code class="varname">.index</code>等等。
  </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
    <code class="varname">{$smarty.foreach}</code>变量在新的<a class="link" href="language.function.foreach.tpl" title="{foreach},{foreachelse}"><code class="varname">{foreach}</code></a> 语法中已经不再使用。
	但仍然支持Smarty 2.x 风格的 foreach 语法。
  </p>
</div>
</div>
<div class="sect2" title="{$smarty.template}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.template"></a>{$smarty.template}</h3></div></div></div>
<p>
  返回当前的模板名称（不带目录名）。
  </p>
</div>
<div class="sect2" title="{$smarty.template_object}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.template_object"></a>{$smarty.template_object}</h3></div></div></div>
<p>
  返回当前模板对象。
  </p>
</div>
<div class="sect2" title="{$smarty.current_dir}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.current_dir"></a>{$smarty.current_dir}</h3></div></div></div>
<p>
   返回当前模板的目录名称。
   </p>
</div>
<div class="sect2" title="{$smarty.version}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.version"></a>{$smarty.version}</h3></div></div></div>
<p>
  返回编译当前模板的Smarty版本。
  </p>
<pre class="programlisting">

&lt;div id="footer"&gt;由 Smarty {$smarty.version} 引擎驱动&lt;/div&gt;

</pre>
</div>
<div class="sect2" title="{$smarty.block.child}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.block.child"></a>{$smarty.block.child}</h3></div></div></div>
<p>
  返回子模板提供的区块代码。
   参见<a class="link" href="advanced.features.template.inheritance.tpl" title="模板继承">模板继承</a>。
  </p>
</div>
<div class="sect2" title="{$smarty.block.parent}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.block.parent"></a>{$smarty.block.parent}</h3></div></div></div>
<p>
  返回父模板提供的区块代码。
   参见<a class="link" href="advanced.features.template.inheritance.tpl" title="模板继承">模板继承</a>。
  </p>
</div>
<div class="sect2" title="{$smarty.ldelim}, {$smarty.rdelim}">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.smarty.ldelim"></a>{$smarty.ldelim}, {$smarty.rdelim}</h3></div></div></div>
<p>
  用于显示左定界符和右定界符。等同于<a class="link" href="language.function.ldelim.tpl" title="{ldelim},{rdelim}">
   <code class="varname">{ldelim},{rdelim}</code></a>。
  </p>
<p>
   参见
   <a class="link" href="language.variables.tpl#language.assigned.variables" title="从PHP赋值的变量">赋值变量</a> 和
   <a class="link" href="language.config.variables.tpl" title="从配置文件获取的变量">配置变量</a>
  </p>
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="language.config.variables.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="language.variables.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="language.modifiers.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">从配置文件获取的变量 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> Chapter 5. 变量修饰器</td>
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
              
              <div id="commentFormChallenge">What is 4 plus 15? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="e29dd9af46a9bf580a9574bb84253729">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/language.variables.smarty.tpl">
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
    <p>This page generated in 0.01351 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
