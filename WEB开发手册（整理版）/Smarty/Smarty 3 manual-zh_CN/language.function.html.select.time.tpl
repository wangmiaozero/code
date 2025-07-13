<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{html_select_time} | Smarty</title>
    <meta name="description" content="{html_select_time}">
    <meta name="keywords" content=", ldelim, html_select_time, rdelim, ">
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
<tr><th colspan="3" align="center">{html_select_time}</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="language.function.html.select.date.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 8. 自定义函数</th>
<td width="20%" align="right"> <a accesskey="n" href="language.function.html.table.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="{html_select_time}">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="language.function.html.select.time"></a>{html_select_time}</h2></div></div></div>
<p>
   <code class="varname">{html_select_time}</code>是一个
   <a class="link" href="language.custom.functions.tpl" title="Chapter 8. 自定义函数">自定义函数</a>，用于创建一个选择时间的下拉框。
   它可以显示任何或全部的小时、分钟、秒和上下午。
 </p>
<p>
  <em class="parameter"><code>time</code></em>属性可以是多种格式。它可以是时间戳，一个格式为
  <code class="literal">YYYYMMDDHHMMSS</code>的字符串，或者是PHP函数
  <a class="ulink" href="../../../www.php.net/strtotime/index.htm" target="_top"><code class="varname">strtotime()</code></a>
  能支持的字符串。
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
<th align="center">参数名称</th>
<th align="center">类型</th>
<th align="center">必选参数</th>
<th align="center">默认值</th>
<th>说明</th>
</tr></thead>
<tbody>
<tr>
<td align="center">prefix</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">Time_</td>
<td>下拉框名称的前缀</td>
</tr>
<tr>
<td align="center">time</td>
<td align="center">
      <a class="ulink" href="../../../www.php.net/function.time" target="_top">时间戳</a>, 
      <a class="ulink" href="../../../www.php.net/class.DateTime" target="_top">DateTime</a>, 
	  mysql时间戳或任何<a class="ulink" href="../../../www.php.net/strtotime/index.htm" target="_top"><code class="varname">strtotime()</code></a>
	  能支持的字符串，或者是数组（当设置了field_array）
     </td>
<td align="center">No</td>
<td align="center">当前 <a class="ulink" href="../../../www.php.net/function.time" target="_top">时间戳</a>
</td>
<td>
	 默认选中的时间。如果提供了数组，那么field_array和prefix属性将单独作用在每个数组元素上，
	 包括小时、分钟、秒数和上下午。
     </td>
</tr>
<tr>
<td align="center">display_hours</td>
<td align="center">boolean</td>
<td align="center">No</td>
<td align="center"><code class="constant">TRUE</code></td>
<td>是否显示小时数</td>
</tr>
<tr>
<td align="center">display_minutes</td>
<td align="center">boolean</td>
<td align="center">No</td>
<td align="center"><code class="constant">TRUE</code></td>
<td>是否显示分钟数</td>
</tr>
<tr>
<td align="center">display_seconds</td>
<td align="center">boolean</td>
<td align="center">No</td>
<td align="center"><code class="constant">TRUE</code></td>
<td>是否显示秒数</td>
</tr>
<tr>
<td align="center">display_meridian</td>
<td align="center">boolean</td>
<td align="center">No</td>
<td align="center"><code class="constant">TRUE</code></td>
<td>是否显示上下午 (am/pm)</td>
</tr>
<tr>
<td align="center">use_24_hours</td>
<td align="center">boolean</td>
<td align="center">No</td>
<td align="center"><code class="constant">TRUE</code></td>
<td>是否使用24小时格式的时间</td>
</tr>
<tr>
<td align="center">minute_interval</td>
<td align="center">integer</td>
<td align="center">No</td>
<td align="center">1</td>
<td>分钟下拉框的时间间隔</td>
</tr>
<tr>
<td align="center">second_interval</td>
<td align="center">integer</td>
<td align="center">No</td>
<td align="center">1</td>
<td>秒数下拉框的时间间隔</td>
</tr>
<tr>
<td align="center">hour_format</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">%02d</td>
<td>小时的格式(sprintf)</td>
</tr>
<tr>
<td align="center">hour_value_format</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">%20d</td>
<td>小时值的格式(sprintf)</td>
</tr>
<tr>
<td align="center">minute_format</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">%02d</td>
<td>分钟的格式(sprintf)</td>
</tr>
<tr>
<td align="center">minute_value_format</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">%20d</td>
<td>分钟值的格式(sprintf)</td>
</tr>
<tr>
<td align="center">second_format</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">%02d</td>
<td>秒数的格式(sprintf)</td>
</tr>
<tr>
<td align="center">second_value_format</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">%20d</td>
<td>秒数值的格式(sprintf)</td>
</tr>
<tr>
<td align="center">field_array</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">n/a</td>
<td>显示值数组的名称</td>
</tr>
<tr>
<td align="center">all_extra</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>附加给select/input标签附加的属性</td>
</tr>
<tr>
<td align="center">hour_extra</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>附加给小时下拉框select/input标签的属性</td>
</tr>
<tr>
<td align="center">minute_extra</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>附加给分钟下拉框select/input标签的属性</td>
</tr>
<tr>
<td align="center">second_extra</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>附加给秒数下拉框select/input标签的属性</td>
</tr>
<tr>
<td align="center">meridian_extra</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>附加给上下午下拉框select/input标签的属性</td>
</tr>
<tr>
<td align="center">field_separator</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">\n</td>
<td>显示在各字段之间间隔的字符串</td>
</tr>
<tr>
<td align="center">option_separator</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">\n</td>
<td>显示在各选项之间的字符串</td>
</tr>
<tr>
<td align="center">all_id</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>全部select/input标签的ID值</td>
</tr>
<tr>
<td align="center">hour_id</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>小时下拉框select/input标签的ID值</td>
</tr>
<tr>
<td align="center">minute_id</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>分钟下拉框select/input标签的ID值</td>
</tr>
<tr>
<td align="center">second_id</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>秒数下拉框select/input标签的ID值</td>
</tr>
<tr>
<td align="center">meridian_id</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>上下午下拉框select/input标签的ID值</td>
</tr>
<tr>
<td align="center">all_empty</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>该属性可以在每个下拉框的第一行显示文字，并以<span class="quote">“<span class="quote"></span>”</span>作为它的值。
	 在需要让下拉框的第一行显示<span class="quote">“<span class="quote">请选择</span>”</span> 的情况下比较有用。</td>
</tr>
<tr>
<td align="center">hour_empty</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>该属性可以在小时下拉框的第一行显示文字，并以<span class="quote">“<span class="quote"></span>”</span>作为它的值。
	 在需要让小时下拉框的第一行显示<span class="quote">“<span class="quote">请选择小时</span>”</span> 的情况下比较有用。</td>
</tr>
<tr>
<td align="center">minute_empty</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>该属性可以在分钟下拉框的第一行显示文字，并以<span class="quote">“<span class="quote"></span>”</span>作为它的值。
	 在需要让分钟下拉框的第一行显示<span class="quote">“<span class="quote">请选择分钟</span>”</span> 的情况下比较有用。</td>
</tr>
<tr>
<td align="center">second_empty</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>该属性可以在秒数下拉框的第一行显示文字，并以<span class="quote">“<span class="quote"></span>”</span>作为它的值。
	 在需要让秒数下拉框的第一行显示<span class="quote">“<span class="quote">请选择秒数</span>”</span> 的情况下比较有用。</td>
</tr>
<tr>
<td align="center">meridian_empty</td>
<td align="center">string</td>
<td align="center">No</td>
<td align="center">null</td>
<td>
	 该属性可以在上下午下拉框的第一行显示文字，并以<span class="quote">“<span class="quote"></span>”</span>作为它的值。
	 在需要让上下午下拉框的第一行显示<span class="quote">“<span class="quote">请选择上午或下午</span>”</span> 的情况下比较有用。</td>
</tr>
</tbody>
</table></div>
<div class="example">
<a name="id464329"></a><p class="title"><b>Example 8.18. {html_select_time}</b></p>
<div class="example-contents">
<pre class="programlisting">

{html_select_time use_24_hours=true}

  </pre>
<p>
  当早上9点20分23秒的时候，模板将显示：
  </p>
<pre class="screen">

&lt;select name="Time_Hour"&gt;
&lt;option value="00"&gt;00&lt;/option&gt;
&lt;option value="01"&gt;01&lt;/option&gt;
... snipped ....
&lt;option value="08"&gt;08&lt;/option&gt;
&lt;option value="09" selected&gt;09&lt;/option&gt;
&lt;option value="10"&gt;10&lt;/option&gt;
... snipped ....
&lt;option value="22"&gt;22&lt;/option&gt;
&lt;option value="23"&gt;23&lt;/option&gt;
&lt;/select&gt;
&lt;select name="Time_Minute"&gt;
&lt;option value="00"&gt;00&lt;/option&gt;
&lt;option value="01"&gt;01&lt;/option&gt;
... snipped ....
&lt;option value="19"&gt;19&lt;/option&gt;
&lt;option value="20" selected&gt;20&lt;/option&gt;
&lt;option value="21"&gt;21&lt;/option&gt;
... snipped ....
&lt;option value="58"&gt;58&lt;/option&gt;
&lt;option value="59"&gt;59&lt;/option&gt;
&lt;/select&gt;
&lt;select name="Time_Second"&gt;
&lt;option value="00"&gt;00&lt;/option&gt;
&lt;option value="01"&gt;01&lt;/option&gt;
... snipped ....
&lt;option value="22"&gt;22&lt;/option&gt;
&lt;option value="23" selected&gt;23&lt;/option&gt;
&lt;option value="24"&gt;24&lt;/option&gt;
... snipped ....
&lt;option value="58"&gt;58&lt;/option&gt;
&lt;option value="59"&gt;59&lt;/option&gt;
&lt;/select&gt;
&lt;select name="Time_Meridian"&gt;
&lt;option value="am" selected&gt;AM&lt;/option&gt;
&lt;option value="pm"&gt;PM&lt;/option&gt;
&lt;/select&gt;

  </pre>
</div>
</div>
<br class="example-break"><p>
    参见
    <a class="link" href="language.variables.smarty.tpl#language.variables.smarty.now" title="{$smarty.now}"><em class="parameter"><code>$smarty.now</code></em></a>,
    <a class="link" href="language.function.html.select.date.tpl" title="{html_select_date}"><code class="varname">{html_select_date}</code></a>
    和 <a class="link" href="tips.dates.tpl" title="日期时间">日期技巧</a>.
  </p>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="language.function.html.select.date.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="language.custom.functions.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="language.function.html.table.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">{html_select_date} </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> {html_table}</td>
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
              
              <div id="commentFormChallenge">What is 10 plus 9? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="e29dd9af46a9bf580a9574bb84253729">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/language.function.html.select.time.tpl">
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
    <p>This page generated in 0.02402 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
