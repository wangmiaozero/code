<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{block} | Smarty</title>
    <meta name="description" content="{block}">
    <meta name="keywords" content=", ldelim, block, rdelim, ">
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
<tr><th colspan="3" align="center">{block}</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="language.function.assign.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 7. 内置函数</th>
<td width="20%" align="right"> <a accesskey="n" href="language.function.call.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="{block}">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="language.function.block"></a>{block}</h2></div></div></div>
<p>
   <code class="varname">{block}</code>可在模板上定义一块区域，以进行模板继承。详细参见<a class="link" href="advanced.features.template.inheritance.tpl" title="模板继承">模板继承</a>.
  </p>
<p>
    子模板中的<code class="varname">{block}</code>区域代码，将会替换父模板对应的区域代码。
   </p>
<p>
   另外，<code class="varname">{block}</code>可以设置成合并父子模板的相应区域。在子模板的<code class="varname">{block}</code>中定义
   <code class="literal">append</code> 或 <code class="literal">prepend</code>，可以使子模板附加在父模板
   <code class="varname">{block}</code>区域的后面或前面。
   在<code class="varname">{block}</code>内容中使用{$smarty.block.parent}，可以让父模板的区域代码放到
   子模板<code class="varname">{block}</code>内的任何位置。
   </p>
<p><code class="varname">{blocks}</code>可以嵌套使用。
   </p>
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
<tbody><tr>
<td align="center">name</td>
<td align="center">string</td>
<td align="center">Yes</td>
<td align="center"><span class="emphasis"><em>n/a</em></span></td>
<td>模板区域的名称</td>
</tr></tbody>
</table></div>
<p><span class="bold"><strong>可选属性 (仅在子模板中使用):</strong></span></p>
<div class="informaltable"><table border="1">
<colgroup>
<col align="center">
<col>
</colgroup>
<thead><tr>
<th align="center">名称</th>
<th>说明</th>
</tr></thead>
<tbody>
<tr>
<td align="center">append</td>
<td>
<code class="varname">{block}</code>区域代码将附加到父模板的<code class="varname">{block}</code>内容之后</td>
</tr>
<tr>
<td align="center">prepend</td>
<td>
<code class="varname">{block}</code>区域代码将附加到父模板的<code class="varname">{block}</code>内容之前</td>
</tr>
<tr>
<td align="center">hide</td>
<td>在没有该名称区域的时候，忽略区域内容。</td>
</tr>
<tr>
<td align="center">nocache</td>
<td>关闭<code class="varname">{block}</code> 缓存</td>
</tr>
</tbody>
</table></div>
<div class="example">
<a name="id428977"></a><p class="title"><b>Example 7.15. 简单的 <code class="varname">{block}</code> 例子</b></p>
<div class="example-contents">
<p>parent.tpl</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;{block name="title"}Default Title{/block}&lt;/title&gt;
    &lt;title&gt;{block "title"}Default Title{/block}&lt;/title&gt;  {* short-hand  *}
  &lt;/head&gt;
&lt;/html&gt;

  </pre>
<p>child.tpl</p>
<pre class="programlisting">

{extends file="parent.tpl"} 
{block name="title"}
Page Title
{/block}

  </pre>
<p>结果输出：</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;Page Title&lt;/title&gt;
  &lt;/head&gt;
&lt;/html&gt;

</pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id429021"></a><p class="title"><b>Example 7.16. 前面附加 <code class="varname">{block}</code> 例子</b></p>
<div class="example-contents">
<p>parent.tpl</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;{block name="title"}Title - {/block}&lt;/title&gt;
  &lt;/head&gt;
&lt;/html&gt;

  </pre>
<p>child.tpl</p>
<pre class="programlisting">

{extends file="parent.tpl"} 
{block name="title" prepend}
Page Title
{/block}

  </pre>
<p>结果输出</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;Title - Page Title&lt;/title&gt;
  &lt;/head&gt;
&lt;/html&gt;

</pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id429063"></a><p class="title"><b>Example 7.17. 后面附加 <code class="varname">{block}</code> 例子</b></p>
<div class="example-contents">
<p>parent.tpl</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;{block name="title"} is my title{/block}&lt;/title&gt;
  &lt;/head&gt;
&lt;/html&gt;

  </pre>
<p>child.tpl</p>
<pre class="programlisting">

{extends file="parent.tpl"} 
{block name="title" append}
Page Title
{/block}

  </pre>
<p>结果输出：</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;Page title is my titel&lt;/title&gt;
  &lt;/head&gt;
&lt;/html&gt;

</pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id429105"></a><p class="title"><b>Example 7.18. <code class="varname">{$smarty.block.child}</code> 例子</b></p>
<div class="example-contents">
<p>parent.tpl</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;{block name="title"}The {$smarty.block.child} was inserted here{/block}&lt;/title&gt;
  &lt;/head&gt;
&lt;/html&gt;

  </pre>
<p>child.tpl</p>
<pre class="programlisting">

{extends file="parent.tpl"} 
{block name="title"}
Child Title
{/block}

  </pre>
<p>结果输出：</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;The Child Title was inserted here&lt;/title&gt;
  &lt;/head&gt;
&lt;/html&gt;

</pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id429146"></a><p class="title"><b>Example 7.19. <code class="varname">{$smarty.block.parent}</code> 例子</b></p>
<div class="example-contents">
<p>parent.tpl</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;{block name="title"}Parent Title{/block}&lt;/title&gt;
  &lt;/head&gt;
&lt;/html&gt;

  </pre>
<p>child.tpl</p>
<pre class="programlisting">

{extends file="parent.tpl"} 
{block name="title"}
You will see now - {$smarty.block.parent} - here
{/block}

  </pre>
<p>结果输出：</p>
<pre class="programlisting">

&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;You will see now - Parent Title - here&lt;/title&gt;
  &lt;/head&gt;
&lt;/html&gt;

</pre>
</div>
</div>
<br class="example-break"><p>
  参见
  <a class="link" href="advanced.features.template.inheritance.tpl" title="模板继承">模板继承</a>,
  <a class="link" href="language.variables.smarty.tpl#language.variables.smarty.block.parent" title="{$smarty.block.parent}"><em class="parameter"><code>$smarty.block.parent</code></em></a>,
  <a class="link" href="language.variables.smarty.tpl#language.variables.smarty.block.child" title="{$smarty.block.child}"><em class="parameter"><code>$smarty.block.child</code></em></a>,
  和 <a class="link" href="language.function.extends.tpl" title="{extends}"><code class="varname">{extends}</code></a>
 </p>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="language.function.assign.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="language.builtin.functions.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="language.function.call.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">{assign} </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> {call}</td>
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
              
              <div id="commentFormChallenge">What is 1 plus 13? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="3be0099fad10fd2a325f65f4d169413a">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/language.function.block.tpl">
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
    <p>This page generated in 0.02710 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
