<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>自定义缓存实现 | Smarty</title>
    <meta name="description" content="自定义缓存实现">
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
<tr><th colspan="3" align="center">自定义缓存实现</th></tr>
<tr>
<td width="20%" align="left">
<a accesskey="p" href="caching.cacheable.tpl">Prev</a> </td>
<th width="60%" align="center">Chapter 15. 缓存</th>
<td width="20%" align="right"> <a accesskey="n" href="resources.tpl">Next</a>
</td>
</tr>
</table>
<hr>
</div>
<div class="sect1" title="自定义缓存实现">
<div class="titlepage"><div><div><h2 class="title" style="clear: both">
<a name="caching.custom"></a>自定义缓存实现</h2></div></div></div>
<p>
 Smarty默认是使用基于文件的缓存机制，作为可选的方案，你可以自定义一套缓存机制的实现，来进行缓存文件的读写和删除。
 </p>
<div class="note" title="Note" style="margin-left: 0.5in; margin-right: 0.5in;">
<h3 class="title">Note</h3>
<p>
 Smarty2使用<code class="literal">$cache_handler_func</code>的回调函数来实现此功能。
 而Smarty3使用了<code class="literal">Smarty_CacheResource</code>模块来实现。
 </p>
</div>
<p>
 自定义缓存实现可以实现类似下面的目的：
 用更快的存储引擎来替代较慢的文件系统，
 使缓存可以分布到多台服务器上。
 </p>
<p>
 Smarty可以通过API <code class="literal">Smarty_CacheResource_Custom</code> 或者 <code class="literal">Smarty_CacheResource_KeyValueStore</code>
 来实现缓存机制。
 <code class="literal">Smarty_CacheResource_Custom</code>是比较简单的API，直接通过覆盖读、写、删除等操作来实现缓存机制。
 该API可以使用于任何你觉得适合的方式，或存储到任何你觉得适合的地方。
 <code class="literal">Smarty_CacheResource_KeyValueStore</code>的API可让你使用K-V存储模式（比如APC，Memcache等）来实现缓存机制。
 更进一步，就算是多层的缓存组如"a|b|c"，该API也让你可以通过删除缓存组"a"来将整个嵌套的缓存组删除，
 即使K-V存储机制本身无法实现这种层次结构的存储。
 </p>
<p>
 自定义缓存可以放到<a class="link" href="variable.plugins.dir.tpl" title="$plugins_dir"><code class="varname">$plugins_dir</code></a>目录下并命名为<code class="literal">cacheresource.foobarxyz.php</code>，
 或者在运行时通过<a class="link" href="api.register.cacheresource.tpl" title="registerCacheResource()"><code class="varname">registerCacheResource()</code></a>
 来进行注册。
 上面两种方式都必须设置<a class="link" href="variable.caching.type.tpl" title="$caching_type"><code class="varname">$caching_type</code></a>
 来启动你的自定义缓存机制。
 </p>
<div class="example">
<a name="id514837"></a><p class="title"><b>Example 15.15. 通过MySQL实现自定义缓存机制</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php

require_once 'libs/Smarty.class.php';
$smarty = new Smarty();
$smarty-&gt;caching_type = 'mysql';

/**
 * MySQL 缓存
 *
 * 通过自定义缓存的接口API，让MySQL来作为Smarty的输出缓存存储器。
 *
 * 表定义:
 * &lt;pre&gt;CREATE TABLE IF NOT EXISTS `output_cache` (
 *   `id` CHAR(40) NOT NULL COMMENT 'sha1 hash',
 *   `name` VARCHAR(250) NOT NULL,
 *   `cache_id` VARCHAR(250) NULL DEFAULT NULL,
 *   `compile_id` VARCHAR(250) NULL DEFAULT NULL,
 *   `modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 *   `content` LONGTEXT NOT NULL,
 *   PRIMARY KEY (`id`),
 *   INDEX(`name`),
 *   INDEX(`cache_id`),
 *   INDEX(`compile_id`),
 *   INDEX(`modified`)
 * ) ENGINE = InnoDB;&lt;/pre&gt;
 *
 * @package CacheResource-examples
 * @author Rodney Rehm
 */
class Smarty_CacheResource_Mysql extends Smarty_CacheResource_Custom {
    // PDO 对象
    protected $db;
    protected $fetch;
    protected $fetchTimestamp;
    protected $save;
    
    public function __construct() {
        try {
            $this-&gt;db = new PDO("mysql:dbname=test;host=127.0.0.1", "smarty", "smarty");
        } catch (PDOException $e) {
            throw new SmartyException('Mysql 源无法链接: ' . $e-&gt;getMessage());
        }
        $this-&gt;fetch = $this-&gt;db-&gt;prepare('SELECT modified, content FROM output_cache WHERE id = :id');
        $this-&gt;fetchTimestamp = $this-&gt;db-&gt;prepare('SELECT modified FROM output_cache WHERE id = :id');
        $this-&gt;save = $this-&gt;db-&gt;prepare('REPLACE INTO output_cache (id, name, cache_id, compile_id, content)
            VALUES  (:id, :name, :cache_id, :compile_id, :content)');
    }

    /**
	 * 从数据表中获取缓存的内容及修改时间
     *
     * @param string $id 缓存内容的唯一识别ID
     * @param string $name 模板名称
     * @param string $cache_id 缓存ID
     * @param string $compile_id 编译ID
     * @param string $content （引用的）缓存内容
     * @param integer $mtime 缓存修改的时间戳 (epoch)
     * @return void
     */
    protected function fetch($id, $name, $cache_id, $compile_id, &amp;$content, &amp;$mtime)
    {
        $this-&gt;fetch-&gt;execute(array('id' =&gt; $id));
        $row = $this-&gt;fetch-&gt;fetch();
        $this-&gt;fetch-&gt;closeCursor();        
        if ($row) {
            $content = $row['content'];
            $mtime = strtotime($row['modified']);
        } else {
            $content = null;
            $mtime = null;
        }
    }
    
    /**
	 * 从数据表中获取缓存的修改时间
     *
     * @note 这是个可选的实现接口。在你确定仅获取修改时间会比获取整个内容要更快的时候，使用此接口。
     * @param string $id 缓存内容的唯一识别ID
     * @param string $name 模板名称
     * @param string $cache_id 缓存ID
     * @param string $compile_id 编译ID
     * @return integer|boolean 返回模板修改时间，如果找不到缓存则返回false
     */
    protected function fetchTimestamp($id, $name, $cache_id, $compile_id)
    {
        $this-&gt;fetchTimestamp-&gt;execute(array('id' =&gt; $id));
        $mtime = strtotime($this-&gt;fetchTimestamp-&gt;fetchColumn());
        $this-&gt;fetchTimestamp-&gt;closeCursor();
        return $mtime;
    }
    
    /**
     * 保存缓存内容到数据表
     *
     * @param string $id 缓存内容的唯一识别ID
     * @param string $name 模板名称
     * @param string $cache_id 缓存ID
     * @param string $compile_id 编译ID
     * @param integer|null $exp_time 缓存过期时间，或null
     * @param string $content 需要缓存的内容
     * @return boolean 成功true，失败false
     */
    protected function save($id, $name, $cache_id, $compile_id, $exp_time, $content)
    {
        $this-&gt;save-&gt;execute(array(
            'id' =&gt; $id,
            'name' =&gt; $name,
            'cache_id' =&gt; $cache_id,
            'compile_id' =&gt; $compile_id,
            'content' =&gt; $content,
        ));
        return !!$this-&gt;save-&gt;rowCount();
    }
    
    /**
     * 从数据表中删除缓存
     *
     * @param string $name 模板名称
     * @param string $cache_id 缓存ID
     * @param string $compile_id 编译ID
     * @param integer|null $exp_time 缓存过期时间，或null
     * @return integer 返回被删除的缓存数量
     */
    protected function delete($name, $cache_id, $compile_id, $exp_time)
    {
        // 删除整个缓存
        if ($name === null &amp;&amp; $cache_id === null &amp;&amp; $compile_id === null &amp;&amp; $exp_time === null) {
			// 返回删除缓存记录的数量，需要再进行一次查询来计算。
            $query = $this-&gt;db-&gt;query('TRUNCATE TABLE output_cache');
            return -1;
        }
        // 组成查找条件
        $where = array();
        // 匹配名称
        if ($name !== null) {
            $where[] = 'name = ' . $this-&gt;db-&gt;quote($name);
        }
        // 匹配编译ID
        if ($compile_id !== null) {
            $where[] = 'compile_id = ' . $this-&gt;db-&gt;quote($compile_id);
        }
        // 匹配过期时间范围
        if ($exp_time !== null) {
            $where[] = 'modified &lt; DATE_SUB(NOW(), INTERVAL ' . intval($exp_time) . ' SECOND)';
        }
        // 匹配缓存ID和缓存组的子ID
        if ($cache_id !== null) {
            $where[] = '(cache_id = '. $this-&gt;db-&gt;quote($cache_id)
                . ' OR cache_id LIKE '. $this-&gt;db-&gt;quote($cache_id .'|%') .')';
        }
        // 执行删除
        $query = $this-&gt;db-&gt;query('DELETE FROM output_cache WHERE ' . join(' AND ', $where));
        return $query-&gt;rowCount();
    }
}
?&gt;

   </pre></div>
</div>
<br class="example-break"><div class="example">
<a name="id514851"></a><p class="title"><b>Example 15.16. 通过Memcache实现自定义缓存机制</b></p>
<div class="example-contents"><pre class="programlisting">

&lt;?php

require_once 'libs/Smarty.class.php';
$smarty = new Smarty();
$smarty-&gt;caching_type = 'memcache';

/**
 * Memcache 缓存
 *
 * 通过K-V存储的API来把memcache作为Smarty的输出缓存器。
 *
 * 注意memcache要求key的长度只能是256个字符以内，
 * 所以程序中，key都进行sha1哈希计算后才使用。
 *
 * @package CacheResource-examples
 * @author Rodney Rehm
 */
class Smarty_CacheResource_Memcache extends Smarty_CacheResource_KeyValueStore {
    /**
     * memcache 对象
     * @var Memcache
     */
    protected $memcache = null;
    
    public function __construct()
    {
        $this-&gt;memcache = new Memcache();
        $this-&gt;memcache-&gt;addServer( '127.0.0.1', 11211 );
    }
    
    /**
	 * 从memcache中获取一系列key的值。
     *
     * @param array $keys 多个key
     * @return array 按key的顺序返回的对应值
     * @return boolean 成功返回true，失败返回false
     */
    protected function read(array $keys)
    {
        $_keys = $lookup = array();
        foreach ($keys as $k) {
            $_k = sha1($k);
            $_keys[] = $_k;
            $lookup[$_k] = $k;
        }
        $_res = array();
        $res = $this-&gt;memcache-&gt;get($_keys);
        foreach ($res as $k =&gt; $v) {
            $_res[$lookup[$k]] = $v;
        }
        return $_res;
    }
    
    /**
	 * 将一系列的key对应的值存储到memcache中。
     *
     * @param array $keys 多个kv对应的数据值
     * @param int $expire 过期时间
     * @return boolean 成功返回true，失败返回false
     */
    protected function write(array $keys, $expire=null)
    {
        foreach ($keys as $k =&gt; $v) {
            $k = sha1($k);
            $this-&gt;memcache-&gt;set($k, $v, 0, $expire);
        }
        return true;
    }

    /**
	 * 从memcache中删除
     *
     * @param array $keys 待删除的多个key
     * @return boolean 成功返回true，失败返回false
     */
    protected function delete(array $keys)
    {
        foreach ($keys as $k) {
            $k = sha1($k);
            $this-&gt;memcache-&gt;delete($k);
        }
        return true;
    }

    /**
     * 清空全部的值
     *
     * @return boolean 成功返回true，失败返回false
     */
    protected function purge()
    {
        return $this-&gt;memcache-&gt;flush();
    }
}
?&gt;

   </pre></div>
</div>
<br class="example-break">
</div>
<div class="navfooter">
<hr>
<table width="100%" summary="Navigation footer">
<tr>
<td width="40%" align="left">
<a accesskey="p" href="caching.cacheable.tpl">Prev</a> </td>
<td width="20%" align="center"><a accesskey="u" href="caching.tpl">Up</a></td>
<td width="40%" align="right"> <a accesskey="n" href="resources.tpl">Next</a>
</td>
</tr>
<tr>
<td width="40%" align="left" valign="top">控制输出缓存 </td>
<td width="20%" align="center"><a accesskey="h" href="index.tpl">Home</a></td>
<td width="40%" align="right" valign="top"> Chapter 16. 资源</td>
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
              
              <div id="commentFormChallenge">What is 4 plus 14? <input id="commentFormChallengeText" type="text" name="challenge" size="30" value="" style="color: grey"> <span style="font-style: italic">(Are you human?)</span></div>
              <input id="commentFormChallengeObf" type="hidden" name="obf" value="5339066f947bdbad167aec87c3b035cc">
              <div id="commentFormBody"><textarea id="commentFormBodyText" name="body" rows="8" cols="60"></textarea></div>
              <div id="commentFormSubmitButtons">
                <input id="commentFormPostButton" type="submit" value="Post Comment">
                <input id="commentFormPreviewButton" type="submit" value="Preview">
                <img id="commentBusyIcon" src="../../images/busy.gif">
              </div>
              <input id="commentFormPageID" type="hidden" name="page_id" value="docs/zh_CN/caching.custom.tpl">
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
    <p>This page generated in 0.02343 secs with <a href="../../../www.tinymvc.com/index.htm">TinyMVC</a> and Smarty 3.</p>
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
