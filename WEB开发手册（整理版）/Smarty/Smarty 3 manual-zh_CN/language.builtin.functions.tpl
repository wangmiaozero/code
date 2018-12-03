<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Chapter 7. 内置函数 | Smarty</title>
    <meta name="description" content="Chapter 7. 内置函数">
    <meta name="keywords" content="chapter, 7, ">
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
<tr><th colspan="3" align="center">Chapter 7. 内置函数</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="language.combining.modifiers.tpl">Prev</a> </td>
<th width="60%" align="center">Part II. 模板设计师篇</th>
<td width="20%" align="right"> <a accesskey="n" href="language.function.append.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="chapter" title="Chapter 7. 内置函数">
<div class="titlepage"><div><div><h2 class="title">
<a name="language.builtin.functions"></a>Chapter 7. 内置函数</h2></div></div></div>
<div class="toc">
<p><b>Table of Contents</b></p>
<dl>
<dt><span class="sect1"><a href="language.builtin.functions.tpl#language.function.shortform.assign">{$var=...}</a></span></dt>
<dt><span class="sect1"><a href="language.function.append.tpl">{append}</a></span></dt>
<dt><span class="sect1"><a href="language.function.assign.tpl">{assign}</a></span></dt>
<dt><span class="sect1"><a href="language.function.block.tpl">{block}</a></span></dt>
<dt><span class="sect1"><a href="language.function.call.tpl">{call}</a></span></dt>
<dt><span class="sect1"><a href="language.function.capture.tpl">{capture}</a></span></dt>
<dt><span class="sect1"><a href="language.function.config.load.tpl">{config_load}</a></span></dt>
<dt><span class="sect1"><a href="language.function.debug.tpl">{debug}</a></span></dt>
<dt><span class="sect1"><a href="language.function.extends.tpl">{extends}</a></span></dt>
<dt><span class="sect1"><a href="language.function.for.tpl">{for}</a></span></dt>
<dt><span class="sect1"><a href="language.function.foreach.tpl">{foreach},{foreachelse}</a></span></dt>
<dd><dl>
<dt><span class="sect2"><a href="language.function.foreach.tpl#foreach.property.index">@index</a></span></dt>
<dt><span class="sect2"><a href="language.function.foreach.tpl#foreach.property.iteration">@iteration</a></span></dt>
<dt><span class="sect2"><a href="language.function.foreach.tpl#foreach.property.first">@first</a></span></dt>
<dt><span class="sect2"><a href="language.function.foreach.tpl#foreach.property.last">@last</a></span></dt>
<dt><span class="sect2"><a href="language.function.foreach.tpl#foreach.property.show">@show</a></span></dt>
<dt><span class="sect2"><a href="language.function.foreach.tpl#foreach.property.total">@total</a></span></dt>
<dt><span class="sect2"><a href="language.function.foreach.tpl#foreach.construct.break">{break}</a></span></dt>
<dt><span class="sect2"><a href="language.function.foreach.tpl#foreach.construct.continue">{continue}</a></span></dt>
</dl></dd>
<dt><span class="sect1"><a href="language.function.function.tpl">{function}</a></span></dt>
<dt><span class="sect1"><a href="language.function.if.tpl">{if},{elseif},{else}</a></span></dt>
<dt><span class="sect1"><a href="language.function.include.tpl">{include}</a></span></dt>
<dt><span class="sect1"><a href="language.function.include.php.tpl">{include_php}</a></span></dt>
<dt><span class="sect1"><a href="language.function.insert.tpl">{insert}</a></span></dt>
<dt><span class="sect1"><a href="language.function.ldelim.tpl">{ldelim},{rdelim}</a></span></dt>
<dt><span class="sect1"><a href="language.function.literal.tpl">{literal}</a></span></dt>
<dt><span class="sect1"><a href="language.function.nocache.tpl">{nocache}</a></span></dt>
<dt><span class="sect1"><a href="language.function.php.tpl">{php}</a></span></dt>
<dt><span class="sect1"><a href="language.function.section.tpl">{section},{sectionelse}</a></span></dt>
<dd><dl>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.index">.index</a></span></dt>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.index.prev">.index_prev</a></span></dt>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.index.next">.index_next</a></span></dt>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.iteration">.iteration</a></span></dt>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.first">.first</a></span></dt>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.last">.last</a></span></dt>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.rownum">.rownum</a></span></dt>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.loop">.loop</a></span></dt>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.show">.show</a></span></dt>
<dt><span class="sect2"><a href="language.function.section.tpl#section.property.total">.total</a></span></dt>
</dl></dd>
<dt><span class="sect1"><a href="language.function.setfilter.tpl">{setfilter}</a></span></dt>
<dt><span class="sect1"><a href="language.function.strip.tpl">{strip}</a></span></dt>
<dt><span class="sect1"><a href="language.function.while.tpl">{while}</a></span></dt>
</dl>
</div>
<p>
 Smarty自带了一些内置函数。
 这些内置函数是Smarty模板引擎的组成部分。
 它们会被编译到PHP代码中，以取得最高的性能。
  </p>
<p>
  你不能建立相同名称的<a class="link" href="language.custom.functions.tpl" title="Chapter 8. 自定义函数">自定义函数</a>；
  同时你也不需要修改这些内置函数。
  </p>
<p>
 少数的内置函数有<em class="parameter"><code>assign</code></em>属性，
 可以将函数的结果赋值给模板变量，而不是输出；
 效果如同<a class="link" href="language.function.assign.tpl" title="{assign}">
 <code class="varname">{assign}</code></a>函数。
 </p>
<div class="sect1" title="{$var=...}">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="language.function.shortform.assign"></a>{$var=...}</h2></div></div></div>
<p>
 {assign}函数的缩写。你可以在模板内对变量进行赋值，或者对数组元素进行赋值。
 </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
 在模板中进行赋值，从根本上讲还是将程序逻辑放到显示层来进行了，在PHP端进行此操作会更好。请自行考虑。
 </p>
</div>
<p>
  下面是该标签的属性：
 </p>
<p><span class="bold"><strong>属性:</strong></span></p>
<div class="informaltable"><table border="1">
<colgroup>
<col align="center">
<col align="center">
<col align="center">
<col align="center">
<col align="center">
<col>
</colgroup>
<thead><tr>
<th align="center">参数名称</th>
<th align="center">缩写</th>
<th align="center">类型</th>
<th align="center">必选参数</th>
<th align="center">默认值</th>
<th>说明</th>
</tr></thead>
<tbody><tr>
<td align="center">scope</td>
<td align="center">n/a</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center"><span class="emphasis"><em>n/a</em></span></td>
<td>变量的作用范围: 'parent','root' 或 'global'</td>
</tr></tbody>
</table></div>
<p><span class="bold"><strong>可选标记:</strong></span></p>
<div class="informaltable"><table border="1">
<colgroup>
<col align="center">
<col>
</colgroup>
<thead><tr>
<th align="center">名称</th>
<th>说明</th>
</tr></thead>
<tbody><tr>
<td align="center">nocache</td>
<td>对赋值操作不进行缓存</td>
</tr></tbody>
</table></div>
<div class="example">
<a name="id426469"></a><p class="title"><b>Example 7.1. 简单赋值</b></p>
<div class="example-contents">
<pre class="programlisting">

{$name='Bob'}

The value of $name is {$name}.

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

The value of $name is Bob.

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id426493"></a><p class="title"><b>Example 7.2. 数学运算赋值</b></p>
<div class="example-contents"><pre class="programlisting">

{$running_total=$running_total+$some_array[row].some_value}

  </pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id426507"></a><p class="title"><b>Example 7.3. 对数组元素赋值</b></p>
<div class="example-contents"><pre class="programlisting">

{$user.name="Bob"}

  </pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id426520"></a><p class="title"><b>Example 7.4. 对多维数组元素赋值</b></p>
<div class="example-contents"><pre class="programlisting">

{$user.name.first="Bob"}

  </pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id426533"></a><p class="title"><b>Example 7.5. 附加到数组</b></p>
<div class="example-contents"><pre class="programlisting">

{$users[]="Bob"}

  </pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id426546"></a><p class="title"><b>Example 7.6. 赋值的作用范围</b></p>
<div class="example-contents">
<p>在包含的模板内赋值的变量，在包含模板内可见。</p>
<pre class="programlisting">

{include file="sub_template.tpl"}
...
{* display variable assigned in sub_template *}
{$foo}&lt;br&gt;
...

  </pre>
<p>上面的模板是包含了下面的模板<code class="filename">sub_template.tpl</code></p>
<pre class="programlisting">

...
{* foo will be known also in the including template *}
{$foo="something" scope=parent}
{* bar is assigned only local in the including template *}
{$bar="value"}
...

</pre>
</div>
</div>
<br class="example-break"><p>
  参见<a class="link" href="language.function.assign.tpl" title="{assign}"><code class="varname">{assign}</code></a>
  和
  <a class="link" href="language.function.append.tpl" title="{append}"><code class="varname">{append}</code></a>
 </p>
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="language.combining.modifiers.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="smarty.for.designers.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="language.function.append.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">Chapter 6. 复合修饰器 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> {append}</td>
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
              
              <div id="commentFormChallenge">What is 15 plus 13? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="b78b6700c07ec511cb0a07de882d2421">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/language.builtin.functions.tpl">
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
    <p>This page generated in 0.02805 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
