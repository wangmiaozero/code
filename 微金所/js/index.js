$(function () {
    //获取元素
    var items=$(".carousel-inner .item");
    /*当屏幕发生改变时执行 */
    $(window).on("resize",function(){
        /*获取屏幕的宽度 */
        var width=$(window).width();
        //判断
        if(width>=768){
            $(items).each(function (index,value) {
                var item=$(value);
                var imgsrc=item.data("largeImage");
                $(item).html($(' <a href="javascript:;" class="pcImage"></a>').css('backgroundImage','url("'+imgsrc+'")'));
                
              })
        }else{
            $(items).each(function (index,value) {
                var item=$(this);
                var imgsrc=item.data("smallImage");
                item.html('<a href="javascript:;" class="mobileImg"><img src="'+imgsrc+'" alt=""></a>')
              })
        }
        
        
    }).trigger("resize");
    
  })