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
<!-- Bootstrap -->
<link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="/resources/sidemenu/css/styles.css" rel="stylesheet">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/sidemenu/https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/sidemenu/js/custom.js"></script>
  

<script>
	$(document).ready(function() {
		$.fn.generateStars = function() {
			return this.each(function(i, e) {
				$(e).html($('<span/>').width($(e).text() * 16));
			});
		};

		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();

	});
	function inputCart() {

		var cart = JSON.parse(sessionStorage.getItem("cartList"));

		if (!cart) {
			console.log("카트생성");
			cart = new Array();
		}
		var goods = new Object();
		goods.board_id = '${goods.board_id}';
		goods.amount = parseInt($("#amount").val());
		console.log(goods);
		cart.push(goods);

		console.log(cart);
		sessionStorage.setItem("cartList", JSON.stringify(cart));
		if (confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?") == true) { //확인
			window.location.assign("/myPage/cart");
		} else { //취소

			return false;

		}

	}
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

.shoppingguide {
	margin: 10px auto 10%;
	max-width: 1100px;
	background: #fff;
	border: 1px #d5d5d5 solid;
	color: #555;
	line-height: 23px;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
	font-size: 8px;
}

table {
	width: 100%;
	boder-collapse: collapse;
}

td, th {
	border-bottom: 1px solid #000000;
}

th {
	background: #FFFFF0;
	text-align: -internal-center;
	font-size: 20px;
}

h2 {
	text-align: center;
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
							<a href="#">Towel</a> <a href="#">Shoes</a> <a href="#">Coat</a>
							<a href="#">Dresses</a> <a href="#">Trousers</a> <a href="#">Men's
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
										<input type="hidden" name="goods_id"
											value="${goods.goodsVO.goods_id}"> <input
											type="hidden" name="goods_id" value="${goods.pdate}">

										<span>${goods.goodsVO.goods_id}</span>
										<h3>${goods.goodsVO.goodsname}</h3>



										<a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
									</div>
									<div class="pd-rating">



										<c:if test="${one.goodsVO.goods_id eq goods.goodsVO.goods_id}">
											<span class="star-prototype"> ${one.avgscore}</span>
											<span> &nbsp; ${one.count}개 리뷰</span>
										</c:if>



									</div>
									<div class="pd-desc">
										<small>${goods.goodsVO.description}</small>
										<h4>
											<fmt:formatNumber value="${goods.goodsVO.price}"
												pattern="###,###,###" />
											원
										</h4>

									</div>
									<div class="pd-color">
										<h6>Color ${goods.goodsVO.pcolor} 뿌릴예정</h6>
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
										<div class="sc-item">${goods.goodsVO.psize}
											뿌릴예정 <input type="radio" id="sm-size"> <label
												for="sm-size">s</label>
										</div>
										<div class="sc-item">
											<input type="radio" id="md-size"> <label
												for="md-size">m</label>
										</div>
										<div class="sc-item">
											<input type="radio" id="lg-size"> <label
												for="lg-size">l</label>
										</div>
										<div class="sc-item">
											<input type="radio" id="xl-size"> <label
												for="xl-size">xs</label>
										</div>
									</div>
									<div class="quantity">
										<div class="pro-qty">
											<span class="dec qtybtn">-</span> <input id="amount" type="text"
												value="1"> <span class="inc qtybtn">+</span>
										</div>
										<div onclick="inputCart()" class="primary-btn pd-cart"
											style="cursor: pointer;">Add To Cart</div>
									</div>
									<ul class="pd-tags">
										<li><span>CATEGORIES</span>:
											${goods.categoryVO.categoryname}/${goods.categoryVO.sortname}
										</li>
										<li><span>TAGS</span>: #${goods.hashtag}</li>
									</ul>
									<div class="pd-share">
										<div class="p-code">재고 :
											${goods.goodsVO.stockVO.stockname}</div>
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

												<p>${goods.content}</p>

											</div>
											<div class="col-lg-5">
												<img src="img/product-single/tab-desc.jpg" alt="">
											</div>
										</div>
									</div>
								</div>



								<!--                   리뷰                 -->
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

									<h2>주문가이드</h2>
									<div class="shoppingguide">

										<table>

											<colgroup>
												<col style="width: 20%;">
												<col style="width: 80%;">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">상품결제정보</th>
													<td><p>
															고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의
															사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수
															있습니다. &nbsp; <br> <br>무통장 입금은 상품 구매 대금은 PC뱅킹,
															인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>주문 시
															입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지
															않은 주문은 자동취소 됩니다. <br>

														</p>
														<p>품질보증기준: 전자상거래 소비자 보호법에 의거하여 소비자 청약철회 가능한 기준에 따름.</p>
														<p>구매자가 미성년자일 경우 법정 대리인이 계약에 동의하지 않을 때 구매를 취소할 수 있습니다.</p>
													</td>
												</tr>
												<tr>
													<th scope="row">배송정보</th>
													<td><p>
															펫츠하우스는 대한민국 택배 no.1 우체국택배를 이용하여<br>가장 안전하고, 신속하게
															배송하여 드립니다 :) <br>대부분 출고 다음날에 바로 도착하며 (주말 제외)<br>지역
															택배 기사님들의 일정과 기상상황에 따라 변동이 있을 수 있습니다. <br>기본 배송 준비일은
															입고지연 상품 제외, 2~5일 정도가 소요되고 있습니다.<br>
														</p></td>
												</tr>
												<tr>
													<th scope="row">교환 및 반품정보</th>
													<td><p>
															[교환/반품 안내]<br>물품 수령 후(택배 도착일자 기준) 7일 이내에 Q&amp;A "배송
															후 교환/반품" 게시판 또는 고객센터 [070-7000-0000]
														</p>
														<p>
															로 반드시 접수 해주세요. 글쓰기시 양식이 자동으로 등록되어 있으며, 사전에 신청해 주신 상품에
															한해서만 교환/반품이 가능합니다.<br>접수 시 펫츠하우스에서 우체국 택배 회수접수를
															도와드리고 있습니다.
														</p>

														<p>
															*패킹하여 보내실 때는 물품 수령시와 동일하게 포장해 주세요.<br>택에 손상이 있는 경우에는
															반품과 교환이 모두 불가합니다.<br>성함,주소,전화번호,보내시는 상품,사유등 반품카드 양식에
															맞게 적어 보내주셔야 처리가 가능합니다.
														</p>


														<p>
															&lt;교환반품 불가사항&gt;<br>-상품 수령 후 7일 이상 경과된 경우<br>-상품
															구매시 교환/환불 불가능이 명시되어 있는경우<br>-사용 흔적(집냄새,향수냄새,체취) / 텍
															제거 및 바코드 훼손, 오염이 발견된 상품<br>-세일상품
														</p>
														<p>-배송시 생긴 구김, 마감 박음질, 제작과정에서 발생하는 냄새나 초크자국 등 대량생산으로
															인해 생긴 사유는 불량으로 간주되지 않습니다.</p>
														<p>
															<br>*불량상품의 재발송 시 왕복배송비는 펫츠하우스가 부담합니다.
														</p></td>
												</tr>
											</tbody>
										</table>
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


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>

</html>
