<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{assign} | Smarty</title>
    <meta name="description" content="{assign}">
    <meta name="keywords" content=", ldelim, assign, rdelim, ">
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
<tr><th colspan="3" align="center">{assign}</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="language.function.append.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 7. 内置函数</th>
<td width="20%" align="right"> <a accesskey="n" href="language.function.block.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="{assign}">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="language.function.assign"></a>{assign}</h2></div></div></div>
<p>
   <code class="varname">{assign}</code>用于在<span class="bold"><strong>模板运行期间</strong></span>赋值给变量.
 </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
 在模板中进行赋值，从根本上讲还是将程序逻辑放到显示层来进行了，在PHP端进行此操作会更好。请自行考虑。
 </p>
</div>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
    参见赋值给变量方法的<a class="link" href="language.builtin.functions.tpl#language.function.shortform.assign" title="{$var=...}"><code class="varname">缩写</code></a>。
 </p>
</div>
<p><span class="bold"><strong>属性:</strong></span></p>
<div class="informaltable"><table border="1">
<colgroup>
<col align="center">
<col align="center">
<col align="center">
<col align="center">
<col>
</colgroup>
<thead><tr>
<th align="center">参数名称</th>
<th align="center">类型</th>
<th align="center">必选参数</th>
<th align="center">默认值</th>
<th>说明</th>
</tr></thead>
<tbody>
<tr>
<td align="center">var</td>
<td align="center">string</td>
<td align="center">Yes</td>
<td align="center"><span class="emphasis"><em>n/a</em></span></td>
<td>被赋值的变量名</td>
</tr>
<tr>
<td align="center">value</td>
<td align="center">string</td>
<td align="center">Yes</td>
<td align="center"><span class="emphasis"><em>n/a</em></span></td>
<td>赋的值</td>
</tr>
<tr>
<td align="center">scope</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center"><span class="emphasis"><em>n/a</em></span></td>
<td>变量的作用范围: 'parent','root' 或 'global'</td>
</tr>
</tbody>
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
<a name="id427819"></a><p class="title"><b>Example 7.8. {assign}</b></p>
<div class="example-contents">
<pre class="programlisting">

{assign var="name" value="Bob"}
{assign "name" "Bob"} {* short-hand *}

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
<a name="id427844"></a><p class="title"><b>Example 7.9. {assign} 使用nocache属性</b></p>
<div class="example-contents">
<pre class="programlisting">

{assign var="name" value="Bob" nocache}
{assign "name" "Bob" nocache} {* short-hand *}

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
<a name="id427868"></a><p class="title"><b>Example 7.10. {assign} 进行数学运算</b></p>
<div class="example-contents"><pre class="programlisting">

{assign var=running_total value=$running_total+$some_array[$row].some_value}

  </pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id427883"></a><p class="title"><b>Example 7.11. {assign} 在调用的模板内的作用范围</b></p>
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
{assign var="foo" value="something" scope=parent}
{* bar is assigned only local in the including template *}
{assign var="bar" value="value"}
...

</pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id427914"></a><p class="title"><b>Example 7.12. {assign} 作用范围例子 </b></p>
<div class="example-contents">
<p>设置变量访问范围为root，然后该变量在相关模板里面都可见。</p>
<pre class="programlisting">

{assign var=foo value="bar" scope="root"}

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id427937"></a><p class="title"><b>Example 7.13. {assign} 赋值一个全局变量</b></p>
<div class="example-contents">
<p>全局变量在任何模板内均可见。</p>
<pre class="programlisting">

{assign var=foo value="bar" scope="global"}
{assign "foo" "bar" scope="global"} {* short-hand *}

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id427955"></a><p class="title"><b>Example 7.14. 从PHP脚本中获取{assign} 的变量</b></p>
<div class="example-contents">
<p>
  可以使用<a class="link" href="api.get.template.vars.tpl" title="getTemplateVars()">
    <code class="varname">getTemplateVars()</code></a>在PHP脚本中获取<code class="varname">{assign}</code>的变量值。
	这里的模板创建了变量<em class="parameter"><code>$foo</code></em>。
  </p>
<pre class="programlisting">

{assign var="foo" value="Smarty"}

</pre>
<p>当模板被执行时/执行后，可以用以下的方式在PHP获取到这个模板变量。
</p>
<pre class="programlisting">

&lt;?php

// this will output nothing as the template has not been executed
echo $smarty-&gt;getTemplateVars('foo');

// fetch the template to a variable
$whole_page = $smarty-&gt;fetch('index.tpl');

// this will output 'smarty' as the template has been executed
echo $smarty-&gt;getTemplateVars('foo');

$smarty-&gt;assign('foo','Even smarter');

// this will output 'Even smarter'
echo $smarty-&gt;getTemplateVars('foo');

?&gt;

</pre>
</div>
</div>
<br class="example-break"><p>
 下面的函数都可用assign作为<span class="emphasis"><em>可选</em></span>属性，用于将函数结果赋值给变量而不显示。
  </p>
<p>
  <a class="link" href="language.function.capture.tpl" title="{capture}"><code class="varname">{capture}</code></a>,
  <a class="link" href="language.function.include.tpl" title="{include}"><code class="varname">{include}</code></a>,
  <a class="link" href="language.function.include.php.tpl" title="{include_php}"><code class="varname">{include_php}</code></a>,
  <a class="link" href="language.function.insert.tpl" title="{insert}"><code class="varname">{insert}</code></a>,
 <a class="link" href="language.custom.functions.tpl#language.function.counter" title="{counter}"><code class="varname">{counter}</code></a>,
 <a class="link" href="language.function.cycle.tpl" title="{cycle}"><code class="varname">{cycle}</code></a>,
 <a class="link" href="language.function.eval.tpl" title="{eval}"><code class="varname">{eval}</code></a>,
 <a class="link" href="language.function.fetch.tpl" title="{fetch}"><code class="varname">{fetch}</code></a>,
 <a class="link" href="language.function.math.tpl" title="{math}"><code class="varname">{math}</code></a>,
 <a class="link" href="language.function.textformat.tpl" title="{textformat}"><code class="varname">{textformat}</code></a>
 </p>
<p>
 参见
  <a class="link" href="language.builtin.functions.tpl#language.function.shortform.assign" title="{$var=...}"><code class="varname">{$var=...}</code></a>,
 <a class="link" href="api.assign.tpl" title="assign()"><code class="varname">assign()</code></a>
   和
  <a class="link" href="api.get.template.vars.tpl" title="getTemplateVars()"><code class="varname">getTemplateVars()</code></a>.
 </p>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="language.function.append.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="language.builtin.functions.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="language.function.block.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">{append} </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> {block}</td>
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
              
              <div id="commentFormChallenge">What is 6 plus 17? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="d95341f193b32c93ed916c272a4411b8">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/language.function.assign.tpl">
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
    <p>This page generated in 0.02279 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
