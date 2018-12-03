<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Chapter 16. 资源 | Smarty</title>
    <meta name="description" content="Chapter 16. 资源">
    <meta name="keywords" content="chapter, 16, ">
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
<tr><th colspan="3" align="center">Chapter 16. 资源</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="caching.custom.tpl">Prev</a> </td>
<th width="60%" align="center">Part III. 程序开发者篇</th>
<td width="20%" align="right"> <a accesskey="n" href="resources.string.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="chapter" title="Chapter 16. 资源">
<div class="titlepage"><div><div><h2 class="title">
<a name="resources"></a>Chapter 16. 资源</h2></div></div></div>
<div class="toc">
<p><b>Table of Contents</b></p>
<dl>
<dt><span class="sect1"><a href="resources.tpl#resources.file">文件资源</a></span></dt>
<dd><dl>
<dt><span class="sect2"><a href="resources.tpl#templates.from.template.dir">$template_dir目录</a></span></dt>
<dt><span class="sect2"><a href="resources.tpl#templates.from.specified.template.dir">特定的$template_dir</a></span></dt>
<dt><span class="sect2"><a href="resources.tpl#templates.from.any.dir">任意目录的模板</a></span></dt>
<dt><span class="sect2"><a href="resources.tpl#templates.windows.filepath">Windows文件路径</a></span></dt>
</dl></dd>
<dt><span class="sect1"><a href="resources.string.tpl">字符串资源</a></span></dt>
<dt><span class="sect1"><a href="resources.streams.tpl">数据流资源</a></span></dt>
<dt><span class="sect1"><a href="resources.extends.tpl">扩展模板资源</a></span></dt>
<dt><span class="sect1"><a href="resources.custom.tpl">自定义模板资源</a></span></dt>
</dl>
</div>
<p>
  模板可以是各种不同的来源提供的。
  当你<a class="link" href="api.display.tpl" title="display()"><code class="varname">display()</code></a> 或者
   <a class="link" href="api.fetch.tpl" title="fetch()"><code class="varname">fetch()</code></a>一个模板，
   又或者当你包含一个模板到另一个模板中的时候，你需要提供一个资源类型、路径及模板名。
   如果没有明确指明资源类型，则将假定是使用
   <a class="link" href="variable.default.resource.type.tpl" title="$default_resource_type"><em class="parameter"><code>$default_resource_type</code></em></a>
   （默认是“file”）。
  </p>
<div class="sect1" title="文件资源">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="resources.file"></a>文件资源</h2></div></div></div>
<p>
 Smarty通常运行在内置的、基于文件系统的模板资源上。
 默认资源是<code class="literal">file:</code>。
 如果修改了<a class="link" href="variable.default.resource.type.tpl" title="$default_resource_type"><em class="parameter"><code>$default_resource_type</code></em></a>
 那么资源关键字<code class="literal">file:</code>就必须要指明。
 </p>
<p>
 如果找不到需要的模板文件，那么 <a class="link" href="variable.default.template.handler.func.tpl" title="$default_template_handler_func"><em class="parameter"><code>$default_template_handler_func</code></em></a>将会被调用。
 </p>
<div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p>
  在Smarty 3.1开始，除非开启了
  <a class="link" href="variable.use.include.path.tpl" title="$use_include_path"><em class="parameter"><code>$use_include_path</code></em></a>配置，否则文件资源不会再搜索
  <a class="ulink" href="../../../www.php.net/ini.core.php#ini.include-path" target="_top">include_path</a>
  的路径了。
  </p>
</div>
<div class="sect2" title="$template_dir目录">
<div class="titlepage"><div><div><h3 class="title">
<a name="templates.from.template.dir"></a>$template_dir目录</h3></div></div></div>
<p>
  Smarty从<a class="link" href="variable.template.dir.tpl" title="$template_dir"><em class="parameter"><code>$template_dir</code></em></a>设置的目录中，
  获取模板文件资源。
  多个模板目录将以在数组中的顺序进行搜索，在寻找到第一个匹配的模板时将返回。
  </p>
<div class="example">
<a name="id516850"></a><p class="title"><b>Example 16.1. 使用$template_dir</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
$smarty-&gt;display('index.tpl');
$smarty-&gt;display('file:index.tpl'); // 同上
?&gt;

   </pre>
<p>模板中使用</p>
<pre class="programlisting">

{include file='index.tpl'}
{include file='file:index.tpl'} {* 同上 *}

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="特定的$template_dir">
<div class="titlepage"><div><div><h3 class="title">
<a name="templates.from.specified.template.dir"></a>特定的$template_dir</h3></div></div></div>
<p>
   Smarty 3.1 提供“归类符号”来定义<a class="link" href="variable.template.dir.tpl" title="$template_dir"><em class="parameter"><code>$template_dir</code></em></a>中的特定元素。
   此特性可允许网站中使用和更好地管理多个模板集合。
  </p>
<p>
  “归类符号”可以用在任何定义了<code class="literal">file:</code>资源类型的地方。
  </p>
<div class="example">
<a name="id516912"></a><p class="title"><b>Example 16.2. 特定的$template_dir</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php

// 设置模板目录
$smarty-&gt;setTemplateDir(array(
    './templates',            // element: 0, index: 0
    './templates_2',          // element: 1, index: 1
    '10' =&gt; 'templates_10',   // element: 2, index: '10'
    'foo' =&gt; 'templates_foo', // element: 3, index: 'foo'
));

/*
  假定模板目录结构如下：
  ./templates/foo.tpl
  ./templates_2/foo.tpl
  ./templates_2/bar.tpl
  ./templates_10/foo.tpl
  ./templates_10/bar.tpl
  ./templates_foo/foo.tpl
*/

// 正常读取
$smarty-&gt;display('file:foo.tpl'); 
// 将载入 ./templates/foo.tpl

// 默认使用数字下标
$smarty-&gt;display('file:[1]foo.tpl'); 
// 将载入 ./templates_2/foo.tpl

// 使用字符串的下标（'10'看起来像数字下标，但却是有单引号的字符串）
$smarty-&gt;display('file:[10]foo.tpl'); 
// 将载入 ./templates_10/foo.tpl

// 使用字符串的下标
$smarty-&gt;display('file:[foo]foo.tpl'); 
// 将载入 ./templates_foo/foo.tpl

// 使用 "未知" 数字下标 (用元素的数字)
$smarty-&gt;display('file:[2]foo.tpl'); 
// 将载入 ./templates_10/foo.tpl

?&gt;

   </pre>
<p>模板中调用</p>
<pre class="programlisting">

{include file="file:foo.tpl"}
{* 将载入 ./templates/foo.tpl *}

{include file="file:[1]foo.tpl"}
{* 将载入 ./templates_2/foo.tpl *}

{include file="file:[foo]foo.tpl"}
{* 将载入 ./templates_foo/foo.tpl *}

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="任意目录的模板">
<div class="titlepage"><div><div><h3 class="title">
<a name="templates.from.any.dir"></a>任意目录的模板</h3></div></div></div>
<p>
  在<a class="link" href="variable.template.dir.tpl" title="$template_dir"><em class="parameter"><code>$template_dir</code></em></a>之外的模板，
  <code class="literal">file:</code>将需要使用绝对路径来获取模板。
  </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
   当<a class="link" href="advanced.features.tpl#advanced.features.security" title="安全"><code class="varname">Security</code></a>开启，
   在<a class="link" href="variable.template.dir.tpl" title="$template_dir"><em class="parameter"><code>$template_dir</code></em></a>之外的模板是不允许读取的，除非你将这些目录都设置在<em class="parameter"><code>$secure_dir</code></em>中。
   </p>
</div>
<div class="example">
<a name="id517020"></a><p class="title"><b>Example 16.3. 任意目录的模板</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
$smarty-&gt;display('file:/export/templates/index.tpl');
$smarty-&gt;display('file:/path/to/my/templates/menu.tpl');
?&gt;

   </pre>
<p>
    模板中：
   </p>
<pre class="programlisting">

{include file='file:/usr/local/share/templates/navigation.tpl'}

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="Windows文件路径">
<div class="titlepage"><div><div><h3 class="title">
<a name="templates.windows.filepath"></a>Windows文件路径</h3></div></div></div>
<p>
  如果使用Windows的机器，那么文件路径将以驱动盘符（C:）开头。
  确保<code class="literal">file:</code>的路径避免命名空间冲突，达到需要的结果。
  </p>
<div class="example">
<a name="id517069"></a><p class="title"><b>Example 16.4. 使用windows的文件路径</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
$smarty-&gt;display('file:C:/export/templates/index.tpl');
$smarty-&gt;display('file:F:/path/to/my/templates/menu.tpl');
?&gt;

  </pre>
<p>
   在模板中：
  </p>
<pre class="programlisting">

{include file='file:D:/usr/local/share/templates/navigation.tpl'}

</pre>
</div>
</div>
<br class="example-break">
</div>
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="caching.custom.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="smarty.for.programmers.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="resources.string.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">自定义缓存实现 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> 字符串资源</td>
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
              
              <div id="commentFormChallenge">What is 19 plus 18? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="2c9d86164a603fadf1aa8a404dabcefe">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/resources.tpl">
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
    <p>This page generated in 0.02103 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
