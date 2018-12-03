<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>控制输出缓存 | Smarty</title>
    <meta name="description" content="控制输出缓存">
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
<tr><th colspan="3" align="center">控制输出缓存</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="caching.groups.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 15. 缓存</th>
<td width="20%" align="right"> <a accesskey="n" href="caching.custom.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="控制输出缓存">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="caching.cacheable"></a>控制输出缓存</h2></div></div></div>
<p>
  通常情况下，开启缓存可以让整个最终输出的页面被缓存下来。
  然而，Smarty 3提供了几种在输出缓存中控制部分区域不进行缓存的方法。
  </p>
<div class="note" title="一般说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">一般说明</h3>
<p>
   注意在不缓存的区域内使用的全部变量，在页面每次加载时都会从PHP里重新赋值。
   </p>
</div>
<div class="sect2" title="模板区域缓存控制">
<div class="titlepage"><div><div><h3 class="title">
<a name="cacheability.sections"></a>模板区域缓存控制</h3></div></div></div>
<p>
   模板内的一块区域可以很容易地通过
   <a class="link" href="language.function.nocache.tpl" title="{nocache}"><code class="varname">{nocache}</code></a>
   和<a class="link" href="language.function.nocache.tpl" title="{nocache}"><code class="varname">{/nocache}</code></a> 标签来设置不进行缓存。
   </p>
<div class="example">
<a name="id513538"></a><p class="title"><b>Example 15.10. 使模板的一块区域不进行缓存</b></p>
<div class="example-contents">
<pre class="programlisting">


今天是：
{nocache}
{$smarty.now|date_format}
{/nocache}

   </pre>
<p>
	上面的代码将在一个缓存的页面上输出当前日期时间。
    </p>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="标签的缓存控制">
<div class="titlepage"><div><div><h3 class="title">
<a name="cacheability.tags"></a>标签的缓存控制</h3></div></div></div>
<p>
   控制单个标签不进行缓存，可以为其加入"nocache"的属性。
   </p>
<div class="example">
<a name="id514010"></a><p class="title"><b>Example 15.11. 让标签内容不进行缓存</b></p>
<div class="example-contents"><pre class="programlisting">

今天是：
{$smarty.now|date_format nocache}

    </pre></div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="变量的缓存控制">
<div class="titlepage"><div><div><h3 class="title">
<a name="cacheability.variables"></a>变量的缓存控制</h3></div></div></div>
<p>
   你可以通过<a class="link" href="api.assign.tpl" title="assign()"><code class="varname">assign()</code></a>来控制变量值不进行缓存。
   </p>
<div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p>
	如果一个变量被设置了不缓存，那么它在页面每次加载时都会从PHP里重新赋值。
    </p>
</div>
<div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p>
	变量不缓存的设置，会在编译后的代码中起效。所以如果你重新设置了某个变量不缓存，那么你需要删除已经存在的编译和缓存文件，使得模板可以重新编译并起效。
    </p>
</div>
<div class="example">
<a name="id514070"></a><p class="title"><b>Example 15.12. 控制变量不缓存</b></p>
<div class="example-contents"><pre class="programlisting">

// 赋值$foo，并将其设置成不缓存的变量
$smarty-&gt;assign('foo',time(),true);


动态的时间值是： {$foo}

    </pre></div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="插件的缓存控制">
<div class="titlepage"><div><div><h3 class="title">
<a name="cacheability.plugins"></a>插件的缓存控制</h3></div></div></div>
<p>
	 你可以在注册一个插件时，同时控制插件的缓存。
	 <a class="link" href="api.register.plugin.tpl" title="registerPlugin()"><code class="varname">registerPlugin()</code></a>
	 的第三个参数是<em class="parameter"><code>$cacheable</code></em>，其默认是<code class="constant">TRUE</code>。
  </p>
<p>
  当你注册一个插件时，同时设置<code class="literal">$cacheable=false</code>，
  那么插件会在每次页面显示的时候都被调用，即使页面整体已经被缓存了。
  插件函数的这个行为和<a class="link" href="plugins.inserts.tpl" title="插入插件"><code class="varname">{insert}</code></a>很相似。
  </p>
<div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p>
	插件不缓存的设置，会在编译后的代码中起效。所以如果你重新设置了某个插件不缓存，那么你需要删除已经存在的编译和缓存文件，使得模板可以重新编译并起效。
    </p>
</div>
<p>
   对比<a class="link" href="plugins.inserts.tpl" title="插入插件"><code class="varname">{insert}</code></a>也可以默认让插件不进行缓存。
   它们可以通过第四个参数<em class="parameter"><code>$cache_attrs</code></em>来定义进行缓存。
   <em class="parameter"><code>$cache_attrs</code></em>定义了一个需要进行缓存的属性数组，
   然后这些属性会被写入缓存，以供插件每次执行的时候直接读取。
  </p>
<div class="example">
<a name="id514176"></a><p class="title"><b>Example 15.13. 控制插件的缓存</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
$smarty-&gt;setCaching(Smarty::CACHING_LIFETIME_CURRENT);

function remaining_seconds($params, $smarty) {
    $remain = $params['endtime'] - time();
    if($remain &gt;= 0){
        return $remain . ' second(s)';
    }else{
        return 'done';
    }
}

$smarty-&gt;registerPlugin('function','remaining', 'remaining_seconds', false, array('endtime'));

if (!$smarty-&gt;isCached('index.tpl')) {
    // 从db获取$obj 并赋值...
    $smarty-&gt;assignByRef('obj', $obj);
}

$smarty-&gt;display('index.tpl');
?&gt;

   </pre>
<p>
   模板<code class="filename">index.tpl</code> 内容是：
   </p>
<pre class="programlisting">

时间还有: {remaining endtime=$obj-&gt;endtime}

   </pre>
<p>
   即使页面被缓存了，<code class="literal">$obj</code>的倒计时也还是会在每次页面刷新的时候改变。
   endtime属性仅在第一次页面显示的时候，被从db里面读取出来并写入到模板，然后就一直是直接从缓存内读取了。
   </p>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id514226"></a><p class="title"><b>Example 15.14. 使模板内一部分区域不缓存</b></p>
<div class="example-contents">
<pre class="programlisting">

index.php:

&lt;?php
$smarty-&gt;setCaching(Smarty::CACHING_LIFETIME_CURRENT);

function smarty_block_dynamic($param, $content, $smarty) {
    return $content;
}
$smarty-&gt;registerPlugin('block','dynamic', 'smarty_block_dynamic', false);

$smarty-&gt;display('index.tpl');
?&gt;

   </pre>
<p>
    模板<code class="filename">index.tpl</code>的内容：
   </p>
<pre class="programlisting">

页面创建于: {'0'|date_format:'%D %H:%M:%S'}

{dynamic}

现在时间是: {'0'|date_format:'%D %H:%M:%S'}

... 做些其他事情 ...

{/dynamic}

   </pre>
</div>
</div>
<br class="example-break"><p>
  刷新页面后你可以发现两个日期的不同。一个是<span class="quote">“<span class="quote">动态的</span>”</span>，另一个是<span class="quote">“<span class="quote">静态的</span>”</span>。
  你可以像上面的代码一样把任何东西放<code class="literal">{dynamic}...{/dynamic}</code>标签内，来使其不缓存。
  </p>
<div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p>
   上面的例子是展示了动态的区块插件是如何工作的。
	参见如何通过<a class="link" href="language.function.nocache.tpl" title="{nocache}"><code class="varname">{nocache}</code></a>
    和 <a class="link" href="language.function.nocache.tpl" title="{nocache}"><code class="varname">{/nocache}</code></a>标签来进行<a class="link" href="caching.cacheable.tpl#cacheability.sections" title="模板区域缓存控制"><em class="parameter"><code>模板区域缓存控制</code></em></a>。
   </p>
</div>
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="caching.groups.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="caching.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="caching.custom.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">缓存组 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> 自定义缓存实现</td>
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
              
              <div id="commentFormChallenge">What is 3 plus 11? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="3be0099fad10fd2a325f65f4d169413a">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/caching.cacheable.tpl">
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
    <p>This page generated in 0.02266 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
