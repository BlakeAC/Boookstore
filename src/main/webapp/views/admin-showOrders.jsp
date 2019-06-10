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
  <title>兰陵学馆</title>
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
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-form-group">
            <select data-am-selected="{btnSize: 'sm'}">
              <option value="option1">所有类别</option>
                <option value="option2">${type}</option>
            </select>
          </div>
        </div>
      </div>

      <div class="am-g">
        <div class="am-u-sm-12">
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-type">订单号</th>
                <th class="table-title">图书名</th>
                <th class="table-type">数量</th>
                <th class="table-type">下单用户id</th>
                <th class="table-author am-hide-sm-only">总价</th>
                <th class="table-date am-hide-sm-only">收货人</th>
                <th class="table-date am-hide-sm-only">下单时间</th>
                <th class="table-date am-hide-sm-only">收货地址</th>
                <th class="table-date am-hide-sm-only">联系方式</th>
                <th class="table-type">订单状态</th>
                <th class="table-set">操作</th>
              </tr>
              </thead>
              <tbody>
          <c:if test="${orders!=null}">
            <c:forEach items="${orders}" var="order">
              <tr>
                <td>${order.orderId}</td>
                <td><a href="#">${order.bookName}</a></td>
                <td>${order.orderNum}</td>
                <td>${order.id}</td>
                <td class="am-hide-sm-only">${order.orderPrice}</td>
                <td class="am-hide-sm-only">${order.consignee}</td>
                <td class="am-hide-sm-only">${order.createTime}</td>
                <td class="am-hide-sm-only">${order.address}</td>
                <td class="am-hide-sm-only">${order.contactWay}</td>
                <td class="am-hide-sm-only">${order.state==0?"未完成":"已完成"}</td>
                <td>
                  <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                      <button id="${order.orderId}" class="am-btn am-btn-default am-btn-xs am-hide-sm-only change-btn" ${order.state==0?"":"disabled=\"disabled\""}>
                        <span class="am-icon-copy"></span> 订单完成</button>
                      <button id="${order.orderId}" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delete-btn">
                        <span class="am-icon-trash-o"></span> 删除订单</button>
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
  $(".change-btn").click(function () {

  })

</script>
</body>
</html>
