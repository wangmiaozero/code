
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
  <title>Comments &laquo; Admin</title>
  <link rel="stylesheet" href="../static/assets/vendors/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="../static/assets/vendors/font-awesome/css/font-awesome.css">
  <link rel="stylesheet" href="../static/assets/vendors/nprogress/nprogress.css">
  <link rel="stylesheet" href="../static/assets/css/admin.css">
  <script src="../static/assets/vendors/nprogress/nprogress.js"></script>
</head>
<body>
  <script>NProgress.start()</script>

  <div class="main">
    <?php include_once 'public/_header.php'; ?>
    <div class="container-fluid">
      <div class="page-title">
        <h1>所有评论</h1>
      </div>
      <!-- 有错误信息时展示 -->
      <!-- <div class="alert alert-danger">
        <strong>错误！</strong>发生XXX错误
      </div> -->
      <div class="page-action">
        <!-- show when multiple checked -->
        <div class="btn-batch" style="display: none">
          <button class="btn btn-info btn-sm">批量批准</button>
          <button class="btn btn-warning btn-sm">批量拒绝</button>
          <button class="btn btn-danger btn-sm">批量删除</button>
        </div>
        <!-- 分页插件 -->
        <ul class="pagination pagination-sm pull-right">
          <!-- <li><a href="#">上一页</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">下一页</a></li> -->
        </ul>
      </div>
      <table class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th class="text-center" width="40"><input type="checkbox"></th>
            <th>作者</th>
            <th>评论</th>
            <th>评论在</th>
            <th>提交于</th>
            <th>状态</th>
            <th class="text-center" width="100">操作</th>
          </tr>
        </thead>
        <tbody>
          
        </tbody>
      </table>
    </div>
  </div>
  
  <?php $current_page = 'comments' ?>
  <?php include_once 'public/_aside.php'; ?>

  <script src="../static/assets/vendors/jquery/jquery.js"></script>
  <script src="../static/assets/vendors/bootstrap/js/bootstrap.js"></script>
    <!-- 分页插件 -->
  <script src="../static/assets/vendors/twbs-pagination/jquery.twbsPagination.min.js"></script>
  <script>NProgress.done()</script>
  <script src="../static/assets/vendors/art-template/template-web.js"></script>
  <script type="text/art-template" id="temlate">
  {{each $data  value}}
      <tr>
          <td class="text-center"><input type="checkbox"></td>
          <td>{{value.author}}</td>
          <td style="width:400px">{{value.content}}</td>
          <td>{{value.title}}</td>
          <td>{{value.created}}</td>
          <td>
              {{if value.status == "held"}}
                未审核
              {{else if value.status == "approved"}}
                已准许
              {{else if value.status == "rejected"}}
                已拒绝
              {{else if value.status == "trashed"}}
                已删除
              {{/if}}
          </td>
          <td class="text-center">
              <a href="post-add.php" class="btn btn-warning btn-xs">驳回</a>
              <a href="javascript:;" class="btn btn-danger btn-xs">删除</a>
          </td>
      </tr>
      {{/each}}
  </script>
  <script>
    $(function(){
      var currentPage=1;//当前页
      var pageSize=10;//当前显示多少条

      var pageCount;//获取当前总页数
      //一开始就加数据
      getCommentsData();
      function getCommentsData(){
        //模板引擎展示数据
        $.ajax({
          url:"./api/_getCommentsData.php",
          type:"POST",
          data:{
            currentPage:currentPage,
            pageSize:pageSize
          },
          success:function(res){
            console.log(res);
            if(res.code == 1){
              pageCount=res.pageCount;
              var html = template("temlate",res.data);// template(模板的id,数据)
             // console.log(html)
             //导入数据
             $("tbody").html(html);
             //分页插件
              $(".pagination").twbsPagination({
                 first: '首页',
					       prev: '前一页',
				         next: '下一页',
				         last: '尾页',
                totalPages:pageCount,  //最大页数
                visiblePages:7,//总共显示分页按钮
               //event  事件对象
               //page   当前页码数
                onPageClick:function(event,page){//点击每个分页按钮的时候执行操作
                  currentPage=page;
                  getCommentsData();
                }
              });
            }
          }
        });
      };
    })
  </script>
  
</body>
</html>
