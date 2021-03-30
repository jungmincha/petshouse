<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>storehome</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$.fn.generateStars = function() {
			return this.each(function(i, e) {
				$(e).html($('<span/>').width($(e).text() * 16));
			});
		};

		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();

	})
</script>

<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #ffffff;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.hero-section {
	padding-top: 15px;
}

#product {
	padding-top: 40px;
}

.single-hero-items {
	max-height: 580px;
}

span.star-prototype, span.star-prototype>* {
	height: 16px;
	background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	display: inline-block;
}

span.star-prototype>* {
	background-position: 0 0;
	max-width: 80px;
}
</style>
</head>

<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Hero Section Begin -->
	<section class="hero-section">
		<div class="hero-items owl-carousel">
			<div class="container">
				<div class="single-hero-items set-bg"
					data-setbg="/resources/img/goods/banner_01.jpg">
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-9">
							<span>Cat, Toy</span>
							<h1>Today's HOT</h1>
							<p></p>
							<a href="#" class="primary-btn">Shop Now</a>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="single-hero-items set-bg"
					data-setbg="/resources/img/goods/banner_02.jpg">
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-9">
							<span>Dog, Snack</span>
							<h1 style="color: #d3d3d3">Today's HOT</h1>
							<p></p>
							<a href="#" class="primary-btn">Shop Now</a>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="single-hero-items set-bg"
					data-setbg="/resources/img/goods/banner_03.jpg">
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-9">
							<span>Dog, Food</span>
							<h1 style="color: #eeeeee">Today's HOT</h1>
							<p></p>
							<a href="#" class="primary-btn">Shop Now</a>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="single-hero-items set-bg"
					data-setbg="/resources/img/goods/banner_04.jpg">
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-9">
							<span>Dog, Clothes</span>
							<h1 style="color: #eeeeee">Today's HOT</h1>
							<p></p>
							<a href="#" class="primary-btn">Shop Now</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Banner Section Begin -->
	<section class="latest-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Category</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-2">
					<div class="single-banner">
						<a href="고양이카테고리" target="_self"><img
							src="/resources/img/category/cat.jpg"></a>
					</div>
				</div>

				<div class="col-lg-2">
					<div class="single-banner">
						<a href="강아지카테고리" target="_self"><img
							src="/resources/img/category/dog.jpg"></a>
					</div>
				</div>

				<div class="col-lg-2">
					<div class="single-banner">
						<a href="파충류카테고리" target="_self"><img
							src="/resources/img/category/reptile.jpg"></a>
					</div>
				</div>

				<div class="col-lg-2">
					<div class="single-banner">
						<a href="조류카테고리" target="_self"><img
							src="/resources/img/category/bird.jpg"></a>
					</div>
				</div>

				<div class="col-lg-2">
					<div class="single-banner">
						<a href="어류카테고리" target="_self"><img
							src="/resources/img/category/fish.jpg"></a>
					</div>
				</div>

				<div class="col-lg-2">
					<div class="single-banner">
						<a href="기타카테고리" target="_self"><img
							src="/resources/img/category/other.jpg"></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Banner Section End -->

	<!-- Hot Item1 Banner Section Begin -->
	<section class="Hot Item1 banner spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="product-large set-bg"
						data-setbg="/resources/img/goods/hot_banner_01.jpg">
						<h2>Hot Item</h2>
						<a href="카테고리홈으로">More</a>
					</div>
				</div>
				<div class="col-lg-8 offset-lg-1">
					<div class="filter-control">
						<ul>
							<li class="active">Products</li>
						</ul>
					</div>
					<div class="product-slider owl-carousel">
						<c:forEach items="${store}" var="dto">
							<div class="product-item">
								<div class="pi-pic">
									<img src="/resources/img/goods/goods_01.jpg" alt="">
									<div class="sale">BEST ${dto.rnum}</div>
									<ul>
										<li class="w-icon active"><a href="#"><i
												class="icon_bag_alt"></i></a></li>
										<li class="quick-view"><a href="#">+ Quick View</a></li>
										<li class="w-icon"><a href="#"><i
												class="fa fa-random"></i></a></li>
									</ul>
								</div>
								<div class="pi-text">
									<div class="catagory-name"></div>
									<a href="#">
										<h5>${dto.goodsname}</h5>
									</a>
									<div class="product-price">${dto.price}원</div>
									<c:forEach items="${rate}" var="rate">
										<c:if test="${dto.goods_id eq rate.goodsVO.goods_id}">
                                별점 <span class="star-prototype">
												${rate.avgscore}</span>
											<span> &nbsp; 리뷰 ${dto.count}</span>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hot Item1 Banner Section End -->

	<!-- Hot Item2 Banner Section Begin -->
	<section class="Hot Item2 banner spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="filter-control">
						<ul>
							<li class="active">Products</li>
						</ul>
					</div>
					<div class="product-slider owl-carousel">
						<c:forEach items="${store}" var="dto">
							<div class="product-item">
								<div class="pi-pic">
							<!-- <c:forEach items="${image}" var="image">
								<c:if test="${dto.board_id eq image.board_id}">  -->	
									<img src="/resources/img/file/${image.imgname}" alt="">
								<!-- </c:if>
									</c:forEach>  -->	
									<div class="sale">BEST ${dto.rnum}</div>
									<ul>
										<li class="w-icon active"><a href="#"><i
												class="icon_bag_alt"></i></a></li>
										<li class="quick-view"><a href="#">+ Quick View</a></li>
										<li class="w-icon"><a href="#"><i
												class="fa fa-random"></i></a></li>
									</ul>
								</div>
								<div class="pi-text">
									<div class="catagory-name"></div>
									<a href="#">
										<h5>${dto.goodsname}</h5>
									</a>
									<div class="product-price">${dto.price}원</div>
									<c:forEach items="${rate}" var="rate">
										<c:if test="${dto.goods_id eq rate.goodsVO.goods_id}">
                                별점 <span class="star-prototype">
												${rate.avgscore}</span>
											<span>&nbsp; 리뷰 ${dto.count}</span>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1">
					<div class="product-large set-bg m-large"
						data-setbg="/resources/img/goods/hot_banner_02.jpg">
						<h2>Hot Item</h2>
						<a href="#">More</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hot Item2 Banner Section End -->

	<!-- Recommended Section Begin-->
	<section class="deal-of-week set-bg spad"
		data-setbg="/resources/img/goods/re_banner.jpg">
		<div class="container">
			<div class="col-lg-6 text-center">
				<div class="section-title">
					<h2>Recommended Product</h2>
					<p>펫츠하우스의 추천 상품!!을 만나보세요</p>
					<div class="product-price">
						29,900원 <span>/ BirdCage</span>
					</div>
				</div>
				<div class="countdown-timer" id="countdown">
					<div class="cd-item">
						<span>7</span>
						<p>Days</p>
					</div>
					<div class="cd-item">
						<span>12</span>
						<p>Hrs</p>
					</div>
					<div class="cd-item">
						<span>40</span>
						<p>Mins</p>
					</div>
					<div class="cd-item">
						<span>52</span>
						<p>Secs</p>
					</div>
				</div>
				<a href="#" class="primary-btn">Shop Now</a>
			</div>
		</div>
	</section>

	<!-- Recommended Section End -->

	<!-- /.container -->

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/store/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/store/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>


