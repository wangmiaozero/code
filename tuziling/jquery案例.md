# 案例

## 1.添加元素

```js

        //需求:点击按钮,在div中创建一个超链接
        $(function () {
            var i=0;
            $("#btn").click(function () {
                i++;
                //创建元素
                var aObj=$("<a href='http://www.baidu.com'>百度"+i+"</a>");
                //把元素添加到div中
               // $("#dv").append(aObj);//把超链接追加到div中

                //把元素插入到某个元素的前面
                //$("#dv").prepend(aObj);
                //把元素添加到当前元素的后面(兄弟元素来添加)
                //$("#dv").after(aObj);
                //把元素添加到当前元素的前面(兄弟元素来添加)
                //$("#dv").before(aObj);

            });
        });
```

## 2.自定义属性

```js
  $(function () {
            //点击按钮,在div中添加一个超链接,设置超链接的title属性和热点文字,地址
            $("#btn").click(function () {
                //获取div,创建超链接
                var aObj=$("<a></a>");
                //attr();可以写两个参数:1参数；属性,2属性值
                //attr();只写了一个参数,获取该元素的这个属性的值
                aObj.attr("title","传智播客好帅");
                aObj.attr("href","http://www.itcast.cn");
                aObj.text("传智播客");
                $("#dv").append(aObj);
                console.log(aObj.attr("href"));

            });
        });
    </script>
```

## 3.下拉菜单

```js
 $(function () {
            //获取.wrap下面的ul中的li,注册鼠标进入和离开的事件
            $(".wrap>ul>li").mouseover(function () {
                //鼠标进入
                $(this).children("ul").stop().show(500);//显示
            });
            $(".wrap>ul>li").mouseout(function () {
                //鼠标离开
                $(this).children("ul").stop().hide(500);//显示
            });
            //.stop()方法用来停止动画
        });
```

## 4.权限选择

```js
$(function(){
            $('#toRight').click(function(){
               $('#se2').append($('#se1>option:selected'));
               $('#se2>option').prop('selected',false);
            });
            $('#toLeft').click(function(){
                $('#se1').append($('#se2>option:selected'));
                $('#se1>option').prop('selected',false);
            });
            $('#toAllRight').click(function(){
                $('#se2').append($('#se1>option'));
                $('#se2>option').prop('selected',false);
            });
            $('#toAllLeft').click(function(){
                $('#se1').append($('#se2>option'));
                $('#se1>option').prop('selected',false);
            })
        });
```

## 5.开关灯

```js
<script>
        $(function(){
            $('#btn').click(function(){
               $('body').toggleClass('current')
            });
        });
    </script>
```

## 6.动画

```js
 <script>
         $(function(){
             $('input').click(function(){
                 $('.box').animate({
                     'left':'300px',
                     'top':'400px'
                 },1000);
             });
         });
     </script>
```

## 7.高亮

```js
$('.wrap>ul>li').mouseover(function(){
                $(this).siblings('li').css('opacity',0.5);
                $(this).css('opacity',1);
            });
           
```

## 8.tab

```js
  $(function(){
            $('#left>li').mouseover(function(){
                var index=$(this).index();
                $('#center>li:eq('+index+')').siblings('li').hide();
                $('#center>li:eq('+index+')').show();
            });
            $('#right>li').mouseover(function(){
                var index=$(this).index()+9;
                $('#center>li:eq('+index+')').siblings('li').hide();
                $('#center>li:eq('+index+')').show();

            });
        })
```

## 9.复选框

```js
  $(function(){
            $('#btn').click(function(){
                var flag=$('#ck').prop('checked');
                if(flag){
                    $('#ck').prop('checked',false);
                }else{
                    $('#ck').prop('checked',true);
                }
            });
        });
```

## 10.全选,不全选

```js
  $(function(){
            $('#btnAll').click(function(){
                $('#dv :checkbox').prop('checked',true);
            });
            $('#btnNoAll').click(function(){
                $('#dv :checkbox').prop('checked',false);
            });
        });
```

## 11.全选反选

```js
 $(function () {
            //先获取j_cbAll的这个复选框,注册点击事件,点击的时候让下面tbody中所有的复选框选中和不全选
            //让tbody中所有的复选框的选中状态和当前的这个全选的复选框的选中状态一致
            $("#j_cbAll").click(function () {
                var cked=$(this).prop("checked");//保存当前复选框的选中状态
                //获取tbody中所有的复选框
                $("#j_tb").find(":checkbox").prop("checked",cked);
            });

            //获取tbody中所有的复选框
            $("#j_tb").find(":checkbox").click(function () {
               //先获取tbody中所有的复选框的个数
                var length1=$("#j_tb").find(":checkbox").length;
                //再获取tbody中所有选中的复选框的个数
                var length2=$("#j_tb").find(":checked").length;
                //二者比较,如果相同,让最上面的复选框选中,否则不选中
                if(length1==length2){
                    //都选中了
                    $("#j_cbAll").prop("checked",true);
                }else{
                    //有没选中
                    $("#j_cbAll").prop("checked",false);
                }
            });
        });
```

## 12.手风琴

```js
 $(function () {
            //获取所有的li标签,注册进入和离开事件
            $("#box>ul>li").mouseover(function () {
                $(this).siblings("li").css("width","100px");
                $(this).css("width","800px");
            });
            $("#box>ul>li").mouseout(function () {
                //find("条件")获取的是调用该方法的对象中的所有的元素
                //内部循环,外部不需要写循环,隐式迭代
                $(this).parent().find("li").css("width","240px");
            });
        });
```

