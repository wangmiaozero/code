<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{section},{sectionelse} | Smarty</title>
    <meta name="description" content="{section},{sectionelse}">
    <meta name="keywords" content=", ldelim, section, rdelim, ldelim, sectionelse, rdelim, ">
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
<tr><th colspan="3" align="center">{section},{sectionelse}</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="language.function.php.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 7. 内置函数</th>
<td width="20%" align="right"> <a accesskey="n" href="language.function.setfilter.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="{section},{sectionelse}">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="language.function.section"></a>{section},{sectionelse}</h2></div></div></div>
<p>
  <code class="varname">{section}</code>可以循环遍历
  <span class="bold"><strong>连续数字索引的数组</strong></span>,
  区别于<a class="link" href="language.function.foreach.tpl" title="{foreach},{foreachelse}"><code class="varname">{foreach}</code></a>
  可以循环<span class="bold"><strong>任意关联数组</strong></span>.
  每个<code class="varname">{section}</code>标签都必须有一个匹配的<code class="varname">{/section}</code>关闭标签。
   </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
   <a class="link" href="language.function.foreach.tpl" title="{foreach},{foreachelse}"><code class="varname">{foreach}</code></a>
   可以做到任何{section}做到的功能, 而且更简单和有更清晰的语法。一般更推荐使用{foreach}语法.
 </p>
</div>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
   {section}不能用于循环关联数组，它仅能循环数字索引的、连续下标的 (0,1,2,...)数组。
   要循环关联数组，请使用<a class="link" href="language.function.foreach.tpl" title="{foreach},{foreachelse}"><code class="varname">{foreach}</code></a>。
 </p>
</div>
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
<td align="center">name</td>
<td align="center">string</td>
<td align="center">Yes</td>
<td align="center"><span class="emphasis"><em>n/a</em></span></td>
<td>section的名称</td>
</tr>
<tr>
<td align="center">loop</td>
<td align="center">mixed</td>
<td align="center">Yes</td>
<td align="center"><span class="emphasis"><em>n/a</em></span></td>
<td>用于循环的值</td>
</tr>
<tr>
<td align="center">start</td>
<td align="center">integer</td>
<td align="center">No</td>
<td align="center"><span class="emphasis"><em>0</em></span></td>
<td>
	 设置开始循环的下标。如果设置成负值，则会从数组的结束位置开始。
	 比如说，如果数组中有7个元素，设置该值为-2，则循环将从下标5开始。
	 设置了不正确的值（比如说在数组长度以外的值）那么会自动计算为最接近的值。
	  </td>
</tr>
<tr>
<td align="center">step</td>
<td align="center">integer</td>
<td align="center">No</td>
<td align="center"><span class="emphasis"><em>1</em></span></td>
<td>循环的步长值。比如，step=2将循环下标0,2,4,等。
	 如果step值设置成负数，那么将从最后开始计算步长。</td>
</tr>
<tr>
<td align="center">max</td>
<td align="center">integer</td>
<td align="center">No</td>
<td align="center"><span class="emphasis"><em>n/a</em></span></td>
<td>设置最大的循环次数。</td>
</tr>
<tr>
<td align="center">show</td>
<td align="center">boolean</td>
<td align="center">No</td>
<td align="center"><span class="emphasis"><em><code class="constant">TRUE</code></em></span></td>
<td>是否显示循环内容</td>
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
<td>关闭<code class="varname">{section}</code>缓存</td>
</tr></tbody>
</table></div>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem"><p>
   <em class="parameter"><code>name</code></em> 和 <em class="parameter"><code>loop</code></em>是必须的参数。
   </p></li>
<li class="listitem"><p>
   <code class="varname">{section}</code>的<em class="parameter"><code>name</code></em>可以是任意字符，如数字、字母或下划线等，和
   <a class="ulink" href="../../../www.php.net/language.variables" target="_top">PHP 变量</a>一样的命名规则。
    </p></li>
<li class="listitem"><p>
    {section}可以嵌套，而且嵌套的<code class="varname">{section}</code>名称必须唯一。
   </p></li>
<li class="listitem"><p>
   <em class="parameter"><code>loop</code></em>一般是数组，决定了<code class="varname">{section}</code>的循环次数。
   同时你也可以传递一个整数指定循环次数。
   </p></li>
<li class="listitem"><p>当在<code class="varname">{section}</code>内显示变量时, 
   <code class="varname">{section}</code> 的<em class="parameter"><code>name</code></em>必须给变量名称加上[方括号].
   </p></li>
<li class="listitem"><p>
   如果loop属性为空，<code class="varname">{sectionelse}</code>将执行。
 	</p></li>
<li class="listitem"><p>
  <code class="varname">{section}</code>同时还有自己的属性。
  这些属性都是通过: <a class="link" href="language.variables.smarty.tpl#language.variables.smarty.loops" title="{$smarty.section}">
  <em class="parameter"><code>{$smarty.section.name.property}</code></em></a>来使用，其中<span class="quote">“<span class="quote">name</span>”</span>是<em class="parameter"><code>name</code></em>属性.
  </p></li>
<li class="listitem"><p>
  <code class="varname">{section}</code>的内置属性有：
  <a class="link" href="language.function.section.tpl#section.property.index" title=".index"><em class="parameter"><code>index</code></em></a>,
  <a class="link" href="language.function.section.tpl#section.property.index.prev" title=".index_prev"><em class="parameter"><code>index_prev</code></em></a>,
  <a class="link" href="language.function.section.tpl#section.property.index.next" title=".index_next"><em class="parameter"><code>index_next</code></em></a>,
  <a class="link" href="language.function.section.tpl#section.property.iteration" title=".iteration"><em class="parameter"><code>iteration</code></em></a>,
  <a class="link" href="language.function.section.tpl#section.property.first" title=".first"><em class="parameter"><code>first</code></em></a>,
  <a class="link" href="language.function.section.tpl#section.property.last" title=".last"><em class="parameter"><code>last</code></em></a>,
  <a class="link" href="language.function.section.tpl#section.property.rownum" title=".rownum"><em class="parameter"><code>rownum</code></em></a>,
  <a class="link" href="language.function.section.tpl#section.property.loop" title=".loop"><em class="parameter"><code>loop</code></em></a>,
  <a class="link" href="language.function.section.tpl#section.property.show" title=".show"><em class="parameter"><code>show</code></em></a>,
  <a class="link" href="language.function.section.tpl#section.property.total" title=".total"><em class="parameter"><code>total</code></em></a>.
  </p></li>
</ul></div>
<div class="example">
<a name="id441406"></a><p class="title"><b>Example 7.63. 简单的{section}例子</b></p>
<div class="example-contents">
<p>
<a class="link" href="api.assign.tpl" title="assign()"><code class="varname">assign()</code></a>赋值一个数组
</p>
<pre class="programlisting">

&lt;?php
$data = array(1000,1001,1002);
$smarty-&gt;assign('custid',$data);
?&gt;

</pre>
<p>模板将输出该数组</p>
<pre class="programlisting">

{* this example will print out all the values of the $custid array *}
{section name=customer loop=$custid}
{section customer $custid} {* short-hand *}
  id: {$custid[customer]}&lt;br /&gt;
{/section}
&lt;hr /&gt;
{*  print out all the values of the $custid array reversed *}
{section name=foo loop=$custid step=-1}
{section foo $custid step=-1} {* short-hand *}
  {$custid[foo]}&lt;br /&gt;
{/section}

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

id: 1000&lt;br /&gt;
id: 1001&lt;br /&gt;
id: 1002&lt;br /&gt;
&lt;hr /&gt;
id: 1002&lt;br /&gt;
id: 1001&lt;br /&gt;
id: 1000&lt;br /&gt;

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id441460"></a><p class="title"><b>Example 7.64. {section}不使用赋值数组</b></p>
<div class="example-contents">
<pre class="programlisting">

{section name=foo start=10 loop=20 step=2}
  {$smarty.section.foo.index}
{/section}
&lt;hr /&gt;
{section name=bar loop=21 max=6 step=-2}
  {$smarty.section.bar.index}
{/section}

</pre>
<p>
  输出：
</p>
<pre class="screen">
  
10 12 14 16 18
&lt;hr /&gt;
20 18 16 14 12 10

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id441486"></a><p class="title"><b>Example 7.65. 给{section}设置名称</b></p>
<div class="example-contents">
<p><code class="varname">{section}</code>的 <em class="parameter"><code>name</code></em>属性可以是任意字符，请参见<a class="ulink" href="../../../www.php.net/language.variables" target="_top">PHP 变量</a>定义.
  它是用于引用<code class="varname">{section}</code>的数据.</p>
<pre class="programlisting">

{section name=anything loop=$myArray}
  {$myArray[anything].foo}
  {$name[anything]}
  {$address[anything].bar}
{/section}

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id441522"></a><p class="title"><b>Example 7.66. {section}中使用关联数组</b></p>
<div class="example-contents">
<p>下面是使用<code class="varname">{section}</code>来输出关联数组的例子。
  这里是在PHP代码中赋值<em class="parameter"><code>$contacts</code></em> 数组到Smarty。</p>
<pre class="programlisting">
  
&lt;?php
$data = array(
          array('name' =&gt; 'John Smith', 'home' =&gt; '555-555-5555',
                'cell' =&gt; '666-555-5555', 'email' =&gt; 'john@myexample.com'),
          array('name' =&gt; 'Jack Jones', 'home' =&gt; '777-555-5555',
                'cell' =&gt; '888-555-5555', 'email' =&gt; 'jack@myexample.com'),
          array('name' =&gt; 'Jane Munson', 'home' =&gt; '000-555-5555',
                'cell' =&gt; '123456', 'email' =&gt; 'jane@myexample.com')
        );
$smarty-&gt;assign('contacts',$data);
?&gt;

  </pre>
<p>该模板用于显示<em class="parameter"><code>$contacts</code></em></p>
<pre class="programlisting">

{section name=customer loop=$contacts}
&lt;p&gt;
  name: {$contacts[customer].name}&lt;br /&gt;
  home: {$contacts[customer].home}&lt;br /&gt;
  cell: {$contacts[customer].cell}&lt;br /&gt;
  e-mail: {$contacts[customer].email}
&lt;/p&gt;
{/section}

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

&lt;p&gt;
  name: John Smith&lt;br /&gt;
  home: 555-555-5555&lt;br /&gt;
  cell: 666-555-5555&lt;br /&gt;
  e-mail: john@myexample.com
&lt;/p&gt;
&lt;p&gt;
  name: Jack Jones&lt;br /&gt;
  home phone: 777-555-5555&lt;br /&gt;
  cell phone: 888-555-5555&lt;br /&gt;
  e-mail: jack@myexample.com
&lt;/p&gt;
&lt;p&gt;
  name: Jane Munson&lt;br /&gt;
  home phone: 000-555-5555&lt;br /&gt;
  cell phone: 123456&lt;br /&gt;
  e-mail: jane@myexample.com
&lt;/p&gt;

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id441585"></a><p class="title"><b>Example 7.67. {section}的<code class="varname">loop</code>属性的演示例子</b></p>
<div class="example-contents">
<p>例子假定<em class="parameter"><code>$custid</code></em>, <em class="parameter"><code>$name</code></em>
  和 <em class="parameter"><code>$address</code></em>三个数组中对应的值都有着相同的数字下标。
  首先从PHP代码中赋值到Smarty</p>
<pre class="programlisting">

&lt;?php

$id = array(1001,1002,1003);
$smarty-&gt;assign('custid',$id);

$fullnames = array('John Smith','Jack Jones','Jane Munson');
$smarty-&gt;assign('name',$fullnames);

$addr = array('253 Abbey road', '417 Mulberry ln', '5605 apple st');
$smarty-&gt;assign('address',$addr);

?&gt;

</pre>
<p>
  <em class="parameter"><code>loop</code></em>值仅是指定循环的次数。
  你可以在<code class="varname">{section}</code>中给它设置任何的变量。
  在多个数组循环时比较有用。
  你可以传递一个数组来让其计算总数而指定循环次数，也可以直接指定一个循环次数的整数。
  </p>
<pre class="programlisting">

{section name=customer loop=$custid}
&lt;p&gt;
  id: {$custid[customer]}&lt;br /&gt;
  name: {$name[customer]}&lt;br /&gt;
  address: {$address[customer]}
&lt;/p&gt;
{/section}

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

&lt;p&gt;
  id: 1000&lt;br /&gt;
  name: John Smith&lt;br /&gt;
  address: 253 Abbey road
&lt;/p&gt;
&lt;p&gt;
  id: 1001&lt;br /&gt;
  name: Jack Jones&lt;br /&gt;
  address: 417 Mulberry ln
&lt;/p&gt;
&lt;p&gt;
  id: 1002&lt;br /&gt;
  name: Jane Munson&lt;br /&gt;
  address: 5605 apple st
&lt;/p&gt;

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id441668"></a><p class="title"><b>Example 7.68. {section}嵌套</b></p>
<div class="example-contents">
<p>
  {section}可以嵌套任意的深度。通过嵌套{section}你可以处理多维数组。
  下面是例子的<code class="filename">.php</code>文件。
  </p>
<pre class="programlisting">

&lt;?php

$id = array(1001,1002,1003);
$smarty-&gt;assign('custid',$id);

$fullnames = array('John Smith','Jack Jones','Jane Munson');
$smarty-&gt;assign('name',$fullnames);

$addr = array('253 N 45th', '417 Mulberry ln', '5605 apple st');
$smarty-&gt;assign('address',$addr);

$types = array(
           array( 'home phone', 'cell phone', 'e-mail'),
           array( 'home phone', 'web'),
           array( 'cell phone')
         );
$smarty-&gt;assign('contact_type', $types);

$info = array(
           array('555-555-5555', '666-555-5555', 'john@myexample.com'),
           array( '123-456-4', 'www.example.com'),
           array( '0457878')
        );
$smarty-&gt;assign('contact_info', $info);

?&gt;
  
</pre>
<p>在这个模板里， <span class="emphasis"><em>$contact_type[customer]</em></span>是客户联系信息的数组</p>
<pre class="programlisting">

{section name=customer loop=$custid}
&lt;hr&gt;
  id: {$custid[customer]}&lt;br /&gt;
  name: {$name[customer]}&lt;br /&gt;
  address: {$address[customer]}&lt;br /&gt;
  {section name=contact loop=$contact_type[customer]}
    {$contact_type[customer][contact]}: {$contact_info[customer][contact]}&lt;br /&gt;
  {/section}
{/section}

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

&lt;hr&gt;
  id: 1000&lt;br /&gt;
  name: John Smith&lt;br /&gt;
  address: 253 N 45th&lt;br /&gt;
    home phone: 555-555-5555&lt;br /&gt;
    cell phone: 666-555-5555&lt;br /&gt;
    e-mail: john@myexample.com&lt;br /&gt;
&lt;hr&gt;
  id: 1001&lt;br /&gt;
  name: Jack Jones&lt;br /&gt;
  address: 417 Mulberry ln&lt;br /&gt;
    home phone: 123-456-4&lt;br /&gt;
    web: www.example.com&lt;br /&gt;
&lt;hr&gt;
  id: 1002&lt;br /&gt;
  name: Jane Munson&lt;br /&gt;
  address: 5605 apple st&lt;br /&gt;
    cell phone: 0457878&lt;br /&gt;

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id441736"></a><p class="title"><b>Example 7.69. {sectionelse}的数据库例子</b></p>
<div class="example-contents">
<p>数据库查找的结果(如 ADODB 或 PEAR) 传递到 Smarty</p>
<pre class="programlisting">
  
&lt;?php
$sql = 'select id, name, home, cell, email from contacts '
      ."where name like '$foo%' ";
$smarty-&gt;assign('contacts', $db-&gt;getAll($sql));
?&gt;

</pre>
<p>模板将以表格形式显示数据结果</p>
<pre class="programlisting">

&lt;table&gt;
&lt;tr&gt;&lt;th&gt;&amp;nbsp;&lt;/th&gt;&lt;th&gt;Name&gt;&lt;/th&gt;&lt;th&gt;Home&lt;/th&gt;&lt;th&gt;Cell&lt;/th&gt;&lt;th&gt;Email&lt;/th&gt;&lt;/tr&gt;
{section name=co loop=$contacts}
  &lt;tr&gt;
    &lt;td&gt;&lt;a href="view.php?id={$contacts[co].id}"&gt;view&lt;a&gt;&lt;/td&gt;
    &lt;td&gt;{$contacts[co].name}&lt;/td&gt;
    &lt;td&gt;{$contacts[co].home}&lt;/td&gt;
    &lt;td&gt;{$contacts[co].cell}&lt;/td&gt;
    &lt;td&gt;{$contacts[co].email}&lt;/td&gt;
  &lt;tr&gt;
{sectionelse}
  &lt;tr&gt;&lt;td colspan="5"&gt;No items found&lt;/td&gt;&lt;/tr&gt;
{/section}
&lt;/table&gt;

</pre>
</div>
</div>
<br class="example-break"><div class="sect2" title=".index">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.index"></a>.index</h3></div></div></div>
<p>
   <em class="parameter"><code>index</code></em>是当前数组的索引值，从0开始，或者从设定的<em class="parameter"><code>start</code></em>值开始。它将每次循环增加1或者增加指定的<em class="parameter"><code>step</code></em>值。
  </p>
<div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p>
    如果 <em class="parameter"><code>step</code></em> 和 <em class="parameter"><code>start</code></em>都没有被指定，
	那么它会和<a class="link" href="language.function.section.tpl#section.property.iteration" title=".iteration"><em class="parameter"><code>iteration</code></em></a>属性很像, 只不过它是从0开始，而iteration是从1开始.
   </p>
</div>
<div class="example">
<a name="id441845"></a><p class="title"><b>Example 7.70. {section} <code class="varname">index</code> 属性</b></p>
<div class="example-contents">
<p>
</p>
<div class="note" title="说明" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">说明</h3>
<p><code class="literal">$custid[customer.index]</code> 和
<code class="literal">$custid[customer]</code> 是一样的.</p>
</div>
<p>
</p>
<pre class="programlisting">

{section name=customer loop=$custid}
  {$smarty.section.customer.index} id: {$custid[customer]}&lt;br /&gt;
{/section}

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

0 id: 1000&lt;br /&gt;
1 id: 1001&lt;br /&gt;
2 id: 1002&lt;br /&gt;

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title=".index_prev">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.index.prev"></a>.index_prev</h3></div></div></div>
<p>
   <em class="parameter"><code>index_prev</code></em>上一次循环的索引值。
	在第一次循环的时候，它是-1.
  </p>
</div>
<div class="sect2" title=".index_next">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.index.next"></a>.index_next</h3></div></div></div>
<p>
   <em class="parameter"><code>index_next</code></em>是下一次循环的索引值。
   在最后一次循环时，它会比当前索引加1，或者加上指定的<em class="parameter"><code>step</code></em>属性值。
  </p>
<div class="example">
<a name="id441942"></a><p class="title"><b>Example 7.71. <code class="varname">index</code>, <code class="varname">index_next</code>
 和 <code class="varname">index_prev</code> 属性 </b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
$data = array(1001,1002,1003,1004,1005);
$smarty-&gt;assign('rows',$data);
?&gt;

</pre>
<p>在表格中显示数组</p>
<pre class="programlisting">

{* $rows[row.index] and $rows[row] are identical in meaning *}
&lt;table&gt;
  &lt;tr&gt;
    &lt;th&gt;index&lt;/th&gt;&lt;th&gt;id&lt;/th&gt;
    &lt;th&gt;index_prev&lt;/th&gt;&lt;th&gt;prev_id&lt;/th&gt;
    &lt;th&gt;index_next&lt;/th&gt;&lt;th&gt;next_id&lt;/th&gt;
  &lt;/tr&gt;
{section name=row loop=$rows}
  &lt;tr&gt;
    &lt;td&gt;{$smarty.section.row.index}&lt;/td&gt;&lt;td&gt;{$rows[row]}&lt;/td&gt;
    &lt;td&gt;{$smarty.section.row.index_prev}&lt;/td&gt;&lt;td&gt;{$rows[row.index_prev]}&lt;/td&gt;
    &lt;td&gt;{$smarty.section.row.index_next}&lt;/td&gt;&lt;td&gt;{$rows[row.index_next]}&lt;/td&gt;
  &lt;/tr&gt;
{/section}
&lt;/table&gt;

  </pre>
<p>
 输出：
  </p>
<pre class="screen">

index  id    index_prev prev_id index_next next_id
0      1001  -1	                1          1002
1      1002  0          1001    2          1003
2      1003  1          1002    3          1004
3      1004  2          1003    4          1005
4      1005  3          1004    5

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title=".iteration">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.iteration"></a>.iteration</h3></div></div></div>
<p>
   <em class="parameter"><code>iteration</code></em>是当前的循环次数，从1开始。
  </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
    它和<a class="link" href="language.function.section.tpl#section.property.index" title=".index"><em class="parameter"><code>index</code></em></a>不同，不会受到<code class="varname">{section}</code> 的属性
    <em class="parameter"><code>start</code></em>, <em class="parameter"><code>step</code></em> 和 <em class="parameter"><code>max</code></em>等影响. 
	而且和<em class="parameter"><code>index</code></em>不同的是，<em class="parameter"><code>iteration</code></em>还是从1开始计算的。 <a class="link" href="language.function.section.tpl#section.property.rownum" title=".rownum"><em class="parameter"><code>rownum</code></em></a>是
    <em class="parameter"><code>iteration</code></em>的别名,它们是一样的。
   </p>
</div>
<div class="example">
<a name="id442085"></a><p class="title"><b>Example 7.72. <code class="varname">iteration</code>属性 </b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
// array of 3000 to 3015
$id = range(3000,3015);
$smarty-&gt;assign('arr',$id);
?&gt;

</pre>
<p>模板将按<code class="literal">step=2</code>来显示<code class="literal">$arr</code>的数组元素</p>
<pre class="programlisting">

{section name=cu loop=$arr start=5 step=2}
  iteration={$smarty.section.cu.iteration}
  index={$smarty.section.cu.index}
  id={$custid[cu]}&lt;br /&gt;
{/section}

  </pre>
<p>
  输出：
  </p>
<pre class="screen">

iteration=1 index=5 id=3005&lt;br /&gt;
iteration=2 index=7 id=3007&lt;br /&gt;
iteration=3 index=9 id=3009&lt;br /&gt;
iteration=4 index=11 id=3011&lt;br /&gt;
iteration=5 index=13 id=3013&lt;br /&gt;
iteration=6 index=15 id=3015&lt;br /&gt;

   </pre>
<p>
  这里是另一个例子，使用<em class="parameter"><code>iteration</code></em>属性来显示表格，
  并且每五行显示一次表头。
  </p>
<pre class="programlisting">

&lt;table&gt;
{section name=co loop=$contacts}
  {if $smarty.section.co.iteration is div by 5}
    &lt;tr&gt;&lt;th&gt;&amp;nbsp;&lt;/th&gt;&lt;th&gt;Name&gt;&lt;/th&gt;&lt;th&gt;Home&lt;/th&gt;&lt;th&gt;Cell&lt;/th&gt;&lt;th&gt;Email&lt;/th&gt;&lt;/tr&gt;
  {/if}
  &lt;tr&gt;
    &lt;td&gt;&lt;a href="view.php?id={$contacts[co].id}"&gt;view&lt;a&gt;&lt;/td&gt;
    &lt;td&gt;{$contacts[co].name}&lt;/td&gt;
    &lt;td&gt;{$contacts[co].home}&lt;/td&gt;
    &lt;td&gt;{$contacts[co].cell}&lt;/td&gt;
    &lt;td&gt;{$contacts[co].email}&lt;/td&gt;
  &lt;tr&gt;
{/section}
&lt;/table&gt;

  </pre>
<p>
     一个用<em class="parameter"><code>iteration</code></em>属性来交替显示文章每三行颜色的例子
    </p>
<pre class="programlisting">
  
  &lt;table&gt;
  {section name=co loop=$contacts}
    {if $smarty.section.co.iteration is even by 3}
      &lt;span style="color: #ffffff"&gt;{$contacts[co].name}&lt;/span&gt;
    {else}
      &lt;span style="color: #dddddd"&gt;{$contacts[co].name}&lt;/span&gt;
    {/if}
  {/section}
  &lt;/table&gt;
  
    </pre>
</div>
</div>
<br class="example-break"><div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
  <span class="emphasis"><em>"is div by"</em></span>语法是PHP取模运算的一个变种。取模运算<code class="literal">{if $smarty.section.co.iteration % 5 == 1}</code>也是可用的。
</p>
</div>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
  你还可以用<span class="emphasis"><em>"is odd by"</em></span>来反转交替。
</p>
</div>
</div>
<div class="sect2" title=".first">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.first"></a>.first</h3></div></div></div>
<p>
  如果当前的循环是第一次，<em class="parameter"><code>first</code></em>将被设成 <code class="constant">TRUE</code> 。
  </p>
</div>
<div class="sect2" title=".last">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.last"></a>.last</h3></div></div></div>
<p>
  如果当前的循环是最后一次，那么<em class="parameter"><code>last</code></em>将为 <code class="constant">TRUE</code>。
  </p>
<div class="example">
<a name="id442252"></a><p class="title"><b>Example 7.73. {section} 属性 <code class="varname">first</code> 和 <code class="varname">last</code></b></p>
<div class="example-contents">
<p>
   例子循环了 <code class="varname">$customers</code>数组，在循环最前面输出头部区域，在底端输出底部区域的内容。
   同时也使用了
   <a class="link" href="language.function.section.tpl#section.property.total" title=".total"><em class="parameter"><code>total</code></em></a> 属性.
   </p>
<pre class="programlisting">

{section name=customer loop=$customers}
  {if $smarty.section.customer.first}
    &lt;table&gt;
    &lt;tr&gt;&lt;th&gt;id&lt;/th&gt;&lt;th&gt;customer&lt;/th&gt;&lt;/tr&gt;
  {/if}

  &lt;tr&gt;
    &lt;td&gt;{$customers[customer].id}}&lt;/td&gt;
    &lt;td&gt;{$customers[customer].name}&lt;/td&gt;
  &lt;/tr&gt;

  {if $smarty.section.customer.last}
    &lt;tr&gt;&lt;td&gt;&lt;/td&gt;&lt;td&gt;{$smarty.section.customer.total} customers&lt;/td&gt;&lt;/tr&gt;
    &lt;/table&gt;
  {/if}
{/section}

  </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title=".rownum">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.rownum"></a>.rownum</h3></div></div></div>
<p>
   <em class="parameter"><code>rownum</code></em>是当前循环的次数，从1开始。它是<a class="link" href="language.function.section.tpl#section.property.iteration" title=".iteration"><em class="parameter"><code>iteration</code></em></a>
   的别名。
  </p>
</div>
<div class="sect2" title=".loop">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.loop"></a>.loop</h3></div></div></div>
<p>
   <em class="parameter"><code>loop</code></em> 是最后一次{section}循环的下标。
   它可以在<code class="varname">{section}</code>循环中或者循环后使用。
     </p>
<div class="example">
<a name="id442350"></a><p class="title"><b>Example 7.74. {section} 属性 <code class="varname">loop</code></b></p>
<div class="example-contents">
<pre class="programlisting">

{section name=customer loop=$custid}
  {$smarty.section.customer.index} id: {$custid[customer]}&lt;br /&gt;
{/section}
There are {$smarty.section.customer.loop} customers shown above.

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

0 id: 1000&lt;br /&gt;
1 id: 1001&lt;br /&gt;
2 id: 1002&lt;br /&gt;
There are 3 customers shown above.

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title=".show">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.show"></a>.show</h3></div></div></div>
<p>
   <em class="parameter"><code>show</code></em>是一个布尔值参数。如果设置为<code class="constant">FALSE</code>，section将不会被显示。
   如果有<code class="varname">{sectionelse}</code>显示，它们将被交替显示。
  </p>
<div class="example">
<a name="id442406"></a><p class="title"><b>Example 7.75. <code class="varname">show</code> 属性 </b></p>
<div class="example-contents">
<p>布尔值 <code class="varname">$show_customer_info</code> 可以在PHP程序赋值并传递到模板中，
   可以控制section的显示与否。</p>
<pre class="programlisting">

{section name=customer loop=$customers show=$show_customer_info}
  {$smarty.section.customer.rownum} id: {$customers[customer]}&lt;br /&gt;
{/section}

{if $smarty.section.customer.show}
  the section was shown.
{else}
  the section was not shown.
{/if}

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

1 id: 1000&lt;br /&gt;
2 id: 1001&lt;br /&gt;
3 id: 1002&lt;br /&gt;

the section was shown.

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title=".total">
<div class="titlepage"><div><div><h3 class="title">
<a name="section.property.total"></a>.total</h3></div></div></div>
<p>
   <em class="parameter"><code>total</code></em>是<code class="varname">{section}</code>的总数。
   它可以在<code class="varname">{section}</code>循环中或者循环后使用。
  </p>
<div class="example">
<a name="id442470"></a><p class="title"><b>Example 7.76. <code class="varname">total</code>例子</b></p>
<div class="example-contents"><pre class="programlisting">

{section name=customer loop=$custid step=2}
  {$smarty.section.customer.index} id: {$custid[customer]}&lt;br /&gt;
{/section}
   There are {$smarty.section.customer.total} customers shown above.

  </pre></div>
</div>
<br class="example-break"><p>
   参见<a class="link" href="language.function.foreach.tpl" title="{foreach},{foreachelse}"><code class="varname">{foreach}</code></a>,
   <a class="link" href="language.function.for.tpl" title="{for}"><code class="varname">{for}</code></a>,
   <a class="link" href="language.function.while.tpl" title="{while}"><code class="varname">{while}</code></a>
    和
   <a class="link" href="language.variables.smarty.tpl#language.variables.smarty.loops" title="{$smarty.section}"><em class="parameter"><code>$smarty.section</code></em></a>.
  </p>
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="language.function.php.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="language.builtin.functions.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="language.function.setfilter.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">{php} </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> {setfilter}</td>
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
              
              <div id="commentFormChallenge">What is 4 plus 1? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="84acb8ebf92c08963b3d900da993d469">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/language.function.section.tpl">
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
    <p>This page generated in 0.02573 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
