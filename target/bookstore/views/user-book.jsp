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
</head>

<body id="blog">

<!-- nav start -->
<nav class="am-g am-g-fixed blog-fixed blog-nav">

    <div class="am-collapse am-topbar-collapse" id="blog-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav">
            <li class="am-active"><a href="<%=basePath%>/userPage/">首页</a></li>
            <li class="am-dropdown" data-am-dropdown>
                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                    图书种类 <span class="am-icon-caret-down"></span>
                </a>
                <ul class="am-dropdown-content">
                    <c:if test="${types != null}">
                        <c:forEach var="type" items="${types}">
                            <li><a href="<%=basePath%>userPage/bookPage?bookType=${type}">${type}</a></li>
                        </c:forEach>
                    </c:if>
                </ul>
            </li>
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

<!-- banner start -->
<!-- content srart -->
<div class="am-g am-g-fixed">
    <div class="am-u-md-12 am-u-sm-12">

        <article class="am-g blog-entry-article">
            <div class="am-u-lg-4 am-u-md-12 am-u-sm-12 blog-entry-img">

                <img class="am-img-thumbnail am-img-bdrs" src="<%=basePath%>${book.cover}" alt=""/>
                <div class="gallery-title">${book.title}
                    <div float="right">价格：&nbsp;￥${book.price}</div>
                </div>
                <div class="gallery-desc">作者：&nbsp;${book.author}</div>
                <p>${book.description}</p>
                <button type="button" class="am-btn am-btn-warning am-btn-sm">加入购物车</button>

            </div>
        </article>

    </div>
</div>

<!-- content end -->


<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
</body>
</html>
