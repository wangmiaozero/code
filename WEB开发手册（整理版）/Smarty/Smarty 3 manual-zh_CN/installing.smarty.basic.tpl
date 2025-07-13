<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>基础安装 | Smarty</title>
    <meta name="description" content="基础安装">
    <meta name="keywords" content=", ">
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
      
      
     
      
      
      <div class="col colMain" id="mainContent">
      
<div class="navheader">
<table width="100%" summary="Navigation header">
<tr><th colspan="3" align="center">基础安装</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="installation.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 2. 安装</th>
<td width="20%" align="right"> <a accesskey="n" href="installing.smarty.extended.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="基础安装">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="installing.smarty.basic"></a>基础安装</h2></div></div></div>
<p>
   在Smarty发行包中，目录<code class="filename">/libs/</code>
   里面的文件就是Smarty的库文件。
   库文件都是<code class="filename">.php</code>文件，开发者不应该编辑它们。
   库文件可以多个应用程序共用，而且只在升级新版本的Smarty时进行覆盖。
   </p>
<p>
   下面的例子Smarty的库文件被解压：
   </p>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem"><p>
   <code class="filename">/usr/local/lib/Smarty-v.e.r/</code> 在 *nix
   的环境</p></li>
<li class="listitem"><p> 以及
   <code class="filename">c:\webroot\libs\Smarty-v.e.r\</code> 在
   windows 环境.</p></li>
</ul></div>
<p>
   </p>
<div class="example">
<a name="id404018"></a><p class="title"><b>Example 2.1. 载入Smarty库文件</b></p>
<div class="example-contents"><pre class="screen">

Smarty-v.e.r/
   libs/
      Smarty.class.php
      debug.tpl
      sysplugins/* (everything)
      plugins/*    (everything)

    </pre></div>
</div>
<br class="example-break"><p>
   Smarty的<a class="link" href="smarty.constants.tpl#constant.smarty.dir" title="SMARTY_DIR"><code class="constant">SMARTY_DIR</code>
    </a><a class="ulink" href="../../../www.php.net/define/index.htm" target="_top">常量</a>，是定义
	Smarty库文件<code class="filename">libs/</code>目录的
	<span class="bold"><strong>完整系统路径</strong></span>。
	一般来说，如果你的程序可以找到<code class="filename">Smarty.class.php</code>文件，
	那么你不需要设置<a class="link" href="smarty.constants.tpl#constant.smarty.dir" title="SMARTY_DIR"><code class="constant">SMARTY_DIR</code></a>，
	Smarty会自行进行赋值。
	然而，如果<code class="filename">Smarty.class.php</code>文件不在你的
	<a class="ulink" href="../../../www.php.net/ini.core.php#ini.include-path" target="_top">include_path</a>内，
	或者你不能在程序中使用绝对路径的时候，那么你需要定义<code class="constant">SMARTY_DIR</code>。
    <code class="constant">SMARTY_DIR</code> <span class="bold"><strong>必须以斜杠（/）结尾。</strong></span>.
   </p>
<div class="informalexample">
<p>
   在PHP中实例化Smarty对象的方法： 
   </p>
<pre class="programlisting">

&lt;?php
// NOTE: Smarty has a capital 'S'
require_once('Smarty.class.php');
$smarty = new Smarty();
?&gt;

    </pre>
</div>
<p>
   运行上面的程序。如果发生错误提示说找不到<code class="filename">Smarty.class.php</code>文件,
   那么你需要按下面的其中一种方法来处理：
   </p>
<div class="example">
<a name="id404119"></a><p class="title"><b>Example 2.2. 手动指定 SMARTY_DIR 常量</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
// *nix style (note capital 'S')
define('SMARTY_DIR', '/usr/local/lib/Smarty-v.e.r/libs/');

// windows style
define('SMARTY_DIR', 'c:/webroot/libs/Smarty-v.e.r/libs/');

// hack version example that works on both *nix and windows
// Smarty is assumend to be in 'includes/' dir under current script
define('SMARTY_DIR',str_replace("\\","/",getcwd()).'/includes/Smarty-v.e.r/libs/');

require_once(SMARTY_DIR . 'Smarty.class.php');
$smarty = new Smarty();
?&gt;

    </pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id404132"></a><p class="title"><b>Example 2.3. 用绝对路径引用库文件</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
// *nix style (note capital 'S')
require_once('/usr/local/lib/Smarty-v.e.r/libs/Smarty.class.php');

// windows style
require_once('c:/webroot/libs/Smarty-v.e.r/libs/Smarty.class.php');

$smarty = new Smarty();
?&gt;

    </pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id404154"></a><p class="title"><b>Example 2.4. 将库文件路径增加到<code class="filename">php.ini</code> 文件</b></p>
<div class="example-contents"><pre class="programlisting">

;;;;;;;;;;;;;;;;;;;;;;;;;
; Paths and Directories ;
;;;;;;;;;;;;;;;;;;;;;;;;;

; *nix: "/path1:/path2"
include_path = ".:/usr/share/php:/usr/local/lib/Smarty-v.e.r/libs/"

; Windows: "\path1;\path2"
include_path = ".;c:\php\includes;c:\webroot\libs\Smarty-v.e.r\libs\"

</pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id404177"></a><p class="title"><b>Example 2.5. 通过函数<code class="literal"><a class="ulink" href="../../../www.php.net/ini-set/index.htm" target="_top">ini_set()</a></code>
	来设置include path
    </b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
// *nix
ini_set('include_path', ini_get('include_path').PATH_SEPARATOR.'/usr/local/lib/Smarty-v.e.r/libs/');

// windows
ini_set('include_path', ini_get('include_path').PATH_SEPARATOR.'c:/webroot/lib/Smarty-v.e.r/libs/');
?&gt;

    </pre></div>
</div>
<br class="example-break"><p>
   现在，库文件已经放好了，可以开始为你的程序配置Smarty了：</p>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem"><p>
	Smarty可配置四个目录，默认名称分别是
	<code class="filename">templates/</code>,
    <code class="filename">templates_c/</code>, <code class="filename">configs/</code> 和 <code class="filename">cache/</code>。
    </p></li>
<li class="listitem"><p>
	这些都分别对应Smarty类的属性定义
    <a class="link" href="variable.template.dir.tpl" title="$template_dir">
    <code class="varname">$template_dir</code></a>,
    <a class="link" href="variable.compile.dir.tpl" title="$compile_dir">
    <code class="varname">$compile_dir</code></a>,
    <a class="link" href="variable.config.dir.tpl" title="$config_dir">
    <code class="varname">$config_dir</code></a>, 和
    <a class="link" href="variable.cache.dir.tpl" title="$cache_dir">
    <code class="varname">$cache_dir</code></a>。
    </p></li>
<li class="listitem"><p>
	 强烈建议分别在每个使用Smarty的程序中都单独定义这些目录。
     </p></li>
<li class="listitem"><p>
	 你可以通过<a class="link" href="api.test.install.tpl" title="testInstall()"><code class="varname">testInstall()</code></a>
	 来测试Smarty是否有权限读写这些目录。
     </p></li>
</ul></div>
<p>
	在下面的安装例子中，我们将为一个留言本程序建立Smarty环境。
	我们提供了一个目录命名约定的例子。
	你可以为任何的程序建立同样的环境，仅需要修改<code class="literal">guestbook/</code>名称。
    </p>
<div class="example">
<a name="id404314"></a><p class="title"><b>Example 2.6. 目录文件结构</b></p>
<div class="example-contents"><pre class="screen">

/usr/local/lib/Smarty-v.e.r/libs/
        Smarty.class.php
        debug.tpl
        sysplugins/*
        plugins/*

/web/www.example.com/
        guestbook/
        templates/
            index.tpl
        templates_c/
        configs/
        cache/
        htdocs/
            index.php

    </pre></div>
</div>
<br class="example-break"><p>
   明确你的web服务器文档根目录。在下面的例子中，
   文档根目录是<code class="filename">/web/www.example.com/guestbook/htdocs/</code>。
	Smarty目录仅可以通过Smarty库文件访问，而不能直接被浏览器访问。
	这样可以避免一些安全问题，强烈建议（但不强制）把这些目录
	放到WEB服务器文档根目录<span class="emphasis"><em>之外</em></span>。
   </p>
<p>
   将会有至少一个文件是放到文档根目录的，这个文件也会被浏览器访问到。
   我们将这文件命名为<code class="filename">index.php</code>, 
   放置到文档根目录<code class="filename">/htdocs/</code>中。
   </p>
<p>
   Smarty需要一些对目录的
   <span class="bold"><strong>读写权限</strong></span>
    (windows用户请忽略)，包括
    <a class="link" href="variable.compile.dir.tpl" title="$compile_dir">
    <em class="parameter"><code>$compile_dir</code></em></a> 和
    <a class="link" href="variable.cache.dir.tpl" title="$cache_dir">
    <em class="parameter"><code>$cache_dir</code></em></a> 目录
    (<code class="filename">templates_c/</code> 和
    <code class="filename">cache/</code>), 
	所以，要确保web服务器用户有权限读写它们。

    </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
	通常是用户<span class="quote">“<span class="quote">nobody</span>”</span> 和组<span class="quote">“<span class="quote">nobody</span>”</span>. 
	OS X用户，默认用户是<span class="quote">“<span class="quote">www</span>”</span>和组<span class="quote">“<span class="quote">www</span>”</span>.
	如果你使用Apache，你可以看看你的<code class="filename">httpd.conf</code>
	来确定是使用什么用户和组的。</p>
</div>
<p>
    </p>
<div class="example">
<a name="id404435"></a><p class="title"><b>Example 2.7. 设置目录的读写权限</b></p>
<div class="example-contents"><pre class="programlisting">

chown nobody:nobody /web/www.example.com/guestbook/templates_c/
chmod 770 /web/www.example.com/guestbook/templates_c/

chown nobody:nobody /web/www.example.com/guestbook/cache/
chmod 770 /web/www.example.com/guestbook/cache/

    </pre></div>
</div>
<br class="example-break"><div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p>
     <code class="literal">chmod 770</code>是比较适当的安全设置，仅允许
	 用户<span class="quote">“<span class="quote">nobody</span>”</span>和组<span class="quote">“<span class="quote">nobody</span>”</span>可以读写访问这些目录。
	 如果你希望能让所有人都能读取该目录 (大部分是因为你需要方便查看这些目录内的文件), 
	 你可以使用<code class="literal">775</code>。
    </p>
</div>
<p>
   我们需要创建文件<code class="filename">index.tpl</code>，然后供Smarty显示。
   文件需要放到<a class="link" href="variable.template.dir.tpl" title="$template_dir">
    <em class="parameter"><code>$template_dir</code></em></a>目录内。
   </p>
<div class="example">
<a name="id404499"></a><p class="title"><b>Example 2.8. /web/www.example.com/guestbook/templates/index.tpl</b></p>
<div class="example-contents"><pre class="screen">

{* Smarty *}

Hello {$name}, welcome to Smarty!

    </pre></div>
</div>
<br class="example-break"><div class="note" title="技术说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">技术说明</h3>
<p>
     <code class="literal">{* Smarty *}</code>是模板的
     <a class="link" href="language.basic.syntax.tpl#language.syntax.comments" title="注释">注释</a>.
	 虽然不是必须的，但在模板内添加注释这是个很好的习惯。
	 它可以帮助识别出文件类型，而不需要看后缀。
	 比如说，代码编辑器可以识别该文件并自动语法高亮。
    </p>
</div>
<p>
   现在，我们来修改<code class="filename">index.php</code>. 
   我们将创建Smarty的实例，给模板<a class="link" href="api.assign.tpl" title="assign()"><code class="varname">assign()</code></a>
赋值变量， 并且<a class="link" href="api.display.tpl" title="display()"><code class="varname">display()</code></a>显示该模板文件
<code class="filename">index.tpl</code>。
   </p>
<div class="example">
<a name="id404564"></a><p class="title"><b>Example 2.9. 修改 /web/www.example.com/docs/guestbook/index.php</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php

require_once(SMARTY_DIR . 'Smarty.class.php');

$smarty = new Smarty();

$smarty-&gt;setTemplateDir('/web/www.example.com/guestbook/templates/');
$smarty-&gt;setCompileDir('/web/www.example.com/guestbook/templates_c/');
$smarty-&gt;setConfigDir('/web/www.example.com/guestbook/configs/');
$smarty-&gt;setCacheDir('/web/www.example.com/guestbook/cache/');

$smarty-&gt;assign('name','Ned');

//** un-comment the following line to show the debug console
//$smarty-&gt;debugging = true;

$smarty-&gt;display('index.tpl');

?&gt;

    </pre></div>
</div>
<br class="example-break"><div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p>
	在我们的例子中，我们为Smarty的目录使用了绝对路径。
	如果<code class="filename">/web/www.example.com/guestbook/</code>在你PHP的include_path内，
		那么，这些设置不是必须的。
	然而，设置成绝对路径，是更高效和更不容易出错（来自经验）。
	这可以保证Smarty的目录路径被设置成正确的。
    </p>
</div>
<p>
   现在，用浏览器访问<code class="filename">index.php</code>文件。
   你可以看到<span class="emphasis"><em>"Hello Ned, welcome to Smarty!"</em></span>
   </p>
<p>
   你已经完成了Smarty的基础安装！
   </p>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="installation.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="installation.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="installing.smarty.extended.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">Chapter 2. 安装 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> 进阶安装</td>
</tr>
</table>
</div>

		

      
      </div><!-- end colMain -->
      
      
    </div><!-- end wrapper -->

 
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
