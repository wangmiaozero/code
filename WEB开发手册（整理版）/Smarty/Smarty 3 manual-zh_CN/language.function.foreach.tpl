<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{foreach},{foreachelse} | Smarty</title>
    <meta name="description" content="{foreach},{foreachelse}">
    <meta name="keywords" content=", ldelim, foreach, rdelim, ldelim, foreachelse, rdelim, ">
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
<tr><th colspan="3" align="center">{foreach},{foreachelse}</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="language.function.for.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 7. 内置函数</th>
<td width="20%" align="right"> <a accesskey="n" href="language.function.function.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="{foreach},{foreachelse}">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="language.function.foreach"></a>{foreach},{foreachelse}</h2></div></div></div>
<p>
  <code class="varname">{foreach}</code>用于循环数组。
  <code class="varname">{foreach}</code>的语法比<a class="link" href="language.function.section.tpl" title="{section},{sectionelse}"><code class="varname">{section}</code></a>循环要更简单和清晰，并且可以使用非数字下标的数组。
 </p>
<p>
  <code class="varname">{foreach $arrayvar as $itemvar}</code> 
 </p>
<p>
  <code class="varname">{foreach $arrayvar as $keyvar=&gt;$itemvar}</code> 
 </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
 foreach的语法可以接受没有名称的属性，该语法是Smarty 3新增的。然而Smarty 2语法
 <code class="literal">{foreach from=$myarray key="mykey" item="myitem"}</code>也同样支持。
 </p>
</div>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem"><p>
   <code class="varname">{foreach}</code> 循环可以被嵌套使用.
   </p></li>
<li class="listitem"><p>
   <em class="parameter"><code>array</code></em>变量，一般是数组的值，决定了<code class="varname">{foreach}</code>
   循环的次数。你也可以传递一个任意的整数来控制循环次数。
   </p></li>
<li class="listitem"><p>
   如果<em class="parameter"><code>array</code></em>数组变量中，没有值的情况下，
   <code class="varname">{foreachelse}</code>将执行。
   </p></li>
<li class="listitem"><p>
    <code class="varname">{foreach}</code>的属性：
    <a class="link" href="language.function.foreach.tpl#foreach.property.index" title="@index"><em class="parameter"><code>@index</code></em></a>,
    <a class="link" href="language.function.foreach.tpl#foreach.property.iteration" title="@iteration"><em class="parameter"><code>@iteration</code></em></a>,
    <a class="link" href="language.function.foreach.tpl#foreach.property.first" title="@first"><em class="parameter"><code>@first</code></em></a>,
    <a class="link" href="language.function.foreach.tpl#foreach.property.last" title="@last"><em class="parameter"><code>@last</code></em></a>,
    <a class="link" href="language.function.foreach.tpl#foreach.property.show" title="@show"><em class="parameter"><code>@show</code></em></a>,
    <a class="link" href="language.function.foreach.tpl#foreach.property.total" title="@total"><em class="parameter"><code>@total</code></em></a>.
   </p></li>
<li class="listitem"><p>
    <code class="varname">{foreach}</code>的语法命令：
    <a class="link" href="language.function.foreach.tpl#foreach.construct.break" title="{break}"><code class="varname">{break}</code></a>,
    <a class="link" href="language.function.foreach.tpl#foreach.construct.continue" title="{continue}"><code class="varname">{continue}</code></a>.
   </p></li>
<li class="listitem"><p>
	代替指定<em class="parameter"><code>key</code></em>变量，你可以通过
	<em class="parameter"><code>{$item@key}</code></em>来使用循环的当前key。(见下面的例子).
    </p></li>
</ul></div>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
    <code class="literal">$var@property</code>的语法是Smarty 3新增的。然而Smarty 2风格的语法<code class="literal">{foreach from=$myarray key="mykey" item="myitem"}</code>, <code class="literal">$smarty.foreach.name.property</code>也是支持的。
   </p>
</div>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
   即使你在循环语法里<code class="literal">{foreach $myArray as $myKey =&gt; $myValue}</code>
   已经指定了key的变量名，但循环体内<code class="varname">$myValue@key</code>还是可用的。
   </p>
</div>
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
<td>关闭<code class="varname">{foreach}</code>循环的缓存</td>
</tr></tbody>
</table></div>
<div class="example">
<a name="id433686"></a><p class="title"><b>Example 7.30. 简单的<code class="varname">{foreach}</code> 循环</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
$arr = array('red', 'green', 'blue');
$smarty-&gt;assign('myColors', $arr);
?&gt;

  </pre>
<p>模板将顺序输出<em class="parameter"><code>$myColors</code></em>。</p>
<pre class="programlisting">

&lt;ul&gt;
{foreach $myColors as $color}
    &lt;li&gt;{$color}&lt;/li&gt;
{/foreach}
&lt;/ul&gt;

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

&lt;ul&gt;
    &lt;li&gt;red&lt;/li&gt;
    &lt;li&gt;green&lt;/li&gt;
    &lt;li&gt;blue&lt;/li&gt;
&lt;/ul&gt;

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id433733"></a><p class="title"><b>Example 7.31. 使用<em class="parameter"><code>key</code></em>变量的例子</b></p>
<div class="example-contents">
<pre class="programlisting">

&lt;?php
$people = array('fname' =&gt; 'John', 'lname' =&gt; 'Doe', 'email' =&gt; 'j.doe@example.com');
$smarty-&gt;assign('myPeople', $people);
?&gt;

  </pre>
<p>模板将以键值对的方式输出<em class="parameter"><code>$myArray</code></em></p>
<pre class="programlisting">

&lt;ul&gt;
{foreach $myPeople as $value}
   &lt;li&gt;{$value@key}: {$value}&lt;/li&gt;
{/foreach}
&lt;/ul&gt;

  </pre>
<p>
   输出：
  </p>
<pre class="screen">

&lt;ul&gt;
    &lt;li&gt;fname: John&lt;/li&gt;
    &lt;li&gt;lname: Doe&lt;/li&gt;
    &lt;li&gt;email: j.doe@example.com&lt;/li&gt;
&lt;/ul&gt;

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id433782"></a><p class="title"><b>Example 7.32. 多维数组通过<em class="parameter"><code>item</code></em> 和 <em class="parameter"><code>key</code></em>来嵌套使用{foreach}</b></p>
<div class="example-contents">
<p>多维数组的键一般会对应另一个数组。</p>
<pre class="programlisting">

&lt;?php
 $smarty-&gt;assign('contacts', array(
                             array('phone' =&gt; '555-555-1234',
                                   'fax' =&gt; '555-555-5678',
                                   'cell' =&gt; '555-555-0357'),
                             array('phone' =&gt; '800-555-4444',
                                   'fax' =&gt; '800-555-3333',
                                   'cell' =&gt; '800-555-2222')
                             ));
?&gt;

  </pre>
<p>模板将输出<em class="parameter"><code>$contact</code></em>.</p>
<pre class="programlisting">

{* key always available as a property *}
{foreach $contacts as $contact}
  {foreach $contact as $value}
    {$value@key}: {$value}
  {/foreach}
{/foreach}

{* accessing key the PHP syntax alternate *}
{foreach $contacts as $contact}
  {foreach $contact as $key =&gt; $value}
    {$key}: {$value}
  {/foreach}
{/foreach}

  </pre>
<p>
   上面两个例子都会输出：
  </p>
<pre class="screen">

  phone: 555-555-1234
  fax: 555-555-5678
  cell: 555-555-0357
  phone: 800-555-4444
  fax: 800-555-3333
  cell: 800-555-2222

  </pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id433851"></a><p class="title"><b>Example 7.33. {foreachelse}的数据库例子</b></p>
<div class="example-contents">
<p>循环显示数据库（PDO）结果。例子是循环了一个PHP的迭代器（iterator）而不是一个数组（array）。</p>
<pre class="programlisting">

&lt;?php 
  include('Smarty.class.php'); 

  $smarty = new Smarty; 

  $dsn = 'mysql:host=localhost;dbname=test'; 
  $login = 'test'; 
  $passwd = 'test'; 

  // setting PDO to use buffered queries in mysql is 
  // important if you plan on using multiple result cursors 
  // in the template. 

  $db = new PDO($dsn, $login, $passwd, array( 
     PDO::MYSQL_ATTR_USE_BUFFERED_QUERY =&gt; true)); 

  $res = $db-&gt;prepare("select * from users"); 
  $res-&gt;execute(); 
  $res-&gt;setFetchMode(PDO::FETCH_LAZY); 

  // assign to smarty 
  $smarty-&gt;assign('res',$res); 

  $smarty-&gt;display('index.tpl');?&gt;
?&gt;

  </pre>
<pre class="programlisting">

{foreach $res as $r} 
  {$r.id} 
  {$r.name}
{foreachelse}
  .. no results .. 
{/foreach}

  </pre>
</div>
</div>
<br class="example-break"><p>
 上面的例子显示了查询结果<code class="literal">id</code> 和 <code class="literal">name</code>两个字段的内容。
 </p>
<p>
 迭代器和数组循环哪个更高效呢？数组而言，每次循环之前全部的数组数据都会被先放到内存堆栈内，然后再进行循环。
 而迭代器每次迭代循环时，都会载入并释放结果内容，这样可以节省运行时间和内存，尤其是当结果集非常大的时候。
 </p>
<div class="sect2" title="@index">
<div class="titlepage"><div><div><h3 class="title">
<a name="foreach.property.index"></a>@index</h3></div></div></div>
<p>
   <em class="parameter"><code>index</code></em>是当前数组索引，从0开始计算。
  </p>
<div class="example">
<a name="id433929"></a><p class="title"><b>Example 7.34. <em class="parameter"><code>index</code></em> 例子</b></p>
<div class="example-contents"><pre class="programlisting">

{* output empty row on the 4th iteration (when index is 3) *}
&lt;table&gt;
{foreach $items as $i}
  {if $i@index eq 3}
     {* put empty table row *}
     &lt;tr&gt;&lt;td&gt;nbsp;&lt;/td&gt;&lt;/tr&gt;
  {/if}
  &lt;tr&gt;&lt;td&gt;{$i.label}&lt;/td&gt;&lt;/tr&gt;
{/foreach}
&lt;/table&gt;

  </pre></div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="@iteration">
<div class="titlepage"><div><div><h3 class="title">
<a name="foreach.property.iteration"></a>@iteration</h3></div></div></div>
<p>
   <em class="parameter"><code>iteration</code></em>是当前循环的次数，和<a class="link" href="language.function.foreach.tpl#foreach.property.index" title="@index"><em class="parameter"><code>index</code></em></a>不同，<em class="parameter"><code>iteration</code></em>是从1开始。
   <em class="parameter"><code>iteration</code></em>在每次循环的时候都会加一。
  </p>
<div class="example">
<a name="id433992"></a><p class="title"><b>Example 7.35. <em class="parameter"><code>iteration</code></em> 例子: is div by</b></p>
<div class="example-contents">
<p>
    <span class="emphasis"><em>"is div by"</em></span>运算可以对循环次数做一些特殊的判断。
	下面我们将每4次循环就输出一次粗体的名称。
  </p>
<pre class="programlisting">

{foreach $myNames as $name}
  {if $name@iteration is div by 4}
    &lt;b&gt;{$name}&lt;/b&gt;
  {/if}
  {$name}
{/foreach}

</pre>
</div>
</div>
<br class="example-break"><div class="example">
<a name="id434020"></a><p class="title"><b>Example 7.36. <em class="parameter"><code>iteration</code></em> 例子: is even/odd by</b></p>
<div class="example-contents">
<p>
     <span class="emphasis"><em>"is even by"</em></span> 和 <span class="emphasis"><em>"is odd by"</em></span>可以用于在循环中奇偶交替进行一些操作。在开始的时候可以选择奇或偶的循环。
	 下面是每三次循环会改变一次字体颜色。
   </p>
<pre class="programlisting">
 
 {foreach $myNames as $name}
   {if $name@iteration is even by 3}
     &lt;span style="color: #000"&gt;{$name}&lt;/span&gt;
   {else}
     &lt;span style="color: #eee"&gt;{$name}&lt;/span&gt;
   {/if}
 {/foreach}
 
 </pre>
<p>
    输出：
   </p>
<pre class="screen">

    &lt;span style="color: #000"&gt;...&lt;/span&gt;
    &lt;span style="color: #000"&gt;...&lt;/span&gt;
    &lt;span style="color: #000"&gt;...&lt;/span&gt;
    &lt;span style="color: #eee"&gt;...&lt;/span&gt;
    &lt;span style="color: #eee"&gt;...&lt;/span&gt;
    &lt;span style="color: #eee"&gt;...&lt;/span&gt;
    &lt;span style="color: #000"&gt;...&lt;/span&gt;
    &lt;span style="color: #000"&gt;...&lt;/span&gt;
    &lt;span style="color: #000"&gt;...&lt;/span&gt;
    &lt;span style="color: #eee"&gt;...&lt;/span&gt;
    &lt;span style="color: #eee"&gt;...&lt;/span&gt;
    &lt;span style="color: #eee"&gt;...&lt;/span&gt;
    ...

   </pre>
</div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="@first">
<div class="titlepage"><div><div><h3 class="title">
<a name="foreach.property.first"></a>@first</h3></div></div></div>
<p>
   当循环<code class="varname">{foreach}</code>是首次循环时，<em class="parameter"><code>first</code></em>将为<code class="constant">TRUE</code>
   下面我们用first来显示一个表格的表头。
  </p>
<div class="example">
<a name="id434098"></a><p class="title"><b>Example 7.37. <em class="parameter"><code>first</code></em>例子</b></p>
<div class="example-contents"><pre class="programlisting">

{* show table header at first iteration *}
&lt;table&gt;
{foreach $items as $i}
  {if $i@first}
    &lt;tr&gt;
      &lt;th&gt;key&lt;/td&gt;
      &lt;th&gt;name&lt;/td&gt;
    &lt;/tr&gt;
  {/if}
  &lt;tr&gt;
    &lt;td&gt;{$i@key}&lt;/td&gt;
    &lt;td&gt;{$i.name}&lt;/td&gt;
  &lt;/tr&gt;
{/foreach}
&lt;/table&gt;

  </pre></div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="@last">
<div class="titlepage"><div><div><h3 class="title">
<a name="foreach.property.last"></a>@last</h3></div></div></div>
<p>
  当<code class="varname">{foreach}</code>循环到了最后一次时，
  <em class="parameter"><code>last</code></em>将为<code class="constant">TRUE</code>。
  下面我们将在循环的最后插入一条水平线。
  </p>
<div class="example">
<a name="id434146"></a><p class="title"><b>Example 7.38. <em class="parameter"><code>last</code></em>例子</b></p>
<div class="example-contents"><pre class="programlisting">

{* Add horizontal rule at end of list *}
{foreach $items as $item}
  &lt;a href="#{$item.id}"&gt;{$item.name}&lt;/a&gt;{if $item@last}&lt;hr&gt;{else},{/if}
{foreachelse}
  ... no items to loop ...
{/foreach}

  </pre></div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="@show">
<div class="titlepage"><div><div><h3 class="title">
<a name="foreach.property.show"></a>@show</h3></div></div></div>
<p>
   <em class="parameter"><code>show</code></em>属性是在<code class="varname">{foreach}</code>循环执行之后，
   检测循环是否显示数据的判断。
   <em class="parameter"><code>show</code></em>是一个布尔值。
  </p>
<div class="example">
<a name="id434195"></a><p class="title"><b>Example 7.39. <em class="parameter"><code>show</code></em>例子</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;ul&gt;
{foreach $myArray as $name}
    &lt;li&gt;{$name}&lt;/li&gt;
{/foreach}
&lt;/ul&gt;
{if $name@show} do something here if the array contained data {/if}

</pre></div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="@total">
<div class="titlepage"><div><div><h3 class="title">
<a name="foreach.property.total"></a>@total</h3></div></div></div>
<p>
   <em class="parameter"><code>total</code></em>是整个<code class="varname">{foreach}</code>循环的次数。
   total可以在<code class="varname">{foreach}</code>内部，或者之后使用。
  </p>
<div class="example">
<a name="id434241"></a><p class="title"><b>Example 7.40. <em class="parameter"><code>total</code></em>例子</b></p>
<div class="example-contents"><pre class="programlisting">

{* show number of rows at end *}
{foreach $items as $item}
  {$item.name}&lt;hr/&gt;
  {if $item@last}
    &lt;div id="total"&gt;{$item@total} items&lt;/div&gt;
  {/if}
{foreachelse}
 ... no items to loop ...
{/foreach}

</pre></div>
</div>
<br class="example-break"><p>
   参见<a class="link" href="language.function.section.tpl" title="{section},{sectionelse}"><code class="varname">{section}</code></a>,
   <a class="link" href="language.function.for.tpl" title="{for}"><code class="varname">{for}</code></a>
   和
   <a class="link" href="language.function.while.tpl" title="{while}"><code class="varname">{while}</code></a>
  </p>
</div>
<div class="sect2" title="{break}">
<div class="titlepage"><div><div><h3 class="title">
<a name="foreach.construct.break"></a>{break}</h3></div></div></div>
<p>
   <code class="varname">{break}</code>停止循环。
  </p>
<div class="example">
<a name="id434307"></a><p class="title"><b>Example 7.41. <code class="varname">{break}</code> 例子</b></p>
<div class="example-contents"><pre class="programlisting">
 
  {$data = [1,2,3,4,5]}
  {foreach $data as $value}
    {if $value == 3}
      {* abort iterating the array *}
      {break}
    {/if}
    {$value}
  {/foreach}
  {*
    prints: 1 2
  *}
 
   </pre></div>
</div>
<br class="example-break">
</div>
<div class="sect2" title="{continue}">
<div class="titlepage"><div><div><h3 class="title">
<a name="foreach.construct.continue"></a>{continue}</h3></div></div></div>
<p>
   <code class="varname">{continue}</code>将跳过当前本次循环并进入下一次循环。
  </p>
<div class="example">
<a name="id434342"></a><p class="title"><b>Example 7.42. <code class="varname">{continue}</code> 例子</b></p>
<div class="example-contents"><pre class="programlisting">
 
  {$data = [1,2,3,4,5]}
  {foreach $data as $value}
    {if $value == 3}
      {* skip this iteration *}
      {continue}
    {/if}
    {$value}
  {/foreach}
  {*
    prints: 1 2 4 5
  *}
 
   </pre></div>
</div>
<br class="example-break">
</div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="language.function.for.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="language.builtin.functions.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="language.function.function.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">{for} </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> {function}</td>
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
              
              <div id="commentFormChallenge">What is 7 plus 8? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="0e44b73f5305cf595520461c751d5359">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/language.function.foreach.tpl">
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
    <p>This page generated in 0.02561 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
