<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Chapter 4. 变量 | Smarty</title>
    <meta name="description" content="Chapter 4. 变量">
    <meta name="keywords" content="chapter, 4, ">
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
<tr><th colspan="3" align="center">Chapter 4. 变量</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="language.escaping.tpl">Prev</a> </td>
<th width="60%" align="center">Part II. 模板设计师篇</th>
<td width="20%" align="right"> <a accesskey="n" href="language.variable.scopes.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="chapter" title="Chapter 4. 变量">
<div class="titlepage"><div><div><h2 class="title">
<a name="language.variables"></a>Chapter 4. 变量</h2></div></div></div>
<div class="toc">
<p><b>Table of Contents</b></p>
<dl>
<dt><span class="sect1"><a href="language.variables.tpl#language.assigned.variables">从PHP赋值的变量</a></span></dt>
<dd><dl>
<dt><span class="sect2"><a href="language.variables.tpl#language.variables.assoc.arrays">数组赋值</a></span></dt>
<dt><span class="sect2"><a href="language.variables.tpl#language.variables.array.indexes">数组下标</a></span></dt>
<dt><span class="sect2"><a href="language.variables.tpl#language.variables.objects">对象</a></span></dt>
</dl></dd>
<dt><span class="sect1"><a href="language.variable.scopes.tpl">变量作用范围</a></span></dt>
<dt><span class="sect1"><a href="language.config.variables.tpl">从配置文件获取的变量</a></span></dt>
<dt><span class="sect1"><a href="language.variables.smarty.tpl">{$smarty} 保留变量</a></span></dt>
<dd><dl>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.request">页面请求变量</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.now">{$smarty.now}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.const">{$smarty.const}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.capture">{$smarty.capture}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.config">{$smarty.config}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.loops">{$smarty.section}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.template">{$smarty.template}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.template_object">{$smarty.template_object}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.current_dir">{$smarty.current_dir}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.version">{$smarty.version}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.block.child">{$smarty.block.child}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.block.parent">{$smarty.block.parent}</a></span></dt>
<dt><span class="sect2"><a href="language.variables.smarty.tpl#language.variables.smarty.ldelim">{$smarty.ldelim}, {$smarty.rdelim}</a></span></dt>
</dl></dd>
</dl>
</div>
<p>
 Smarty有多种类型的变量。
 </p>
<p>
 在Smarty中的变量可以直接显示，或者作为
 <a class="link" href="language.syntax.functions.tpl" title="函数">函数</a>,
  <a class="link" href="language.syntax.attributes.tpl" title="属性">属性</a> and
  <a class="link" href="language.modifiers.tpl" title="Chapter 5. 变量修饰器">修饰器</a>, 内部条件表达式等的参数。
  要显示变量，可以简单地用
  <a class="link" href="variable.left.delimiter.tpl" title="$left_delimiter">定界符</a>
  把变量括起来。
</p>
<div class="example">
<a name="id408431"></a><p class="title"><b>Example 4.1. 变量例子</b></p>
<div class="example-contents"><pre class="programlisting">

{$Name}

{$product.part_no} &lt;b&gt;{$product.description}&lt;/b&gt;

{$Contacts[row].Phone}

&lt;body bgcolor="{#bgcolor#}"&gt;

  </pre></div>
</div>
<p><br class="example-break">
</p>
<div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p>一个简单的检查Smarty变量的方法是打开Smarty的
<a class="link" href="chapter.debugging.console.tpl" title="Chapter 10. 调试控制台">调试控制台</a>。
</p>
</div>
<p>
 </p>
<div class="sect1" title="从PHP赋值的变量">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="language.assigned.variables"></a>从PHP赋值的变量</h2></div></div></div>
<p>
 赋值的变量以美元符号 (<code class="literal">$</code>) 开头。
 </p>
<div class="example">
<a name="id408483"></a><p class="title"><b>Example 4.2. 变量赋值</b></p>
<div class="example-contents">
<p>PHP 代码</p>
<pre class="programlisting">

&lt;?php

$smarty = new Smarty();

$smarty-&gt;assign('firstname', 'Doug');
$smarty-&gt;assign('lastname', 'Evans');
$smarty-&gt;assign('meetingPlace', 'New York');

$smarty-&gt;display('index.tpl');

?&gt;

</pre>
<p>
      <code class="filename">index.tpl</code>模板源码:
     </p>
<pre class="programlisting">

Hello {$firstname} {$lastname}, glad to see you can make it.
&lt;br /&gt;
{* this will not work as $variables are case sensitive *}
This weeks meeting is in {$meetingplace}.
{* this will work *}
This weeks meeting is in {$meetingPlace}.

   </pre>
<p>
   输出：
  </p>
<pre class="screen">

Hello Doug Evans, glad to see you can make it.
&lt;br /&gt;
This weeks meeting is in .
This weeks meeting is in New York.

  </pre>
</div>
</div>
<br class="example-break"><div class="sect2" title="数组赋值">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.assoc.arrays"></a>数组赋值</h3></div></div></div>
<p>
  可以通过点号“.”来使用赋值的数组变量。
  </p>
<div class="example">
<a name="id408858"></a><p class="title"><b>Example 4.3. 数组变量</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
$smarty-&gt;assign('Contacts',
    array('fax' =&gt; '555-222-9876',
          'email' =&gt; 'zaphod@slartibartfast.example.com',
          'phone' =&gt; array('home' =&gt; '555-444-3333',
                           'cell' =&gt; '555-111-1234')
                           )
         );
$smarty-&gt;display('index.tpl');
?&gt;

   </pre>
<p>
    <code class="filename">index.tpl</code>模板代码：
   </p>
<pre class="programlisting">

{$Contacts.fax}&lt;br /&gt;
{$Contacts.email}&lt;br /&gt;
{* you can print arrays of arrays as well *}
{$Contacts.phone.home}&lt;br /&gt;
{$Contacts.phone.cell}&lt;br /&gt;

   </pre>
<p>
   输出：
   </p>
<pre class="screen">

555-222-9876&lt;br /&gt;
zaphod@slartibartfast.example.com&lt;br /&gt;
555-444-3333&lt;br /&gt;
555-111-1234&lt;br /&gt;

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="数组下标">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.array.indexes"></a>数组下标</h3></div></div></div>
<p>
  你可以通过下标来使用数组，和PHP语法一样。
  </p>
<div class="example">
<a name="id408918"></a><p class="title"><b>Example 4.4. 使用数组下标</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
$smarty-&gt;assign('Contacts', array(
                           '555-222-9876',
                           'zaphod@slartibartfast.example.com',
                            array('555-444-3333',
                                  '555-111-1234')
                            ));
$smarty-&gt;display('index.tpl');
?&gt;

   </pre>
<p>
    <code class="filename">index.tpl</code>模板代码：
   </p>
<pre class="programlisting">

{$Contacts[0]}&lt;br /&gt;
{$Contacts[1]}&lt;br /&gt;
{* you can print arrays of arrays as well *}
{$Contacts[2][0]}&lt;br /&gt;
{$Contacts[2][1]}&lt;br /&gt;

   </pre>
<p>
    输出：
   </p>
<pre class="screen">

555-222-9876&lt;br /&gt;
zaphod@slartibartfast.example.com&lt;br /&gt;
555-444-3333&lt;br /&gt;
555-111-1234&lt;br /&gt;

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="对象">
<div class="titlepage"><div><div><h3 class="title">
<a name="language.variables.objects"></a>对象</h3></div></div></div>
<p>
  从PHP赋值的<a class="link" href="advanced.features.objects.tpl" title="对象">对象</a>的属性和方法，可以通过<code class="literal">-&gt;</code>来使用。
  </p>
<div class="example">
<a name="id408987"></a><p class="title"><b>Example 4.5. 使用对象</b></p>
<div class="example-contents">
<pre class="programlisting">

name:  {$person-&gt;name}&lt;br /&gt;
email: {$person-&gt;email}&lt;br /&gt;

   </pre>
<p>
    输出：
   </p>
<pre class="screen">

name:  Zaphod Beeblebrox&lt;br /&gt;
email: zaphod@slartibartfast.example.com&lt;br /&gt;

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
<a accesskey="p" href="language.escaping.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="smarty.for.designers.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="language.variable.scopes.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">避免Smarty解析 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> 变量作用范围</td>
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
              
              <div id="commentFormChallenge">What is 12 plus 16? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="b78b6700c07ec511cb0a07de882d2421">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/language.variables.tpl">
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
    <p>This page generated in 0.01543 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
