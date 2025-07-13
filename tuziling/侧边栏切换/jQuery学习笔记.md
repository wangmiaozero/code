# [jQuery学习笔记](https://segmentfault.com/a/1190000010063989)

### jQuery

- 提高业务编程能力
  - JQ中提供了很多的方法（基本都兼容），我们可以使用这些方法快速开发项目
  - JQ中有的方法提供的思想可以让我们把项目实现得更优化
- 提高JS基础以及一些高级编程思想
  - 分析JQ源码，学习里面类库封装的思想和一些方法实现的原理
  - 有时间把JQ中提供的常用方法都去实现一遍，提高自己的编程能力

##### 1.jQuery的原理

- jquery-1.xxx: 专门为PC端诞生的类库，兼容所有的浏览器
- jquery-2.xxx: 当初是为了移动端而准备的，所以IE低版本浏览器一般不兼容，但是这个版本针对移动端的事件等操作也不是特别完善，被Zepto这个类库取代了

> jQuery充分利用了JS中函数的三种特性：普通函数、类、普通对象；jQuery就是这个类，在外面使用的$和jQuery是一个东西，jQuery中提供的方法分为两部分：写在原型上的方法和写在jQuery私有属性上的方法；创建jQuery实例的时候，会返回一个类数组（它也是jQuery实例），这个类数组是jQuery自己去创建的，里面有一些自己特定的属性

```
//jQuery核心原理
(function(){
    var version="1.11.3",
    jQuery=function(selector,context){
        return jQuery.fn.innt(selector,context);
    };
    
    jQuery.fn=jQuery.prototype={
        //...
        init:function(selector,context){
            
        }
    };
    
    jQuery.ajax=function(){};
    
    window.jQuery=window.$=jQuery;
    
})();

```

- jQuery对象和JS对象相互转换

```
//jQuery对象转换成JS对象
var $obj=$("*");
$obj[0];  //-->JS对象
$obj.get(0);  //-->JS对象
$obj.eq(0)  //-->这个获取的是jQuery对象

//JS对象转换成jQuery对象
var obj=document.getElementsByTagName("*");
$(obj);  //-->jQuery对象
```

- extend

在jQuery对象上和jQuery实例上都有这个方法，并且都是同一个方法，但是这两个方法执行时其this指向不一样，也就是说extend所扩展的方法所在的扩展位置不一样

```
$.extend({
    aa:function(){}
});
$.aa();
//->aa扩展到jQuery的属性上了：完善类库，提供一些常用的操作方法，例如，数组去重...

$.fn.extend({
    bb:function(){}
});
$([select]).bb();
//-->bb扩展到jQuery的原型上了：扩展插件，例如，选项卡、轮播图、登录、验证...
```

##### 2.jQuery的常用方法

- 1）选择器

CSS选择器有哪些，jQuery选择器基本上就有哪些：#ID、.class、tagName、*、selector,selector、parent offspring、parent>child、:first、:last、:not、:contain、:eq、:gt、:lt、:text...

- 2）核心方法
  - $([selector|node|function],[context])
  - $([html])
  - each(callback)
  - get()
  - index()
  - length
  - context
  - selector
  - noConflict()
  - extend()
- 3）属性方法
  - attr()：设置或获取自定义属性值，获取的值是字符串类型的
  - removeAttr()
  - prop()：操作的是元素的内置属性
  - addClass()
  - removeClass()
  - hasClass()
  - toggleClass()
  - html()：获取或设置元素的innerHTML
  - text()：获取或设置元素的innerText
  - val()：获取或设置元素的value值
- 4）CSS方法
  - css()
  - offset()：当前元素距离body的偏移：{top:xxx,left:xxx}
  - position()：当前元素距离父级已定位参照物的偏移
  - scrollTop() / scrollLeft()：获取或者设置滚动值
  - height() / width()：设置或获取元素的宽高
  - innerWidth() / innerHeight()：获取元素的clientHeight/clientWidth
  - outerWidth() / outerHeight()：获取元素的offsetHeight/offsetWidth
- 5）DOM操作方法
  - append()
  - appendTo()
  - prepend()
  - prependTo()
  - insertBefore() / insertAfter()
  - clone()
  - remove()
- 6）筛选方法
  - eq()
  - filter()：同级筛选
  - children()：子级筛选
  - find()：后代筛选
  - first() / last()
  - not()
  - slice()
  - next() / prev()
  - nextAll() / prevAll()
  - sibings()
  - add()
  - contents()
- 7）动画方法
  - animate()
  - stop()
  - finish()
  - show() / hide() / toggle()
  - fadeIn() / fadeOut() / fadeToggle()
  - sliceDown() / sliceUp() / scliceToggle()
  - delay()
- 8）事件方法
  - on() / off()：解决jQuery事件的一切需求，其它方法也是从这个方法里扩展的
  - bind() / unbind() / trigger()
  - one()
  - live() / delegate()
  - click()/hover()/mouseover()...
- 9）工具方法
  - callbacks()
  - makeArray()
  - toArray()
  - parseJSON()
  - parseXML()
  - type()
  - isFunction()
  - trim()
  - param()

```
//只要当前页面的HTML结构加载完成，就会执行回调函数，而且在一个页面中可以执行多次
$(document).ready(function(){
    //<javascript code>

});

$(function(){});  //这种方式和上面的方式一样，没有区别
```

—————————————————————————————————————————————————————

# [锋利的 jQuery (第二版) 认识 jQuery](https://segmentfault.com/a/1190000008097285)

# 第1章 认识 jQuery

## 1.2 jQuery 简介

### 1.2.1 jQuery 团队

现在的 jQuery 团队主要包括 **核心库**、**UI**、**插件** 和 **jQuery Mobile** 等开发人员以及推广和网站设计、维护人员。

### 1.2.2 jQuery 优势

1) 轻量级。 压缩后的 jQuery 大小在 30KB 左右。
2) 强大的选择器。jQuery 支持 CSS 1 --> CSS 3 几乎所有的选择器， 以及jQuery 独有的选择器。引入插件可支持 XPath 选择器。
3) 出色的 DOM 封装。 
4) 可靠的事件处理机制。jQuery 在 **预留退路**、**循序渐进** 以及 **非入侵式** 编程方面做的不错。
5) 完善的 Ajax。
6) 不污染顶级变量。 jQuery 只建立一个名为 jQuery 的对象，其所有的函数方法都在这个对象之下。其别名 **$** 可以随时交出控制权，不会污染其他对象。
7) 出色的浏览器兼容性。
8) 链式操作方式。 对发生在同一个 jQuery 对象的一组动作， 可以直接连写无需重复获取对象。
9) 隐式迭代。 jQuery 的方法被设计成自动操作对象集合而不是单独的对象。
10) 行为层与结构层分离。 可以用 jQuery 选择器选中元素并直接给该元素添加事件。
11) 丰富的插件支持。
12) 完善的文档。
13) 开源。 任何人可以自由使用并提出修改意见。

## 1.3 jQuery 代码的编写

### 1.3.1 jQuery 库对比

表 1-1

| 名称            | 大小     | 说明                            |
| ------------- | ------ | ----------------------------- |
| jquery.js     | 约229KB | 完整无压缩版本，主要用于测试、学习和开发          |
| jquery.min.js | 约30KB  | 经过工具或服务器开启 Gzip 压缩 主要应用于产品和项目 |

### 1.3.2 jQuery 代码

在 jQuery 库中, **$** 是jQuery 的简写形式，如 $("#foo") 等价于 jQuery("#foo")
表 1-2 window.onload 与 $(document).ready() 对比

|      | window.onload                            | $(document).ready()                      |
| ---- | ---------------------------------------- | ---------------------------------------- |
| 执行时机 | 必须等待网页中所有的内容加载完毕后（包括图片）才能执行              | 网页中所有的 DOM 结构绘制完毕后就执行， 可能 DOM 元素关联的东西并没有加载完 |
| 编写个数 | 不能同时编写多个以下代码无法正确执行:window.onload = function() {alert("test1");};window.onload = function() {alert("test2");};结果只输出 “test2” | 能同时编写多个以下代码正确执行:$(document).ready(function() {alert("Hello 1");});$(document).ready(function() {alert("Hello 2");});结果两次都输出 |
| 简化写法 | 无                                        | $(document).ready(function() {//...});可以简写成：$(function() {//...}); |

### 1.3.3 jQuery 代码风格

**1. 链式操作风格**
HTML 结构

```
<!DOCTYPE html>
<html>

<head>
    <title>前端UI</title>
    <link rel="stylesheet" href="style.css">
    <script src="jquery-1.8.3.js"></script>
</head>

<body>
    <div class="box">
        <ul class="menu">
            <li class="level1">
                <a class="base" href="#none">衬衫</a>
                <ul class="level2">
                    <li><a href="#none">短袖衬衫</a></li>
                    <li><a href="#none">长袖衬衫</a></li>
                    <li><a href="#none">短袖T恤</a></li>
                    <li><a href="#none">长袖T恤</a></li>
                </ul>
            </li>
            <li class="level1">
                <a class="base" href="#none">卫衣</a>
                <ul class="level2">
                    <li><a href="#none">开襟卫衣</a></li>
                    <li><a href="#none">套头卫衣</a></li>
                    <li><a href="#none">运动卫衣</a></li>
                    <li><a href="#none">童装卫衣</a></li>
                </ul>
            </li>
            <li class="level1">
                <a class="base" href="#none">裤子</a>
                <ul class="level2">
                    <li><a href="#none">短裤</a></li>
                    <li><a href="#none">休闲裤</a></li>
                    <li><a href="#none">牛仔裤</a></li>
                    <li><a href="#none">免烫卡其裤</a></li>
                </ul>
            </li>
        </ul>
    </div>
</body>
<script>
$(function() {
    $(".level1 > a").click(function() {
        $(this).addClass("current")
            .next().show()
            .parent().siblings().children("a").removeClass("current")
            .next().hide();
    });
});
</script>

</html>
```

CSS 样式

```
ul {
    padding: 0;
}

ul >li {
    list-style-type: none;
}

a {
    text-decoration-line: none;
    text-align: center;
    display: block;
    height: 25px;
    width: 90px;
    color: black;
}

a:active {
    color: #5F9EA0;
}

.box {
    margin: 0 auto;
}

.menu {
    height: 183px;
    width: 92px;
    margin: 0 auto;
}

.base {
    border: 1px solid #272822;
    background-color: #F6F6F6;
}

.level2 {
    display: none;
    border: 1px solid #272822;
}

.level2 li {
    background-color: #fff;
}

.current {
    background-color: #005F3C;
    color: #D2691E;
}

```

代码规范：
(1) 对于同一个对象不超过3个操作的，可以直接写成一行。如：

```
$("li").show().unbind("click");
```

(2) 对一个对象的较多操作，每行写一个操作。如：

```
$(this).removeClass("mouseout")
.addClass("mouseover")
.stop()
.fadeTo("fast", 0.6)
.fadeTo("fast", 1)
.unbind("click")
.click(function(){
// do something
});
```

(3) 对于多个对象的少量操作，每个对象写一行，若涉及子元素，可以考虑适当地使用缩进。如：

```
$(this).removeClass("hightlight")
     .children("li").show().end()
.siblings().removeClass("highlight")
     .children("li").hide();
```

**2. 为代码添加注释**
编写优秀选择器的时候，不要忘记给这段代码加上注释， 这对于自己日后阅读和与他人分享、合作时都能起到良好效果。

```
// 在一个 id 为table 的 tbody 中，对于每一行的一列中的 checkbox 如果没被禁用，将这一行的背景置为红色。
$("#table>tbody>tr:has(td:has(:checkbox:enabled))").css("background","red")
```

## 1.4 jQuery 对象和 DOM 对象

### 1.4.1 DOM 对象和 jQuery 对象简介

**1. DOM 对象 **
DOM（Document Object Model），每一份 DOM 都可以表示成一棵树。
通过 JavaScript 中的 getElementsByTagName或 getElementById 获取元素节点。 像这样得到的 DOM 元素就是 DOM 对象。DOM 对象可以使用 JavaScript 中的方法。

```
var domObj = document.getElementById("id");
var ObjHTML = domObj.innerHTML; // 使用 JavaScript 中的属性----innerHTML
```

**1. jQuery 对象 **
jQuery 对象通过 jQuery 包装 DOM 对象后产生的对象。jQuery 可以使用 jQuery 里的方法。如：

```
$("foo").html()
```

等价于

```
document.getElementById("foo"),innerHTML;
```

jQuery 对象无法使用 DOM对象的任何方法。

### 1.4.2 jQuery 对象和 DOM 对象的相互转换

约定变量定义风格， 如果获取的是 jQuery 对象， 则在变量前加一个 $ 符号。如：

```
var $variable = jQuery 对象；
```

如果是 DOM 对象

```
var variable = DOM 对象；
```

**1. jQuery 对象转 DOM 对象**
[index] 和 get(index)方法
(1) jQuery 对象是一个类似数组的对象，可通过 [index] 方法得到 DOM 对象。

```
var $cr = $("#cr"); // jQuery 对象
var cr = $cr[0]; // DOM 对象
```

(2) 另一种方法为 jQuery 本身提供，通过 get(index) 方法得到 DOM 对象。

```
var $cr = $("#cr"); // jQuery 对象
var cr = $cr.get(0); // DOM 对象
```

**2. DOM　对象转 jQuery 对象 **
对于一个 DOM 对象， 只要用 $() 将 DOM 对象包起来， 就得到一个 jQuery 对象。

```
var cr = document.getElementById("cr"); // DOM 对象
var $cr = $(cr); // jQuery 对象
```

## 1.5 解决 jQuery 和 其他库的冲突

在 jQuery 中， 几乎所有的插件都被限制在它的命名空间里。 jQuery 用 $ 作为自身快捷方式。
**1. jQuery 库在其他库之后导入 **
在其他库和 jQuery 库都被加载完毕后， 可以在任何时候调用 jQuery.noConflict() 函数来将变量 $ 的控制权移交给其他的 JavaScript 库。如：

```
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="prototype.js"></script>
    <script src="../jquery-1.8.3.js"></script>
</head>
<body>
    <div id="id">
        I am a cool gay!(It will be hided!)
    </div>
    <button> Do you agree?(It will be clicked!)</button>
</body>
<script>
    jQuery.noConflict();// 将变量$的控制权移交给prototype.js
    jQuery(function(){// 使用 jQuery
        jQuery("button").click(function(){
            alert(jQuery(this).text())
        });
    });
    $("id").style.display = 'none';// 使用 prototype.js隐藏元素
</script>
</html>
```

也可以自定义快捷方式

```
var $j = jQuery.noConflict();// 将变量$的控制权移交给prototype.js
    $j(function(){// 使用 jQuery，利用自定义快捷方式---$j
        $j("button").click(function(){
            alert($j(this).text())
        });
    });
    $("id").style.display = 'none';// 使用 prototype.js隐藏元素
```

其他方法一:

```
jQuery.noConflict();// 将变量$的控制权移交给prototype.js
    jQuery(function($){// 使用 jQuery 设定页面加载时执行的函数
        $("button").click(function(){// 在函数内部继续使用$()方法
            alert($(this).text())
        });
    });
    $("id").style.display = 'none';// 使用 prototype.js隐藏元素
```

其他方法二:

```
jQuery.noConflict();// 将变量$的控制权移交给prototype.js
    (function($){       // 定义匿名函数并设置形参为 $
        $(function(){   // 匿名函数的$均为 jQuery
            $("button").click(function(){// 继续使用$()方法
               alert($(this).text())
            });
        });
    })(jQuery);  // 执行匿名函数并传递实参 jQuery
    $("id").style.display = 'none';// 使用 prototype.js隐藏元素
```

**2. jQuery 库在其他库之前导入 **
若 jQuery 库在其他库之前导入， 可直接使用 jQuery 做 jQuery 的工作。
同时可使用 $() 方法作为其他库的快捷方式。无需使用 jQuery.noConflict()函数。如：

```
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="../jquery-1.8.3.js"></script>
    <script src="prototype.js"></script>

</head>
<body>
    <div id="id">
        I am a cool gay!(It will be hided!)
    </div>
    <button> Do you agree?(It will be clicked!)</button>
</body>
<script>
    jQuery(function(){// 使用 jQuery, 无需调用 jQuery.noConflict()函数
        jQuery("button").click(function(){
            alert(jQuery(this).text())
        });
    });
    $("id").style.display = 'none';// 使用 prototype.js隐藏元素
</script>
</html>
```







—————————————————————————————————————————————————————



# [锋利的 jQuery (第二版) jQuery 选择器](https://segmentfault.com/a/1190000008127132)

## 2.1 jQuery 选择器的概念

**1. CSS 选择器**
常用 CSS 选择器（几乎所有浏览器都支持的 CSS 选择器）
标签选择器、ID选择器、类选择器、 群组选择器（多个选择器组合）、后代选择器（写法: E F{ }）、通配选择器（写法: *{ }）；
其他 CSS 选择器
伪类选择器（E:PseudoElements{}）、子类选择器（E>F{}）、邻近选择器（E+F{}）和属性选择器（E[attr]{}）。**主流浏览器并非支持所有的 CSS 选择器。**
**1. jQuery 选择器**
jQuery 选择器拥有跨浏览器兼容性。

## 2.2 jQuery 选择器的优势

**1. 简洁**
$() 为多种 javascript 库作为选择器函数使用。
**2. 完善的事件处理机制**
jQuery 在获取网页中并不存在的元素不会报错。
$('')获取的永远是对象，即使网页中并不存在该元素。因而检查某元素在网页是否存在时，不可使用

```
if ($("#a")) {
}
```

应该根据获取元素的长度来判断，

```
if ($("#a").length > 0) {
}
```

或者转化为 DOM 对象

```
if ($("#a")[0]) {
}
```

## 2.3 jQuery 选择器

### 2.3.1 基本选择器

```
$("#ID"), $(".class"), $("tagName"), $("*"), 群组选择器
```

### 2.3.2 层次选择器

```
$("ancestor descendant"), $("parent> child"), $("prex + next"), $("prex ~ siblings")。
```

### 2.3.3 过滤选择器

...

### 2.3.4 表单选择器

...

## 2.5 选择器中的注意事项

### 2.5.1 选择器带有特殊符号， 需要转义

```
$("#id#b") 换成 $("#id\\#b")
```

### 2.5.2 选择器带有空格

```
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <script src="../jquery-1.8.3.js"></script>
</head>

<body>
    <div class="div">
        <div style="display:none;"></div>
        <div style="display:none;"></div>
        <div style="display:none;"></div>
        <div class="div" style="display:none;"></div>
    </div>
    <div class="div">
        <div class="div" style="display:none;"></div>
        <div class="div" style="display:none;"></div>
    </div>
</body>
<script>
$(function() {
    var $a = $(".div :hidden");
    var $b = $(".div:hidden");
    var a_len = $a.length;     // 6
    var b_len = $b.length;     // 3
    alert(a_len);
    alert(b_len);
});
</script>

</html>

```

```
//后代选择器
var $a = $(".div :hidden");   // 选取 class 为 div 的元素里面的隐藏元素。
```

```
//过滤选择器
var $b = $(".div:hidden");   // 选取隐藏的 class 为 div 的元素。
```





—————————————————————————————————————————————————————



# [锋利的 jQuery (第二版) jQuery 中的 DOM 操作](https://segmentfault.com/a/1190000008204908)

DOM 是一种与浏览器、平台、语言无关的接口，使用该接口可以访问到网页容器中的标准组件。
解决 Netspace 的 JavaScript 和 Miscrosoft 的 JScript

## 3.1 DOM 操作的分类

DOM 操作分为 DOM Core(核心)、HTML-DOM 和 CSS-DOM
**1. DOM Core**
任一支持 DOM 的程序设计语言都可以使用 DOM Core。
**2. HTML-DOM**
**3. CSS-DOM**

## 3.2 jQuery 中的 DOM 操作

### 3.2.1 查找节点

**1. 查找元素节点**
**2. 查找属性节点**
attr(param1 [, param2]): 只有一个参数时获得对应属性值，有两个参数时为设置对应属性值。

### 3.2.2 创建节点

**1. 创建元素节点**

```
$(html)
```

**2. 创建文本节点**
**3. 创建属性节点**

### 3.2.3 插入节点

| 方法             | 简述       | 实例   |
| -------------- | -------- | ---- |
| append()       | s        | s    |
| appendTo()     | 追加到指定元素中 |      |
| prepend()      | s        |      |
| prependTo()    | s        |      |
| after()        | s        |      |
| insertAfter()  | s        |      |
| before()       | s        |      |
| insertBefore() | s        |      |

### 3.2.4 删除节点

**1. remove()方法**
作用：从 DOM 删除是所有匹配的元素，传入的参数用于根据 jQuery 表达式来筛选元素。
返回：指向删除节点的引用。
**2. detach()方法**
作用：不会将匹配的元素从 jQuery 对象删除。 所有绑定的事件、附加的数据等都会保存下来。
**3. empty()方法**
作用：清空元素中的所有后代节点。

### 3.2.5 复制节点

**clone()方法**
clone(true) : 复制元素的同时复制元素绑定的事件。
商品拖动功能（将商品加入购物车）用的就是复制节点。

### 3.2.6 替换节点

**1. replaceWith()**
**2. replaceAll()**
替换后需要重新绑定事件

### 3.2.7 包裹节点

**1. wrap()方法**
作用：将所有元素进行单独的包裹。
**2. wrapAll()方法**
作用：将所有匹配的元素用一个元素来包裹。
**3. wrapInner()方法**
将每一个匹配的元素的子内容(包括文本节点)用其他结构化的标记包裹起来。

### 3.2.8 属性操作

**1. 获取属性与设置属性**
attr(param) : 获取属性值
arrr(param1, param2): 设置单个属性
attr(jsonData):设置多个属性
**2. 删除属性** 
removeAttr(param)

### 3.2.9 样式操作

**1. 获取样式与设置样式**
attr("class"):获取样式
attr("class", param):设置样式, 替换之前的样式
**2. 追加样式**
addClass(param)
**3. 移除样式**
removeClass(param)
**4. 切换样式**
toggleClass(param): 若类名存在则删除它， 不存在则添加它。
附加：toggle(function1, function2): 元素原来显示的，则隐藏他；隐藏的则显示它。
**5. 判断是否含有某个样式**
hasClass(param) 等价于 is()方法

```
$("p"),hasClass("my") 等价于 $("p").is(".my")
```

### 3.2.10 设置和获取 HTML、文本和值

**1. html()**
**2. text()**
JavaScript的 innerText 不能在 Firefox 中运行。
**3. val()**

### 3.2.11 遍历节点

**1. childdren()**
作用：取得匹配元素的子元素集合。
**2. next()**
作用：取得匹配元素后面紧邻的同辈元素。
**3. prev()**
作用：取得匹配元素前面紧邻的同辈元素。
**4. siblings()**
作用：取得匹配元素前后所有的同辈元素。
**5. closest(param)**
作用：取得最近的匹配元素。
**6. parent() 和 parents()的区别**
parent() : 返回父级元素。
parents() : 返回祖先元素。

### 3.2.12 CSS-DOM 操作

css(param) : 获取对应属性值。
css(param1, param2) : 设置单个属性。
css(jsonData) : 设置多个属性。若设置属性的值时不带引号，则需要采用驼峰式写法。如

```
$("p").css({fontSize : "20px", backgroundColor : "#fff"});
```

css()获取的高度值与样式的设置有关， 而 height()获取的高度值是样式在页面的实际高度， 与样式设置无关， 并且不带单位。
**1. offset()**
作用：获取元素在当前视窗的相对偏移， 返回对象包括两个属性 top 和 left， 它只对可见元素有效。
**2. position()**
作用：获取元素相对于最近的一个 position 样式属性设置为 relative 或 absolute 的祖父节点的相对位移， 返回对象包括两个属性 top 和 left。
**3. scrollTop()方法和scrollLeft()方法**
作用：获取元素的滚动条距顶端的距离和距左侧的距离。
附加：这两个方法可以指定一个参数， 控制元素的滚动条滚动到指定的位置。

—————————————————————————————————————————————————————



# [锋利的 jQuery (第二版) jQuery 中的 事件](https://segmentfault.com/a/1190000008223980)

## 4.1 jQuery 中的事件

### 4.1.1 加载 DOM

**1. 执行时机**
$(document).ready(function(){}): DOM 完全就绪即执行。
window.onload = function(){} 等价于 $(window).load(function(){}): 所有关联文件加载完才执行。
**2. 多次使用**
**3. 简写方式**
$(function(){}) 或 $().ready(function(){})

### 4.1.2 事件绑定

```
bind(type [, data] , fn): 
type 为事件类型， 包括：blur、focus、load、resize、scroll、unload、click、dbclick、mouse[down, up, move, over, out, enter, leave]、change、select、submit、key[down, press, up]、error。
data 为可选参数， 作为 event.data 属性值传递给事件对象的额外数据对象。
fn 为绑定的处理函数。
```

**3. 多次使用 bind 函数可绑定多个不同事件**
**4. 简写绑定事件**

```
    $(选择器).mouseover(function(){
        // body...
    }).mouseout(function(){
        // body...
    });

```

### 4.1.3 合成事件

**1. hover()方法**
hover(enter, leave): 模拟光标悬停事件， 光标移到元素上方时触发 enter 事件， 光标离开时触发 leave 事件。
**2. toggle()方法**
toggle(fn1, fn2, ...fnN): 模拟鼠标连续点击事件， 点击第1次触发第一个事件， 点击第2次触发第二个事件。随后的点击会重复循环这 N 个事件。

### 4.1.4 事件冒泡

**1. 冒泡的概念**

```
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <link rel="stylesheet" href="">
    <script src="../jquery-1.8.3.js"></script>
</head>

<body>body
    <div id="content">外层div
        <span>
            内部span
        </span>外层div
    </div>
    <div class="msg">
    </div>
</body>
<script>
$(function() {
    $("span").bind("click", function() {
        var text = $(".msg").html() + "<p>这是内部span</p>";
        $(".msg").html(text);
    });
    $("#content").bind("click", function() {
        var text = $(".msg").html() + "<p>这是外层div</p>";
        $(".msg").html(text);
    });
    $("body").bind("click", function() {
        var text = $(".msg").html() + "<p>body被点击</p>";
        $(".msg").html(text);
    });
});
</script>

</html>

```

单击内部 <span> 元素，触发 <span> 元素的 click 事件， 接着触发 div 的 click 事件， 最后触发 body 的 click 事件。
元素的 click 事件会按照如下顺序 “冒泡”：
（1） <span>
（2） <div>
（3） <body>
**2. 事件冒泡引发的问题**
事件对象

```
$(选择器).bind("click", function(event){ //event: 事件对象
     //...
});
```

停止事件冒泡

```
$(选择器).bind("click", function(event){ //event: 事件对象
     //...
     event.stopPropagation();   // 停止事件冒泡
});
```

阻止默认行为

```
$(选择器).bind("click", function(event){ //event: 事件对象
     //...
     event.preventDefault();   // 阻止默认行为
});
```

事件捕获
事件捕获是从最顶端往下开始触发。
由冒泡的例子， 元素的 click 事件会按照以下顺序捕获。
（1） <body>
（2） <div>
（3） <span>
事件捕获需要用原生的 javascript 。

### 4.1.5 事件对象的属性

（1） event.type
作用：获取事件类型。
（2） event.preventDefault()
（3） event.stopPropagation()
（4） event.target
作用：获取到触发事件的元素。
（5） event.relatedTarget
标准 DOM 中， mouseover 和 mouseout 所发生的元素可以通过event.target 来访问， 相关元素是通过 event.relatedTarget 来访问的。
（6） event.pageX 和 event.pageY
作用： 获取光标相对于页面的 x 坐标和 y 坐标。
（7） event.which
作用：在鼠标单击事件中获取到鼠标的左、中、右键；在键盘事件中获取到键盘的按键。

```
$("a").mousedown(function(event){
    alert(event.which);
});
说明：当鼠标指针移动到元素上方，并按下鼠标按键时，会发生 mousedown 事件。
```

（8）event.metaKey
作用：键盘事件中获取 <ctrl> 按键。

### 4.1.6 移除事件

```
unbind([type], [data]):
（1） 没有参数， 删除所有绑定事件；
（2） 只有事件类型作为参数， 删除该类型的绑定事件；
（3） 绑定时传递处理函数作为第二个参数， 则只有这个特定的事件处理函数会被删除。
```

```
one(type, [data], fn):
在每个对象上， 处理函数只会被触发一次， 语法与 bind 相同。
```

### 4.1.7 模拟操作

```
trigger(type, [data]):
第一个参数是要触发的事件类型， 可以是自定义的点击事件， 第二个参数为传递给处理函数的附加数据，以数组方式传递。
```

```
$(".content").bind("myClick", function(event, param1, param2){
   alert(param1 + param2);
});
$(".content").trigger("myClick", ["参数一", "参数二"]);
```

**执行默认操作**
trigger() 方法触发事件后， 会执行浏览器默认操作。
**解决办法**
triggerHandler() 方法， 不执行浏览器默认操作。

### 4.1.8 其他用法

**1. 绑定多个事件类型**
**2. 添加事件命名空间， 便于管理。**

```
$(function() {
    $("div").bind("click.com", function() {
        var text = $(".msg").html() + "<p>这是内部div</p>";
        $(".msg").html(text);
    });
    $("div").bind("mouseover.com", function() {
        var text = $(".msg").html() + "<p>这是外层div</p>";
        $(".msg").html(text);
    });
    $("div").bind("dbclick", function() {
        var text = $(".msg").html() + "<p>body被点击</p>";
        $(".msg").html(text);
    });
    $("p").bind("click", function(){
        $("div").unbind('.com');
    });

});
```

com 命名空间被删除，不在 “com” 的命名空间的 “dbclick” 事件依然有效。
**3. 相同事件名称， 不同命名空间执行方法**
trigger("click!"): 感叹号为匹配所有不在命名空间的 click 事件。

—————————————————————————————————————————————————————



# [锋利的 jQuery (第二版) jQuery 中的 动画](https://segmentfault.com/a/1190000008325456)



## 4.2 jQuery 中的动画

### 4.2.1 show() 和 hide()方法

**show() 和 hide()方法让元素动起来**
show("slow"|"normal"|"fast") 长度分别为600ms、400ms、200ms.
show(1000) 表示在 1000ms 内展示完毕.

### 4.2.2 fadeIn() 和 fadeOut()方法

方法作用：改变元素的不透明度。

### 4.2.3 slideUp() 和 slideDown()方法

方法作用：改变元素的高度。

### 4.2.4 自定义动画方法 animate() 方法

```
animate(params, [speed], [callback]):
1) params 为属性值及其映射，一般为 json 格式;
2) speed 为速度;
3) callback 为动画完成时执行函数。
```

**1. 自定义简单动画**

```
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>jQ-动画</title>
    <style>
    #app {
        position: relative;
        width: 100px;
        height: 100px;
        border: 1px solid #003322;
    }
    </style>
    <script src="../jquery-1.8.3.js"></script>
</head>

<body>
    <div id="app">
    </div>
    <script>
    $(function() {
        $("#app").click(function() {
            $(this).animate({
                left: "100px"
            }, 300);
        });
    });
    </script>
</body>

</html>

```

**2. 累加、累减动画**

```
$(this).animate({left: "+=100px"}, 300); // 离左边距离增加 100px
```

**3. 多重动画**
(1) 同时执行多个动画

```
$(this).animate({left: "+=100px", height: "+=100px"}, 300); // 离左边距离增加 100px 高度增加100px 同时执行
```

(2) 按顺序执行多种动画

```
$(this).animate({left: "+=100px"}, 300); // 离左边距离增加100px  先执行
$(this).animate({height: "+=100px"}, 300); // 高度增加100px     后执行
```

**4. 综合动画**
以上动画效果的混合应用

### 4.2.5 动画回调函数

如果想在动画执行后改变元素的 css 样式， 这时就不能使用 css() 方法， 因为 css() 方法在动画执行之前就会立即执行。 所以这时候就要用到回调函数。

### 4.2.6 停止动画和判断是否处于动画状态

```
stop([clearQueue],[gotoEnd]): clearQueue 和 gotoEnd 只能取 Boolean 值。
clearQueue:  
gotoEnd: 
```

直接使用 stop() 方法，则会立即停止当前正在进行的动画， 如果后续有动画则等待继续进行，以刚才的状态执行动画。

```
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>jQ-动画</title>
    <style>
    #app {
        position: relative;
        width: 100px;
        height: 100px;
        border: 1px solid #003322;
    }
    </style>
    <script src="../jquery-1.8.3.js"></script>
</head>

<body>
    <div id="app">
    </div>
    <script>
    $(function() {
        $("#app").hover(function() {
            $(this).stop()
                .animate({                // 此时触发光标事件则会执行下面的动画，
                    left: "+=100px",      // 而不会执行光标移出时的动画
                }, 1000)    
                .animate({
                    height: "+=100px"
                }, 1000)
        }, function() {
            $(this).stop()
                .animate({
                    left: "-=100px",
                }, 1000)
                .animate({
                    height: "-=100px"
                }, 1000)
        });
    });
    </script>
</body>

</html>

```

—————————————————————————————————————————————————————



# [回味jQuery系列（1）-选择器](https://segmentfault.com/a/1190000006667079)

# jQuery-选择器浅析

jQuery 最核心的组成部分就是：选择器引擎，选择器引擎Sizzle占了jQuery很大一部分。它继承了CSS 的语法，可以对DOM 元素的标签名、属性名、状态等进行快速准确的选择，并且不必担心浏览器的兼容性。jQuery选择器实现了CSS1~CSS3 的大部分规则之外，还实现了一些自定义的选择器，用于各种特殊状态的选择。

### 基础选择器

```
选择类型           选择器                  返回  
元素名         $('div')            获取所有div元素的DOM对象
ID            $('#xzavier')       获取一个ID为box元素的DOM对象
类(class)     $('.xzavier')       获取所有class为box的所有DOM对象
群组选择       $('span,.xzavier')  获取多个选择器的DOM对象
后代选择       $('ul li a')        获取追溯到的多个DOM对象
通配选择       $('*')              获取所有元素标签的DOM对象
后代选择       $('ul li a')        获取追溯到的多个DOM对象
子选择         $('div p')          只获取子类节点的多个DOM对象
next选择       $('div + p')        只获取某节点后一个同级DOM对象
nextAll选择    $('div ~ p')        获取某节点后面所有同级DOM对象

$('#xzavier').find('button')      //等价后代选择器
$('#xzavier').children('button')  //等价子选择器
$('#xzavier').next('button')      //等价next选择器 
$('#xzavier').nextAll('button')   //等价nextAll选择器    
$('#xzavier').prev('button')      //选择同级上一个元素
$('#xzavier').prevAll('button')   //选择同级所有上面的元素
$('#xzavier').prevUntil('button') //选择同级上非指定元素，遇到则停止
$('#xzavier').nextUntil('button') //选择同级下非指定元素，遇到则停止
$('#xzavier').siblings('button')  //选择同级上下所有元素
```

更多：
1.ID返回的是单个元素，而元素标签名和类(class)返回的是多个，我们可以采用jQuery 核心自带的一个属性length 或size()方法来查看返回的元素个数。 
2.ID在页面中是唯一的，一般要求开发者要遵守规范。如果你在页面中出现三次，在CSS使用样式是会成功显示样式的，但在jQuery，就匹配不到后面的ID。
3.在使用上，通配选择器一般用的并不多，尤其是*，比如：$('*')，这种使用方法效率很低，影响性能。 
4.在构造选择器时，尽量简单，只保证必要的确定性。当选择器筛选越复杂，jQuery 内部的选器引擎处理字符串的时间就越长。 
5.注意，find()、next()、nextAll()和children()这四个方法中，如果不传递参数，就相当于传递了“*”，即任何节点。

### 属性选择器

```
对应CSS模式               选择器                            返回
a[title]           $('a[title]')             获取title属性的DOM对象
a[title=num]       $('a[title=num]')         获取title属性且=num的DOM对象
a[title^=num]      $('a[title^=num]')        获取title且开头属性值匹配的DOM对象
a[title|=num]      $('a[title|=num]')        获取title且=num或开头属性值匹配后面跟一个“-”号的DOM对象
a[title$=num]      $('a[title$=num]')        获取title属性且结尾属性值匹配的DOM对象
a[title!=num]      $('a[title!=num]')        获取title属性且!=num的DOM对象
a[title~=num]      $('a[title~=num]')        获取title且属性值是以一个空格分割的列表，其中包含属性值的DOM对象
a[title*=num]      $('a[title*=num]')        获取title且属性值含有一个指定字串的DOM对象
a[xz][title=num]   $('a[xz][title=num]')     获取具有bbb属性且title属性=num的DOM对象
```

### 过滤选择器

#### 基本过滤选择器

```
过滤器名          jQuery              返回       
:first         $('li:first')     选取第一个元素     
:last          $('li:last')      选取最后一个元素   
:not(selector) $('li:not(.xzavier)') 选取class不是xzavier的li元素
:even          $('li.even')      选择索引(0 开始)是偶数的所有元素
:odd           $('li:odd')       选择索引(0 开始)是奇数的所有元素
:eq(index)     $('li:eq(2)')     选择索引(0 开始)等于index的元素
:gt(index)     $('li:gt(2)')     选择索引(0 开始)大于index的元素
:lt(index)     $('li.lt(2)')     选择索引(0 开始)小于index的元素
:header        $(':header')      选择标题元素，h1 ~ h6 
:animated      $(':animated')    选择正在执行动画的元素
:focus         $(':focus')       选择当前被焦点的元素
```

更多：
1.:focus 过滤器，必须是网页初始状态的已经被激活焦点的元素才能实现元素获取。而不是鼠标点击或者Tab键盘敲击激活的。
2.:first、:last 和first()、last()这两组过滤器和方法在出现相同元素的时候，first 会实现第一个父元素的第一个子元素，last 会实现最后一个父元素的最后一个子元素。所以，如果需要明确是哪个父元素。

#### 内容过滤器

```
过滤器名                jQuery                        返回
:contains(text)  $(':contains("xzavier")')  选取含有"xzavier"文本的元素
:empty           $(':empty')                选取不包含子元素或空文本的元素
:has(selector)   $(':has(.xzavier)')        选取含有class是xzavier的元素
:parent          $(':parent')               选取含有子元素或文本的元素
```

更多：
1.jQuery 提供了一个has()方法来提高:has 过滤器的性能：$('ul').has('.xzavier')
2.jQuery 提供了一个名称和:parent 相似的方法，但这个方法并不是选取含有子元素或文本的元素，而是获取当前元素的父元素，返回的是元素集合

#### 可见性过滤器

```
过滤器名      jQuery            返回
:hidden    $(':hidden')    选取所有不可见元素集合元素
:visible   $(':visible')   选取所有可见元素集合元素
```

更多：
1.:hidden 过滤器一般是包含的内容为：CSS 样式为display:none、input 表单类型为type="hidden"和visibility:hidden 的元素

#### 子元素过滤器

```
过滤器名             jQuery                   返回
:first-child   $('li:first-child')   获取每个父元素的第一个子元素
:last-child    $('li:last-child')    获取每个父元素的最后一个子元素
:only-child    $('li:only-child')    获取只有一个子元素的元素
:nth-child(odd/even/eq(index))  $('li:nth-child(even)')    获取每个自定义子元素的元素(索引值从1开始计算)

```

#### 过滤方法

```
方法名                 jQuery                               备注
is(s/o/q/f)       $('li').is('.red')           参数可传递选择器、DOM、jquery对象或是函数来匹配
hasClass(class)   $('li').hasClass('xzavier')  同is("." + class)
slice(start, end) $('li').slice(0,2)           选择从start到end位置的元素，如果是负数，则从后面开始
filter(s/o/q/f)   $('li').filter('.xzavier')   参数可传递选择器、DOM、jquery对象或是函数来匹配
end()             $('div').find('p').end()     获取当前元素前一次状态集合元素
contents()        $('div').contents()          获取某元素下面所有元素节点，包括文本节点
```

### 表单元素选择器

```
选择器名         jQuery               返回
:input       $(":input")       所有 <input> 元素
:text        $(":text")        所有 type="text" 的 <input> 元素
:password    $(":password")    所有 type="password" 的 <input> 元素
:radio       $(":radio")       所有 type="radio" 的 <input> 元素
:checkbox    $(":checkbox")    所有 type="checkbox" 的 <input> 元素
:submit      $(":submit")      所有 type="submit" 的 <input> 元素
:reset       $(":reset")       所有 type="reset" 的 <input> 元素
:button      $(":button")      所有 type="button" 的 <input> 元素
:image       $(":image")       所有 type="image" 的 <input> 元素
:file        $(":file")        所有 type="file" 的 <input> 元素      
:enabled     $(":enabled")     所有激活的 input 元素
:disabled    $(":disabled")    所有禁用的 input 元素
:selected    $(":selected")    所有被选取的 input 元素
:checked     $(":checked")     所有被选中的 input 元素
```

更多：
1.这些选择器都是返回元素集合，如果想获取某一个指定的元素，最好结合一下属性选择器。

```
$(':text[name=xzavier]); //获取单行文本框name=xzavier 的元素
```

我们在使用中，不会所有标签都有id，使用起来也不方便，代码冗杂。综合组合很多选择器使用，选到特定的元素，也是非常方便的。

—————————————————————————————————————————————————————

# [回味jQuery系列（2）-动画效果](https://segmentfault.com/a/1190000006740827)

## jQuery-动画效果浅析

动画可以给网站的用户体验加分，让网页更加活泼。不过，什么东西都需要适量，简易快捷的动画会给网站加分不少。比如购物网站的个人中心按钮hover效果啊，各种hover产生的动画等。不过，现在CSS3的新特性可以模拟很多动画，可以多用CSS3去实现一些动画效果了。比如box-shadow，text-shaow，animation，transform等。jquery作为全明星级别插件，是有很强的动画功能的。

### 全局属性

jQuery在动画中提供了两个全局属性（不常在代码中使用），分别为：
$.fx.interval，设置每秒运行的帧数，默认13ms，越小越流畅，但太小耗费浏览器性能
$.fx.off，关闭页面上所有的动画，浏览器不支持动画时可以全部关掉。

```
$.fx.interval = 100; //默认为13
$.fx.off = true; //默认false
```

那么，我们看看jquery都提供了哪些动画方法。

### 显示&&隐藏

jQuery 中显示方法为：.show(speed,callback)，隐藏方法为：.hide(speed,callback)。在无参数的时候，只是硬性的显示内容和隐藏内容。

```
$('.show').click(function () { 
    $('.xzavier').show();
});
$('.hide').click(function () { 
    $('.xzavier').hide();
});
```

两个可选参数。参数speed，毫秒，表示运动所花时间，用速度来说更切合动画一词。可以是number，也可以是这个三个参数字符串：slow、normal 和fast，分别对应600ms、400 ms和200ms。如果传参错误或者不传，默认normal，即400ms。参数callback代表回调函数。

```
$('.show').click(function () {
    $('.xzavier').show('fast'); 
});
$('.show').click(function () {
    $('.xzavier').show('');   //normal
});

$('.show').click(function () {
    $('.xzavier').show('fast', function () {
        console.log('animation is over');  //其他可执行代码
    });
});
```

原理上，.hide(speed,callback)方法其实就是在行内设置CSS 代码：display:none; 而.show(speed,callback)方法要根据原来元素是区块还是内联来决定，如果是区块，则设置CSS 代码：display:block; 如果是内联，则设置CSS 代码：display:inline。

.show()和.hide()的在同一元素的时候，需要一个按钮切换操作，或者需要进行一些条件判
断。而jQuery 提供给我们一个类似功能的独立方法：.toggle(speed,callback)，自动切换。

```
$('.toggle').click(function () {
    $(this).toggle('fast');
});
```

### 收缩&&展开

jQuery 提供了一组改变元素高度的方法：.slideUp(speed,callback)，向上收缩、.slideDown(speed,callback)，向下展开和.slideToggle(speed,callback)，自动切换。

```
$('.slidedown').click(function () {
    $('.xzavier').slideDown('slow');
});
$('.slideup').click(function () {
    $('.xzavier').slideUp();
});
$('.slidetoggle').click(function () {
    $('.xzavier').slideToggle('fast');
});

```

### 淡入&&淡出

jQuery 提供了一组专门用于透明度变化的方法：.fadeIn(speed,callback)，淡入、.fadeOut(speed,callback)，淡出、.fadeToggle(speed,callback)，自动切换。

```
$('.fadein').click(function () {
    $('.xzavier').fadeIn('slow');
});
$('.fadeout').click(function () {
    $('.xzavier').fadeOut();
});
$('.fadetoggle').click(function () {
    $('.xzavier').fadeToggle('fast');
});
```

这三个方法只能透明度变化只能从0 到100，或者从100 到0。不能自己设定变化到一个值。不过，jQuery提供了.fadeTo(speed,opacity，callback)方法解决了这个问题。

```
$('.fadeto').click(function () {
    $('.xzavier').fadeTo('1000', 0.4); //0.4代表上面方法的30
});
```

如果本身透明度大于指定值，会淡出，否则相反。

### 自定义动画

jQuery提供了几种简单常用的固定动画方法供开发使用。随着业务逻辑的复杂，这些简单动画无法满足我们更加复杂的需求。这时，开发可以使用jQuery提供了一个.animate(params,speed,easing,callback);方法来创建我效果更为复杂的自定义动画。
参数为：CSS变化样式的对象（必传），速度（可选），回调函数（可选）。easing后面解释。

```
.xzavier {width:200px;height:100px;opacity:1;}
$('.animate').click(function () {
    $('.xzavier').animate({
        'width' : '800px',
        'height' : '400px',
        'opacity' : 0.3
    });
});
```

class为xzavier的盒子多重动画同步运动。变宽，变长，变淡。

```
$('.animate').click(function () {
    $('.xzavier').animate({
        'top' : '400px', 
        'left' : '200px'
    });
});

```

如果元素位置需要运动变化，需要设置元素的position为absolute。

jQuery还提供了自定义动画的累加、累减功能。

```
$('.animate').click(function () {
    $('.xzavier').animate({
        'top' : '+=100px',
        'left' : '+=100px'
    });
});
```

包括jquery固定的几个动画在内，都有可选参数easing，即运动方式，seasing有两个值：swing(缓动)、linear(匀速)，默认为swing。不过这个参数很少用到O(∩_∩)O~

```
$('.animate').click(function () {
    $('.xzaiver').animate({
        left : '800px'
    }, 'slow', 'swing');
    $('.xzavier').animate({
        top : '40px'
    }, 'fast', 'linear');
});

```

### 列队动画

自定义实现列队动画的方式，有3种：
1.在回调函数中再执行一个动画

```
$('.animate').click(function () {
    $('.xzavier').animate({
        'left' : '800px'
    }, function () {
        $('.xzavier').animate({
            'top' : '400px'
        }, function () {
            $('.xzavier').animate({
                'opacity' : 0.3
            });
        });
    });
});

```

2.通过连缀来实现列队动画

```
$('.animate').click(function () {
    $('.xzavier').animate({
        'left' : '800px'
    }).animate({
        'top' : '400px'
    }).animate({
        'opacity' : 0.3
    });
});

```

3.通过顺序来实现列队动画（需要时同一元素动画，否则，就是同步动画）

```
$('.animate').click(function () {
    $('.xzavier').animate({'left' : '100px'});
    $('.xzavier').animate({'top' : '100px'});
    $('.xzavier').animate({'opacity' : 0.3});
});
```

这样来看，我们更倾向于后面两种写法，因为嵌套多了就出现了}}}}}}}}}}

### 连缀非动画方法

先看个问题：

```
//连缀
$('.xzavier').slideUp().slideDown().css('background', '#ccc');
```

这里面css方法并不是动画方法，不会排在列队之后执行，但是，我们又需要它在前面动画执行之后再执行。这是，肯定会想到采用回调函数来解决。

```
$('.xzavier').slideUp().slideDown(function () {
    $(this).css('background', '#ccc');
});
```

确实可以解决问题，但是当列队动画变多时，回调函数}}}}}}}}}}的可读性大大降低确实一个非常烦人的问题。jQuery 提供了一个类似于回调函数的方法：.queue()。.queue()方法将css方法跟随动画方法之后。如果还需继续调用动画方法，使用.dequeue()方法。

```
$('.xzavier').slideUp();
$('.xzavier').slideDown();
$('.xzavier').queue(function () {
    $(this).css('background', '#ccc');
    $(this).dequeue();
})
$('.xzavier').hide('slow');
```

### 停止动画&&延迟动画

停止正在运行中的动画：.stop()方法。可选参数：clearQueue, gotoEnd。clearQueue 传递一个布尔值，代表是否清空未执行完的动画列队，gotoEnd 代表是否直接将正在执行的动画跳转到末状态。

```
$('.stop').click(function () {
    $('.xzavier').stop(true ,true);
});
```

延迟执行动画：.delay()方法。可以在动画之前设置延迟，也可以在列队动画设置。

```
$('.animate').click(function () {
    $('.xzavier').delay(1000).animate({
        'opacity' : 0.3
    }, 1000);
    $('.xzavier').delay(1000).animate({
        'width' : '800px'
    }, 1000);
    $('.xzavier').animate({
        'height' : '400px'
    }, 1000);
});

```

______________________________________________________________________________________________________

# 每个前端应该知道的jquery 细节

## 一组简单的小技巧收集,让你玩转jquery

### 1.回到顶部

不需要其他插件,简单通过使用jquery 中的 `animate` and `scrollTop` 方法,就能实现

```
// 回到顶部
$('a.top').click(function (e) {
  e.preventDefault();
  $(document.body).animate({scrollTop: 0}, 800);
});
```

```
<!--创建一个回到顶部的按钮 -->
<a class="top" href="#">Back to top</a>
```

通过 改变`scrollTop`的值控制滚动条到达哪个位置

### 2.预加载图片

如果你的页面有很多图片,并且默认情况下是看不到的,当你鼠标移动过的时候才出现,这时候就需要 预加载功能

```
$.preloadImages = function () {
  for (var i = 0; i < arguments.length; i++) {
    $('img').attr('src', arguments[i]);
  }
};

$.preloadImages('img/hover-on.png', 'img/hover-off.png');
```

### 3.检测图片是否加载完成

有时候你需要去知道图片是否真正加载完成.

```
$('img').load(function () {
  console.log('image load successful');
});
```

### 4.优雅处理加载不成功的图片

使用一张默认的图片来代替加载不成功的 图片

```
$('img').on('error', function () {
  $(this).prop('src', 'img/broken.png');
});
```

### 5.Hover事件切换类

```
$('.btn').hover(function () {
  $(this).addClass('hover');
  }, function () {
    $(this).removeClass('hover');
  });
```

混合写法,

```
$('.btn').hover(function () {
  $(this).toggleClass('hover');
});
```

### 6.禁用一个表单元素

比如有时候 ,只想提交一次表单,就可以设置禁用

```
$('input[type="submit"]').prop('disabled', true);
```

如果想解禁 ,

```
$('input[type="submit"]').prop('disabled', false);
```

### 7.阻止超链接的默认行为

有时候我们常常用超链接作为按钮,但是超链接本身是有链接 会跳转的,假如我们不想要跳转的时候 就需要阻止默认行为

```
$('a.no-link').click(function (e) {
  e.preventDefault();
});
```

### 8.fade(渐入渐出)效果和slide(下拉收起)效果的切换

```
// 渐入渐出
$('.btn').click(function () {
  $('.element').fadeToggle('slow');
});
// 下拉收起
$('.btn').click(function () {
  $('.element').slideToggle('slow');
});
```

### 9.动态设置两个div的高度一样

不管他们的内容怎样 他们的高度都会保持一致

通过css设置 最低高度值,

```
$('.div').css('min-height', $(.main-div).height());
```

无论内容是什么 都保持高度一致

```
var $columns = $('.column');
var height = 0;
$columns.each(function () {
  if ($(this).height() > height) {
    height = $(this).height();
  }
});
$columns.height(height);
```

遍历设置一序列的元素的高度统一

```
var $rows = $('.same-height-columns');
$rows.each(function () {
  $(this).find('.column').height($(this).height());
});
```

### 10.新的标签或者窗口打开外部链接

```
$('a[href^="http"]').attr('target','_blank');
$('a[href^="//"]').attr('target','_blank');
$('a[href^="'+window.location.origin+'"]').attr('target','_self');
```

**注意:** `window.location.origin` 不兼容IE10 [解决方案](http://tosbourn.com/a-fix-for-window-location-origin-in-internet-explorer/)

### 11.根据内容来寻找元素

通过 jquery的`contains()`方法

```
var search = $('#search').val();
$('div:not(:contains("'+search+'"))').hide();//表示如果没有包含search内容的都隐藏
```





