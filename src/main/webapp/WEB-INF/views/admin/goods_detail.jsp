<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>상품조회</title>
<!-- jquery cdn -->
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
.tab-item {
	width: 1000;
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

	<!-- Page Content -->
	<!-- Product Shop Section Begin -->

	<section class="product-shop spad page-details">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="filter-widget">
					<h4 class="fw-title">카테고리</h4>
					<ul class="filter-catagories">
						<li><a href="#">고양이</a></li>
						<li><a href="#">강아지</a></li>
						<li><a href="#">파충류</a></li>
						<li><a href="#">어류</a></li>
						<li><a href="#">조류</a></li>
						<li><a href="#">기타</a></li>
					</ul>
				</div>

				<div class="filter-widget">
					<h4 class="fw-title">Price</h4>
					<div class="filter-range-wrap">
						<div class="range-slider">
							<div class="price-input">
								<input type="text" id="minamount"> <input type="text"
									id="maxamount">
							</div>
						</div>
						<div
							class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
							data-min="33" data-max="98">
							<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
							<span tabindex="0"
								class="ui-slider-handle ui-corner-all ui-state-default"></span>
							<span tabindex="0"
								class="ui-slider-handle ui-corner-all ui-state-default"></span>
						</div>
					</div>
					<a href="#" class="filter-btn">Filter</a>
				</div>
				<div class="filter-widget">
					<h4 class="fw-title">Color</h4>
					<div class="fw-color-choose">
						<div class="cs-item">
							<input type="radio" id="cs-black"> <label
								class="cs-black" for="cs-black">Black</label>
						</div>
						<div class="cs-item">
							<input type="radio" id="cs-violet"> <label
								class="cs-violet" for="cs-violet">Violet</label>
						</div>
						<div class="cs-item">
							<input type="radio" id="cs-blue"> <label class="cs-blue"
								for="cs-blue">Blue</label>
						</div>
						<div class="cs-item">
							<input type="radio" id="cs-yellow"> <label
								class="cs-yellow" for="cs-yellow">Yellow</label>
						</div>
						<div class="cs-item">
							<input type="radio" id="cs-red"> <label class="cs-red"
								for="cs-red">Red</label>
						</div>
						<div class="cs-item">
							<input type="radio" id="cs-green"> <label
								class="cs-green" for="cs-green">Green</label>
						</div>
					</div>
				</div>
				<div class="filter-widget">
					<h4 class="fw-title">Size</h4>
					<div class="fw-size-choose">
						<div class="sc-item">
							<input type="radio" id="s-size"> <label for="s-size">s</label>
						</div>
						<div class="sc-item">
							<input type="radio" id="m-size"> <label for="m-size">m</label>
						</div>
						<div class="sc-item">
							<input type="radio" id="l-size"> <label for="l-size">l</label>
						</div>
						<div class="sc-item">
							<input type="radio" id="xs-size"> <label for="xs-size">xs</label>
						</div>
					</div>
				</div>
				<div class="filter-widget">
					<h4 class="fw-title">Tags</h4>
					<div class="fw-tags">
						<a href="#">Towel</a> <a href="#">Shoes</a> <a href="#">Coat</a> <a
							href="#">Dresses</a> <a href="#">Trousers</a> <a href="#">Men's
							hats</a> <a href="#">Backpack</a>
					</div>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-lg-6">
						<div class="product-pic-zoom">
							<img class="product-big-img"
								src="/resources/img/product-single/product-1.jpg" alt="">
							<div class="zoom-icon">
								<i class="fa fa-search-plus"></i>
							</div>
						</div>
						<div class="product-thumbs">
							<div class="product-thumbs-track ps-slider owl-carousel">
								<div class="pt active"
									data-imgbigurl="/resources/img/product-single/product-1.jpg">
									<img src="/resources/img/product-single/product-1.jpg" alt="">
								</div>
								<div class="pt"
									data-imgbigurl="/resources/img/product-single/product-2.jpg">
									<img src="/resources/img/product-single/product-2.jpg" alt="">
								</div>
								<div class="pt"
									data-imgbigurl="/resources/img/product-single/product-3.jpg">
									<img src="/resources/img/product-single/product-3.jpg" alt="">
								</div>
								<div class="pt"
									data-imgbigurl="/resources/img/product-single/product-3.jpg">
									<img src="/resources/img/product-single/product-3.jpg" alt="">
								</div>
							</div>
						</div>
					</div>

			 
				<form action="modify" method="post">

						<div class="col-lg-12">
							<div class="product-details">
								<div class="pd-title">
									<input type="hidden" name="board_id" value="${goods.board_id}">
									
								${goods.board_id}//${goods.content}//${goods.goodsVO.goodsname}
									${goods.content}${goods.title}
									<span>${board_g.goodsVO.goods_id}</span>
									<h3></h3>
									 
				
									<a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
								</div>
								<div class="pd-rating">
								 
									 
						              <span class="star-prototype"> ${rate.avgscore}</span>          
						 
				  
					
								</div>
								<div class="pd-desc">
									<a>${board_g.goodsVO.description}</a>
									<h4>${board_g.goodsVO.price}원</h4> 
									
								</div>
								<div class="pd-color">
									<h6>Color ${board_g.goodsVO.pcolor} 뿌릴예정</h6>
									<div class="pd-color-choose">
										<div class="cc-item">
											<input type="radio" id="cc-black"> <label
												for="cc-black"></label>
										</div>
										<div class="cc-item">
											<input type="radio" id="cc-yellow"> <label
												for="cc-yellow" class="cc-yellow"></label>
										</div>
										<div class="cc-item">
											<input type="radio" id="cc-violet"> <label
												for="cc-violet" class="cc-violet"></label>
										</div>
									</div>
								</div>
								<div class="pd-size-choose">
									<div class="sc-item">${goods.psize} 뿌릴예정
										<input type="radio" id="sm-size"> <label for="sm-size">s</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="md-size"> <label for="md-size">m</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="lg-size"> <label for="lg-size">l</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="xl-size"> <label for="xl-size">xs</label>
									</div>
								</div>
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
									<a href="#" class="primary-btn pd-cart">Add To Cart</a>
								</div>
								<ul class="pd-tags">
									<li><span>CATEGORIES</span>: ${board_g.categoryVO.category_id} </li>
									<li><span>TAGS</span>: #${board_g.hashtag}</li>
								</ul>
								<div class="pd-share">
									<div class="p-code">Sku : ${stocks.stockname}</div>
									<div class="pd-social">
										<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
											class="ti-twitter-alt"></i></a> <a href="#"><i
											class="ti-linkedin"></i></a>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div class="product-tab">
					<div class="tab-item">
						<ul class="nav" role="tablist">
							<li><a class="active" data-toggle="tab" href="#tab-1"
								role="tab"> 상세정보 </a></li>
							<li><a data-toggle="tab" href="#tab-2" role="tab"> 고객리뷰
							</a></li>
							<li><a data-toggle="tab" href="#tab-3" role="tab"> 배송 및
									환불 </a></li>
						</ul>
					</div>
					<div class="tab-item-content">
						<div class="tab-content">
							<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
								<div class="product-content">
									<div class="row">
										<div class="col-lg-7">
											<h5>제품설명</h5>
											<p>제품에대해설명해보자</p>
											<h5>${board_g.content}</h5>
 
										</div>
										<div class="col-lg-5">
											<img src="img/product-single/tab-desc.jpg" alt="">
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="tab-2" role="tabpanel">
								<div class="specification-table">
									<table>
										<tr>
											<td class="p-catagory">Customer Rating</td>
											<td>
												<div class="pd-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i> <span>(5)</span>
												</div>
											</td>
										</tr>
										<tr>
											<td class="p-catagory">Price</td>
											<td>
												<div class="p-price">$495.00</div>
											</td>
										</tr>
										<tr>
											<td class="p-catagory">Add To Cart</td>
											<td>
												<div class="cart-add">+ add to cart</div>
											</td>
										</tr>
										<tr>
											<td class="p-catagory">Availability</td>
											<td>
												<div class="p-stock">22 in stock</div>
											</td>
										</tr>
										<tr>
											<td class="p-catagory">Weight</td>
											<td>
												<div class="p-weight">1,3kg</div>
											</td>
										</tr>
										<tr>
											<td class="p-catagory">Size</td>
											<td>
												<div class="p-size">Xxl</div>
											</td>
										</tr>
										<tr>
											<td class="p-catagory">Color</td>
											<td><span class="cs-color"></span></td>
										</tr>
										<tr>
											<td class="p-catagory">Sku</td>
											<td>
												<div class="p-code">00012</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="tab-pane fade" id="tab-3" role="tabpanel">
								<div class="customer-review-option">
									<h4>2 Comments</h4>
									<div class="comment-option">
										<div class="co-item">
											<div class="avatar-pic">
												<img src="img/product-single/avatar-1.png" alt="">
											</div>
											<div class="avatar-text">
												<div class="at-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i>
												</div>
												<h5>
													Brandon Kelley <span>27 Aug 2019</span>
												</h5>
												<div class="at-reply">Nice !</div>
											</div>
										</div>
										<div class="co-item">
											<div class="avatar-pic">
												<img src="img/product-single/avatar-2.png" alt="">
											</div>
											<div class="avatar-text">
												<div class="at-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i>
												</div>
												<h5>
													Roy Banks <span>27 Aug 2019</span>
												</h5>
												<div class="at-reply">Nice !</div>
											</div>
										</div>
									</div>
									<div class="personal-rating">
										<h6>Your Ratind</h6>
										<div class="rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
									</div>
									<div class="leave-comment">
										<h4>Leave A Comment</h4>
										<form action="#" class="comment-form">
											<div class="row">
												<div class="col-lg-6">
													<input type="text" placeholder="Name">
												</div>
												<div class="col-lg-6">
													<input type="text" placeholder="Email">
												</div>
												<div class="col-lg-12">
													<textarea placeholder="Messages"></textarea>
													<button type="submit" class="site-btn">Send
														message</button>
												</div>
											</div>
										</form>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Product Shop Section End -->



	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>
