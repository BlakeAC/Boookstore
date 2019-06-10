
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>购书商城</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>

  <link rel="icon" type="image/png" href="<%=basePath%>views/assets/i/book.png">
  <link rel="stylesheet" href="<%=basePath%>views/assets/css/amazeui.min.css">
  <link rel="stylesheet" href="<%=basePath%>views/assets/css/admin.css">

  <script src="<%=basePath%>views/assets/js/jquery.min.js"></script>
  <script src="<%=basePath%>views/assets/js/amazeui.js"></script>
  <script src="<%=basePath%>views/assets/js/handlebars.min.js"></script>
  <script src="<%=basePath%>views/assets/js/amazeui.widgets.helper.js"></script>

  <style>

  </style>
</head>
<body>

<c:if test="${message != null}">
  <script>
    alert("${message}");
  </script>
</c:if>

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>购书商城</strong> <small>后台管理系统</small>
  </div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 未处理订单 <span style="display:none" class="am-badge am-badge-warning">0</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="<%=basePath%>Admin/outLogin"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">

      <ul class="am-list admin-sidebar-list">
        <li><a href="<%=basePath%>adminPage/"><span class="am-icon-home"></span> 首页</a></li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span>
            图书分类 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav">

            <c:if test="${types != null}">
              <c:forEach var="type" items="${types}">
                <li><a href="<%=basePath%>adminPage/getBookByType?bookType=${type}"><span class="am-icon-th"></span> ${type} </a></li>
              </c:forEach>
            </c:if>

          </ul>
        </li>
        <li><a href="<%=basePath%>adminPage/getAllOrders"><span class="am-icon-table"></span> 查看订单</a></li>
        <li><a href="<%=basePath%>adminPage/addBook"><span class="am-icon-pencil-square-o"></span> 添加图书</a></li>
        <li><a href="<%=basePath%>adminPage/chargeUser"><span class="am-icon-users"></span> 用户管理</a></li>

      </ul>

    </div>
  </div>
  <!-- sidebar end -->
      
          <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加图书</strong> / <small>向书店中添加一项图书商品</small></div>
      </div>

      <hr/>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <form id="submit-form" class="am-form am-form-horizontal" action="<%=basePath%>Book/admin/addBook" method="post" enctype="multipart/form-data">
            <div class="am-form-group">
              <label for="book-name" class="am-u-sm-3 am-form-label">书名 / Name</label>
              <div class="am-u-sm-9">
                <input required type="text" id="book-name" name="bookName" placeholder="书名 / bookName">
              </div>
            </div>

            <div class="am-form-group">
              <label for="book-type" class="am-u-sm-3 am-form-label">图书类别 / Type</label>
              <div class="am-u-sm-9">
                <input required type="text" id="book-type" name="bookType" placeholder="输入图书类别 / Type">
              </div>
            </div>

            <div class="am-form-group">
              <label for="book-author" class="am-u-sm-3 am-form-label">图书作者 / Author</label>
              <div class="am-u-sm-9">
                <input required type="text" id="book-author" name="author" placeholder="输入图书作者 / Author">
              </div>
            </div>


            <div class="am-form-group">
              <label for="book-price" class="am-u-sm-3 am-form-label">图书价格 / Price</label>
              <div class="am-u-sm-9">
                <input required type="number" pattern="[0-9]*" id="book-price" name="price" placeholder="输入图书价格 / Price">
              </div>
            </div>

           <%-- <div class="am-form-group">
              <label for="book-inventory" class="am-u-sm-3 am-form-label">图书库存 / Inventory</label>
              <div class="am-u-sm-9">
                <input required type="number" pattern="[0-9]*" id="book-inventory" name="inventory" placeholder="输入图书库存 / Inventory">
              </div>
            </div>--%>

            <div class="am-form-group">
              <label for="book-intro" class="am-u-sm-3 am-form-label">图书简介 / Intro</label>
              <div class="am-u-sm-9">
                <textarea required class="" rows="5" id="book-intro" name="introduction" placeholder="输入图书简介"></textarea>
              </div>
            </div>

            <div class="am-form-group">
              <label for="book-img" class="am-u-sm-3 am-form-label">图书封面 / Image</label>
              <div class="am-u-sm-9">
                <div class="am-g">
                  <%--<div class="am-u-sm-4 am-u-md-3 am-u-lg-2">
                    <img class="am-img-circle am-img-thumbnail" src="<%=basePath%>views/assets/i/book.png" alt=""/>
                  </div>--%>
                  <div class="am-u-sm-8 am-u-md-9 am-u-lg-10">
                    <input required type="file" id="book-img" name="pictureFile">
                  </div>
                </div>
              </div>
            </div>

            <div class="am-form-group am-center">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <button id="submit-btn" type="button" class="am-btn am-btn-primary">提交</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>


  </div>
  <!-- content end -->
 </div>

<script>
  $("#submit-btn").click(function () {
      var form = $("#submit-form")[0];

      var price_length = $("#book-price")[0].value.length;
      var inventory_length = $("#book-inventory")[0].value.length;

      console.log(price_length + " " + inventory_length);

      if (price_length <= 6 && inventory_length <= 6){
          form.submit();
      } else{
          alert("请输入合法的数据");
      }
  });
</script>

</body>
</html>
