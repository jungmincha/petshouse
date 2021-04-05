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
							<button type="button" class="category-btn">All
								Categories</button>
							<form action="#" class="input-group">
								<input type="text" placeholder="What do you need?">
								<button type="button">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
					</div>
					<div class="col-lg-3 text-right col-md-3">
						<ul class="nav-right">
							<li class="heart-icon"><a href="#"> <i
									class="icon_heart_alt"></i> <span>1</span>
							</a></li>
							<li class="cart-icon"><a href="/myPage/cart"> <i
									class="icon_bag_alt"></i> <span>3</span>
							</a>
								<div class="cart-hover">
									<div class="select-items">
										<table>
											<tbody>
												<tr>
													<td class="si-pic"><img
														src="/resources/img/select-product-1.jpg" alt=""></td>
													<td class="si-text">
														<div class="product-selected">
															<p>$60.00 x 1</p>
															<h6>Kabino Bedside Table</h6>
														</div>
													</td>
													<td class="si-close"><i class="ti-close"></i></td>
												</tr>
												<tr>
													<td class="si-pic"><img
														src="/resources/img/select-product-2.jpg" alt=""></td>
													<td class="si-text">
														<div class="product-selected">
															<p>$60.00 x 1</p>
															<h6>Kabino Bedside Table</h6>
														</div>
													</td>
													<td class="si-close"><i class="ti-close"></i></td>
												</tr>
											</tbody>
										</table>
									</div>

									<div class="select-total">
										<span>total:</span>
										<h5>$120.00</h5>
									</div>

									<div class="select-button">
										<a href="/myPage/cart" class="primary-btn view-card">VIEW
											CARD</a> <a href="#" class="primary-btn checkout-btn">CHECK
											OUT</a>

									</div>

									<sec:authorize access="isAnonymous()">
										<li class="heart-icon"><a href="/login/login"
											class="login-panel"><i class="fa fa-user"></i>Login</a></li>
									</sec:authorize>
									<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
										<li class="heart-icon"><a href="/login/logout"
											class="login-panel"><i class="fa fa-user"></i>로그아웃</a></li>

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
						<li><a href="./shop.html">커뮤니티</a>
							<ul class="dropdown">

								<li><a href="/commu">SNS</a></li>
								<li><a href="/commu/tips">노하우</a></li>
								<li><a href="/commu/qna">질문과답변</a></li>
								<li><a href="/commu">펫츠하우스</a></li>
							</ul></li>
						<li><a href="/store/home">STORE</a>
							<ul class="dropdown">
								<li><a href="/category/home">카테고리</a></li>
								<li><a href="/store/best/1">베스트상품</a></li>
								<li><a href="/store/event">이벤트</a></li>
							</ul></li>

						<li><a href="./shop.html">마이페이지</a>
							<ul class="dropdown">
								<li><a href="#">프로필</a></li>
								<li><a href="#">주문배송내역</a></li>
								<li><a href="#">포인트</a></li>
								<li><a href="#">회원정보수정</a></li>
							</ul></li>

						<li><a href="/admin/home">관리자페이지</a>
							<ul class="dropdown">
								<li><a href="/admin/goods">상품조회</a></li>
								<li><a href="/admin/member_list">회원관리</a></li>
								<li><a href="#">통계</a></li>
							</ul></li>

					</ul>
				</nav>

				<div id="mobile-menu-wrap"></div>
			</div>
		</div>

	</header>
	<!-- Header End -->


	<!-- Breadcrumb Section Begin -->

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