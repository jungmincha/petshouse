<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">



<style>

#sidebar { font-size: 14px; z-index: 100; 
-webkit-transform: translate3d(-300px,0,0);
-moz-transform: translate3d(-300px,0,0);
transform: translate3d(-300px,0,0);
-webkit-transition: all 0.2s;
-moz-transition: all 0.2s;
-ms-transition: all 0.2s;
-o-transition: all 0.2s;
transition: all 0.2s;
}

html.open #sidebar { overflow-y: auto;
-webkit-transform: translate3d(0,0,0);
-moz-transform: translate3d(0,0,0);
transform: translate3d(0,0,0);
-webkit-transition: all 0.2s;
-moz-transition: all 0.2s;
-ms-transition: all 0.2s;
-o-transition: all 0.2s;
transition: all 0.2s;
}

#sidebar-toggle { display: block; position: fixed; left: 10px; bottom: 10px; width: 50px; height: 50px; line-height: 55px; text-align: center; color: #555; background-color: #f1f1f1; border-radius: 10px; opacity: 0.9; box-shadow: 0 0 10px #aaa; z-index: 101; }


</style>

</head>
<body style="padding-top:180px">

<div id="sidebar">
    content
</div>

<div id="sidebar-toggle">사이드바 열기</div>
<script>
 $("#sidebar-toggle").click(function(){
  $("html").toggleClass("open");
});
	</script>

 </body>
</html>
 