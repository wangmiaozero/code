<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Smarty3 手册 | Smarty</title>
    <meta name="description" content="Smarty3 手册">
    <meta name="keywords" content="smarty3, ">
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
<tr><th colspan="3" align="center">Smarty3 手册</th></tr>
<tr>
<td width="20%" align="left"> </td>
<th width="60%" align="center"> </th>
<td width="20%" align="right"> <a accesskey="n" href="preface.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div lang="〈" class="book" title="Smarty3 手册">
<div class="titlepage">
<div>
<div><h1 class="title">
<a name="manual"></a>Smarty - PHP模板引擎</h1></div>
<div><div class="authorgroup">
<a name="authors"></a><div class="author"><h3 class="author">
<span class="firstname">Monte</span> <span class="surname">Ohrt &lt;monte at ohrt dot com&gt;</span>
</h3></div>
<div class="author"><h3 class="author">
<span class="firstname">Uwe</span> <span class="surname">Tews &lt;uwe dot tews at googlemail dot com&gt;</span>
</h3></div>
</div></div>
<div><div class="authorgroup">
<a name="translators"></a><div class="author"><h3 class="author">
<span class="firstname">jake</span> <span class="surname">&lt;jake at speedphp dot com&gt;</span>
</h3></div>
</div></div>
<div><p class="copyright">Copyright © 2001-2011 New Digital Group, Inc.</p></div>
<div><p class="pubdate">2012-06-30</p></div>
</div>
<hr>
</div>
<div class="toc">
<p><b>Table of Contents</b></p>
<dl>
<dt><span class="preface"><a href="preface.tpl">序言</a></span></dt>
<dt><span class="part"><a href="getting.started.tpl">I. 开始</a></span></dt>
<dd><dl>
<dt><span class="chapter"><a href="what.is.smarty.tpl">1. Smarty是什么?</a></span></dt>
<dt><span class="chapter"><a href="installation.tpl">2. 安装</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="installation.tpl#installation.requirements">环境需求</a></span></dt>
<dt><span class="sect1"><a href="installing.smarty.basic.tpl">基础安装</a></span></dt>
<dt><span class="sect1"><a href="installing.smarty.extended.tpl">进阶安装</a></span></dt>
</dl></dd>
</dl></dd>
<dt><span class="part"><a href="smarty.for.designers.tpl">II. 模板设计师篇</a></span></dt>
<dd><dl>
<dt><span class="chapter"><a href="language.basic.syntax.tpl">3. 基本语法</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="language.basic.syntax.tpl#language.syntax.comments">注释</a></span></dt>
<dt><span class="sect1"><a href="language.syntax.variables.tpl">变量</a></span></dt>
<dt><span class="sect1"><a href="language.syntax.functions.tpl">函数</a></span></dt>
<dt><span class="sect1"><a href="language.syntax.attributes.tpl">属性</a></span></dt>
<dt><span class="sect1"><a href="language.syntax.quotes.tpl">双引号中嵌入变量</a></span></dt>
<dt><span class="sect1"><a href="language.math.tpl">数学计算</a></span></dt>
<dt><span class="sect1"><a href="language.escaping.tpl">避免Smarty解析</a></span></dt>
</dl></dd>
<dt><span class="chapter"><a href="language.variables.tpl">4. 变量</a></span></dt>
<dd><dl>
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
</dl></dd>
<dt><span class="chapter"><a href="language.modifiers.tpl">5. 变量修饰器</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="language.modifiers.tpl#language.modifier.capitalize">capitalize</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.cat.tpl">cat</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.count.characters.tpl">count_characters</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.count.paragraphs.tpl">count_paragraphs</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.count.sentences.tpl">count_sentences</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.count.words.tpl">count_words</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.date.format.tpl">date_format</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.default.tpl">default</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.escape.tpl">escape</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.from_charset.tpl">from_charset</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.indent.tpl">indent</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.lower.tpl">lower</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.nl2br.tpl">nl2br</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.regex.replace.tpl">regex_replace</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.replace.tpl">replace</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.spacify.tpl">spacify</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.string.format.tpl">string_format</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.strip.tpl">strip</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.strip.tags.tpl">strip_tags</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.to_charset.tpl">to_charset</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.truncate.tpl">truncate</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.unescape.tpl">unescape</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.upper.tpl">upper</a></span></dt>
<dt><span class="sect1"><a href="language.modifier.wordwrap.tpl">wordwrap</a></span></dt>
</dl></dd>
<dt><span class="chapter"><a href="language.combining.modifiers.tpl">6. 复合修饰器</a></span></dt>
<dt><span class="chapter"><a href="language.builtin.functions.tpl">7. 内置函数</a></span></dt>
<dd><dl>
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
</dl></dd>
<dt><span class="chapter"><a href="language.custom.functions.tpl">8. 自定义函数</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="language.custom.functions.tpl#language.function.counter">{counter}</a></span></dt>
<dt><span class="sect1"><a href="language.function.cycle.tpl">{cycle}</a></span></dt>
<dt><span class="sect1"><a href="language.function.eval.tpl">{eval}</a></span></dt>
<dt><span class="sect1"><a href="language.function.fetch.tpl">{fetch}</a></span></dt>
<dt><span class="sect1"><a href="language.function.html.checkboxes.tpl">{html_checkboxes}</a></span></dt>
<dt><span class="sect1"><a href="language.function.html.image.tpl">{html_image}</a></span></dt>
<dt><span class="sect1"><a href="language.function.html.options.tpl">{html_options}</a></span></dt>
<dt><span class="sect1"><a href="language.function.html.radios.tpl">{html_radios}</a></span></dt>
<dt><span class="sect1"><a href="language.function.html.select.date.tpl">{html_select_date}</a></span></dt>
<dt><span class="sect1"><a href="language.function.html.select.time.tpl">{html_select_time}</a></span></dt>
<dt><span class="sect1"><a href="language.function.html.table.tpl">{html_table}</a></span></dt>
<dt><span class="sect1"><a href="language.function.mailto.tpl">{mailto}</a></span></dt>
<dt><span class="sect1"><a href="language.function.math.tpl">{math}</a></span></dt>
<dt><span class="sect1"><a href="language.function.textformat.tpl">{textformat}</a></span></dt>
</dl></dd>
<dt><span class="chapter"><a href="config.files.tpl">9. 配置文件</a></span></dt>
<dt><span class="chapter"><a href="chapter.debugging.console.tpl">10. 调试控制台</a></span></dt>
</dl></dd>
<dt><span class="part"><a href="smarty.for.programmers.tpl">III. 程序开发者篇</a></span></dt>
<dd><dl>
<dt><span class="chapter"><a href="charset.tpl">11. 字符集编码</a></span></dt>
<dd><dl><dt><span class="sect1"><a href="charset.tpl#charset.encoding">字符集编码</a></span></dt></dl></dd>
<dt><span class="chapter"><a href="smarty.constants.tpl">12. 常量</a></span></dt>
<dd><dl><dt><span class="sect1"><a href="smarty.constants.tpl#constant.smarty.dir">SMARTY_DIR</a></span></dt></dl></dd>
<dt><span class="chapter"><a href="api.variables.tpl">13. Smarty成员变量</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="api.variables.tpl#variable.allow.php.templates">$allow_php_templates</a></span></dt>
<dt><span class="sect1"><a href="variable.auto.literal.tpl">$auto_literal</a></span></dt>
<dt><span class="sect1"><a href="variable.autoload.filters.tpl">$autoload_filters</a></span></dt>
<dt><span class="sect1"><a href="variable.cache.dir.tpl">$cache_dir</a></span></dt>
<dt><span class="sect1"><a href="variable.cache.id.tpl">$cache_id</a></span></dt>
<dt><span class="sect1"><a href="variable.cache.lifetime.tpl">$cache_lifetime</a></span></dt>
<dt><span class="sect1"><a href="variable.cache.locking.tpl">$cache_locking</a></span></dt>
<dt><span class="sect1"><a href="variable.cache.modified.check.tpl">$cache_modified_check</a></span></dt>
<dt><span class="sect1"><a href="variable.caching.tpl">$caching</a></span></dt>
<dt><span class="sect1"><a href="variable.caching.type.tpl">$caching_type</a></span></dt>
<dt><span class="sect1"><a href="variable.compile.check.tpl">$compile_check</a></span></dt>
<dt><span class="sect1"><a href="variable.compile.dir.tpl">$compile_dir</a></span></dt>
<dt><span class="sect1"><a href="variable.compile.id.tpl">$compile_id</a></span></dt>
<dt><span class="sect1"><a href="variable.compile.locking.tpl">$compile_locking</a></span></dt>
<dt><span class="sect1"><a href="variable.compiler.class.tpl">$compiler_class</a></span></dt>
<dt><span class="sect1"><a href="variable.config.booleanize.tpl">$config_booleanize</a></span></dt>
<dt><span class="sect1"><a href="variable.config.dir.tpl">$config_dir</a></span></dt>
<dt><span class="sect1"><a href="variable.config.overwrite.tpl">$config_overwrite</a></span></dt>
<dt><span class="sect1"><a href="variable.config.read.hidden.tpl">$config_read_hidden</a></span></dt>
<dt><span class="sect1"><a href="variable.debug_template.tpl">$debug_tpl</a></span></dt>
<dt><span class="sect1"><a href="variable.debugging.tpl">$debugging</a></span></dt>
<dt><span class="sect1"><a href="variable.debugging.ctrl.tpl">$debugging_ctrl</a></span></dt>
<dt><span class="sect1"><a href="variable.default.config.type.tpl">$default_config_type</a></span></dt>
<dt><span class="sect1"><a href="variable.default.modifiers.tpl">$default_modifiers</a></span></dt>
<dt><span class="sect1"><a href="variable.default.resource.type.tpl">$default_resource_type</a></span></dt>
<dt><span class="sect1"><a href="variable.default.config.handler.func.tpl">$default_config_handler_func</a></span></dt>
<dt><span class="sect1"><a href="variable.default.template.handler.func.tpl">$default_template_handler_func</a></span></dt>
<dt><span class="sect1"><a href="variable.direct.access.security.tpl">$direct_access_security</a></span></dt>
<dt><span class="sect1"><a href="variable.error.reporting.tpl">$error_reporting</a></span></dt>
<dt><span class="sect1"><a href="variable.escape.html.tpl">$escape_html</a></span></dt>
<dt><span class="sect1"><a href="variable.force.cache.tpl">$force_cache</a></span></dt>
<dt><span class="sect1"><a href="variable.force.compile.tpl">$force_compile</a></span></dt>
<dt><span class="sect1"><a href="variable.left.delimiter.tpl">$left_delimiter</a></span></dt>
<dt><span class="sect1"><a href="variable.locking.timeout.tpl">$locking_timeout</a></span></dt>
<dt><span class="sect1"><a href="variable.merge.compiled.includes.tpl">$merge_compiled_includes</a></span></dt>
<dt><span class="sect1"><a href="variable.php.handling.tpl">$php_handling</a></span></dt>
<dt><span class="sect1"><a href="variable.plugins.dir.tpl">$plugins_dir</a></span></dt>
<dt><span class="sect1"><a href="variable.right.delimiter.tpl">$right_delimiter</a></span></dt>
<dt><span class="sect1"><a href="variable.smarty.debug.id.tpl">$smarty_debug_id</a></span></dt>
<dt><span class="sect1"><a href="variable.template.dir.tpl">$template_dir</a></span></dt>
<dt><span class="sect1"><a href="variable.trusted.dir.tpl">$trusted_dir</a></span></dt>
<dt><span class="sect1"><a href="variable.use.include.path.tpl">$use_include_path</a></span></dt>
<dt><span class="sect1"><a href="variable.use.sub.dirs.tpl">$use_sub_dirs</a></span></dt>
</dl></dd>
<dt><span class="chapter"><a href="api.functions.tpl">14. Smarty成员方法</a></span></dt>
<dd><dl>
<dt>
<span class="refentrytitle"><a href="api.add.config.dir.tpl">addConfigDir()</a></span><span class="refpurpose"> — 增加一个配置文件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.add.plugins.dir.tpl">addPluginsDir()</a></span><span class="refpurpose"> — 增加一个插件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.add.template.dir.tpl">addTemplateDir()</a></span><span class="refpurpose"> — 增加一个模板文件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.append.tpl">append()</a></span><span class="refpurpose"> — 把值追加到数组。</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.append.by.ref.tpl">appendByRef()</a></span><span class="refpurpose"> — 引用追加</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.assign.tpl">assign()</a></span><span class="refpurpose"> — 赋值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.assign.by.ref.tpl">assignByRef()</a></span><span class="refpurpose"> — 引用赋值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.all.assign.tpl">clearAllAssign()</a></span><span class="refpurpose"> — 清除全部赋值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.all.cache.tpl">clearAllCache()</a></span><span class="refpurpose"> — 清除全部缓存</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.assign.tpl">clearAssign()</a></span><span class="refpurpose"> — 清除赋值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.cache.tpl">clearCache()</a></span><span class="refpurpose"> — 清除缓存</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.compiled.tpl.tpl">clearCompiledTemplate()</a></span><span class="refpurpose"> — 清除模板编译文件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.clear.config.tpl">clearConfig()</a></span><span class="refpurpose"> — 清除配置</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.compile.all.config.tpl">compileAllConfig()</a></span><span class="refpurpose"> — 编译全部配置文件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.compile.all.templates.tpl">compileAllTemplates()</a></span><span class="refpurpose"> — 编译全部模板</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.config.load.tpl">configLoad()</a></span><span class="refpurpose"> — 载入预配置的变量</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.create.data.tpl">createData()</a></span><span class="refpurpose"> — 创建数据对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.create.template.tpl">createTemplate()</a></span><span class="refpurpose"> — 创建模板对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.disable.security.tpl">disableSecurity()</a></span><span class="refpurpose"> — 关闭安全检查</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.display.tpl">display()</a></span><span class="refpurpose"> — 显示</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.enable.security.tpl">enableSecurity()</a></span><span class="refpurpose"> — 开启安全检查</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.fetch.tpl">fetch()</a></span><span class="refpurpose"> — 取得输出内容</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.cache.dir.tpl">getCacheDir()</a></span><span class="refpurpose"> — 取得缓存目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.compile.dir.tpl">getCompileDir()</a></span><span class="refpurpose"> — 取得编译目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.config.dir.tpl">getConfigDir()</a></span><span class="refpurpose"> — 取得配置文件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.config.vars.tpl">getConfigVars()</a></span><span class="refpurpose"> — 取得预配置变量</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.plugins.dir.tpl">getPluginsDir()</a></span><span class="refpurpose"> — 取得插件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.registered.object.tpl">getRegisteredObject()</a></span><span class="refpurpose"> — 获取已注册对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.tags.tpl">getTags()</a></span><span class="refpurpose"> — 取得模板标签</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.template.dir.tpl">getTemplateDir()</a></span><span class="refpurpose"> — 取得模板目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.get.template.vars.tpl">getTemplateVars()</a></span><span class="refpurpose"> — 取得变量值</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.is.cached.tpl">isCached()</a></span><span class="refpurpose"> — 检查模板是否已经缓存</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.load.filter.tpl">loadFilter()</a></span><span class="refpurpose"> — 载入过滤插件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.mute.expected.errors.tpl">Smarty::muteExpectedErrors()</a></span><span class="refpurpose"> — 忽略脚本警告信息</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.cacheresource.tpl">registerCacheResource()</a></span><span class="refpurpose"> — 注册缓存资源</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.class.tpl">registerClass()</a></span><span class="refpurpose"> — 注册类</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.default.plugin.handler.tpl">registerDefaultPluginHandler()</a></span><span class="refpurpose"> — 注册默认插件处理器</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.filter.tpl">registerFilter()</a></span><span class="refpurpose"> — 注册过滤器</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.plugin.tpl">registerPlugin()</a></span><span class="refpurpose"> — 注册插件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.object.tpl">registerObject()</a></span><span class="refpurpose"> — 注册对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.register.resource.tpl">registerResource()</a></span><span class="refpurpose"> — 注册资源</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.cache.dir.tpl">setCacheDir()</a></span><span class="refpurpose"> — 设置缓存目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.compile.dir.tpl">setCompileDir()</a></span><span class="refpurpose"> — 设置编译目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.config.dir.tpl">setConfigDir()</a></span><span class="refpurpose"> — 设置配置目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.plugins.dir.tpl">setPluginsDir()</a></span><span class="refpurpose"> — 设置插件目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.set.template.dir.tpl">setTemplateDir()</a></span><span class="refpurpose"> — 设置模板目录</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.template.exists.tpl">templateExists()</a></span><span class="refpurpose"> — 检查模板是否存在</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.cacheresource.tpl">unregisterCacheResource()</a></span><span class="refpurpose"> — 注销缓存资源</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.filter.tpl">unregisterFilter()</a></span><span class="refpurpose"> — 注销过滤器</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.plugin.tpl">unregisterPlugin</a></span><span class="refpurpose"> — 注销插件</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.object.tpl">unregisterObject()</a></span><span class="refpurpose"> — 注销对象</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.unregister.resource.tpl">unregisterResource()</a></span><span class="refpurpose"> — 注销资源</span>
</dt>
<dt>
<span class="refentrytitle"><a href="api.test.install.tpl">testInstall()</a></span><span class="refpurpose"> — 测试Smarty安装</span>
</dt>
</dl></dd>
<dt><span class="chapter"><a href="caching.tpl">15. 缓存</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="caching.tpl#caching.setting.up">配置缓存时间</a></span></dt>
<dt><span class="sect1"><a href="caching.multiple.caches.tpl">单页多个缓存</a></span></dt>
<dt><span class="sect1"><a href="caching.groups.tpl">缓存组</a></span></dt>
<dt><span class="sect1"><a href="caching.cacheable.tpl">控制输出缓存</a></span></dt>
<dd><dl>
<dt><span class="sect2"><a href="caching.cacheable.tpl#cacheability.sections">模板区域缓存控制</a></span></dt>
<dt><span class="sect2"><a href="caching.cacheable.tpl#cacheability.tags">标签的缓存控制</a></span></dt>
<dt><span class="sect2"><a href="caching.cacheable.tpl#cacheability.variables">变量的缓存控制</a></span></dt>
<dt><span class="sect2"><a href="caching.cacheable.tpl#cacheability.plugins">插件的缓存控制</a></span></dt>
</dl></dd>
<dt><span class="sect1"><a href="caching.custom.tpl">自定义缓存实现</a></span></dt>
</dl></dd>
<dt><span class="chapter"><a href="resources.tpl">16. 资源</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="resources.tpl#resources.file">文件资源</a></span></dt>
<dd><dl>
<dt><span class="sect2"><a href="resources.tpl#templates.from.template.dir">$template_dir目录</a></span></dt>
<dt><span class="sect2"><a href="resources.tpl#templates.from.specified.template.dir">特定的$template_dir</a></span></dt>
<dt><span class="sect2"><a href="resources.tpl#templates.from.any.dir">任意目录的模板</a></span></dt>
<dt><span class="sect2"><a href="resources.tpl#templates.windows.filepath">Windows文件路径</a></span></dt>
</dl></dd>
<dt><span class="sect1"><a href="resources.string.tpl">字符串资源</a></span></dt>
<dt><span class="sect1"><a href="resources.streams.tpl">数据流资源</a></span></dt>
<dt><span class="sect1"><a href="resources.extends.tpl">扩展模板资源</a></span></dt>
<dt><span class="sect1"><a href="resources.custom.tpl">自定义模板资源</a></span></dt>
</dl></dd>
<dt><span class="chapter"><a href="advanced.features.tpl">17. 高级特性</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="advanced.features.tpl#advanced.features.security">安全</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.template.settings.tpl">修改模板设置</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.template.inheritance.tpl">模板继承</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.streams.tpl">数据流</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.objects.tpl">对象</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.static.classes.tpl">静态类</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.prefilters.tpl">前置过滤器</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.postfilters.tpl">后置过滤器</a></span></dt>
<dt><span class="sect1"><a href="advanced.features.outputfilters.tpl">输出过滤器</a></span></dt>
</dl></dd>
<dt><span class="chapter"><a href="plugins.tpl">18. 以插件扩展Smarty</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="plugins.tpl#plugins.howto">插件如何工作</a></span></dt>
<dt><span class="sect1"><a href="plugins.naming.conventions.tpl">命名规则</a></span></dt>
<dt><span class="sect1"><a href="plugins.writing.tpl">编写插件</a></span></dt>
<dt><span class="sect1"><a href="plugins.functions.tpl">模板函数</a></span></dt>
<dt><span class="sect1"><a href="plugins.modifiers.tpl">修饰器</a></span></dt>
<dt><span class="sect1"><a href="plugins.block.functions.tpl">块函数</a></span></dt>
<dt><span class="sect1"><a href="plugins.compiler.functions.tpl">编译函数</a></span></dt>
<dt><span class="sect1"><a href="plugins.prefilters.postfilters.tpl">前置/后置过滤器</a></span></dt>
<dt><span class="sect1"><a href="plugins.outputfilters.tpl">输出过滤器</a></span></dt>
<dt><span class="sect1"><a href="plugins.resources.tpl">资源插件</a></span></dt>
<dt><span class="sect1"><a href="plugins.inserts.tpl">插入插件</a></span></dt>
</dl></dd>
<dt><span class="chapter"><a href="bc.tpl">19. SmartyBC - 向前兼容的类库</a></span></dt>
<dd><dl><dt><span class="sect1"><a href="bc.tpl#bc.class">SmartyBC 类</a></span></dt></dl></dd>
</dl></dd>
<dt><span class="part"><a href="appendixes.tpl">IV. 附录</a></span></dt>
<dd><dl>
<dt><span class="chapter"><a href="troubleshooting.tpl">20. 疑难解答</a></span></dt>
<dd><dl><dt><span class="sect1"><a href="troubleshooting.tpl#smarty.php.errors">Smarty/PHP 错误</a></span></dt></dl></dd>
<dt><span class="chapter"><a href="tips.tpl">21. 技巧</a></span></dt>
<dd><dl>
<dt><span class="sect1"><a href="tips.tpl#tips.blank.var.handling">空变量的处理</a></span></dt>
<dt><span class="sect1"><a href="tips.default.var.handling.tpl">默认变量处理</a></span></dt>
<dt><span class="sect1"><a href="tips.passing.vars.tpl">传递标题到头部模板</a></span></dt>
<dt><span class="sect1"><a href="tips.dates.tpl">日期时间</a></span></dt>
<dt><span class="sect1"><a href="tips.wap.tpl">WAP/WML页面</a></span></dt>
<dt><span class="sect1"><a href="tips.componentized.templates.tpl">组件化模板</a></span></dt>
<dt><span class="sect1"><a href="tips.obfuscating.email.tpl">混淆电子邮件地址</a></span></dt>
</dl></dd>
<dt><span class="chapter"><a href="inforesources.tpl">22. 资料</a></span></dt>
<dt><span class="chapter"><a href="bugs.tpl">23. BUGS</a></span></dt>
</dl></dd>
</dl>
</div>
<div class="list-of-examples">
<p><b>List of Examples</b></p>
<dl>
<dt>2.1. <a href="installing.smarty.basic.tpl#id404018">载入Smarty库文件</a>
</dt>
<dt>2.2. <a href="installing.smarty.basic.tpl#id404119">手动指定 SMARTY_DIR 常量</a>
</dt>
<dt>2.3. <a href="installing.smarty.basic.tpl#id404132">用绝对路径引用库文件</a>
</dt>
<dt>2.4. <a href="installing.smarty.basic.tpl#id404154">将库文件路径增加到<code class="filename">php.ini</code> 文件</a>
</dt>
<dt>2.5. <a href="installing.smarty.basic.tpl#id404177">通过函数ini_set()
	来设置include path
    </a>
</dt>
<dt>2.6. <a href="installing.smarty.basic.tpl#id404314">目录文件结构</a>
</dt>
<dt>2.7. <a href="installing.smarty.basic.tpl#id404435">设置目录的读写权限</a>
</dt>
<dt>2.8. <a href="installing.smarty.basic.tpl#id404499">/web/www.example.com/guestbook/templates/index.tpl</a>
</dt>
<dt>2.9. <a href="installing.smarty.basic.tpl#id404564">修改 /web/www.example.com/docs/guestbook/index.php</a>
</dt>
<dt>2.10. <a href="installing.smarty.extended.tpl#id404679">/php/includes/guestbook/setup.php</a>
</dt>
<dt>2.11. <a href="installing.smarty.extended.tpl#id404721">/web/www.example.com/guestbook/htdocs/index.php</a>
</dt>
<dt>3.1. <a href="language.basic.syntax.tpl#id406276">注释例子</a>
</dt>
<dt>3.2. <a href="language.syntax.variables.tpl#id406228">变量</a>
</dt>
<dt>3.3. <a href="language.syntax.functions.tpl#id406342">函数语法</a>
</dt>
<dt>3.4. <a href="language.syntax.attributes.tpl#id406644">函数属性语法</a>
</dt>
<dt>3.5. <a href="language.syntax.quotes.tpl#id406905">例子</a>
</dt>
<dt>3.6. <a href="language.syntax.quotes.tpl#id407272">例子</a>
</dt>
<dt>3.7. <a href="language.math.tpl#id407020">数学计算例子</a>
</dt>
<dt>3.8. <a href="language.escaping.tpl#id407600">使用自动忽略解析的特性</a>
</dt>
<dt>3.9. <a href="language.escaping.tpl#id407685">改变定界符的例子</a>
</dt>
<dt>4.1. <a href="language.variables.tpl#id408431">变量例子</a>
</dt>
<dt>4.2. <a href="language.variables.tpl#id408483">变量赋值</a>
</dt>
<dt>4.3. <a href="language.variables.tpl#id408858">数组变量</a>
</dt>
<dt>4.4. <a href="language.variables.tpl#id408918">使用数组下标</a>
</dt>
<dt>4.5. <a href="language.variables.tpl#id408987">使用对象</a>
</dt>
<dt>4.6. <a href="language.variable.scopes.tpl#id409324">变量范围的例子</a>
</dt>
<dt>4.7. <a href="language.config.variables.tpl#id409550">配置变量</a>
</dt>
<dt>4.8. <a href="language.variables.smarty.tpl#id409887">显示页面请求变量</a>
</dt>
<dt>5.1. <a href="language.modifiers.tpl#id411550">修饰器例子</a>
</dt>
<dt>5.2. <a href="language.modifiers.tpl#id412178">capitalize</a>
</dt>
<dt>5.3. <a href="language.modifier.cat.tpl#id412551">cat</a>
</dt>
<dt>5.4. <a href="language.modifier.count.characters.tpl#id412851">count_characters</a>
</dt>
<dt>5.5. <a href="language.modifier.count.paragraphs.tpl#id412688">count_paragraphs</a>
</dt>
<dt>5.6. <a href="language.modifier.count.sentences.tpl#id413113">count_sentences</a>
</dt>
<dt>5.7. <a href="language.modifier.count.words.tpl#id413074">count_words</a>
</dt>
<dt>5.8. <a href="language.modifier.date.format.tpl#id413834">date_format</a>
</dt>
<dt>5.9. <a href="language.modifier.default.tpl#id414750">default</a>
</dt>
<dt>5.10. <a href="language.modifier.escape.tpl#id415268">escape</a>
</dt>
<dt>5.11. <a href="language.modifier.escape.tpl#id415299">escape的另一个例子</a>
</dt>
<dt>5.12. <a href="language.modifier.indent.tpl#id416283">indent</a>
</dt>
<dt>5.13. <a href="language.modifier.lower.tpl#id416170">lower</a>
</dt>
<dt>5.14. <a href="language.modifier.nl2br.tpl#id416428">nl2br</a>
</dt>
<dt>5.15. <a href="language.modifier.regex.replace.tpl#id417096">regex_replace</a>
</dt>
<dt>5.16. <a href="language.modifier.replace.tpl#id417513">replace</a>
</dt>
<dt>5.17. <a href="language.modifier.spacify.tpl#id417891">spacify</a>
</dt>
<dt>5.18. <a href="language.modifier.string.format.tpl#id418243">string_format</a>
</dt>
<dt>5.19. <a href="language.modifier.strip.tpl#id418503">strip</a>
</dt>
<dt>5.20. <a href="language.modifier.strip.tags.tpl#id418775">strip_tags</a>
</dt>
<dt>5.21. <a href="language.modifier.truncate.tpl#id419585">truncate</a>
</dt>
<dt>5.22. <a href="language.modifier.unescape.tpl#id420101">escape</a>
</dt>
<dt>5.23. <a href="language.modifier.upper.tpl#id420185">upper</a>
</dt>
<dt>5.24. <a href="language.modifier.wordwrap.tpl#id420798">wordwrap</a>
</dt>
<dt>6.1. <a href="language.combining.modifiers.tpl#id425471">复合修饰器</a>
</dt>
<dt>7.1. <a href="language.builtin.functions.tpl#id426469">简单赋值</a>
</dt>
<dt>7.2. <a href="language.builtin.functions.tpl#id426493">数学运算赋值</a>
</dt>
<dt>7.3. <a href="language.builtin.functions.tpl#id426507">对数组元素赋值</a>
</dt>
<dt>7.4. <a href="language.builtin.functions.tpl#id426520">对多维数组元素赋值</a>
</dt>
<dt>7.5. <a href="language.builtin.functions.tpl#id426533">附加到数组</a>
</dt>
<dt>7.6. <a href="language.builtin.functions.tpl#id426546">赋值的作用范围</a>
</dt>
<dt>7.7. <a href="language.function.append.tpl#id427201">{append}</a>
</dt>
<dt>7.8. <a href="language.function.assign.tpl#id427819">{assign}</a>
</dt>
<dt>7.9. <a href="language.function.assign.tpl#id427844">{assign} 使用nocache属性</a>
</dt>
<dt>7.10. <a href="language.function.assign.tpl#id427868">{assign} 进行数学运算</a>
</dt>
<dt>7.11. <a href="language.function.assign.tpl#id427883">{assign} 在调用的模板内的作用范围</a>
</dt>
<dt>7.12. <a href="language.function.assign.tpl#id427914">{assign} 作用范围例子 </a>
</dt>
<dt>7.13. <a href="language.function.assign.tpl#id427937">{assign} 赋值一个全局变量</a>
</dt>
<dt>7.14. <a href="language.function.assign.tpl#id427955">从PHP脚本中获取{assign} 的变量</a>
</dt>
<dt>7.15. <a href="language.function.block.tpl#id428977">简单的 <code class="varname">{block}</code> 例子</a>
</dt>
<dt>7.16. <a href="language.function.block.tpl#id429021">前面附加 <code class="varname">{block}</code> 例子</a>
</dt>
<dt>7.17. <a href="language.function.block.tpl#id429063">后面附加 <code class="varname">{block}</code> 例子</a>
</dt>
<dt>7.18. <a href="language.function.block.tpl#id429105"><code class="varname">{$smarty.block.child}</code> 例子</a>
</dt>
<dt>7.19. <a href="language.function.block.tpl#id429146"><code class="varname">{$smarty.block.parent}</code> 例子</a>
</dt>
<dt>7.20. <a href="language.function.call.tpl#id430057">调用一个递归菜单的例子</a>
</dt>
<dt>7.21. <a href="language.function.capture.tpl#id430758">{capture}使用name属性</a>
</dt>
<dt>7.22. <a href="language.function.capture.tpl#id430771">{capture} 捕获内容到变量</a>
</dt>
<dt>7.23. <a href="language.function.capture.tpl#id430791">{capture} 捕获内容到数组变量</a>
</dt>
<dt>7.24. <a href="language.function.config.load.tpl#id431500">{config_load}</a>
</dt>
<dt>7.25. <a href="language.function.config.load.tpl#id431577"> {config_load} 载入段落配置变量</a>
</dt>
<dt>7.26. <a href="language.function.extends.tpl#id432338">简单 {extends} 例子</a>
</dt>
<dt>7.27. <a href="language.function.for.tpl#id432843">简单的<code class="varname">{for}</code> 循环</a>
</dt>
<dt>7.28. <a href="language.function.for.tpl#id432873">使用<code class="varname">max</code> 属性</a>
</dt>
<dt>7.29. <a href="language.function.for.tpl#id432910"><code class="varname">{forelse}</code>的执行</a>
</dt>
<dt>7.30. <a href="language.function.foreach.tpl#id433686">简单的<code class="varname">{foreach}</code> 循环</a>
</dt>
<dt>7.31. <a href="language.function.foreach.tpl#id433733">使用<em class="parameter"><code>key</code></em>变量的例子</a>
</dt>
<dt>7.32. <a href="language.function.foreach.tpl#id433782">多维数组通过<em class="parameter"><code>item</code></em> 和 <em class="parameter"><code>key</code></em>来嵌套使用{foreach}</a>
</dt>
<dt>7.33. <a href="language.function.foreach.tpl#id433851">{foreachelse}的数据库例子</a>
</dt>
<dt>7.34. <a href="language.function.foreach.tpl#id433929"><em class="parameter"><code>index</code></em> 例子</a>
</dt>
<dt>7.35. <a href="language.function.foreach.tpl#id433992"><em class="parameter"><code>iteration</code></em> 例子: is div by</a>
</dt>
<dt>7.36. <a href="language.function.foreach.tpl#id434020"><em class="parameter"><code>iteration</code></em> 例子: is even/odd by</a>
</dt>
<dt>7.37. <a href="language.function.foreach.tpl#id434098"><em class="parameter"><code>first</code></em>例子</a>
</dt>
<dt>7.38. <a href="language.function.foreach.tpl#id434146"><em class="parameter"><code>last</code></em>例子</a>
</dt>
<dt>7.39. <a href="language.function.foreach.tpl#id434195"><em class="parameter"><code>show</code></em>例子</a>
</dt>
<dt>7.40. <a href="language.function.foreach.tpl#id434241"><em class="parameter"><code>total</code></em>例子</a>
</dt>
<dt>7.41. <a href="language.function.foreach.tpl#id434307"><code class="varname">{break}</code> 例子</a>
</dt>
<dt>7.42. <a href="language.function.foreach.tpl#id434342"><code class="varname">{continue}</code> 例子</a>
</dt>
<dt>7.43. <a href="language.function.function.tpl#id435563">递归菜单 {function} 例子</a>
</dt>
<dt>7.44. <a href="language.function.if.tpl#id436306">{if} 表达式</a>
</dt>
<dt>7.45. <a href="language.function.if.tpl#id436318">{if} 的更多例子</a>
</dt>
<dt>7.46. <a href="language.function.include.tpl#id437288">简单 {include} 例子</a>
</dt>
<dt>7.47. <a href="language.function.include.tpl#id437300">{include} 传递变量</a>
</dt>
<dt>7.48. <a href="language.function.include.tpl#id437338">{include} 作用范围示例</a>
</dt>
<dt>7.49. <a href="language.function.include.tpl#id437373">{include} 关闭缓存</a>
</dt>
<dt>7.50. <a href="language.function.include.tpl#id437390">{include} 单独的缓存时间</a>
</dt>
<dt>7.51. <a href="language.function.include.tpl#id437408">{include}开启缓存</a>
</dt>
<dt>7.52. <a href="language.function.include.tpl#id437425">{include} 和赋值变量</a>
</dt>
<dt>7.53. <a href="language.function.include.tpl#id437455">{include} 相对路径</a>
</dt>
<dt>7.54. <a href="language.function.include.tpl#id437474">各种 {include} 资源例子</a>
</dt>
<dt>7.55. <a href="language.function.include.php.tpl#id438552"> {include_php} 函数</a>
</dt>
<dt>7.56. <a href="language.function.insert.tpl#id439311"> {insert} 函数</a>
</dt>
<dt>7.57. <a href="language.function.ldelim.tpl#id439955">{ldelim}, {rdelim}</a>
</dt>
<dt>7.58. <a href="language.function.ldelim.tpl#id440001">再一个 Javascript 例子</a>
</dt>
<dt>7.59. <a href="language.function.literal.tpl#id439707">{literal} 标签</a>
</dt>
<dt>7.60. <a href="language.function.nocache.tpl#id440062">阻止模板区域缓存</a>
</dt>
<dt>7.61. <a href="language.function.php.tpl#id440208">{php}标签的使用</a>
</dt>
<dt>7.62. <a href="language.function.php.tpl#id440608">{php}标签中使用全局变量来赋值变量</a>
</dt>
<dt>7.63. <a href="language.function.section.tpl#id441406">简单的{section}例子</a>
</dt>
<dt>7.64. <a href="language.function.section.tpl#id441460">{section}不使用赋值数组</a>
</dt>
<dt>7.65. <a href="language.function.section.tpl#id441486">给{section}设置名称</a>
</dt>
<dt>7.66. <a href="language.function.section.tpl#id441522">{section}中使用关联数组</a>
</dt>
<dt>7.67. <a href="language.function.section.tpl#id441585">{section}的<code class="varname">loop</code>属性的演示例子</a>
</dt>
<dt>7.68. <a href="language.function.section.tpl#id441668">{section}嵌套</a>
</dt>
<dt>7.69. <a href="language.function.section.tpl#id441736">{sectionelse}的数据库例子</a>
</dt>
<dt>7.70. <a href="language.function.section.tpl#id441845">{section} <code class="varname">index</code> 属性</a>
</dt>
<dt>7.71. <a href="language.function.section.tpl#id441942"><code class="varname">index</code>, <code class="varname">index_next</code>
 和 <code class="varname">index_prev</code> 属性 </a>
</dt>
<dt>7.72. <a href="language.function.section.tpl#id442085"><code class="varname">iteration</code>属性 </a>
</dt>
<dt>7.73. <a href="language.function.section.tpl#id442252">{section} 属性 <code class="varname">first</code> 和 <code class="varname">last</code></a>
</dt>
<dt>7.74. <a href="language.function.section.tpl#id442350">{section} 属性 <code class="varname">loop</code></a>
</dt>
<dt>7.75. <a href="language.function.section.tpl#id442406"><code class="varname">show</code> 属性 </a>
</dt>
<dt>7.76. <a href="language.function.section.tpl#id442470"><code class="varname">total</code>例子</a>
</dt>
<dt>7.77. <a href="language.function.setfilter.tpl#id444269">{setfilter} 标签</a>
</dt>
<dt>7.78. <a href="language.function.strip.tpl#id443977">{strip} 标签</a>
</dt>
<dt>7.79. <a href="language.function.while.tpl#id444991">{while} 循环</a>
</dt>
<dt>8.1. <a href="language.custom.functions.tpl#id455474">{counter}</a>
</dt>
<dt>8.2. <a href="language.function.cycle.tpl#id456105">{cycle}</a>
</dt>
<dt>8.3. <a href="language.function.eval.tpl#id456693">{eval}</a>
</dt>
<dt>8.4. <a href="language.function.eval.tpl#id456742">另一个{eval}例子</a>
</dt>
<dt>8.5. <a href="language.function.fetch.tpl#id457288">{fetch} 例子</a>
</dt>
<dt>8.6. <a href="language.function.html.checkboxes.tpl#id457985">{html_checkboxes}</a>
</dt>
<dt>8.7. <a href="language.function.html.checkboxes.tpl#id458055">
      数据库例子(例如 PEAR 或 ADODB):
  </a>
</dt>
<dt>8.8. <a href="language.function.html.image.tpl#id458980">{html_image} 例子</a>
</dt>
<dt>8.9. <a href="language.function.html.options.tpl#id459731">使用<code class="varname">options</code>属性</a>
</dt>
<dt>8.10. <a href="language.function.html.options.tpl#id459790">分开赋值<code class="varname">values</code> 和 <code class="varname">ouptut</code></a>
</dt>
<dt>8.11. <a href="language.function.html.options.tpl#id459845">数据库例子(如 ADODB 或 PEAR)</a>
</dt>
<dt>8.12. <a href="language.function.html.options.tpl#id459889">&lt;optgroup&gt; 下拉组</a>
</dt>
<dt>8.13. <a href="language.function.html.radios.tpl#id460842">{html_radios}第一个例子</a>
</dt>
<dt>8.14. <a href="language.function.html.radios.tpl#id460875">{html_radios}第二个例子</a>
</dt>
<dt>8.15. <a href="language.function.html.radios.tpl#id460914">{html_radios} 数据库例子(如 PEAR 或 ADODB):</a>
</dt>
<dt>8.16. <a href="language.function.html.select.date.tpl#id462334">{html_select_date}</a>
</dt>
<dt>8.17. <a href="language.function.html.select.date.tpl#id462359">{html_select_date} 第二个地理</a>
</dt>
<dt>8.18. <a href="language.function.html.select.time.tpl#id464329">{html_select_time}</a>
</dt>
<dt>8.19. <a href="language.function.html.table.tpl#id465903">{html_table}</a>
</dt>
<dt>8.20. <a href="language.function.mailto.tpl#id466846">{mailto}例子和其输出的结果</a>
</dt>
<dt>8.21. <a href="language.function.math.tpl#id467596">{math}</a>
</dt>
<dt>8.22. <a href="language.function.textformat.tpl#id468412">{textformat}</a>
</dt>
<dt>9.1. <a href="config.files.tpl#id475377">配置文件语法示例</a>
</dt>
<dt>11.1. <a href="charset.tpl#id476564">设置字符集编码</a>
</dt>
<dt>12.1. <a href="smarty.constants.tpl#id476385">SMARTY_DIR</a>
</dt>
<dt>13.1. <a href="variable.compile.id.tpl#id479632">虚拟主机环境的$compile_id</a>
</dt>
<dt>13.2. <a href="variable.config.overwrite.tpl#id479929">#变量#数组</a>
</dt>
<dt>13.3. <a href="variable.debugging.ctrl.tpl#id480965">在localhost上的$debugging_ctrl</a>
</dt>
<dt>13.4. <a href="variable.default.config.handler.func.tpl#id481327">$default_config_handler_func</a>
</dt>
<dt>13.5. <a href="variable.default.template.handler.func.tpl#id481367">$default_template_handler_func</a>
</dt>
<dt>14.1. <a href="api.add.config.dir.tpl#id488057">addConfigDir()</a>
</dt>
<dt>14.2. <a href="api.add.plugins.dir.tpl#id488287">addPluginsDir()</a>
</dt>
<dt>14.3. <a href="api.add.template.dir.tpl#id488512">addTemplateDir()</a>
</dt>
<dt>14.4. <a href="api.append.tpl#id488815">append()</a>
</dt>
<dt>14.5. <a href="api.append.by.ref.tpl#id489206">appendByRef()</a>
</dt>
<dt>14.6. <a href="api.assign.tpl#id489577">assign()</a>
</dt>
<dt>14.7. <a href="api.assign.by.ref.tpl#id490007">assignByRef()</a>
</dt>
<dt>14.8. <a href="api.clear.all.assign.tpl#id489850">clearAllAssign()</a>
</dt>
<dt>14.9. <a href="api.clear.all.cache.tpl#id490501">clearAllCache</a>
</dt>
<dt>14.10. <a href="api.clear.assign.tpl#id490707">clearAssign()</a>
</dt>
<dt>14.11. <a href="api.clear.cache.tpl#id491039">clearCache()</a>
</dt>
<dt>14.12. <a href="api.clear.compiled.tpl.tpl#id491382">clearCompiledTemplate()</a>
</dt>
<dt>14.13. <a href="api.clear.config.tpl#id491174">clearConfig()</a>
</dt>
<dt>14.14. <a href="api.compile.all.config.tpl#id491999">compileAllConfig()</a>
</dt>
<dt>14.15. <a href="api.compile.all.templates.tpl#id492404">compileAllTemplates()</a>
</dt>
<dt>14.16. <a href="api.config.load.tpl#id492774">configLoad()</a>
</dt>
<dt>14.17. <a href="api.create.data.tpl#id493114">createData()</a>
</dt>
<dt>14.18. <a href="api.create.template.tpl#id493644">createTemplate()</a>
</dt>
<dt>14.19. <a href="api.display.tpl#id494366">display()</a>
</dt>
<dt>14.20. <a href="api.display.tpl#id494392">其他 display() 的示例</a>
</dt>
<dt>14.21. <a href="api.fetch.tpl#id495131">fetch()</a>
</dt>
<dt>14.22. <a href="api.fetch.tpl#id495154">用fetch()来发邮件</a>
</dt>
<dt>14.23. <a href="api.get.cache.dir.tpl#id495018">getCacheDir()</a>
</dt>
<dt>14.24. <a href="api.get.compile.dir.tpl#id495319">getCompileDir()</a>
</dt>
<dt>14.25. <a href="api.get.config.dir.tpl#id495478">getConfigDir()</a>
</dt>
<dt>14.26. <a href="api.get.config.vars.tpl#id496097">getConfigVars()</a>
</dt>
<dt>14.27. <a href="api.get.plugins.dir.tpl#id496314">getPluginsDir()</a>
</dt>
<dt>14.28. <a href="api.get.registered.object.tpl#id496528">getRegisteredObject()</a>
</dt>
<dt>14.29. <a href="api.get.tags.tpl#id496774">getTags()</a>
</dt>
<dt>14.30. <a href="api.get.template.dir.tpl#id496954">getTemplateDir()</a>
</dt>
<dt>14.31. <a href="api.get.template.vars.tpl#id497175">getTemplateVars</a>
</dt>
<dt>14.32. <a href="api.is.cached.tpl#id497644">isCached()</a>
</dt>
<dt>14.33. <a href="api.is.cached.tpl#id497662">isCached()用于多缓存的模板</a>
</dt>
<dt>14.34. <a href="api.load.filter.tpl#id498121">载入过滤插件</a>
</dt>
<dt>14.35. <a href="api.register.cacheresource.tpl#id498599">registerCacheResource()</a>
</dt>
<dt>14.36. <a href="api.register.class.tpl#id498862">注册类</a>
</dt>
<dt>14.37. <a href="api.register.class.tpl#id498885">注册带命名空间的类</a>
</dt>
<dt>14.38. <a href="api.register.default.plugin.handler.tpl#id499150">默认插件处理器例子</a>
</dt>
<dt>14.39. <a href="api.register.plugin.tpl#id500359">注册函数</a>
</dt>
<dt>14.40. <a href="api.register.plugin.tpl#id500389">注册块函数</a>
</dt>
<dt>14.41. <a href="api.register.plugin.tpl#id500418">注册修饰器</a>
</dt>
<dt>14.42. <a href="api.register.resource.tpl#id501294">registerResource()</a>
</dt>
<dt>14.43. <a href="api.set.cache.dir.tpl#id501118">setCacheDir()</a>
</dt>
<dt>14.44. <a href="api.set.compile.dir.tpl#id501368">setCompileDir()</a>
</dt>
<dt>14.45. <a href="api.set.config.dir.tpl#id501486">setConfigDir()</a>
</dt>
<dt>14.46. <a href="api.set.plugins.dir.tpl#id502140">setPluginsDir()</a>
</dt>
<dt>14.47. <a href="api.set.template.dir.tpl#id502353">setTemplateDir()</a>
</dt>
<dt>14.48. <a href="api.template.exists.tpl#id502571">templateExists()</a>
</dt>
<dt>14.49. <a href="api.unregister.cacheresource.tpl#id502880">unregisterCacheResource()</a>
</dt>
<dt>14.50. <a href="api.unregister.plugin.tpl#id503488">注销函数</a>
</dt>
<dt>14.51. <a href="api.unregister.resource.tpl#id503543">unregisterResource()</a>
</dt>
<dt>14.52. <a href="api.test.install.tpl#id503668">testInstall()</a>
</dt>
<dt>15.1. <a href="caching.tpl#id512281">开启缓存</a>
</dt>
<dt>15.2. <a href="caching.tpl#id512396">为每个缓存设置$cache_lifetime</a>
</dt>
<dt>15.3. <a href="caching.tpl#id512451">关闭 $compile_check</a>
</dt>
<dt>15.4. <a href="caching.tpl#id512529">使用 isCached()</a>
</dt>
<dt>15.5. <a href="caching.tpl#id512626">删除缓存</a>
</dt>
<dt>15.6. <a href="caching.multiple.caches.tpl#id513080">display()的参数作为$cache_id</a>
</dt>
<dt>15.7. <a href="caching.multiple.caches.tpl#id513200">给 isCached() 传递一个 cache_id </a>
</dt>
<dt>15.8. <a href="caching.multiple.caches.tpl#id513239">删除特定$cache_id的缓存</a>
</dt>
<dt>15.9. <a href="caching.groups.tpl#id513683">$cache_id 组</a>
</dt>
<dt>15.10. <a href="caching.cacheable.tpl#id513538">使模板的一块区域不进行缓存</a>
</dt>
<dt>15.11. <a href="caching.cacheable.tpl#id514010">让标签内容不进行缓存</a>
</dt>
<dt>15.12. <a href="caching.cacheable.tpl#id514070">控制变量不缓存</a>
</dt>
<dt>15.13. <a href="caching.cacheable.tpl#id514176">控制插件的缓存</a>
</dt>
<dt>15.14. <a href="caching.cacheable.tpl#id514226">使模板内一部分区域不缓存</a>
</dt>
<dt>15.15. <a href="caching.custom.tpl#id514837">通过MySQL实现自定义缓存机制</a>
</dt>
<dt>15.16. <a href="caching.custom.tpl#id514851">通过Memcache实现自定义缓存机制</a>
</dt>
<dt>16.1. <a href="resources.tpl#id516850">使用$template_dir</a>
</dt>
<dt>16.2. <a href="resources.tpl#id516912">特定的$template_dir</a>
</dt>
<dt>16.3. <a href="resources.tpl#id517020">任意目录的模板</a>
</dt>
<dt>16.4. <a href="resources.tpl#id517069">使用windows的文件路径</a>
</dt>
<dt>16.5. <a href="resources.string.tpl#id517538">使用字符串资源</a>
</dt>
<dt>16.6. <a href="resources.string.tpl#id517608">使用编码后的字符串资源</a>
</dt>
<dt>16.7. <a href="resources.streams.tpl#id517309">PHP数据流</a>
</dt>
<dt>16.8. <a href="resources.streams.tpl#id517357">模板中使用</a>
</dt>
<dt>16.9. <a href="resources.extends.tpl#id518073">使用模板继承</a>
</dt>
<dt>16.10. <a href="resources.custom.tpl#id517841">U使用自定义资源</a>
</dt>
<dt>17.1. <a href="advanced.features.tpl#id519802">扩展Smarty_Security 类来设置安全策略</a>
</dt>
<dt>17.2. <a href="advanced.features.tpl#id519817">通过Smarty_Security类的实例来自定义安全策略</a>
</dt>
<dt>17.3. <a href="advanced.features.tpl#id519838">开启默认的安全设置</a>
</dt>
<dt>17.4. <a href="advanced.features.template.settings.tpl#id520420">创建模板对象并修改Smarty的设置</a>
</dt>
<dt>17.5. <a href="advanced.features.template.settings.tpl#id520441">创建模板对象并注册插件</a>
</dt>
<dt>17.6. <a href="advanced.features.template.inheritance.tpl#id520754">模板继承例子</a>
</dt>
<dt>17.7. <a href="advanced.features.template.inheritance.tpl#id520820">用<code class="literal">extends:</code>来进行模板继承</a>
</dt>
<dt>17.8. <a href="advanced.features.streams.tpl#id520959">数据流变量</a>
</dt>
<dt>17.9. <a href="advanced.features.objects.tpl#id521540">注册或赋值一个对象</a>
</dt>
<dt>17.10. <a href="advanced.features.static.classes.tpl#id521375">静态类存取语法</a>
</dt>
<dt>17.11. <a href="advanced.features.prefilters.tpl#id521999">使用前置过滤器</a>
</dt>
<dt>17.12. <a href="advanced.features.postfilters.tpl#id522223">使用后置过滤器</a>
</dt>
<dt>17.13. <a href="advanced.features.outputfilters.tpl#id522505">使用输出过滤器</a>
</dt>
<dt>18.1. <a href="plugins.functions.tpl#id525249">带输出的函数插件</a>
</dt>
<dt>18.2. <a href="plugins.functions.tpl#id525287">不带输出的函数插件</a>
</dt>
<dt>18.3. <a href="plugins.modifiers.tpl#id525599">一个简单的修饰器</a>
</dt>
<dt>18.4. <a href="plugins.modifiers.tpl#id525627">更复杂的修饰器</a>
</dt>
<dt>18.5. <a href="plugins.block.functions.tpl#id526030">块函数</a>
</dt>
<dt>18.6. <a href="plugins.compiler.functions.tpl#id526390">一个简单的编译函数</a>
</dt>
<dt>18.7. <a href="plugins.prefilters.postfilters.tpl#id526692">前置过滤器</a>
</dt>
<dt>18.8. <a href="plugins.prefilters.postfilters.tpl#id526708">后置过滤器</a>
</dt>
<dt>18.9. <a href="plugins.outputfilters.tpl#id526991">输出过滤器</a>
</dt>
<dt>18.10. <a href="plugins.resources.tpl#id527253">资源插件</a>
</dt>
<dt>18.11. <a href="plugins.inserts.tpl#id527594">插入插件</a>
</dt>
<dt>19.1. <a href="bc.tpl#id528790">使用SmartyBC</a>
</dt>
<dt>20.1. <a href="troubleshooting.tpl#id528840">Smarty 错误</a>
</dt>
<dt>20.2. <a href="troubleshooting.tpl#id529004">PHP 错误提示</a>
</dt>
<dt>20.3. <a href="troubleshooting.tpl#id529295">其他的常见错误</a>
</dt>
<dt>21.1. <a href="tips.tpl#id530100">当变量为空时显示 &amp;nbsp; </a>
</dt>
<dt>21.2. <a href="tips.default.var.handling.tpl#id530167">给变量赋默认值</a>
</dt>
<dt>21.3. <a href="tips.passing.vars.tpl#id530234">传递标题到头部模板</a>
</dt>
<dt>21.4. <a href="tips.dates.tpl#id530377">使用 date_format</a>
</dt>
<dt>21.5. <a href="tips.dates.tpl#id530441">转换元件的日期为时间戳</a>
</dt>
<dt>21.6. <a href="tips.wap.tpl#id530548">使用 {insert} 来插入一个WML类型的文件头</a>
</dt>
<dt>21.7. <a href="tips.componentized.templates.tpl#id530702">组件化模板</a>
</dt>
<dt>21.8. <a href="tips.obfuscating.email.tpl#id530816">混淆电邮地址的例子</a>
</dt>
</dl>
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left"> </td>
<td width="20%" align="center"> </td>
<td width="40%" align="right"> <a accesskey="n" href="preface.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top"> </td>
<td width="20%" align="center"> </td>
<td width="40%" align="right" valign="top"> 序言</td>
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
              
              <div id="commentFormChallenge">What is 12 plus 4? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="52c0bbb11d7e83a80b9b9d20682a7f8b">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/index.tpl">
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
    <p>This page generated in 0.03032 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
