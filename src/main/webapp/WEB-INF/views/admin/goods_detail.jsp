<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- 제이쿼리 사용하는 cnd -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/sidemenu/https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/sidemenu/js/custom.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- Bootstrap -->
<link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="/resources/sidemenu/css/styles.css" rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">



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

	//카테고리
	function fire_ajax_submit(id, name) {
		console.log(id);
		console.log(name);
		var category = $("#category").val();

		var form = {

			category : category,

			name : name,

		};
		var url = "/category/smallcategory/" + id;
		$.ajax({

			type : "Post",
			contentType : 'application/json; charset=utf-8',
			url : url,
			data : JSON.stringify(form),
			cache : false,

			success : function(data) {
				console.log("SUCCESS : ", data);
				console.log(id);
				$('#input').html(data);

			},

			error : function(e) {
				console.log("ERROR : ", e);

			}
		});
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

.owl-carousel .owl-item img {
	display: block;
	width: 130px;
	height: 150px;
}

.pcolor {
	width: 45px;
	background-color: #e7ab3c;
	height: 30px;
}

.form_radio_btn {
	display: inline-block;
	margin-right: 10px;
}

.form_radio_btn input[type=radio] {
	display: none;
}

.form_radio_btn label {
	display: inline-block;
	cursor: pointer;
	padding: 0px 15px;
	line-height: 34px;
	border: 1px solid #999;
	/* border-radius: 6px; */
	 user-select: none; 
}

/* Checked */
.form_radio_btn input[type=radio]:checked+label {
	background: #ffe0a6;
}

/* Hover */
.form_radio_btn label:hover {
	color: #666;
}
</style>

</head>
<body style="padding-top: 80px">


	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Page Content -->
	<!-- Product Shop Section Begin -->

	<section class="product-shop spad page-details">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="sidebar" style="display: block;">
						<ul class="nav">
							<li class="submenu">
								<!-- 고양이 --> <a href="#" style="font-size: 20px;"> <i
									class="fas fa-cat"></i>${cateBoard[0].categoryname}<span
									class="caret pull-right"></span>
							</a> <!-- Sub menu -->
								<ul>
									<c:forEach items="${sortBoard}" var="vo" begin="0" end="6">


										<li><a href="#" style="font-size: 15px;"
											onclick="fire_ajax_submit('${vo.category_id}' , '${cateBoard[0].categoryname} / ${vo.categoryname}');">${vo.categoryname}</a></li>


									</c:forEach>
								</ul>
							</li>
						</ul>


						<!-- 강아지 -->
						<ul class="nav">
							<li class="submenu"><a href="#" style="font-size: 20px;">

									<i class="fas fa-dog"></i>${cateBoard[1].categoryname}<span
									class="caret pull-right"></span>
							</a> <!-- Sub menu -->
								<ul>
									<c:forEach items="${sortBoard}" var="vo2" begin="7" end="13">


										<li><a href="#" style="font-size: 15px;"
											onclick="fire_ajax_submit('${vo2.category_id}' , '${cateBoard[1].categoryname} / ${vo2.categoryname}');">${vo2.categoryname}</a></li>



									</c:forEach>
								</ul></li>
						</ul>

						<!-- 조류 -->
						<ul class="nav">
							<li class="submenu"><a href="#" style="font-size: 20px;">
									<i class="fas fa-frog"></i>${cateBoard[2].categoryname}<span
									class="caret pull-right"></span>
							</a> <!-- Sub menu -->
								<ul>
									<c:forEach items="${sortBoard}" var="vo3" begin="14" end="17">


										<li><a href="#" style="font-size: 15px;"
											onclick="fire_ajax_submit('${vo3.category_id}' , '${cateBoard[2].categoryname} / ${vo3.categoryname}');">${vo3.categoryname}</a></li>


									</c:forEach>
								</ul></li>
						</ul>

						<!-- 어류 -->
						<ul class="nav">
							<li class="submenu"><a href="#" style="font-size: 20px;">
									<i class="fas fa-fish"></i>${cateBoard[3].categoryname}<span
									class="caret pull-right"></span>
							</a> <!-- Sub menu -->
								<ul>
									<c:forEach items="${sortBoard}" var="vo4" begin="18" end="24">


										<li><a href="#" style="font-size: 15px;"
											onclick="fire_ajax_submit('${vo4.category_id}' , '${cateBoard[3].categoryname} / ${vo4.categoryname}');">${vo4.categoryname}</a></li>


									</c:forEach>
								</ul></li>
						</ul>

						<!-- 파충류 -->
						<ul class="nav">
							<li class="submenu"><a href="#" style="font-size: 20px;">
									<i class="fas fa-crow"></i>${cateBoard[4].categoryname}<span
									class="caret pull-right"></span>
							</a> <!-- Sub menu -->
								<ul>
									<c:forEach items="${sortBoard}" var="vo5" begin="25" end="29">


										<li><a href="#" style="font-size: 15px;"
											onclick="fire_ajax_submit('${vo5.category_id}' , '${cateBoard[4].categoryname} / ${vo5.categoryname}');">${vo5.categoryname}</a></li>


									</c:forEach>
								</ul></li>
						</ul>

						<!-- 기타 -->
						<ul class="nav">
							<li class="submenu"><a href="#" style="font-size: 20px;">
									<i class="fas fa-paw"></i>${cateBoard[5].categoryname}<span
									class="caret pull-right"></span>
							</a> <!-- Sub menu -->
								<ul>
									<c:forEach items="${sortBoard}" var="vo6" begin="30" end="36">


										<li><a href="#" style="font-size: 15px;"
											onclick="fire_ajax_submit('${vo6.category_id}' , '${cateBoard[5].categoryname} / ${vo6.categoryname}');">${vo6.categoryname}</a></li>


									</c:forEach>
								</ul></li>
						</ul>

					</div>
				</div>



				<!--  카테고리 부트스트랩 end -->









				<div class="col-lg-9">

					<form action="modify" method="post">
						<!-- input ajax 시작하는 곳! -->
						<div id="input" class="row">


							<div class="col-lg-6">
								<div class="product-pic-zoom">
									<img class="product-big-img" height="500"
										src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}"
										alt="">
									<div class="zoom-icon">
										<i class="fa fa-search-plus"></i>
									</div>
								</div>
								<div class="product-thumbs">
									<div class="product-thumbs-track ps-slider owl-carousel">
										<div class="pt active"
											data-imgbigurl="/resources/img/admin/goods/${goods.goodsVO.thumbnail}">
											<img
												src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}"
												width="1270" alt="">
										</div>
										<c:forEach var="goods" items="${img}">
											<div class="pt"
												data-imgbigurl="/resources/img/admin/board/${goods.imgname}">
												<img src="/resources/img/admin/board/${goods.imgname}"
													alt="">
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="product-details">
									<div class="pd-title">
										<input type="hidden" name="board_id" value="${goods.board_id}">
										<input type="hidden" name="goods_id"
											value="${goods.goodsVO.goods_id}"> <input
											type="hidden" name="goods_id" value="${goods.pdate}">
										<span>${goods.categoryVO.categoryname}/${goods.categoryVO.sortname}</span>
										<h3>${goods.goodsVO.goodsname}</h3>

										<input type="button" class="btn"
											style="background-color: #e7ab3c; float: right; color: #ffffff"
											value="게시글수정"
											onClick="location.href='${pageContext.request.contextPath}/admin/board/${goods.board_id}'">


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
										<c:set var="pcolor" value="${goods.goodsVO.pcolor}" />
										<c:set var="color" value="${fn:split(pcolor, ',')}" />
										<c:forEach var="c" items="${color}">

											<div class="btn-group btn-group-toggle" data-toggle="buttons">
												<label class="btn btn-warning pcolor"> <input
													type="radio" name="pcolor" id="pcolor"> ${c}
												</label>
											</div>

										</c:forEach>
									</div>

								 
										<c:set var="pcolor" value="${goods.goodsVO.pcolor}" />
										<c:set var="color" value="${fn:split(pcolor, ',')}" />
										<c:forEach var="c" items="${color}">
											<div class="form_radio_btn">
												<input id="pcolor1" type="radio" name="pcolor1" value="${c}">
												<label for="pcolor1">${c} </label>
											</div>

										</c:forEach>
									 


									<div class="pd-size-choose">
										<c:set var="psize" value="${goods.goodsVO.psize}" />
										<c:set var="size" value="${fn:split(psize, ',')}" />
										<c:forEach var="s" items="${size}">
											<div class="sc-item">
												<input type="radio" id="size" name="size" /> <label
													for="size">${s}</label>
											</div>
										</c:forEach>
									</div>







									<div class="quantity">
										<div class="pro-qty">
											<span class="dec qtybtn">-</span> <input id="amount"
												type="text" value="1"> <span class="inc qtybtn">+</span>
										</div>
										<div onclick="inputCart()" class="primary-btn pd-cart"
											style="cursor: pointer;">Add To Cart</div>
									</div>
									<ul class="pd-tags">
										<li><span>CATEGORIES</span>:
											${goods.categoryVO.categoryname}/${goods.categoryVO.sortname}</li>
										<li><span>TAGS</span>: <c:set var="hashtag"
												value="${goods.hashtag}" /> <c:set var="tag"
												value="${fn:split(hashtag, ' ')}" /> <c:forEach var="t"
												items="${tag}">

												<a href="xxx">${t}</a>

											</c:forEach></li>
									</ul>
									<div class="pd-share">
										<div class="p-code">
											<small>재고상태 : ${goods.goodsVO.stockVO.stockname}</small>
										</div>

									</div>
								</div>
							</div>



							<div class="product-tab">
								<div class="tab-item">
									<ul class="nav" role="tablist">
										<li><a class="active" data-toggle="tab" href="#tab-1"
											role="tab"> 상세정보 </a></li>
										<li><a data-toggle="tab" href="#tab-2" role="tab">
												고객리뷰 </a></li>
										<li><a data-toggle="tab" href="#tab-3" role="tab">주문가이드</a></li>
									</ul>
								</div>
								<div class="tab-item-content">
									<div class="tab-content">
										<div class="tab-pane fade-in active" id="tab-1"
											role="tabpanel">
											<div class="product-content">
												<div class="row">
													<div class="col-lg-7">
														<h5>Introduction</h5>
														<p>어대공에서 살고 있는 냥냥이</p>
														<h5>Features</h5>
														<p>${goods.content}</p>
													</div>
													<div class="col-lg-5">
														<img src="/resources/img/file/cat1.jpg" alt="">
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


											<br> <br>
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
																	사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할
																	수 있습니다. &nbsp; <br> <br>무통장 입금은 상품 구매 대금은
																	PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>주문
																	시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며
																	입금되지 않은 주문은 자동취소 됩니다. <br>

																</p>
																<p>품질보증기준: 전자상거래 소비자 보호법에 의거하여 소비자 청약철회 가능한 기준에 따름.</p>
																<p>구매자가 미성년자일 경우 법정 대리인이 계약에 동의하지 않을 때 구매를 취소할 수
																	있습니다.</p></td>
														</tr>
														<tr>
															<th scope="row">배송정보</th>
															<td><p>
																	펫츠하우스는 대한민국 택배 no.1 우체국택배를 이용하여<br>가장 안전하고, 신속하게
																	배송하여 드립니다 :) <br>대부분 출고 다음날에 바로 도착하며 (주말 제외)<br>지역
																	택배 기사님들의 일정과 기상상황에 따라 변동이 있을 수 있습니다. <br>기본 배송
																	준비일은 입고지연 상품 제외, 2~5일 정도가 소요되고 있습니다.<br>
																</p></td>
														</tr>
														<tr>
															<th scope="row">교환 및 반품정보</th>
															<td><p>
																	[교환/반품 안내]<br>물품 수령 후(택배 도착일자 기준) 7일 이내에 Q&amp;A
																	"배송 후 교환/반품" 게시판 또는 고객센터 [070-7000-0000]
																</p>
																<p>
																	로 반드시 접수 해주세요. 글쓰기시 양식이 자동으로 등록되어 있으며, 사전에 신청해 주신 상품에
																	한해서만 교환/반품이 가능합니다.<br>접수 시 펫츠하우스에서 우체국 택배 회수접수를
																	도와드리고 있습니다.
																</p>

																<p>
																	*패킹하여 보내실 때는 물품 수령시와 동일하게 포장해 주세요.<br>택에 손상이 있는
																	경우에는 반품과 교환이 모두 불가합니다.<br>성함,주소,전화번호,보내시는 상품,사유등
																	반품카드 양식에 맞게 적어 보내주셔야 처리가 가능합니다.
																</p>


																<p>
																	&lt;교환반품 불가사항&gt;<br>-상품 수령 후 7일 이상 경과된 경우<br>-상품
																	구매시 교환/환불 불가능이 명시되어 있는경우<br>-사용 흔적(집냄새,향수냄새,체취) /
																	텍 제거 및 바코드 훼손, 오염이 발견된 상품<br>-세일상품
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

						<!-- input ajax 끝나는 곳! -->
					</form>
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>

</html>