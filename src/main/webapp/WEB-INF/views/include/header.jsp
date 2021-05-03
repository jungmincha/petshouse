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
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

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
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link rel="stylesheet"
	href="https://www.w3schools.com/w3css/4/w3pro.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-teal.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
	<input type="hidden" id="location_security" name="location_security"
		value="<sec:authentication property="principal.location"/>">
	<input type="hidden" id="member_id" name="member_id"
		value="<sec:authentication property="principal.member_id"/>">
</sec:authorize>
<style>
.top_profile_box {
	width: 50px;
	height: 50px;
}

.top_profile {
	width: 50px;
	height: 50px;
	border-radius: 70%;
	border: 3px solid white;
}

.top_profile:hover {
	border: 3px solid #e7ab3c;
}

.top {
	cursor: pointer;
	position: fixed;
	right: 15px;
	font-size: 15px;
	bottom: 80px;
	padding: 10px;
}

.chat {
	border-radius: 10px;
	cursor: pointer;
	position: fixed;
	right: 15px;
	font-size: 30px;
	bottom: 120px;
	padding: 10px;
}

.logo img {
	width: 180px;
	height: 50px;
}

.depart-btn {
	height: 100%;
	margin: 0 auto;
}

.depart-btn>li {
	float: left;
	width: 25%;
	line-height: 50px;
	text-align: center;
	position: relative;
}

.depart-btn>li:hover .depart-hover {
	left: 0;
}

.depart-btn>li a {
	display: block;
}

.depart-btn>li a:hover {
	color: #fff;
	font-weight: bold;
}

.depart-hover {
	position: absolute;
	left: -9999px;
	width: 100%;
}

.depart-hover>li {
	position: relative;
	height: 60px;
}

.depart-hover>li:hover .M02 {
	left: 100%;
}

.depart-hover>li a, .M02>li a {
	
}

.M02 {
	position: absolute;
	top: 0;
	width: 100%;
	background: rgba(59, 59, 59, 0.95);
	left: -9999px;
}

.M02>li a:hover {
	color: #fff;
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
				<div class="row" style="height: 70px">
					<div class="col-lg-3 " style="padding-left: 50px">
						<div class="logo">
							<a href="/home"> <img src="/resources/img/logo.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-lg-5 " style="padding-top: 10px;">
						<div class="advanced-search">

							<form action="${pageContext.request.contextPath}/search"
								class="input-group" method="get">
								<input type="text" name="keyword" placeholder="펫츠하우스 통합검색">
								<button type="submit">
									<i class="ti-search"></i>
								</button>
							</form>

						</div>
					</div>
					<div class="col-lg-4 text-right">

						<ul class="nav-right"
							style="padding-top: 15px; padding-right: 15px">

							<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">

								<li class="heart-icon">
									<div class="top_profile_box ">
										<a
											href="/myPage/<sec:authentication property="principal.nickname"/>">
											<img class="top_profile"
											src="/resources/img/member/profile/<sec:authentication  property="principal.thumbnail"/>">
										</a>
									</div>
								</li>
								<li><a
									href="/myPage/<sec:authentication property="principal.nickname"/>"><sec:authentication
											property="principal.nickname" />님</a></li>
							</sec:authorize>
							<li class="cart-icon"><a href="/myPage/cart" id="cartCount"><i
									class="icon_bag_alt"></i> </a></li>
							<!-- 로그아웃 버튼 -->
							<sec:authorize access="isAnonymous()">
								<li><a href="/login/login" class="login-panel">Login</a></li>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
								<li><a href="/login/logout" class="login-panel">Logout</a></li>
							</sec:authorize>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item ">
			<div class="container">
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu "></i> <span>&nbsp;&nbsp;카테고리</span>
						<ul class="depart-hover">
							<li><a
								href="/store/commu/category/101?categoryName=고양이 / 사료">고양이</a></li>

							<li><a
								href="/store/commu/category/201?categoryName=강아지 / 사료">강아지</a></li>

							<li><a
								href="/store/commu/category/301?categoryName=파충류 / 사료">파충류</a></li>

							<li><a href="/store/commu/category/401?categoryName=어류 / 어항">어류</a>

							</li>

							<li><a href="/store/commu/category/501?categoryName=조류 / 모이">조류</a>

							</li>

							<li><a href="/store/commu/category/601?categoryName=기타 / 사료">기타</a>

							</li>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul id="navbars">
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

					   <sec:authorize access="hasAnyRole('ROLE_USER')">
                     <li><a
                        href="/myPage/<sec:authentication property="principal.nickname"/>">마이페이지</a>
                        <ul class="dropdown">
                           <li><a href="/myPage/orderList">주문배송내역</a></li>
                           <li><a href="/myPage/pointList">포인트</a></li>
                           <li><a href="/myPage/updateMember">회원정보수정</a></li>
                        </ul></li>
                  </sec:authorize>

                  <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                     <li><a href="/admin/goods">관리자페이지</a>
                       <!-- <!--  <ul class="dropdown">

                           <li><a href="/admin/goods">상품관리</a></li>
                           <li><a href="/admin/member_list">회원관리</a></li>
                           <li><a href="/room">문의채팅방</a></li>
                           <li><a href="/statistics/main/home">통계</a></li>
                        </ul> --> </li>
                  </sec:authorize>

					</ul>
				</nav>

			</div>
		</div>
		<div id="mobile-header">
			<nav class="w3-sidebar w3-bar-block w3-card" id="mySidebar">
				<div class="w3-container w3-theme-d2">
					<span onclick="closeSidebar()"
						class="w3-button w3-display-topright w3-large">X</span> <br>
					<div class="w3-padding w3-center">
						
					</div>
				</div>
				<a class="w3-bar-item w3-button" href="#">Movies</a> <a
					class="w3-bar-item w3-button" href="#">Friends</a> <a
					class="w3-bar-item w3-button" href="#">Messages</a>
			</nav>

			<div class="w3-bar w3-card ">
				<div class="row">
					<div class="col-4">
						<i class="icon_profile"></i>
						<button class="" onclick="openSidebar()">&#9776;</button>
					</div>
					<div class="col-4">
						<div class="logo text-center">
							<a href="/home"> <img src="/resources/img/logo.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-4"></div>
				</div>

			</div>
		</div>
		<!-- 상단 버튼 -->

	</header>
	<!-- Header End -->

	<div class="top" onclick="window.scrollTo(0,0);">
		<i class="fas fa-chevron-circle-up" style="font-size: 30px;"></i>
	</div>
	<sec:authorize access="hasAnyRole('ROLE_USER')">
		<div class="chat">
			<a href="${pageContext.request.contextPath}/chat"
				onclick="window.open(this.href,'팝업창','width=600,height=670');return false;"><i
				class="fas fa-paw"></i></a>
		</div>
	</sec:authorize>
	<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
		<div class="chat">
			<a href="${pageContext.request.contextPath}/roomup"
				onclick="window.open(this.href,'팝업창','width=510,height=610');return false;"><i
				class="fas fa-paw"></i></a>
		</div>
	</sec:authorize>

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
		closeSidebar();
	})

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
		//var location = document.getElementById("location").value; 
		console.log(location_security);

		if (location_security == 'null') {

			location.href = "/map/home";

		} else {
			console.log(location_security);
			console.log(member_id);
			
			location.href="/map/board/?location="+location_security+"&member_id=" + member_id;
			
			
		/* 	document.write('<form action="/map/board" id="post_test" method="post"><input type="hidden" id="location" name="location" value="'+ location_security +'"><input type="hidden" id="member_id" name="member_id" value="'+ member_id +'"></form>');
			document.getElementById("post_test").submit();
 */
			

		
			

		}

	}
	function openSidebar() {
		document.getElementById("mySidebar").style.display = "block";
	}

	function closeSidebar() {
		document.getElementById("mySidebar").style.display = "none";
	}
</script>
<!-- Js Plugins -->
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
</html>