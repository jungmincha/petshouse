<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>주문 상세 내역</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.pi {
	padding-left: 20px
}
</style>
</head>

<body>
	<section class="contact-section spad">

		<div class="container">
			<h4>주문 상세 내역</h4>
			<hr>
			<div class="row">
				<div class="col-lg-12">
					<div class="contact-widget">
						<div class="cw-item">
							<div class="row">
								<div class="col-md-6">
									<div class="ci-text">


										<span>결제번호 / 결제일자</span>
										<p>${pay.pay_id}&nbsp;/&nbsp;${payDetail.data.purchased_at}</p>

										<span><br>상태</span>

										<p>
											<c:choose>
												<c:when test="${pay.paystateVO.paystate_id eq 1}">
													<button onclick="">결제취소</button>
												</c:when>
												<c:when test="${pay.paystateVO.paystate_id  eq 2}">
													배송준비중
												</c:when>
												<c:when test="${pay.paystateVO.paystate_id  eq 3}">
													<button onclick='delivery()'>배송조회</button>
												</c:when>
												<c:when test="${pay.paystateVO.paystate_id  eq 4}">
													<button onclick='delivery()'>배송완료</button>
												</c:when>
												<c:when test="${pay.paystateVO.paystate_id  eq 5}">
													배송완료
												</c:when>
												<c:when test="${pay.paystateVO.paystate_id  eq 6}">
													취소된 결제
												</c:when>
												<c:when test="${pay.paystateVO.paystate_id  eq 7}">
													교환처리
													<button onclick='delivery()'>배송조회</button>
												</c:when>
												<c:when test="${pay.paystateVO.paystate_id  eq 8}">
													환불처리
												</c:when>
											</c:choose>

										</p>
									</div>
								</div>
								<div class="col-md-6">
									<div class="ci-text ">

										<span>금액</span>
										<p>상품 금액 : ${pay.goodsprice}원</p>
										<p>

											<c:choose>
												<c:when test="${pay.goodsprice<30000}">
									       					배송비 : 2500원
									    		</c:when>
												<c:otherwise>
										        배송비 : 0원
										    	</c:otherwise>


											</c:choose>

										</p>
										<p>포인트 사용 : ${pay.usepoint}P</p>
										<hr>
										<p>최종 결제 금액 : ${pay.payprice}원</p>

									</div>

								</div>
							</div>
						</div>
						<div class="cw-item">
							<div class="row">
								<div class="col-md-6">
									<div class="ci-text">
										<span>결제 정보</span>
										<p>
											<i class='icon_check'></i>결제 방식
										</p>
										<p class="pi">${payDetail.data.method}</p>
										<p>
											<i class='icon_check'></i>카드명
										</p>
										<p class="pi">${payDetail.data.payment_data.card_name}</p>
										<p>
											<i class='icon_check'></i>할부
										</p>
										<p class="pi">

											<c:choose>
												<c:when
													test="${payDetail.data.payment_data.card_quota eq 00}">
													        일시불
													    </c:when>
												<c:otherwise>
     														  ${payDetail.data.payment_data.card_quota}개월
   														 </c:otherwise>
											</c:choose>
										</p>

									</div>

								</div>
								<div class="col-md-6">
									<div class="ci-text">
										<p>
											<br> <i class='icon_check'></i>승인일시
										</p>
										<p class="pi">${payDetail.data.purchased_at}</p>
										<p>
											<i class='icon_check'></i>결제금액
										</p>
										<p class="pi">${payDetail.data.price}원</p>
										<p>
											<i class='icon_check'></i>카드번호
										</p>
										<p class="pi">${payDetail.data.payment_data.card_no}</p>
									</div>
								</div>
							</div>
						</div>
						<div class="cw-item">
							<div class="row">
								<div class="col-md-6">
									<div class="ci-text">


										<span>배송 정보</span>
										<p>
											<i class='icon_check'></i>이름
										</p>
										<p class="pi">${pay.deliveryname}</p>
										<p>
											<i class='icon_check'></i>번호
										</p>
										<p class="pi">0${pay.deliverytel}</p>

									</div>

								</div>
								<div class="col-md-6">
									<div class="ci-text">
										<p>
											<br> <i class='icon_check'></i>주소
										</p>
										<p class="pi">${pay.deliveryaddress}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

</body>

<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			url : "/myPage/orderList/payCancel/" + receipt_id,
			type : "post",
			data : {
				name : $("#memberName").val(),
				reason : "개인사유"
			},
			success : function(data) {
				alert("정상적으로 취소되었습니다.");

			},
			error : function(request, status, error) {

			}

		})
	})

	// 시간 포맷 함수
	function getFormatDate(date) {

		var date = date.substr(0, 19);
		var date = date.split("T");
		var date = date[0] + " " + date[1];
		return date;
	}
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