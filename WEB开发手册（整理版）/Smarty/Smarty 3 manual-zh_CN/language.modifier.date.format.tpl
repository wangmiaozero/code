<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>date_format | Smarty</title>
    <meta name="description" content="date_format">
    <meta name="keywords" content="date_format">
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
<tr><th colspan="3" align="center">date_format</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="language.modifier.count.words.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 5. 变量修饰器</th>
<td width="20%" align="right"> <a accesskey="n" href="language.modifier.default.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="date_format">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="language.modifier.date.format"></a>date_format</h2></div></div></div>
<p>
	将日期和时间格式化成<a class="ulink" href="../../../www.php.net/strftime/index.htm" target="_top"><code class="varname">strftime()</code></a>的格式。
	时间可以是unix的
	<a class="ulink" href="../../../www.php.net/function.time" target="_top">时间戳</a>, 
     <a class="ulink" href="../../../www.php.net/class.DateTime" target="_top">DateTime 对象</a>, mysql时间戳，或者月日年格式的字符串，与PHP函数<a class="ulink" href="../../../www.php.net/strtotime/index.htm" target="_top"><code class="varname">strtotime()</code></a>类似。
	 模板设计者可以对<code class="varname">date_format</code>的格式有完全的控制。
	 如果传递到<code class="varname">date_format</code>的时间为空，
	 而第二个参数传递了值，那么第二个参数将作为需要格式化的时间。
   </p>
<div class="informaltable"><table border="1">
<colgroup>
<col align="center">
<col align="center">
<col align="center">
<col align="center">
<col>
</colgroup>
<thead><tr>
<th align="center">参数顺序</th>
<th align="center">类型</th>
<th align="center">必选参数</th>
<th align="center">默认值</th>
<th>说明</th>
</tr></thead>
<tbody>
<tr>
<td align="center">1</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">%b %e, %Y</td>
<td>输出时间的格式定义</td>
</tr>
<tr>
<td align="center">2</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">n/a</td>
<td>如果输入为空，则作为默认时间。</td>
</tr>
</tbody>
</table></div>
<p>
   </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
	从Smarty-2.6.10开始，给<code class="varname">date_format</code>传递
	数字值将<span class="emphasis"><em>一直</em></span>被当作unix时间戳（除了mysql时间戳，看下文）。
    </p>
<p>
	在Smarty-2.6.10之前，数字值(如 <code class="literal">YYYYMMDD</code>)使用了php函数<code class="varname">strtotime()</code>来进行处理，
     所以有时候值会被看作时间字符串而不是时间戳（取决于<code class="varname">strtotime()</code>的实现）。
    </p>
<p>
	唯一的例外mysql时间戳：14位数字值(<code class="literal">YYYYMMDDHHMMSS</code>),
	mysql时间戳比unix时间戳更优先匹配。
    </p>
</div>
<p>
      </p>
<div class="note" title="程序设计者说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">程序设计者说明</h3>
<p>
     <code class="varname">date_format</code>是派生于PHP函数
     <a class="ulink" href="../../../www.php.net/strftime/index.htm" target="_top"><code class="varname">strftime()</code></a>的wrapper。
	 在PHP编译时<a class="ulink" href="../../../www.php.net/strftime/index.htm" target="_top"><code class="varname">strftime()</code></a>的支持格式的数量将会受到系统影响。
	 请系统的说明找出完整的格式列表。
	 然而，部分格式是模拟了windows的行为，如 %D, %e, %h, %l, %n, 
     %r, %R, %t, %T。
    </p>
</div>
<p>
  </p>
<div class="example">
<a name="id413834"></a><p class="title"><b>Example 5.8. date_format</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php

$config['date'] = '%I:%M %p';
$config['time'] = '%H:%M:%S';
$smarty-&gt;assign('config', $config);
$smarty-&gt;assign('yesterday', strtotime('-1 day'));

?&gt;

   </pre>
<p>
    模板使用了<a class="link" href="language.variables.smarty.tpl#language.variables.smarty.now" title="{$smarty.now}">
    <em class="parameter"><code>$smarty.now</code></em></a>取得当前的时间：
   </p>
<pre class="programlisting">

{$smarty.now|date_format}
{$smarty.now|date_format:"%D"}
{$smarty.now|date_format:$config.date}
{$yesterday|date_format}
{$yesterday|date_format:"%A, %B %e, %Y"}
{$yesterday|date_format:$config.time}

   </pre>
<p>
   输出是：
   </p>
<pre class="screen">

Jan 1, 2022
01/01/22
02:33 pm
Dec 31, 2021
Monday, December 1, 2021
14:33:00

   </pre>
</div>
</div>
<br class="example-break"><p>

  <span class="command"><strong>date_format</strong></span>支持格式：
   </p>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem"><p>
     %a - 当前区域星期几的简写
    </p></li>
<li class="listitem"><p>
     %A - 当前区域星期几的全称
    </p></li>
<li class="listitem"><p>
     %b - 当前区域月份的简写
    </p></li>
<li class="listitem"><p>
     %B - 当前区域月份的全称
    </p></li>
<li class="listitem"><p>
     %c - 当前区域首选的日期时间表达
    </p></li>
<li class="listitem"><p>
     %C - 世纪值（年份除以 100 后取整，范围从 00 到 99）
    </p></li>
<li class="listitem"><p>
     %d - 月份中的第几天，十进制数字（范围从 01 到 31）
    </p></li>
<li class="listitem"><p>
     %D - 和 %m/%d/%y 一样
    </p></li>
<li class="listitem"><p>
     %e - 月份中的第几天，十进制数字，一位的数字前会加上一个空格（范围从 ' 1' 到 '31'）
    </p></li>
<li class="listitem"><p>
     %g - 和 %G 一样，但是没有世纪
    </p></li>
<li class="listitem"><p>
     %G - 4 位数的年份
    </p></li>
<li class="listitem"><p>
     %h - 和 %b 一样
    </p></li>
<li class="listitem"><p>
     %H - 24 小时制的十进制小时数（范围从 00 到 23）
    </p></li>
<li class="listitem"><p>
     %I - 12 小时制的十进制小时数（范围从 00 到 12）
    </p></li>
<li class="listitem"><p>
     %j - 年份中的第几天，十进制数（范围从 001 到 366）
    </p></li>
<li class="listitem"><p>
     %k - 小时，24 小时格式，没有前导零
    </p></li>
<li class="listitem"><p>
     %l - 小时，12 小时格式，没有前导零
    </p></li>
<li class="listitem"><p>
     %m - 十进制月份（范围从 01 到 12）
    </p></li>
<li class="listitem"><p>
     %M - 十进制分钟数
    </p></li>
<li class="listitem"><p>
     %n - 换行符
    </p></li>
<li class="listitem"><p>
     %p - 根据给定的时间值为 `am' 或 `pm'，或者当前区域设置中的相应字符串
    </p></li>
<li class="listitem"><p>
     %r - 用 a.m. 和 p.m. 符号的时间
    </p></li>
<li class="listitem"><p>
     %R - 24 小时符号的时间
    </p></li>
<li class="listitem"><p>
     %S - 十进制秒数
    </p></li>
<li class="listitem"><p>
     %t - 制表符
    </p></li>
<li class="listitem"><p>
     %T - 当前时间，和 %H:%M:%S 一样
    </p></li>
<li class="listitem"><p>
     %u - 星期几的十进制数表达 [1,7]，1 表示星期一
    </p></li>
<li class="listitem"><p>
     %U - 本年的第几周，从第一周的第一个星期天作为第一天开始
    </p></li>
<li class="listitem"><p>
     %V - 本年第几周的 ISO 8601:1988 格式，范围从 01 到 53，第 1 周是本年第一个至少还有 4 天的星期，星期一作为每周的第一天。（用 %G 或者 %g 作为指定时间戳相应周数的年份组成。）
    </p></li>
<li class="listitem"><p>
     %w - 星期中的第几天，星期天为 0
    </p></li>
<li class="listitem"><p>
     %W - 本年的第几周数，从第一周的第一个星期一作为第一天开始
    </p></li>
<li class="listitem"><p>
     %x - 当前区域首选的时间表示法，不包括时间
    </p></li>
<li class="listitem"><p>
     %X - 当前区域首选的时间表示法，不包括日期
    </p></li>
<li class="listitem"><p>
     %y - 没有世纪数的十进制年份（范围从 00 到 99）
    </p></li>
<li class="listitem"><p>
     %Y - 包括世纪数的十进制年份
    </p></li>
<li class="listitem"><p>
     %Z - 时区名或缩写
    </p></li>
<li class="listitem"><p>
     %% - 文字上的 `%' 字符
    </p></li>
</ul></div>
<p>

  </p>
<p>
   参见 <a class="link" href="language.variables.smarty.tpl#language.variables.smarty.now" title="{$smarty.now}"><em class="parameter"><code>$smarty.now</code></em></a>,
   <a class="ulink" href="../../../www.php.net/strftime/index.htm" target="_top"><code class="varname">strftime()</code></a>,
   <a class="link" href="language.function.html.select.date.tpl" title="{html_select_date}"><code class="varname">{html_select_date}</code></a>
   和 <a class="link" href="tips.dates.tpl" title="日期时间">时间技巧</a>文章.
  </p>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="language.modifier.count.words.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="language.modifiers.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="language.modifier.default.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">count_words </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> default</td>
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
              
              <div id="commentFormChallenge">What is 19 plus 8? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="5725575264b7aeda94fb371c04afa8d6">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/language.modifier.date.format.tpl">
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
    <p>This page generated in 0.02311 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
