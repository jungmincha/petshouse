<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html >
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>펫츠하우스</title>

<!-- Google Font -->
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
<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
	<input type="hidden" id="location_security" name="location_security"
		value="<sec:authentication property="principal.location"/>">
	<input type="hidden" id="member_id" name="member_id"
		value="<sec:authentication property="principal.member_id"/>">
	<input type="hidden" id="nickname" name="nickname"
		value="<sec:authentication property="principal.nickname"/>">
</sec:authorize>

<script>
	//위치기반 인증 자바스크립트 함수
	function location_auth() {

		try {
			var member_id = document.getElementById("member_id").value;
		} catch (e) {
			console.error(e);
			alert("로그인 후 이용 가능합니다.");
			location.href = "/login/login";
		}

		var location_security = document.getElementById("location_security").value;
		var member_id = document.getElementById("member_id").value;
		var nickname = document.getElementById("nickname").value;
		//var location = document.getElementById("location").value; 
		console.log(location_security);

		if (location_security == null) {

			location.href = "/map/home";

		} else {

			location.href = "/map/board?location=" + location_security
					+ "&member_id=" + member_id + "&nickname=" + nickname;

			console.log(location_security);
			console.log(member_id);
			console.log(nickname);

		}

	}
</script>


<style>
.top_profile_box {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
}

.top_profile {
	width: 100%;
	object-fit: cover;
}

.top {
	background-color: #e7ab3c;
	border-radius: 10px;
	cursor: pointer;
	position: fixed;
	right: 20px;
	font-size: 15px;
	bottom: 80px;
	padding: 10px;
}
</style>
</head>

<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header-section fixed-top bg-white">

		<div class="container">
			<div class="inner-header">
				<div class="row">
					<div class="col-lg-2 col-md-2">
						<div class="logo">
							<a href="/home"> <img src="/resources/img/logo.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-lg-7 col-md-7">
						<div class="advanced-search">
						<button type="button" class="category-btn">All Categories</button>
							<form action="${pageContext.request.contextPath}/search" class="input-group" method="post">
								<input type="text" name="keyword" placeholder="펫츠하우스 통합검색">
								<button type="submit">
									<i class="ti-search"></i>
								</button>
							</form>
			
						</div>
					</div>
					<div class="col-lg-3 text-right col-md-3">
						<ul class="nav-right">
							<li class="heart-icon"><a href="#"> <i
									class="icon_heart_alt"></i>
							</a></li>
							<li class="cart-icon"><a href="/myPage/cart" id="cartCount"><i
									class="icon_bag_alt"></i> </a>
								<div class="cart-hover">
									<sec:authorize access="isAnonymous()">
										<li class="heart-icon"><a href="/login/login"
											class="login-panel">Login</a></li>
									</sec:authorize>
									<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
										<li><a href="/login/logout" class="login-panel"
											style="color: black">Logout</a>
										<li class="heart-icon ">
											<div class="top_profile_box ">
												<a
													href="/myPage/<sec:authentication property="principal.nickname"/>">
													<img class="top_profile"
													src="/resources/img/member/profile/<sec:authentication  property="principal.thumbnail"/>">
												</a>
											</div>

										</li>

									</sec:authorize>


								</div></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item">
			<div class="container">
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu"></i> <span>MY HOME</span>
						<ul class="depart-hover">
							<li class="active"><a href="#">프로필</a></li>
							<li><a href="#">주문배송내역조회</a></li>
							<li><a href="#">회원정보수정</a></li>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul>
						<li><a href="/store/home">Home</a></li>
						<li><a href="/store/commu/home">커뮤니티</a>
							<ul class="dropdown">

								<li><a href="/commu/sns">SNS</a></li>
								<li><a href="/commu/tips">노하우</a></li>
								<li><a href="/commu/qna">질문과답변</a></li>

								<li><a onclick="location_auth()" href="#">펫츠타운</a></li>

							</ul></li>
						<li><a href="/store/home">STORE</a>
							<ul class="dropdown">
								<li><a href="/admin/notice">공지사항</a></li>
								<li><a href="/category/home">카테고리</a></li>
								<li><a href="/store/best">베스트상품</a></li>
								<li><a href="/store/event">이벤트</a></li>
							</ul></li>

						<li><sec:authorize
								access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
								<a
									href="/myPage/<sec:authentication property="principal.nickname"/>">마이페이지</a>
								<ul class="dropdown">
									<li><a href="/myPage/orderList">주문배송내역</a></li>
									<li><a href="/myPage/pointList">포인트</a></li>
									<li><a href="/myPage/updateMember">회원정보수정</a></li>
								</ul>
							</sec:authorize></li>

						<li><a href="/admin/home">관리자페이지</a>
							<ul class="dropdown">

								<li><a href="/admin/goods">상품관리</a></li>
								<li><a href="/admin/member_list">회원관리</a></li>
								<li><a href="#">통계</a></li>
							</ul></li>

					</ul>
				</nav>

			</div>
		</div>
		<!-- 상단 버튼 -->
		<div class="top" onclick="window.scrollTo(0,0);">top</div>
	</header>
	<!-- Header End -->




</body>
<script>
	$(document).ready(function() {
		var count = 0;
		if (sessionStorage.getItem("cartList") != null) {
			count = JSON.parse(sessionStorage.getItem("cartList")).length;
		}

		if (count > 0) {
			html = "<span id='cartCount'>" + count + "</span>"
			$("#cartCount").append(html)
		}

	})
</script>
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
</html>