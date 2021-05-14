<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠타운</title>
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

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script>
	$(function() {

		$("#sel").change(function() {

			location.href = "/map/home"

		});

	});
</script>



</head>
<body style="padding-top: 180px">

	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="width: 800px; padding-bottom:150px;">

		<!-- 위치 다시 선정하기 -->
		<i class="fas fa-paw"></i><span style="font-size: 18px;">
			${location}</span> <br> <br> <i class="fas fa-paw"></i><a
			href="/map/home"><span style="font-size: 15px;"> 위치 다시
				설정하기</span></a> <br> <br>


		<form action="/map/modify" method="post" enctype="multipart/form-data">
			<input id="location" type="hidden" name="location"
				value="${location}" /> <input type="hidden" name="member_id"
				value="<sec:authentication property="principal.member_id"/>">

			<input id="board_id" type="hidden" name="board_id"
				value="${content_view.board_id}" />
			<div class="row">
				<select name="hashtag" id="hashtag" class=" form-control col-2"
					style="height: 38px; margin-left: 15px; margin-right: 10px;">
					<option value="우리동네">우리동네</option>
					<option value="분실/실종">분실/실종</option>
					<option value="동물병원">동물병원</option>
					<option value="산책로">산책로</option>
					<option value="나눔마켓">나눔마켓</option>
					<option value="애완용품샵">애완용품샵</option>
					<option value="기타">기타</option>
				</select>


			</div>




			<textarea class="form-control col" name="content" placeholder="내용"
				style="width: 770px; height: 400px; margin-bottom: 20px; resize: none;">${content_view.content}</textarea>
			<div class="form-group row"></div>

			<input class="form-control col-sm-1"
				style="position: fixed; background-color: #FFC81E; color: black; top: 170px; right: 130px;"
				type="submit" value="수정 완료">








		</form>
	</div>



	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


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