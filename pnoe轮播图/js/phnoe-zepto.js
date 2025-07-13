$(function (){ 
    //获取宽度  
    var bannerWidth=$(".jd_banner").width();
    //console.log(banner);
    //获取第一个ul
    var imgBox=$(".jd_banner").find("ul:first-of-type");
    //获取圆点
    var dian=$(".jd_bannerIndicator").find("li");
    //获取第一个元素和最后一个元素
    var first=imgBox.find("li:first-of-type");
    var last=imgBox.find("li:last-of-type");
    //添加元素
   // imgBox.append(first.clone());
    //last.clone().insertBefore(first);
    
    
    
 })