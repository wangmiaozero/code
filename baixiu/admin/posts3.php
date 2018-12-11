
<?php
//    一定要记得使用session就必须先开启
/*session_start();

if(!isset($_SESSION["isLogin"]) || $_SESSION["isLogin"]!=1){
    header("Location:login.php");
}*/

require_once "../config.php";
require_once "../function.php";

checkLogin();
?>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>Posts &laquo; Admin</title>
  <link rel="stylesheet" href="../static/assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="../static/assets/vendors/font-awesome/css/font-awesome.css">
  <link rel="stylesheet" href="../static/assets/vendors/nprogress/nprogress.css">
  <link rel="stylesheet" href="../static/assets/css/admin.css">
  <script src="../static/assets/vendors/nprogress/nprogress.js"></script>
</head>
<body>
  <script>NProgress.start()</script>

  <div class="main">
   <!-- <nav class="navbar">
      <button class="btn btn-default navbar-btn fa fa-bars"></button>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="profile.php"><i class="fa fa-user"></i>个人中心</a></li>
        <li><a href="login.php"><i class="fa fa-sign-out"></i>退出</a></li>
      </ul>
    </nav>-->

      <?php require_once "public/_header.php" ?>
    <div class="container-fluid">
      <div class="page-title">
        <h1>所有文章</h1>
        <a href="post-add.php" class="btn btn-primary btn-xs">写文章</a>
      </div>
      <!-- 有错误信息时展示 -->
      <!-- <div class="alert alert-danger">
        <strong>错误！</strong>发生XXX错误
      </div> -->
      <div class="page-action">
        <!-- show when multiple checked -->
        <a class="btn btn-danger btn-sm" href="javascript:;" style="display: none">批量删除</a>
        <form class="form-inline">
          <select name="" class="form-control input-sm">
            <option value="">所有分类</option>
            <option value="">未分类</option>
          </select>
          <select name="" class="form-control input-sm">
            <option value="">所有状态</option>
            <option value="">草稿</option>
            <option value="">已发布</option>
          </select>
          <button class="btn btn-default btn-sm">筛选</button>
        </form>
        <ul class="pagination pagination-sm pull-right">
         <!-- <li><a href="#">上一页</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">下一页</a></li>-->
        </ul>
      </div>
      <table class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th class="text-center" width="40"><input type="checkbox"></th>
            <th>标题</th>
            <th>作者</th>
            <th>分类</th>
            <th class="text-center">发表时间</th>
            <th class="text-center">状态</th>
            <th class="text-center" width="100">操作</th>
          </tr>
        </thead>
        <tbody>
          <!--<tr>
            <td class="text-center"><input type="checkbox"></td>
            <td>随便一个名称</td>
            <td>小小</td>
            <td>潮科技</td>
            <td class="text-center">2016/10/07</td>
            <td class="text-center">已发布</td>
            <td class="text-center">
              <a href="javascript:;" class="btn btn-default btn-xs">编辑</a>
              <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
            </td>
          </tr>
          <tr>
            <td class="text-center"><input type="checkbox"></td>
            <td>随便一个名称</td>
            <td>小小</td>
            <td>潮科技</td>
            <td class="text-center">2016/10/07</td>
            <td class="text-center">已发布</td>
            <td class="text-center">
              <a href="javascript:;" class="btn btn-default btn-xs">编辑</a>
              <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
            </td>
          </tr>
          <tr>
            <td class="text-center"><input type="checkbox"></td>
            <td>随便一个名称</td>
            <td>小小</td>
            <td>潮科技</td>
            <td class="text-center">2016/10/07</td>
            <td class="text-center">已发布</td>
            <td class="text-center">
              <a href="javascript:;" class="btn btn-default btn-xs">编辑</a>
              <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
            </td>
          </tr>-->
        </tbody>
      </table>
    </div>
  </div>

  <!--<div class="aside">
    <div class="profile">
      <img class="avatar" src="../static/uploads/avatar.jpg">
      <h3 class="name">布头儿</h3>
    </div>
    <ul class="nav">
      <li>
        <a href="index.php"><i class="fa fa-dashboard"></i>仪表盘</a>
      </li>
      <li class="active">
        <a href="#menu-posts" data-toggle="collapse">
          <i class="fa fa-thumb-tack"></i>文章<i class="fa fa-angle-right"></i>
        </a>
        <ul id="menu-posts" class="collapse in">
          <li class="active"><a href="posts.php">所有文章</a></li>
          <li><a href="post-add.php">写文章</a></li>
          <li><a href="categories.php">分类目录</a></li>
        </ul>
      </li>
      <li>
        <a href="comments.php"><i class="fa fa-comments"></i>评论</a>
      </li>
      <li>
        <a href="users.php"><i class="fa fa-users"></i>用户</a>
      </li>
      <li>
        <a href="#menu-settings" class="collapsed" data-toggle="collapse">
          <i class="fa fa-cogs"></i>设置<i class="fa fa-angle-right"></i>
        </a>
        <ul id="menu-settings" class="collapse">
          <li><a href="nav-menus.php">导航菜单</a></li>
          <li><a href="slides.php">图片轮播</a></li>
          <li><a href="settings.php">网站设置</a></li>
        </ul>
      </li>
    </ul>
  </div>-->

  <?php

    $current_page="posts";
  ?>
  <?php require_once "public/_aside.php" ?>
  <script src="../static/assets/vendors/jquery/jquery.js"></script>
  <script src="../static/assets/vendors/bootstrap/js/bootstrap.js"></script>
  <script>NProgress.done()</script>

  <script>
      var statusData={
          drafted:"草稿",
          published:"已发布",
          trashed:"已作废"
      };

      $(function(){
          $.ajax({
              url:"api/_getPostsData.php",
              type:"post",
              success:function(res){
                  if(res.code==1){
                      var  data=res.data;
                      console.log(data);
                      $.each(data,function(index,val){
                          var  str='<tr>\n' +
                              '  <td class="text-center"><input type="checkbox"></td>\n' +
                              '  <td>'+val.title+'</td>\n' +
                              '  <td>'+val.nickname+'</td>\n' +
                              '  <td>'+val.name+'</td>\n' +
                              '  <td class="text-center">'+val.created+'</td>\n' +
                              '  <td class="text-center">'+statusData[val.status]+'</td>\n' +
                              '  <td class="text-center">\n' +
                              '    <a href="javascript:;" class="btn btn-default btn-xs">编辑</a>\n' +
                              '    <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>\n' +
                              '  </td>\n' +
                              '</tr>';

                          $(str).appendTo('tbody');
                      });
                  }
              }
          })
      })

      /*动态生成分页*/
      var  html="";
      var currentPage=1;
      /*根据当前页计算起始页和结束页的页码*/
      // 开始页=当前页-2
      // 结束页=当前页+4
      var start=currentPage-2;
      var end=currentPage+4;
      //如果开始的页码数小于1的，强制控制从1开始
      if(start<1){
          start=1;
      };

      html+='<li><a href="#">上一页</a></li>';
      for(var i = start ; i <= end; i++){
          if(i==currentPage){
              html+='<li class="item active"><a href="#">'+i+'</a></li>';
          }else{
              html+='<li><a href="#">'+i+'</a></li>';
          };
      };
      html+='<li><a href="#">下一页</a></li>';
      $(".pagination").html(html);

  </script>
</body>
</html>
