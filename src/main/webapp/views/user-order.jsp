<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>购书商城</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="<%=basePath%>/views/assets/i/favicon.png">
    <meta name="mobile-web-app-capable" content="yes">

    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>/views/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileImage" content="<%=basePath%>views/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">

    <link rel="icon" type="image/png" href="<%=basePath%>views/assets/i/book.png">
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/amazeui.min.css">
    <%--<link rel="stylesheet" href="<%=basePath%>views/assets/css/admin.css">--%>
    <link rel="stylesheet" href="<%=basePath%>views/assets/css/app.css">

    <script src="<%=basePath%>views/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>views/assets/js/amazeui.min.js"></script>

    <style>
        .gallery-list li {
            padding: 10px;
        }

        .gallery-list a {
            color: #666;
        }

        .gallery-list a:hover {
            color: #3bb4f2;
        }
        .book-btn button{
            width: 49%;
        }
    </style>

</head>

<body id="blog">

<%--<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
    <div class="am-u-sm-8 am-u-sm-centered">
        <!-- <img width="200" src="http://s.amazeui.org/media/i/brand/amazeui-b.png" alt="Amaze UI Logo"/> -->
        <img width="50" src="<%=basePath%>views/assets/i/favicon.png" alt="UI Logo"/>
        <img width="200" src="<%=basePath%>views/assets/i/wordLogo.png" alt="UI Logo"/>

    </div>
</header>
<hr>--%>
<!-- nav start -->
<nav class="am-g am-g-fixed blog-fixed blog-nav">

    <div class="am-collapse am-topbar-collapse" id="blog-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav">
            <li class="am-active"><a href="/userPage/">首页</a></li>
        </ul>
        <ul class="am-nav  am-topbar-right am-nav am-nav-pills">
            <li><a class="am-btn am-btn-warning" href="<%=basePath%>userPage/shoppingCart">
                <i class="am-icon-shopping-cart"></i>&nbsp;购物车</a>
            </li>
            <li><a href="#"><i class="am-icon-user"></i>&nbsp;${username}</a></li>
        </ul>
    </div>
</nav>
<hr>
<!-- nav end -->

<!-- content srart -->
<div class="am-u-sm-10 am-u-sm-centered">
    <table class="am-table am-table-bordered">
    <thead>
    <tr>
        <th>订单号</th>
        <th>书名</th>
        <th>数量</th>
        <th>总价</th>
        <th>收货人</th>
        <th>状态</th>
        <th>联系方式</th>
        <th>收货地址</th>
    </tr>
    </thead>
    <tbody>
<c:if test="${orders!=null}">
    <c:forEach items="${orders}" var="order" >
    <tr>
        <td>${order.orderId}</td>
        <td>${order.title}</td>
        <td>${order.amount}</td>
        <td>${order.orderPrice}</td>
        <td>${order.consignee}</td>
        <td>${order.state}</td>
        <td>${order.contactWay}</td>
        <td>${order.address}</td>
    </tr>
    </c:forEach>
</c:if>


    </tbody>
</table>
</div>

</body>
</html>