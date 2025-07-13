<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Chapter 15. 缓存 | Smarty</title>
    <meta name="description" content="Chapter 15. 缓存">
    <meta name="keywords" content="chapter, 15, ">
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
<tr><th colspan="3" align="center">Chapter 15. 缓存</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="api.test.install.tpl">Prev</a> </td>
<th width="60%" align="center">Part III. 程序开发者篇</th>
<td width="20%" align="right"> <a accesskey="n" href="caching.multiple.caches.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="chapter" title="Chapter 15. 缓存">
<div class="titlepage"><div><div><h2 class="title">
<a name="caching"></a>Chapter 15. 缓存</h2></div></div></div>
<div class="toc">
<p><b>Table of Contents</b></p>
<dl>
<dt><span class="sect1"><a href="caching.tpl#caching.setting.up">配置缓存时间</a></span></dt>
<dt><span class="sect1"><a href="caching.multiple.caches.tpl">单页多个缓存</a></span></dt>
<dt><span class="sect1"><a href="caching.groups.tpl">缓存组</a></span></dt>
<dt><span class="sect1"><a href="caching.cacheable.tpl">控制输出缓存</a></span></dt>
<dd><dl>
<dt><span class="sect2"><a href="caching.cacheable.tpl#cacheability.sections">模板区域缓存控制</a></span></dt>
<dt><span class="sect2"><a href="caching.cacheable.tpl#cacheability.tags">标签的缓存控制</a></span></dt>
<dt><span class="sect2"><a href="caching.cacheable.tpl#cacheability.variables">变量的缓存控制</a></span></dt>
<dt><span class="sect2"><a href="caching.cacheable.tpl#cacheability.plugins">插件的缓存控制</a></span></dt>
</dl></dd>
<dt><span class="sect1"><a href="caching.custom.tpl">自定义缓存实现</a></span></dt>
</dl>
</div>
<p>
   通过将输出内容保存到文件内，缓存机制可以用来加速
   <a class="link" href="api.display.tpl" title="display()"><code class="varname">display()</code></a> 或者<a class="link" href="api.fetch.tpl" title="fetch()"><code class="varname">fetch()</code></a>的执行。
   如果缓存被开启，那么显示时缓存的输出将替代重新生成显示内容的操作。
   缓存可以极大提高程序的执行速度，尤其当模板需要很长的计算时间的情况下。
   当<a class="link" href="api.display.tpl" title="display()"><code class="varname">display()</code></a> 或者
   <a class="link" href="api.fetch.tpl" title="fetch()"><code class="varname">fetch()</code></a>开启缓存，
   Smarty将生成对应的缓存文件，缓存文件包含了多个模板文件的内容，配置文件内容等等。
   </p>
<p>
   当页面是动态的内容，那么必须谨慎考虑你的缓存和缓存时间。
   比如说，你的网站首页通常不会更新得太快，那么可以将其缓存一个小时或者更多，以便加速其显示。
   从另一方面讲，如果你的页面上有按秒来显示新内容的功能，那么该页面就不应该被缓存。
   </p>
<div class="sect1" title="配置缓存时间">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="caching.setting.up"></a>配置缓存时间</h2></div></div></div>
<p>
   缓存可以通过设置
   <a class="link" href="variable.caching.tpl" title="$caching">
    <em class="parameter"><code>$caching</code></em></a>为：<code class="literal">Smarty::CACHING_LIFETIME_CURRENT</code> 或 <code class="literal">Smarty::CACHING_LIFETIME_SAVED</code>来开启。
   </p>
<div class="example">
<a name="id512281"></a><p class="title"><b>Example 15.1. 开启缓存</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
require('Smarty.class.php');
$smarty = new Smarty;

// 使用$smarty-&gt;cacheLifetime()可以更精确定义缓存时间

$smarty-&gt;setCaching(Smarty::CACHING_LIFETIME_CURRENT);

$smarty-&gt;display('index.tpl');
?&gt;

    </pre></div>
</div>
<br class="example-break"><p>
   开启了缓存，调用<code class="literal">display('index.tpl')</code>
   会正常渲染模板，但也会保存一份输出的内容到<a class="link" href="variable.cache.dir.tpl" title="$cache_dir"><em class="parameter"><code>$cache_dir</code></em></a>目录下的文件中（缓存副本）。
	在下一次调用<code class="literal">display('index.tpl')</code>，
	缓存文件会替代渲染模板的过程。
   </p>
<div class="note" title="技术说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">技术说明</h3>
<p>
	在<a class="link" href="variable.cache.dir.tpl" title="$cache_dir"><em class="parameter"><code>$cache_dir</code></em></a>下的文件，文件名与模板名称相似。
	虽然这些文件也有<code class="filename">.php</code> 后缀，但它们不会被直接执行。请不要编辑这些文件！
    </p>
</div>
<p>
   每个缓存页面都有一个缓存过期时间<a class="link" href="variable.cache.lifetime.tpl" title="$cache_lifetime"><em class="parameter"><code>$cache_lifetime</code></em></a>。
	默认是3600秒，也就是一小时。
	当超过了此时间，缓存将被重新生成。
	当设置<a class="link" href="variable.caching.tpl" title="$caching"><em class="parameter"><code>$caching</code></em></a>为<code class="literal">Smarty::CACHING_LIFETIME_SAVED</code>时，可以给每个缓存设置其单独的缓存时间。
    参见<a class="link" href="variable.cache.lifetime.tpl" title="$cache_lifetime"><em class="parameter"><code>$cache_lifetime</code></em></a>。
   </p>
<div class="example">
<a name="id512396"></a><p class="title"><b>Example 15.2. 为每个缓存设置$cache_lifetime</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
require('Smarty.class.php');
$smarty = new Smarty;

// 让每个缓存的过期时间都可以在display执行前单独设置。
$smarty-&gt;setCaching(Smarty::CACHING_LIFETIME_SAVED);

// 设置index.tpl的过期时间为5分钟
$smarty-&gt;setCacheLifetime(300);
$smarty-&gt;display('index.tpl');

// 设置home.tpl的过期时间为1小时
$smarty-&gt;setCacheLifetime(3600);
$smarty-&gt;display('home.tpl');

// 注意：当$caching设置了Smarty::CACHING_LIFETIME_SAVED后，
// 下面的$cache_lifetime将不会起效。
// home.tpl已经设置了过期时间为1小时，
// 所以不会再遵循下面的$cache_lifetime值，
// home.tpl的过期时间还是1小时。
$smarty-&gt;setCacheLifetime(30); // 30 秒
$smarty-&gt;display('home.tpl');
?&gt;

    </pre></div>
</div>
<br class="example-break"><p>
   当<a class="link" href="variable.compile.check.tpl" title="$compile_check">
    <em class="parameter"><code>$compile_check</code></em></a>开启的时候（默认开启），
	每个模板文件和配置文件都会在缓存检查的时候执行编译检查。
	如果这些文件在缓存生成后被修改，那么缓存会马上重新生成。
    这是一个覆盖的选项，所以更好的性能建议把
	<a class="link" href="variable.compile.check.tpl" title="$compile_check"><em class="parameter"><code>$compile_check</code></em>
    </a>设置成false。
   </p>
<div class="example">
<a name="id512451"></a><p class="title"><b>Example 15.3. 关闭 $compile_check</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
require('Smarty.class.php');
$smarty = new Smarty;

$smarty-&gt;setCaching(Smarty::CACHING_LIFETIME_CURRENT);
$smarty-&gt;setCompileCheck(false);

$smarty-&gt;display('index.tpl');
?&gt;

    </pre></div>
</div>
<br class="example-break"><p>
   如果开启了<a class="link" href="variable.force.compile.tpl" title="$force_compile">
    <em class="parameter"><code>$force_compile</code></em></a>，
	缓存文件将总是会重新生成。效果和关闭缓存是一样的，
	而且还会降低性能。
    <a class="link" href="variable.force.compile.tpl" title="$force_compile"><em class="parameter"><code>$force_compile</code></em>
    </a>一般用于
    <a class="link" href="chapter.debugging.console.tpl" title="Chapter 10. 调试控制台">调试</a>的目的。
	更确当的方式是把缓存<a class="link" href="variable.caching.tpl" title="$caching"><em class="parameter"><code>$caching</code></em>
    </a>设置成Smarty::CACHING_OFF。
   </p>
<p>
    <a class="link" href="api.is.cached.tpl" title="isCached()"><code class="varname">isCached()</code></a>
	函数可以检查模板的缓存是否存在。
	如果你的模板是需要读取某些数据（如数据库），
	那么你可以用它来跳过这个过程。
   </p>
<div class="example">
<a name="id512529"></a><p class="title"><b>Example 15.4. 使用 isCached()</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
require('Smarty.class.php');
$smarty = new Smarty;

$smarty-&gt;setCaching(Smarty::CACHING_LIFETIME_CURRENT);

if(!$smarty-&gt;isCached('index.tpl')) {
	// 找不到缓存，这里进行一些赋值操作
    $contents = get_database_contents();
    $smarty-&gt;assign($contents);
}

$smarty-&gt;display('index.tpl');
?&gt;

    </pre></div>
</div>
<br class="example-break"><p>
   你可以使用<a class="link" href="language.function.nocache.tpl" title="{nocache}"><code class="varname">{nocache}{/nocache}</code></a>来设置页面上部分区块是动态的（不缓存），
	同样你也可以使用
	<a class="link" href="language.function.insert.tpl" title="{insert}"><code class="varname">{insert}</code></a>函数，或者<code class="literal">nocache</code>参数来达到同样目的。
   </p>
<p>  
   比如说我们希望把整个页面缓存，除了页面两边显示的banner广告。
   那么我们可以用<a class="link" href="language.function.insert.tpl" title="{insert}"><code class="varname">{insert}</code></a>来显示banner广告，
   这样就可以在缓存的内容里面，保存广告部分的动态效果。
	参见
    <a class="link" href="language.function.insert.tpl" title="{insert}"><code class="varname">{insert}</code></a>的详细文档。
   </p>
<p>
   你可以通过<a class="link" href="api.clear.all.cache.tpl" title="clearAllCache()"><code class="varname">clearAllCache()</code></a>来删除全部缓存，或者
	用<a class="link" href="api.clear.cache.tpl" title="clearCache()"><code class="varname">clearCache()</code></a> 
	来删除特定的<a class="link" href="caching.groups.tpl" title="缓存组">缓存组</a>
	的缓存内容。
   </p>
<div class="example">
<a name="id512626"></a><p class="title"><b>Example 15.5. 删除缓存</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
require('Smarty.class.php');
$smarty = new Smarty;

$smarty-&gt;setCaching(Smarty::CACHING_LIFETIME_CURRENT);

// 仅删除index.tpl的缓存
$smarty-&gt;clearCache('index.tpl');

// 删除全部缓存
$smarty-&gt;clearAllCache();

$smarty-&gt;display('index.tpl');
?&gt;

    </pre></div>
</div>
<br class="example-break">
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="api.test.install.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="smarty.for.programmers.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="caching.multiple.caches.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">testInstall() </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> 单页多个缓存</td>
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
              
              <div id="commentFormChallenge">What is 18 plus 3? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="7ae890cb7606a156c77fd4b70e9f98a1">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/caching.tpl">
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
    <p>This page generated in 0.02634 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
