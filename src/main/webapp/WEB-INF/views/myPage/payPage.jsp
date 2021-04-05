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
<title>결제페이지</title>

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

<body style="padding-top: 128px">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Shopping Cart Section Begin -->
	<section class="checkout-section spad">
		<div class="container">
			<form action="#" class="checkout-form" name='form'>
				<div class="row">
					<div class="col-lg-6">

						<h4>결제 상세</h4>
						<div class="row">
							<div class="col-lg-12 ">
								<div class="row">
									<div class="col-lg-6">
										<h5 style="font-weight: bold">주문자</h5>
									</div>
									<div class="col-lg-6 text-right">
										<span>정보 수정</span>
									</div>
								</div>

								<hr>
							</div>
							<div class="col-lg-7">
								<label for="fir">이름</label> <input type="text" readonly
									value="<sec:authentication property="principal.name"/>">
							</div>
							<div class="col-lg-6">
								<label for="cun-name">이메일</label> <input type="text" readonly
									value="<sec:authentication property="principal.member_id"/>">
							</div>
							<div class="col-lg-6">
								<label for="cun">전화번호</label> <input type="text" readonly
									value="0<sec:authentication property="principal.tel"/>">
							</div>
							<div class="col-lg-12">
								<br>
							</div>
							<div class="col-lg-12 ">
								<div class="row">
									<div class="col-lg-6">
										<h5 style="font-weight: bold">배송지 정보</h5>
									</div>
									<div class="col-lg-6 text-right">
										<span>내 정보 가져오기</span>
									</div>
								</div>

								<hr>
							</div>
							<div class="col-lg-7">
								<label for="fir">받는 사람</label> <input type="text" id="fir">
							</div>
							<div class="col-lg-12">
								<label for="street">주소</label> <input type="text" id="street"
									class="street-first">
							</div>
							<div class="col-lg-6">
								<label for="email">Email Address<span>*</span></label> <input
									type="text" id="email">
							</div>
							<div class="col-lg-6">
								<label for="phone">Phone<span>*</span></label> <input
									type="text" id="phone">
							</div>

						</div>
					</div>
					<div class="col-lg-6">

						<div class="place-order">
							<h4>결제 금액</h4>
							<div class="order-total">
								<ul class="order-table" id='pay'>
									<li>Product <span>Total</span></li>

								</ul>

								<div class="order-btn">
									<button type="submit" onclick="goodsTotal()" class="site-btn place-btn">Place
										Order</button>

								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


</body>
<script type="text/javascript">
	$(document)
			.ready(
					function getGoods() {
						var payGoods = JSON.parse(sessionStorage
								.getItem("payGoods"));
						var html = "";
						for (var i = 0; i < payGoods.length; i++) {
							html += "<li class='fw-normal'>" + payGoods[i].name
									+ "&nbsp x &nbsp " + payGoods[i].amount
									+ " <span>" + payGoods[i].sum
									+ "원</span></li>"

						}
						html += "<li class='total-price'>총 상품 금액 <span><label>123</label></span></li>"
								+ "<li class='fw-normal'>배송비 <span>2500원</span></li>"
								+ "<li class='fw-normal'>포인트 사용 <span>$240.00</span></li>"
								+ "<li class='total-price'>최종 결제 금액 <span>$240.00</span></li>"
								+ "<li class='fw-normal'>적립액</li>"
								
						$('#pay').append(html);		
					}
				
					
			);
	function goodsTotal() {
		var as = parseInt($("#goodsTotal").value);
		console.log(as);
	}

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