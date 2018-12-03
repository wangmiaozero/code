<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>序言 | Smarty</title>
    <meta name="description" content="序言">
    <meta name="keywords" content=", ">
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
<tr><th colspan="3" align="center">序言</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="index.tpl">Prev</a> </td>
<th width="60%" align="center"> </th>
<td width="20%" align="right"> <a accesskey="n" href="getting.started.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="preface" title="序言">
<div class="titlepage"><div><div><h2 class="title">
<a name="preface"></a>序言</h2></div></div></div>
<p>
   <span class="bold"><strong>理念</strong></span>
  </p>
<p>
  Smarty的设计主要由这些理念的驱动：
  </p>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem"><p>
	干净地分离显示逻辑和程序代码</p></li>
<li class="listitem"><p>PHP后端，Smarty模板前端</p></li>
<li class="listitem"><p>增强PHP, 而不是取代它</p></li>
<li class="listitem"><p>程序员和设计师的快速开发/部署</p></li>
<li class="listitem"><p>快速和简单的维护</p></li>
<li class="listitem"><p>语法简单易懂，无须懂PHP</p></li>
<li class="listitem"><p>灵活的自定义开发</p></li>
<li class="listitem"><p>安全: 隔离于PHP</p></li>
<li class="listitem"><p>免费, 开源</p></li>
</ul></div>
<p>
   <span class="bold"><strong>Smarty是什么?</strong></span>
  </p>
<p>
  Smarty是一个PHP的模板引擎，提供让程序逻辑与页面显示（HTML/CSS）代码分离的功能。
  也就是<span class="emphasis"><em>PHP代码是程序逻辑</em></span>，与页面显示分开。
  </p>
<p>
    <span class="bold"><strong>两种观点</strong></span>
  </p>
<p>
  当PHP出现了模板引擎时，就有了两种观点：
  第一种观点是：“PHP本身就是模板引擎”。主张在HTML中内使用简单的PHP代码。
  虽然从纯代码运行观点来看，这种主张是速度最快的，但有很大的争议就是内嵌的PHP代码会
  使得HTML凌乱并且非常复杂。
  </p>
<p>
  另一种观点是页面显示应该是没有程序代码的，转而用简单的标签来显示内容。
    这中主张在别的模板引擎（甚至是其他编程语言）是很常见的，而且也是Smarty的观点。
	这种方式可以让模板只专注于页面显示，避免混合了程序逻辑代码，更方便管理。
  </p>
<p>
   <span class="bold"><strong>PHP与模板分离的重要性</strong></span>
  </p>
<p>
    两个主要是好处：
  </p>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem"><p>
	  语法：模板语法通常是更符合HTML标记的语义。PHP语法可以在程序代码中运作的很好，
	  但如何混合在HTML中就不然。Smarty简单的{标签}语法是为了表达显示逻辑而设计的。
	  Smarty让你的模板更专注于页面显示，而不用关注太多“代码”。
	  这可以让模板开发得更快速，维护更容易。
	  学习Smarty的语法不需要懂得PHP的相关知识，程序员或非程序员都能很快上手。
      </p></li>
<li class="listitem"><p>
	  松耦合：当PHP代码混合在模板中，那将无法约束任意的逻辑代码被写到模板上。
	  Smarty分隔了模板和PHP，控制了页面显示和业务逻辑的分离。
	  Smarty还有安全特性，可以令模板源码有强制的约束。
      </p></li>
</ul></div>
<p>
   <span class="bold"><strong>页面设计者和PHP</strong></span>
  </p>
<p>
  一个通常的问题是：“页面设计者既然要学一门语法，为什么不学PHP？”。当然页面设计者可以
  学习PHP，而且他们可能已经非常熟悉PHP。问题并非是他们是否有能力学习PHP，问题在于HTML混合PHP的情况，如果设计者使用PHP，那么就很容易会将一些不属于模板的PHP代码写到模板上。
  （正如当他们只需要一把小刀但你塞给他们一把瑞士军刀一样）。
  你可以教导他们程序设计的规则，但这可能是他们不真正需要学习的事情（他们不是开发者）。
  而且PHP手册也是非常繁多难以筛选出你需要的部分进行教导，
  就像你给了车子的买主一本汽车工厂里面的装配手册，而不是汽车的操作手册一样。
  Smarty恰到好处地给予了设计者需要的工具，而提供了开发者更好地控制这些工具的方法。
  这种简单的标签语法也是非常受到设计者的欢迎，帮助了设计者流水式地组织管理模板。
  </p>
<p>
   <span class="bold"><strong>实践很重要</strong></span>
  </p>
<p>
  虽然Smarty提供了让你清晰分离显示逻辑和程序代码的工具，但也留下了不少空间可违反这些规则。一个失败的实践（如将纯PHP代码写到模板中）将导致比显示逻辑分离更多的问题。本手册可以很好地告诉你哪些事情需要关注的。同时也可以参考Smarty网站上最佳实践的文章。
  </p>
<p>
   <span class="bold"><strong>Smarty是怎么工作的？</strong></span>
  </p>
<p>
  在底层，Smarty“编译”（简单地复制和转换）模板为PHP代码。这在每个模板第一次调用时发生，然后编译后的代码将被一直使用。Smarty处理地非常的好，所以模板设计师仅编辑模板而不需要关注编译的事情。这方法保持了模板的易维护，同时也保证了运行时是PHP代码的方式运行，这样PHP代码就可以通过类似APC等OP-CODE缓存器来加速了。
  </p>
<p>
   <span class="bold"><strong>模板继承</strong></span>
  </p>
<p>
  模板继承是Smarty 3的新特性。在模板继承出现之前，我们将模板分为多片，如header和footer等模板。这种在每个模板内都引入header/footer的组织方式会导致许多问题，如递归跳转等。模板继承，就像维护单独的模板一样简单。我们可以设置一些内容块来进行继承，这样更直观、有效和容易被管理。更多详情请参考模板继承的章节。
  </p>
<p>
   <span class="bold"><strong>为什么不使用 XML/XSLT 语法?</strong></span>
  </p>
<p>
  有许多好的理由。首先，Smarty不仅可以用在XML/HTML模板中，还可以做更多，如生成电邮、javascript、CSV和PDF文档等。
  其次，XML/XSLT语法比起PHP代码还要更冗长和脆弱！它适合给计算机看，但对人类非常不友好。
  Smarty是希望模板能非常容易阅读、理解和维护的。
  </p>
<p>
   <span class="bold"><strong>模板安全</strong></span>
  </p>
<p>
  虽然Smarty已经隔离了PHP代码，但如果你愿意，你还可以有相当多的方法来使用它。
  模板安全机制提供了严格的隔离方式。在你将模板给第三方进行编辑，但又不希望他们使用全部的PHP功能时，
  模板安全机制非常地有用。
  </p>
<p>
   <span class="bold"><strong>整合</strong></span>
  </p>
<p>
  有时人们会把Smarty和一些MVC框架进行对比（Model-View-Controller 模型-视图-控制器）。
  Smarty并非一个MVC，它仅是显示层，就是MVC中的V层（视图层）。
  从这方面而言，Smarty可以很容易被整合到MVC中作为视图层。
  许多非常著名的框架都整合了Smarty作为视图层，你可以在论坛或者文档中找到一些相关的内容。
  </p>
<p>
   <span class="bold"><strong>其他的模板引擎</strong></span>
  </p>
<p>
  Smarty并非唯一的，遵循<span class="emphasis"><em>"分离显示逻辑和程序代码"</em></span>的引擎。
  举个例子，Python有这相同理念的模板引擎，如 Django Templates 和 CheetahTemplate等。
  <span class="emphasis"><em>说明: Python这种语言天生是不那么容易混杂在HTML中，因为其设计思路就是希望程序代码独立在显示之外的。
  当然，也有一些Python库可以让Python混合到HTML中，但一般是不推荐的。</em></span>
  </p>
<p>
   <span class="bold"><strong>Smarty不是什么</strong></span>
  </p>
<p>
  Smarty不是一个应用开发框架。Smarty不是一个MVC。Smarty不像Zend Framework, CodeIgniter, PHPCake, 或者其他的PHP应用开发框架。
  </p>
<p>
  Smarty是一个模板引擎，在应用程序中，当作V层（视图层）的组件来使用。
  Smarty可以很轻易连接到其他的视图引擎中。
  和其他的软件技术一样，Smarty也有着学习曲线。
  Smarty不一定保证良好的程序设计或者达成显示分离的目的，这还得需要开发者和模板设计师的努力。
  </p>
<p>
   <span class="bold"><strong>Smarty适合我吗?</strong></span>
  </p>
<p>
  Smarty并非一个可以做任何事情的工具。重要的是如何去判断Smarty是否符合你的需要，下面是一些建议：
  </p>
<p>
  模板语法。
  你的模板内容是否PHP代码和HTML的混合体？
  你的模板设计师是否也适应用PHP开发？
  你的模板设计师是否希望有一套标记型的语法来设计显示内容？
  通过使用Smarty和PHP的经验可以回答这些问题。
  </p>
<p>
  业务状况。
  是否有将模板和PHP代码分离的需求？
  你是否有非可信的第三方来编辑模板，但你又不希望他们可以使用全部PHP的功能？
  你是否需要通过程序控制哪些功能在模板是可用、和不可用？
  Smarty的设计可以满足以上的功能。
  </p>
<p>
  强大特性。
  比起自行开发，Smarty的特性如缓存、模板继承和插件机制，是否更能节省开发时间？
  你计划使用的基础库或者框架是否需要这样的显示组件？
  </p>
<p>
  PHP模板是个热门的话题，也存在很多意见的分歧。
  重要的是你弄清楚Smarty，弄情况你的需求，来做一个适合你的选择。
  欢迎在论坛或者IRC频道中提出问题讨论。
  </p>
<p>
  参见Smarty网站的“用例及工作流”章节。
  </p>
<p>
   <span class="bold"><strong>使用Smarty的站点</strong></span>
  </p>
<p>
    每天都有成千上万的独立访客访问Smarty网站，大多数都是开发者在阅读手册。许多著名的PHP项目在使用Smarty，如XOOPS CMS, CMS Made Simple , Tiki CMS/Groupware 和 X-Cart 等等。
  </p>
<p>
   <span class="bold"><strong>总结</strong></span>
  </p>
<p>
  无论你使用Smarty来制作一个小网站，或者是大型的商业系统，它都能很好地适合你的需要。
  这里是一些选择Smarty的优势：
  </p>
<div class="itemizedlist"><ul class="itemizedlist" type="disc">
<li class="listitem"><p>分离PHP代码和HTML/CSS显示</p></li>
<li class="listitem"><p>良好的组织和管理</p></li>
<li class="listitem"><p>第三方模板访问安全机制</p></li>
<li class="listitem"><p>全功能，易于扩展</p></li>
<li class="listitem"><p>众多用户使用，Smarty一直在发展</p></li>
<li class="listitem"><p>LGPL 许可，可商业使用</p></li>
<li class="listitem"><p>100% 免费, 开源的项目</p></li>
</ul></div>
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="index.tpl">Prev</a> </td>
<td width="20%" align="center"> </td>
<td width="40%" align="right"> <a accesskey="n" href="getting.started.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">Smarty3 手册 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> Part I. 开始</td>
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
              
              <div id="commentFormChallenge">What is 15 plus 0? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="0e44b73f5305cf595520461c751d5359">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/preface.tpl">
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
    <p>This page generated in 0.02856 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
