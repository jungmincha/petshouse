<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${tips_view.title} 수정하기</title>
<script src="/resources/ckeditor/ckeditor.js"></script>

<link
   href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
   rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

<!-- bootstrap css cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
#navbars>li:nth-child(2) {
   background-color: #e7ab3c;
}
</style>
</head>

<body style="padding-top:180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="width: 800px; min-height:550px;">
	<h3 style="margin-bottom:50px; margin-top:50px;">노하우 수정하기</h3>
		<form action="${pageContext.request.contextPath}/commu/tmodify" method="post" enctype="multipart/form-data">

			<input type="hidden" name="board_id" value="${tips_view.board_id}" />
			<div class="row">
				<select class=" form-control col-2" name="categoryVO.category_id"
					style="height: 38px; margin-left: 15px; margin-right:30px;">
					<option value="${tips_view.categoryVO.category_id}">${tips_view.categoryVO.categoryname}</option>
					<option value="1">고양이</option>
					<option value="2">강아지</option>
					<option value="3">파충류</option>
					<option value="4">조류</option>
					<option value="5">어류</option>
					<option value="6">기타</option>
				</select> 
				<input type="text" class="form-control col-9" name="title"
					value="${tips_view.title}" style="margin-bottom: 20px;">
			</div>

			

 			<textarea id="editor4" name="content">${tips_view.content}</textarea>
			<script>
					CKEDITOR.replace('editor4');			
			</script>  
			
			<input class="form-control" style=" margin-top: 20px;" type="text" name="hashtag" value="${tips_view.hashtag}" />
			
		<div style="margin-top:30px; float: right;">
			<button type="submit" class="btn btn-warning"	
				onclick="location.href='${pageContext.request.contextPath}/commu/tips'">수정하기</button>
			<a class="btn btn-warning"  href="tips">취소</a>
		</div>
		
		</form>

	</div>

	<!-- Footer -->
	<div style="margin-top: 100px">
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>
	
		<!-- Js Plugins -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>

</body>
</html>
