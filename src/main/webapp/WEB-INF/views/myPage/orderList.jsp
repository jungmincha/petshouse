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
<title>주문배송내역</title>
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
.pimg {
	width: 80px;
	height: 80px;
}
</style>
</head>
<body style="padding-top: 180px;">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<div class="jumbotron"></div>
			</div>
			<div class="col-lg-3"></div>
		</div>

		<div class="row">
			<div class="col-lg-1"></div>

			<div class="col-lg-12">
				<div class="jumbotron"
					style="padding-top: 40px; padding-bottom: 70px">
					<div class="row ">
						<div class="col-lg-2 text-center">입금대기</div>

						<div class="col-lg-2 text-center">결제완료</div>
						<div class="col-lg-2 text-center">배송준비</div>
						<div class="col-lg-2 text-center">배송중</div>
						<div class="col-lg-2 text-center">배송완료</div>
						<div class="col-lg-2 text-center">구매확정</div>
					</div>

				</div>
			</div>

			<div class="col-lg-1"></div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="blog-details-inner">
					<div class="posted-by">
						<div class="row">
							<div class="col-lg-4">
								<div class="pb-pic">
									<img src="/resources/img/products/product-1.jpg" class="pimg"
										alt="">
								</div>
								<div class="pb-text">
									<a href="#">
										<h5>303123122 / 2021.04.08</h5>
									</a>
									<p>다용도 책상 테이블</p>
								</div>
							</div>
							<div class="col-lg-2"></div>
							<div class="col-lg-4">
								<span style="font-size: 20px">색상 - 빨강</span><br> <span
									style="font-size: 20px">29000원</span><br>

							</div>
							<div class="col-lg-2">
							<span style="font-size: 20px"><button>배송추적</button></span><br> <span
									style="font-size: 20px"><button>리뷰작성</button></span><br>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
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