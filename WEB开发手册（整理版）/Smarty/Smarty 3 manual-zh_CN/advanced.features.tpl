<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Chapter 17. 高级特性 | Smarty</title>
    <meta name="description" content="Chapter 17. 高级特性">
    <meta name="keywords" content="chapter, 17, ">
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
<tr><th colspan="3" align="center">Chapter 17. 高级特性</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="resources.custom.tpl">Prev</a> </td>
<th width="60%" align="center">Part III. 程序开发者篇</th>
<td width="20%" align="right"> <a accesskey="n" href="advanced.features.template.settings.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="chapter" title="Chapter 17. 高级特性">
<div class="titlepage"><div><div><h2 class="title">
<a name="advanced.features"></a>Chapter 17. 高级特性</h2></div></div></div>
<div class="toc">
<p><b>Table of Contents</b></p>
<dl>
<dt><span class="sect1"><a href="advanced.features.tpl#advanced.features.security">安全</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.template.settings.tpl">修改模板设置</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.template.inheritance.tpl">模板继承</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.streams.tpl">数据流</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.objects.tpl">对象</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.static.classes.tpl">静态类</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.prefilters.tpl">前置过滤器</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.postfilters.tpl">后置过滤器</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.outputfilters.tpl">输出过滤器</a></span></dt>
</dl>
</div>
<div class="sect1" title="安全">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="advanced.features.security"></a>安全</h2></div></div></div>
<p>
 当你有非可信任的第三方来编辑模板时，比如说通过FTP编辑，安全机制可以帮助你通过
 模板语言的限制，来减少可能对系统安全产生的危害。
 </p>
<p>
 安全机制可以通过Smarty_Security对象的属性来进行设置。
   这里是允许的设置：
</p>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem">
<p>
      <em class="parameter"><code>$php_handling</code></em>明确定义了Smarty如何处理内嵌到模板的PHP代码：
	  可用值是：
      </p>
<div class="itemizedlist"><ul class="itemizedlist" type="circle">
<li class="listitem"><p>
          Smarty::PHP_PASSTHRU -&gt; 原样显示PHP代码
          </p></li>
<li class="listitem"><p>
          Smarty::PHP_QUOTE    -&gt; 将PHP代码转换成HTML实体显示
          </p></li>
<li class="listitem"><p>
          Smarty::PHP_REMOVE   -&gt; 删除PHP代码
          </p></li>
<li class="listitem"><p>
          Smarty::PHP_ALLOW    -&gt; 执行PHP代码
          </p></li>
</ul></div>
<p>
     默认值是Smarty::PHP_PASSTHRU。
    </p>
<p>
	如果安全机制开启，Smarty对象的<a class="link" href="variable.php.handling.tpl" title="$php_handling"><em class="parameter"><code>$php_handling</code></em></a>
	设置将不会被检查。
    </p>
</li>
<li class="listitem"><p>
      <em class="parameter"><code>$secure_dir</code></em>是安全模板目录的数组。
      <a class="link" href="variable.template.dir.tpl" title="$template_dir"><em class="parameter"><code>$template_dir</code></em></a>
	  同样也被看作安全的目录。
      默认这是空的数组。
    </p></li>
<li class="listitem"><p>
      <em class="parameter"><code>$trusted_dir</code></em>是可信任目录的数组。
	  信任目录可以允许你存放PHP文件，这些PHP文件可以通过
	  <a class="link" href="language.function.include.php.tpl" title="{include_php}"><code class="varname">{include_php}</code></a>包含到模板中，
	  并且直接运行。
	  默认这是空的数组。
    </p></li>
<li class="listitem">
<p>
        <em class="parameter"><code>$trusted_uri</code></em>是一个包含了匹配URL的正则表达式的数组，这些URL都被认为是可信的。
		这个安全功能用于
		<a class="link" href="language.function.fetch.tpl" title="{fetch}"><code class="varname">{fetch}</code></a> 和
        <a class="link" href="language.function.html.image.tpl" title="{html_image}"><code class="varname">{html_image}</code></a>。
		在这些函数内使用的URL，必须类似<code class="literal">{$PROTOCOL}://{$HOSTNAME}</code>的格式，
		并且可以使用一些简单的正则表达式。
        (不包括一些极端的例子如authentication-tokens)
      </p>
<p>
       正则表达式<code class="literal">'#https?://.*smarty.net$#i'</code>将允许下面的URL：
        </p>
<div class="itemizedlist"><ul class="itemizedlist" type="circle">
<li class="listitem"><p><code class="literal">http://smarty.net/foo</code></p></li>
<li class="listitem"><p><code class="literal">http://smarty.net/foo</code></p></li>
<li class="listitem"><p><code class="literal">http://www.smarty.net/foo</code></p></li>
<li class="listitem"><p><code class="literal">http://smarty.net/foo</code></p></li>
<li class="listitem"><p><code class="literal">https://foo.bar.www.smarty.net/foo/bla?blubb=1</code></p></li>
</ul></div>
<p>
		但不允许以下的URL：
        </p>
<div class="itemizedlist"><ul class="itemizedlist" type="circle">
<li class="listitem"><p><code class="literal">http://smarty.com/foo</code> (不匹配顶级域名"com")</p></li>
<li class="listitem"><p><code class="literal">ftp://www.smarty.net/foo</code> (不匹配协议"ftp")</p></li>
<li class="listitem"><p><code class="literal">http://www.smarty.net.otherdomain.com/foo</code> (不匹配域名"smarty.net")</p></li>
</ul></div>
<p>
      </p>
</li>
<li class="listitem"><p>
      <em class="parameter"><code>$static_classes</code></em>是一个包含了可信的静态类的数组。
	  默认是空数组，表示信任任何的静态类。
	  设置不信任全部静态类可以设置$static_classes = null。
    </p></li>
<li class="listitem"><p>
      <em class="parameter"><code>$php_functions</code></em>是一个包含了可用的PHP函数的数组，这些函数可以在模板内直接使用。
	  空数组 ( $php_functions = array() ) 表示全部PHP函数都是可用的。
	  设置全部函数不可用，需要设置$php_functions = null。
	  默认值是array('isset', 'empty', 'count', 'sizeof', 'in_array', 'is_array','time','nl2br')。
    </p></li>
<li class="listitem"><p>
      <em class="parameter"><code>$php_modifiers</code></em>是一个包含了可用的PHP函数的数组，这些函数可以在模板内当作修饰器来使用。
	  空数组 ( $php_functions = array() ) 表示全部PHP函数修饰器都是可用的。
		设置全部函数修饰器不可用，需要设置$php_modifier = null。
		默认值是array('escape','count')。
    </p></li>
<li class="listitem"><p>
      <em class="parameter"><code>$streams</code></em>是一个包含了可用数据流的数组，这些数据流可以直接在模板内使用。
	  空数组 ( $streams = array() ) 表示全部数据流都是可用的。
		设置全部数据流不可用，需要设置$streams = null。
		默认值是array('file')。
    </p></li>
<li class="listitem"><p>
     <em class="parameter"><code>$allowed_modifiers</code></em>是一个包含了可用的（注册的/自动加载的）修饰器数组。
	 如果非空，则只有列表上的修饰器才能使用。这是一个白名单。
    </p></li>
<li class="listitem"><p>
     <em class="parameter"><code>$disabled_modifiers</code></em>是一个包含了不可用的（注册的/自动加载的）修饰器数组。
    </p></li>
<li class="listitem"><p>
     <em class="parameter"><code>$allowed_tags</code></em>是一个控制哪些区块标签、函数和过滤器能够在模板内使用的数组。
	 如果非空，则只有列表上的标签才能使用。这是一个白名单。
    </p></li>
<li class="listitem"><p>
     <em class="parameter"><code>$disabled_tags</code></em>是一个包含了不可用的区块标签、函数和过滤器的数组。
    </p></li>
<li class="listitem"><p>
     <em class="parameter"><code>$allow_constants</code></em>布尔值，代表了是否允许在模板内使用常量。
	 默认是true。
    </p></li>
<li class="listitem"><p>
      <em class="parameter"><code>$allow_super_globals</code></em>布尔值，代表了是否允许在模板内使用PHP的全局变量。
	  默认是true。
    </p></li>
<li class="listitem"><p>
      <em class="parameter"><code>$allow_php_tag</code></em>布尔值，代表了是否允许在模板内使用{php} 和 {include_php}标签。 
	  默认是false。
    </p></li>
</ul></div>
<p>
 </p>
<p>
  如果安全机制开启，私有的成员方法、静态类/对象的私有函数或者私有属性都不能在模板内使用。
  </p>
<p>
  自定义你自己的安全策略，可以扩展继承Smarty_Security类或者是建立它的实例。
 </p>
<div class="example">
<a name="id519802"></a><p class="title"><b>Example 17.1. 扩展Smarty_Security 类来设置安全策略</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
require 'Smarty.class.php';

class My_Security_Policy extends Smarty_Security {
  // 关闭全部PHP函数
  public $php_functions = null;
  // 删除PHP标签
  public $php_handling = Smarty::PHP_REMOVE;
  // 允许任何函数成为修饰器
  public $modifiers = array();
}
$smarty = new Smarty();
// 开启自定义安全机制
$smarty-&gt;enableSecurity('My_Security_Policy');
?&gt;

</pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id519817"></a><p class="title"><b>Example 17.2. 通过Smarty_Security类的实例来自定义安全策略</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
require 'Smarty.class.php';
$smarty = new Smarty();
$my_security_policy = new Smarty_Security($smarty);
// 关闭全部PHP函数
$my_security_policy-&gt;php_functions = null;
// 删除PHP标签
$my_security_policy-&gt;php_handling = Smarty::PHP_REMOVE;
// 允许任何函数成为修饰器
$my_security_policy-&gt;$modifiers = array();
// 开启自定义安全机制
$smarty-&gt;enableSecurity($my_security_policy);
?&gt;

</pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id519838"></a><p class="title"><b>Example 17.3. 开启默认的安全设置</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php
require 'Smarty.class.php';
$smarty = new Smarty();
// 开启默认安全设置
$smarty-&gt;enableSecurity();
?&gt;

</pre></div>
</div>
<br class="example-break"><div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
  安全机制只会在模板编译时进行检查。
  所以当你修改了安全设置后，必须删除全部缓存和编译文件并重新编译。
  </p>
</div>
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="resources.custom.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="smarty.for.programmers.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="advanced.features.template.settings.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">自定义模板资源 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> 修改模板设置</td>
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
              
              <div id="commentFormChallenge">What is 5 plus 19? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="d60ec30184770b8b9b4a01d5f5d8a5f0">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/advanced.features.tpl">
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
    <p>This page generated in 0.03307 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
