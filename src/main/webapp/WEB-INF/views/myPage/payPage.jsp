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
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body style="padding-top: 100px">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<!-- Shopping Cart Section Begin -->
	<section class="checkout-section spad">
		<div class="container">
			<form action="#" class="checkout-form" name='form'>
				<div class="row">
					<div class="col-lg-8">

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
							<div class="col-lg-4">
								<label for="fir">이름</label> <input type="text" readonly
									value="<sec:authentication property="principal.name"/>">
							</div>
							<div class="col-lg-8"></div>
							<div class="col-lg-5">
								<label for="cun-name">이메일</label> <input type="text" readonly
									value="<sec:authentication property="principal.member_id"/>">
							</div>
							<div class="col-lg-5">
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
							<div class="col-lg-5">
								<label for="fir">받는 사람</label> <input type="text" id="fir">
							</div>
							<div class="col-lg-5">
								<label for="phone">연락처</label> <input type="text" id="phone">
							</div>
							<div class="group-input col-lg-4">

								<label for="street">주소</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">

										<input type="button" class="form-control" onClick="goPopup();"
											value="주소검색"
											style="font-size: 10pt; background-color: #000000; color: #ffffff; font-weight: bold" />
									</div>
									<input class="form-control" type="text" width="6px"
										style="font-size: 13pt;" id="zipno" name="zipno" />
								</div>

							</div>
							<div class="col-lg-10">
								<input class="form-control" type="text" style="font-size: 13pt;"
									id="address" name="address" />
							</div>



							<div class="col-lg-12">
								<br>
							</div>
							<div class="col-lg-12 ">
								<div class="row">
									<div class="col-lg-6">
										<h5 style="font-weight: bold">포인트</h5>
									</div>

								</div>

								<hr>
							</div>
							<div class="col-lg-6">
								<div class="row ">
									<div class="col-lg-7">
										<label for="point">사용 가능 포인트 ${point.sum}P</label> <input
											type="text" id="point" />
									</div>
									<div class="col-lg-4 "
										style="position: absolute; right: 50px; bottom: 35px;">
										<button onclick="usePoint()">전액사용</button>

									</div>

								</div>
								<br>
							</div>
							<div class="col-lg-12 ">
								<div class="row">
									<div class="col-lg-6">
										<h5 style="font-weight: bold">결제 수단</h5>
									</div>

								</div>

								<hr>
							</div>
							<div class="col-lg-12 ">
								<div class="row">
									<div class="col-lg-1">
										<h5 style="font-weight: bold">결제 수단</h5>
									</div>

								</div>

								<hr>
							</div>
						</div>
					</div>
					<div class="col-lg-4 ">

						<div class="place-order">
							<h4>결제 금액</h4>
							<div class="order-total">
								<ul class="order-table" id='pay'>
									<li>Product <span>Total</span></li>
									<input type="hidden" name="goodsSum">
									<input type="hidden" name="goodsName">
								</ul>

								<div class="order-btn">
									<button type="submit" onclick="payNow('card')"
										class="site-btn place-btn">Place Order</button>

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
					//상품 가져오기 
					function getGoods() {
						var payGoods = JSON.parse(sessionStorage
								.getItem("payGoods"));
						var html = "";
						for (var i = 0; i < payGoods.length; i++) {
							html += "<li class='fw-normal'>"
									+ payGoods[i].name
									+ "&nbsp x &nbsp "
									+ payGoods[i].amount
									+ " <span>"
									+ payGoods[i].sum
									+ "<input type='hidden' name='goodsSum' value='"+ payGoods[i].sum+"'><input type='hidden' name='goodsName' value='"+ payGoods[i].name+"'>"
									+ "원</span></li>"

						}
						html += "<li class='total-price'>총 상품 금액 <span id='goodsTotal1'></span><input type='hidden' id='goodsTotal'></li>"
								+ "<li class='fw-normal'>배송비  <span id='deliveryPay1'></span><input type='hidden' id='deliveryPay'></li>"
								+ "<li class='fw-normal'>포인트 사용  <span id='payPoint1'></span><input type='hidden' id='payPoint'></li>"
								+ "<li class='total-price'>최종 결제 금액 <span id='lastTotal1'></span><input type='hidden' id='lastTotal'></li>"
								+ "<li class='fw-normal'>적립액 <span id='innerPoint1'></span><input type='hidden' id='innerPoint'></li>"
						$('#pay').append(html);

						// 총 상품 금액 계산 
						var sumCount = this.form.goodsSum.length
						var total = 0;

						for (var i = 1; i < sumCount; i++) {
							total += parseInt(this.form.goodsSum[i].value);
						}

						$("#goodsTotal1").text(total + "원");
						$("#goodsTotal").val(total);

						// 배송비 계산
						if (total < 30000) {
							$("#deliveryPay1").text(2500 + "원")
							$("#deliveryPay").val(2500)
						} else {
							$("#deliveryPay1").text(0 + "원")
							$("#deliveryPay").val(0)
						}
						$('#payPoint').val(0);
						$('#payPoint1').text(0 + "P");
						lastTotal();

					}

			);

	// 주소 검색 팝업
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	// 주소 콜백
	function jusoCallBack(roadFullAddr, zipNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		$('#address').val(roadFullAddr);
		$('#zipno').val(zipNo);
	}

	// 전체 포인트 사용
	function usePoint() {
		event.preventDefault();
		$("#point").val("${point.sum}");
		$('#payPoint').val("-" + $("#point").val());
		$('#payPoint1').text("-" + $("#point").val() + "P");
		lastTotal()
	}

	// 포인트 값 체인지
	$("#point").on("change keyup paste", function() {

		$('#payPoint').val("-" + $("#point").val());
		$('#payPoint1').text("-" + $("#point").val() + "P");
	})

	// 최종 결제 금액 계산
	function lastTotal() {
		var lastTotal = 0;
		lastTotal = parseInt($("#goodsTotal").val())
				+ parseInt($("#payPoint").val())
				+ parseInt($("#deliveryPay").val());
		$("#lastTotal").val(lastTotal)
		$("#lastTotal1").text(lastTotal + "원")
		// 적립 포인트 계산
		var innerPoint = Math.floor(lastTotal * 0.01);
		$("#innerPoint1").text(innerPoint + "P");
		$("#innerPoint").val(innerPoint);
	}
</script>

<script>
	IMP.init('imp29855153');

	function payNow(method) {
		event.preventDefault();
		// 회원정보
		var email = "${member.member_id}";
		var name = "${member.name}";
		var tel = "${member.tel}";
		var address = "${member.address}";

		//결제 정보
		var lastTotal = $("#lastTotal").val();
		var nameCount = this.form.goodsName.length - 2;
		var name = this.form.goodsName[1].value;
		if (nameCount > 1) {
			name += " 외 " + nameCount + "개"
		}

		IMP.request_pay({
			pg : 'html5_inicis', // version 1.1.0부터 지원.
			pay_method : method,
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : name,
			amount : lastTotal, //판매 가격
			buyer_email : email,
			buyer_name : name,
			buyer_tel : tel,
			buyer_addr : address,
			buyer_postcode : '123-456',
			m_redirect_url : 'localhost:8383/store/home'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
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