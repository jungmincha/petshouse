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
<title>${qna_view.title}수정하기</title>

<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
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

textarea::-webkit-scrollbar {
    width: 10px;
  }
textarea::-webkit-scrollbar-thumb {
    background-color: #666666;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
textarea::-webkit-scrollbar-track {
    background-color: #CCCCCC;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }

</style>
</head>

<body style="padding-top:180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="width: 800px;">

    <h4 style=" margin-bottom:30px;"> 글 수정하기</h4>
		<form action="${pageContext.request.contextPath}/commu/modify"
			method="post">
			<input type="hidden" name="board_id" value="${qna_view.board_id}" />
			<div class="row">
				<select class=" form-control col-2" name="categoryVO.category_id"
					style="height: 38px; margin-left: 15px; margin-right:30px;">
					<option value="${qna_view.categoryVO.category_id}">${qna_view.categoryVO.categoryname}</option>
					<option value="1">고양이</option>
					<option value="2">강아지</option>
					<option value="3">파충류</option>
					<option value="4">조류</option>
					<option value="5">어류</option>
					<option value="6">기타</option>
				</select> 
				<input type="text" class="form-control col-9" name="title"
					value="${qna_view.title}" style="margin-bottom: 20px;">
			</div>
			<textarea class="form-control col" name="content"
				style="width: 800px; height: 400px; margin-bottom: 20px; resize: none;" value="${qna_view.content}">${qna_view.content}</textarea>
			
			<input type="text" class="form-control" name="hashtag" maxlength="30"
				value="${qna_view.hashtag}"/>

		<div style="margin-top:30px; float: right;">
			<button type="submit" class="btn btn-warning"	
				onclick="location.href='${pageContext.request.contextPath}/commu/qna'">수정하기</button>
			<a class="btn btn-warning"  href="qna">취소</a>
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
