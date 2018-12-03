<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Chapter 20. 疑难解答 | Smarty</title>
    <meta name="description" content="Chapter 20. 疑难解答">
    <meta name="keywords" content="chapter, 20, ">
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
<tr><th colspan="3" align="center">Chapter 20. 疑难解答</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="appendixes.tpl">Prev</a> </td>
<th width="60%" align="center">Part IV. 附录</th>
<td width="20%" align="right"> <a accesskey="n" href="tips.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="chapter" title="Chapter 20. 疑难解答">
<div class="titlepage"><div><div><h2 class="title">
<a name="troubleshooting"></a>Chapter 20. 疑难解答</h2></div></div></div>
<div class="toc">
<p><b>Table of Contents</b></p>
<dl><dt><span class="sect1"><a href="troubleshooting.tpl#smarty.php.errors">Smarty/PHP 错误</a></span></dt></dl>
</div>
<p></p>
<div class="sect1" title="Smarty/PHP 错误">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="smarty.php.errors"></a>Smarty/PHP 错误</h2></div></div></div>
<p>
   Smarty可以捕获多种错误，如错误的标签、写错的变量名等等。
   如果发生这些错误，Smarty将如下提示：
   </p>
<div class="example">
<a name="id528840"></a><p class="title"><b>Example 20.1. Smarty 错误</b></p>
<div class="example-contents"><pre class="screen">

Warning: Smarty: [in index.tpl line 4]: syntax error: unknown tag - '%blah'
       in /path/to/smarty/Smarty.class.php on line 1041

Fatal error: Smarty: [in index.tpl line 28]: syntax error: missing section name
       in /path/to/smarty/Smarty.class.php on line 1041

    </pre></div>
</div>
<br class="example-break"><p>
   Smarty会显示模板名字，错误行数和错误内容。
   还会接着显示在Smarty类文件真实错误发生的行数。
   </p>
<p>
   部分错误是Smarty无法捕获的。如忘记了写分号等。
   这种类型一般会在PHP编译时直接提示。
   </p>
<div class="example">
<a name="id529004"></a><p class="title"><b>Example 20.2. PHP 错误提示</b></p>
<div class="example-contents"><pre class="screen">

Parse error: parse error in /path/to/smarty/templates_c/index.tpl.php on line 75

    </pre></div>
</div>
<br class="example-break"><p>
   当提示PHP错误，系统会提示Smarty已编译的PHP文件出错的行数，
   而不是模板代码的行数。
   一般你可以查看模板代码并且寻找出错的代码。
   下面是一些通常可以检查的地方：
   是否丢失了关闭标签如<a class="link" href="language.function.if.tpl" title="{if},{elseif},{else}"><code class="varname">{if}{/if}</code></a> 或者
    <a class="link" href="language.function.if.tpl" title="{if},{elseif},{else}"><code class="varname">{section}{/section}</code>
    </a>, 或是<code class="varname">{if}</code>标签内的逻辑等。.
	如果无法找到错误位置，你可以打开已编译的PHP文件来定位问题，然后这对应找出模板的错误位置。
   </p>
<div class="example">
<a name="id529295"></a><p class="title"><b>Example 20.3. 其他的常见错误</b></p>
<div class="example-contents">
<pre class="screen">

Warning: Smarty error: unable to read resource: "index.tpl" in...
or
Warning: Smarty error: unable to read resource: "site.conf" in...

</pre>
<p>
    </p>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem"><p>
	  <a class="link" href="variable.template.dir.tpl" title="$template_dir">
      <em class="parameter"><code>$template_dir</code></em></a>出现的错误, 在
	  <code class="filename">templates/</code>目录中
	  不存在<code class="filename">index.tpl</code>文件。
      </p></li>
<li class="listitem"><p>
       <a class="link" href="language.function.config.load.tpl" title="{config_load}">
        <code class="varname">{config_load}</code></a>函数，（或调用
		 <a class="link" href="api.config.load.tpl" title="configLoad()"><code class="varname">configLoad()</code></a>函数）
		 ，<a class="link" href="variable.config.dir.tpl" title="$config_dir"><em class="parameter"><code>$config_dir</code></em>
        </a>出现的错误，目录中找不到<code class="filename">site.conf</code>文件。
        </p></li>
</ul></div>
<p>
    </p>
<pre class="screen">

Fatal error: Smarty error: the $compile_dir 'templates_c' does not exist,
or is not a directory...

    </pre>
<div class="itemizedlist"><ul class="itemizedlist" type="disc"><li class="listitem"><p>
	<a class="link" href="variable.compile.dir.tpl" title="$compile_dir">
    <em class="parameter"><code>$compile_dir</code></em></a>不正确，目录不存在；或者
	<code class="filename">templates_c</code>不是目录而是文件。
    </p></li></ul></div>
<pre class="screen">

Fatal error: Smarty error: unable to write to $compile_dir '....

    </pre>
<div class="itemizedlist"><ul class="itemizedlist" type="disc"><li class="listitem"><p>
	<a class="link" href="variable.compile.dir.tpl" title="$compile_dir">
   <em class="parameter"><code>$compile_dir</code></em></a>在服务器上无法写入文件。
   关于文件权限问题，参考下面
    <a class="link" href="installing.smarty.basic.tpl" title="基础安装">Smarty安装</a>的文章。
    </p></li></ul></div>
<pre class="screen">

Fatal error: Smarty error: the $cache_dir 'cache' does not exist,
or is not a directory. in /..

    </pre>
<div class="itemizedlist"><ul class="itemizedlist" type="disc"><li class="listitem"><p>
	这意味着，<a class="link" href="variable.caching.tpl" title="$caching">
    <em class="parameter"><code>$caching</code></em></a>已经开启，
	但<a class="link" href="variable.cache.dir.tpl" title="$cache_dir"><em class="parameter"><code>$cache_dir</code></em></a>
	不正确，目录不存在；或者
	<code class="filename">cache/</code>不是目录而是文件。
    </p></li></ul></div>
<pre class="screen">

Fatal error: Smarty error: unable to write to $cache_dir '/...

    </pre>
<div class="itemizedlist"><ul class="itemizedlist" type="disc"><li class="listitem"><p>
	 这意味着，<a class="link" href="variable.caching.tpl" title="$caching"><em class="parameter"><code>$caching</code></em></a>
	 已经开启，
	 <a class="link" href="variable.cache.dir.tpl" title="$cache_dir">
    <em class="parameter"><code>$cache_dir</code></em></a>在服务器上无法写入文件。
   关于文件权限问题，参考下面
    <a class="link" href="installing.smarty.basic.tpl" title="基础安装">Smarty安装</a>的文章。
    </p></li></ul></div>
<pre class="screen">

Warning: filemtime(): stat failed for /path/to/smarty/cache/3ab50a623e65185c49bf17c63c90cc56070ea85c.one.tpl.php 
in /path/to/smarty/libs/sysplugins/smarty_resource.php

   </pre>
<div class="itemizedlist"><ul class="itemizedlist" type="disc"><li class="listitem"><p>
	 这意味着，你的应用程序已经注册了自定义错误处理器（使用
	 <a class="ulink" href="../../../www.php.net/set_error_handler/index.htm" target="_top">set_error_handler()</a>），
	 但该处理器没有处理当前的<code class="literal">$errno</code>。
	  如果，不管什么理由，这是你的自定义错误处理器的处理方式的话，
	  那么在注册你的错误处理器后，调用
	  <a class="link" href="api.mute.expected.errors.tpl" title="Smarty::muteExpectedErrors()"><code class="varname">muteExpectedErrors()</code></a>。
     </p></li></ul></div>
</div>
</div>
<br class="example-break"><p>
  参见
   <a class="link" href="chapter.debugging.console.tpl" title="Chapter 10. 调试控制台">调试</a>。
   </p>
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="appendixes.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="appendixes.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="tips.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">Part IV. 附录 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> Chapter 21. 技巧</td>
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
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/troubleshooting.tpl">
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
    <p>This page generated in 0.02320 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
