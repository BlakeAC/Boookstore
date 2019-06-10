<%--
  Created by IntelliJ IDEA.
  User: danchun
  Date: 2018/12/1
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

  <style>

  </style>
</head>
<body>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">表格</strong> / <small>Table</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-5 am-u-md-push-10"></div>
        <div class="am-u-sm-12 am-u-md-7 am-u-md-pull-3">
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-type">用户名</th>
                <th class="table-type">是否是管理员</th>
                <th class="table-type">下单数量</th>
                <th class="table-set">操作</th>
              </tr>
              </thead>
              <tbody>

          <%--循环显示数据--%>
          <c:if test="${users != null}">
            <c:forEach var="user" items="${users}">
              <tr>
                <td>${user.username}</td>
                <td>${user.isManager}</td>
                <td>${user.OrderCount}</td>
                <td>
                  <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                      <button id="${user.id}" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delete-btn">
                        <span class="am-icon-trash-o"></span> 删除</button>
                    </div>
                  </div>
                </td>
              </tr>
            </c:forEach>
          </c:if>

              </tbody>
            </table>
          </form>
        </div>
      </div>
    </div>

  </div>
  <!-- content end -->
  </div>

<script>
  $(".delete-btn").click(function () {
      var userId = this.id;

      var json_data = {
          "userId": userId
      };
      var jason_str = JSON.stringify(json_data);

      $.ajax({
          url :"<%=basePath%>Admin/deleteUserById",
          cache : true,
          type : "post",
          datatype : "json",
          contentType : "application/json; charset=utf-8",
          data : jason_str,

          success : function (data){
              console.log(data.state + data.message);
              if (data.state == true){
                  alert(data.message);
                  location.reload();
              } else {
                  alert(data.message);
              }
          },
          error:function (data) {
              console.log(data);
              alert("请求出错，请检查网络或服务器是否开启");
          }
      });
  });
</script>

</body>
</html>
