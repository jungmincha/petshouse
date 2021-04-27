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

<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js"
	type="application/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>
.pimg {
	width: 40px;
	height: 40px;
	border-radius: 20%;
}

#point-btn {
	background-color: black;
	color: white;
	border-color: black;
	font-family: "MY FONT", serif;
	font: inherit;
	font-weight: 700;
	padding: 10px;
	font-size: small;
}

#point-btn:hover {
	color: #e7ab3c;
}

#address-btn {
	color: #ffffff;
}

#address-btn:hover {
	color: #e7ab3c;
}
</style>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<body style="padding-top: 100px">
	<input type="hidden" id="memberName"
		value="<sec:authentication property="principal.name"/>">


	<!-- Shopping Cart Section Begin -->
	<section class="checkout-section spad">
		<div class="section-title">
			<h2 style="margin-bottom: 20px; font-size: 30px;">주문결제</h2>
		</div>
		<div class="container">
			<form action="/myPage/payPage/insert" class="checkout-form"
				name='form' method="post">
				<input type="hidden" name="memberVO.member_id"
					value="<sec:authentication property="principal.member_id"/>">
				<div class="row">
					<div class="col-lg-8" style="padding-right: 40px;">

						<h4>결제 상세</h4>
						<div class="row">
							<div class="col-lg-12 ">
								<div class="row">
									<div class="col-lg-6">
										<h5 style="font-weight: bold">주문자</h5>
									</div>
									<div class="col-lg-6 text-right">
										<a href="/myPage/updateMember"><span>정보 수정</span></a>
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
										<a href="#" onclick="reset()">초기화</a>
									</div>
								</div>

								<hr>
							</div>
							<div class="col-lg-5">
								<label for="fir">받는 사람</label> <input type="text"
									name="deliveryname" id="deliveryname"
									value="<sec:authentication property="principal.name"/>">
							</div>
							<div class="col-lg-5">
								<label for="phone">연락처</label> <input id="deliverytel"
									type="text" name="deliverytel"
									value="0<sec:authentication property="principal.tel"/>">
							</div>
							<div class="group-input col-lg-10">

								<label for="street">주소</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">

										<input id="address-btn" type="button" class="form-control"
											onClick="goPopup();" value="주소검색"
											style="font-size: 10pt; background-color: #000000; font-weight: bold" />
									</div>
									<input class="form-control" type="text"
										style="font-size: 13pt;" id="deliveryaddress"
										name="deliveryaddress"
										value="<sec:authentication property="principal.address"/>" />
								</div>

							</div>
							<div class="col-lg-10"></div>



							<div class="col-lg-12">
								<br>
							</div>
							<div class="col-lg-12 ">
								<div class="row">
									<div class="col-lg-6">
										<h5 style="font-weight: bold">포인트</h5>

									</div>
									<div class="col-lg-6 text-right">
										<span>1,000포인트 이상부터 사용가능합니다.</span>
									</div>
								</div>

								<hr>
							</div>
							<div class="col-lg-6">
								<div class="row ">
									<div class="col-lg-8">
										<label id="pointL" for="point"></label> <input type="text"
											id="point" />
									</div>
									<div class="col-lg-4 ">
										<button id="point-btn" onclick="usePoint()">전액사용</button>

									</div>

								</div>
								<br>
							</div>


						</div>
					</div>
					<div class="col-lg-4">

						<div class="place-order">
							<h4>결제 금액</h4>
							<div class="order-total">
								<ul class="order-table" id='pay'>
									<li>Product <span>Total</span></li>
									<!-- 스크립트 계산시 사용 -->
									<input type="hidden" name="goodsSum">
									<input type="hidden" name="goodsName">
									<input type="hidden" name="amount">
									<input type="hidden" name="board_id">
									<input type="hidden" name="psize">
									<input type="hidden" name="pcolor">
								</ul>

								<div class="order-btn">
									<button type="submit" onclick="payNow('card')"
										class="site-btn place-btn">결제하기</button>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 결제 정보  -->
				<input type="hidden" name="receipt_id" id="receipt_id"> <input
					type="hidden" name="paydate" id="paydate"> <input
					type="hidden" name="payname" id="payname">
			</form>
		</div>
	</section>
	<!-- Shopping Cart Section End -->




</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
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
									+ "<img src='/resources/img/admin/goods/"+payGoods[i].thumbnail+"' class='pimg'>&nbsp;&nbsp;"
									if(payGoods[i].name.length>11){
										console.log(payGoods[i].name.length)
										html += payGoods[i].name.substr(0,11)+".."
										console.log( payGoods[i].name.substr(0,11).length);
									}else{
										html += payGoods[i].name
									}
									
									html += "&nbsp; x &nbsp; "
									+ payGoods[i].amount
									+ "<input type='hidden' name='amount' value='"+payGoods[i].amount+"'>"
									+ " <span style='padding-top:10px;'>"
									+ priceFormat(payGoods[i].sum)
									+ "원</span>" 
									if(payGoods[i].pcolor !="" && payGoods[i].psize !=""){
										html += "<br> 옵션 : "+payGoods[i].pcolor+" / "+payGoods[i].psize
									} else if(payGoods[i].pcolor !="" && payGoods[i].psize ==""){
										html += "<br> 옵션 : " + payGoods[i].pcolor
									}else if(payGoods[i].pcolor =="" && payGoods[i].psize !=""){
										html +=  "<br> 옵션 : " + payGoods[i].psize
									}
									
									html += "<input type='hidden' name='goodsSum' value='"+ payGoods[i].sum+"'><input type='hidden' name='goodsName' value='"+ payGoods[i].name+"'>"
									+"<input type='hidden' name='psize' value='"+ payGoods[i].psize+"'>"
									+"<input type='hidden' name='pcolor' value='"+ payGoods[i].pcolor+"'>"
									+ "<input type='hidden' name='board_id' value='"+ payGoods[i].board_id+"'></li>"

						}
						html += "<li class='total-price'>총 상품 금액 <span id='goodsprice1'></span><input type='hidden' name='goodsprice' id='goodsprice'></li>"
								+ "<li class='fw-normal'>배송비  <span id='deliveryPay1'></span><input type='hidden' id='deliveryPay'></li>"
								+ "<li class='fw-normal'>포인트 사용  <span id='payPoint1'></span><input type='hidden' id='payPoint' name='usepoint'></li>"
								+ "<li class='total-price'>최종 결제 금액 <span id='lastTotal1'></span><input type='hidden' id='lastTotal' name='payprice'></li>"
								+ "<li class='fw-normal'>적립 포인트 <span id='earningPoint1'></span><input type='hidden' id='earningPoint' name='earningpoint'></li>"
						$('#pay').append(html);

						// 총 상품 금액 계산 
						var sumCount = this.form.goodsSum.length
						var total = 0;

						for (var i = 1; i < sumCount; i++) {
							total += parseInt(this.form.goodsSum[i].value);
						}

						$("#goodsprice1").text(priceFormat(total) + "원");
						$("#goodsprice").val(total);

						// 배송비 계산
						if (total < 30000) {
							$("#deliveryPay1").text(priceFormat(2500) + "원")
							$("#deliveryPay").val(2500)
						} else {
							$("#deliveryPay1").text(0 + "원")
							$("#deliveryPay").val(0)
						}

						// 최초 포인트 설정
						$('#payPoint').val(0);
						$('#payPoint1').text(0 + "P");

						// 최종 결제 금액 계산
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
		$('#deliveryaddress').val("(" + zipNo + ")" + roadFullAddr);
	}

	// 전체 포인트 사용
	function usePoint() {
		event.preventDefault();
		var goodsprice = parseInt($("#goodsprice").val());
		if("${point.sum}" > goodsprice){
		    $("#point").val(goodsprice);
		    $('#payPoint').val("-" + $("#point").val());
			$('#payPoint1').text("-" + priceFormat($("#point").val()) + "P");
			lastTotal();
		} else if("${point.sum}">999){
			$("#point").val("${point.sum}");
			$('#payPoint').val("-" + $("#point").val());
			$('#payPoint1').text("-" + priceFormat($("#point").val()) + "P");
			lastTotal();
		} else{
			alert("1000포인트 이상부터 사용가능합니다.");
		}
		
	}
	
	// 최종 결제 금액 계산
	function lastTotal() {
		var lastTotal = 0;
		lastTotal = parseInt($("#goodsprice").val())
				+ parseInt($("#payPoint").val())
				+ parseInt($("#deliveryPay").val());
		$("#lastTotal").val(lastTotal)
		$("#lastTotal1").text(priceFormat(lastTotal) + "원")
		// 적립 포인트 계산
		var innerPoint = Math.floor(parseInt($("#goodsprice").val()) * 0.01);
		$("#earningPoint1").text(priceFormat(innerPoint) + "P");
		$("#earningPoint").val(innerPoint);
	}
	
	// 결제 모듈 실행
	function payNow(method) {
		event.preventDefault();
		if($("#point").val() <1000 && $("#point").val() >0 ){
			alert("1000포인트 이상부터 사용가능합니다.")
			return;
		}
		
		var email = "${member.member_id}";
		var name = "${member.name}";
		var tel = "0${member.tel}";
		var address = "${member.address}";

		//결제 정보
		var lastTotal = $("#lastTotal").val();
		var nameCount = this.form.goodsName.length - 2;
		console.log(nameCount)
		var goodsName = this.form.goodsName[1].value;
		if (nameCount > 0) {
			goodsName += " 외 " + nameCount + "개"
		}
	BootPay.request({
		price: lastTotal, //실제 결제되는 가격
		application_id: "6076c93a5b2948001d07b41b",
		name: goodsName, //결제창에서 보여질 이름
		pg: 'inicis',
		method: method, //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		user_info: {
			username: name,
			email: email,
			addr: address,
			phone: tel
		},
		order_id: guid(), //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		extra: {
		  
			theme: 'purple', // [ red, purple(기본), custom ]
			custom_background: '#00a086', // [ theme가 custom 일 때 background 색상 지정 가능 ]
			custom_font_color: '#ffffff' // [ theme가 custom 일 때 font color 색상 지정 가능 ]
		}
	}).error(function (data) {
		//결제 진행시 에러가 발생하면 수행됩니다.
		console.log(data);
	}).cancel(function (data) {
		var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : '+data.message;
		alert(msg);
		console.log(data);
	}).ready(function (data) {
		// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
		console.log(data);
	}).confirm(function (data) {
		//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
		//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
		console.log(data);
		var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
		if (enable) {
			BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
		} else {
			BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
		}
	}).close(function (data) {
	    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
	 
	}).done(function (data) {
		//결제가 정상적으로 완료되면 수행됩니다
		
		// 유효성 체크
		$.ajax({
			url : "/myPage/orderList/payCheck/"+data.receipt_id,
			type : "post",
			success : function(verify) {
				if(verify.status=="200"){
					console.log(verify);
					//카트 초기화 
					var cartList = new Array();
					sessionStorage.setItem("cartList", JSON.stringify(cartList));
					
					var msg = '결제가 완료되었습니다.';
					msg += '영수증ID : ' + verify.data.receipt_id;
					msg += '상점 거래ID : ' + verify.data.order_id;
					msg += '결제 금액 : ' + verify.data.price;
					$("#paydate").val(verify.data.purchased_at)
					$("#receipt_id").val(verify.data.receipt_id);
					$('#payname').val(verify.data.name);
					document.form.submit();
				}
				else{
					//유효성 체크 실피시 결제취소
					alert("결제가 정상적으로 진행되지 않았습니다. 결제를 취소합니다.");
					$.ajax({
						url : "/myPage/orderList/payCancel/"+data.receipt_id,
						type : "post",
						data :{
							name : $("#memberName").val(),
							reason : "개인사유"
							
						},
						success : function(data) {
							alert("정상적으로 취소되었습니다.");

						},
						error : function(request, status, error){

						}
					})
				}
				
			},
			error : function(request, status, error){
				
				//유효성 체크 실피시 결제취소
			
    		$.ajax({
				url : "/myPage/orderList/payCancel/"+data.receipt_id,
			type : "post",
			data :{
				name : $("#memberName").val(),
				reason : "개인사유"
				
			},
			success : function(data) {
				alert("정상적으로 취소되었습니다.");
				
			},
			error : function(request, status, error){
				
				
			}
		})	
			}
		})
	});
	}
	
	// 초기화
	function reset(){
		event.preventDefault();
		$('#deliveryname').val("");
		$('#deliveryaddress').val("");
		$('#deliverytel').val("");
	}
	
	// 포인트 값 체인지
	$("#point").on("change keyup paste", function() {

		var val = $("#point").val();
		var valInt = parseInt($("#point").val());
		var goodsprice = $("#goodsprice").val();
		
		if(valInt>goodsprice){
			 alert("포인트 사용액이 상품금액보다 큽니다.");
		     $("#point").val('');
		     $('#payPoint').val('0');
			 $('#payPoint1').text('0P');
			lastTotal();
		}
		else if(val.replace(/[0-9]/g, "").length > 0) {
	        alert("숫자만 입력해 주십시오.");
	        $("#point").val('');
	        $('#payPoint').val('0');
			 $('#payPoint1').text('0P');
			 lastTotal();
	    } else if("${point.sum}"<1000){
			 alert("1000P 이상 부터 사용가능합니다.");
			 $("#point").val('');
			 $('#payPoint').val('0');
			 $('#payPoint1').text('0P');
			 lastTotal();
		} else if(valInt < 1 || valInt > "${point.sum}") {
			console.log(val)
	        alert("1~${point.sum} 사이로 사용 가능합니다.");
	        $("#point").val('');
	        $('#payPoint').val('0');
			 $('#payPoint1').text('0P');
			 lastTotal();
	    } else{
	    	$('#payPoint').val("-" + $("#point").val());
			$('#payPoint1').text("-" + priceFormat($("#point").val()) + "P");
			lastTotal();
	    }
		if(val == ""){
			 $("#point").val('');
		        $('#payPoint').val('0');
				 $('#payPoint1').text('0P');
				 lastTotal();
		}
	})
	
	// 고유값 생성
	function guid() {
    function s4() {
      return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	}
	
	// 숫자 콤마찍기
	function priceFormat(n) {
		var n = n.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		return n;
	}
	// 콤마 풀기
	function stringNumberToInt(stringNumber){
	    return parseInt(stringNumber.replace(/,/g , ''));
	}
	$(document).ready(function(){
		$('#pointL').text(priceFormat("사용 가능 포인트 ${point.sum}P"))
	})
</script>
<!-- Js Plugins -->

<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
</html>