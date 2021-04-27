<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SNS</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

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

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="/resources/css/select-style.css"
	type="text/css">
<link rel="stylesheet" href="/resources/js/select-index.js"
	type="text/css">

<style>
.profile_box {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile {
	width: 40px;
	height: 40px;
	object-fit: cover;
}

.i {
	
	border-radius: 10px;
}

.count {
	position: absolute;
	bottom: 80px;
	right: 30px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}

.count2 {
	position: absolute;
	bottom: 10px;
	right: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}
</style>
<script>
	//로그인 체크
	$(document).ready(function() {
		var member_id = $("#member_id").val();

		function checkLogin() {
			if (member_id == undefined) {
				alert("로그인 후 글을 작성해주세요.");
				location.href = '/login/login';
			}
		}
		$('#login').click(function() {
			checkLogin();
		});

	});
</script>

 
</head>
<body style="padding-top: 170px; min-height: 1500px;">
<a class="btn btn-outline-secondary col-sm-1 float-right"  id = "login"  style="position: fixed; top: 170px; right: 200px;" onclick="location.href='${pageContext.request.contextPath}sns/write_view'">게시글등록</a>
	
	<div class="container" style="min-height: 1500px;">

		<h2>SNS</h2>
		 

		<div class="row ">
			<div class="col-sm-2">
				<a href="#" onclick="fire_ajax_submit(1);"> <img
					src="/resources/img/category/cat.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href="#" onclick="fire_ajax_submit(2);"> <img
					src="/resources/img/category/dog.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href="#" onclick="fire_ajax_submit(3);"> <img
					src="/resources/img/category/reptile.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href="#" onclick="fire_ajax_submit(4);"> <img
					src="/resources/img/category/bird.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href="#" onclick="fire_ajax_submit(5);"> <img
					src="/resources/img/category/fish.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href="#" onclick="fire_ajax_submit(6);"> <img
					src="/resources/img/category/other.jpg"></a>
			</div>
		</div>

		<!-- Category Section End -->

		<div id="snslist" class="row text-center">
		<c:if test="${empty list}">
							
							<div class="col-12" style="min-height:200px; margin:100px auto;">
								<div>등록된 게시글이 없습니다.</div>
							</div>
			</c:if>
			<c:if test="${not empty list}">
			<c:forEach items="${list}" var="sns">

				<div class=" col-12 col-md-4 col-lg-3">

					<div class="user-Info row" style="margin: 20px auto 0px 5px">
						<div class="profile_box ">

							<img
								src="/resources/img/member/profile/${sns.boardVO.memberVO.thumbnail}"
								name="profile" alt="" class="profile" />
						</div>
						<div style="padding-top: 13px; padding-left :7px;">${sns.boardVO.memberVO.nickname} </div>
						 
						<a href="/myPage/${sns.boardVO.memberVO.nickname}"
							style="padding: 13px; "><b>팔로우</b></a>


					</div>

					<div class="shot">
						<c:forEach items="${imgCount}" var = "imgCount">
							 <c:if test="${imgCount.boardVO.board_id eq sns.boardVO.board_id and imgCount.count > 1}"> 
							  <i class="far fa-clone clone"></i>
								 </c:if> 
								 </c:forEach> 
						<a href="/commu/sns/${sns.boardVO.board_id}"> <img
							src="/resources/img/member/sns/${sns.imgname }" alt=""
							style="height: 300px;" class="card-img-top i" /><span
							class="count">조회수 ${sns.boardVO.hit}</span></a>
					</div>
					<div class="card-body" style="font-size : 20px; ">
							
							<a href="/commu/sns/${sns.boardVO.board_id}"> <i class="far fa-heart"></i>&nbsp&nbsp${sns.boardVO.plike}</a> &nbsp&nbsp&nbsp&nbsp
							<i class="far fa-comment"></i>
							<c:forEach items="${count}" var="count">  
							
							
							<c:if test="${count.pgroup eq sns.boardVO.board_id}"><a href="/commu/sns/${sns.boardVO.board_id}">
							
							 ${count.count}</a></c:if></c:forEach>
							 
							 </div>

				</div>
			</c:forEach></c:if>
		</div>


 		<c:if test="${fn:length(count) > 12}">
		          <div class="col-lg-12 text-center">
		         	  <input type="hidden" class="count" value="${fn:length(count)}" />
		          	  <button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
			      </div>   
		     </c:if> 
	</div>


	<!-- Bootstrap core JavaScript -->
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