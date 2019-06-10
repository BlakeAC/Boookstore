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
            <%--<li class="admin-parent">
              <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span>
                图书分类 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
              <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav">

                <c:if test="${types != null}">
                  <c:forEach var="type" items="${types}">
                    <li><a href="<%=basePath%>adminPage/getBookByType?bookType=${type}"><span class="am-icon-th"></span> ${type} </a></li>
                  </c:forEach>
                </c:if>

              </ul>
            </li>--%>
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
                  <div class="am-fl am-cf">
                    <strong class="am-text-primary am-text-lg">查看图书</strong> / <small>Gallery</small>
                  </div>
                </div>
          
                <hr>
          
                <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-6 am-margin gallery-list">
                  <c:if test="${books != null}">
                    <c:forEach var="book" items="${books}">
                      <li>
                        <a>
                          <img class="am-img-thumbnail am-img-bdrs" src="<%=basePath%>${book.cover}" alt=""/>
                          <div class="gallery-title">${book.title}</div>
                          <div class="gallery-desc">${book.author}</div>
                        </a>
                        <button type="button" class="am-btn am-btn-default am-btn-sm">修改库存</button>
                        <button type="button" id="${book.bookId}" class="am-btn am-btn-warning am-btn-sm delete-btn">删除图书</button>
                      </li>
                    </c:forEach>
                  </c:if>
                </ul>

              </div>

          
            </div>
            <!-- content end -->
          
          </div>
          

    <script type="text/javascript">
        $(".delete-btn").click(function () {
            console.log(this.id);
            var ID = this.id;

            var json_data = {
                "bookId": ID
            };
            var jason_str = JSON.stringify(json_data);

            $.ajax({
                url :"<%=basePath%>Book/deleteBookById",
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
