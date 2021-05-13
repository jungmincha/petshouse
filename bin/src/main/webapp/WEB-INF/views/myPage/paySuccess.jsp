<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
#registerCheck {
	border-radius: 50%;
	border: 2px solid white;
	width: 250px;
	heigth: 250px;
}

.login-btn {
	background-color: #FFC81E;
	color: black;
	border: 1px solid white;
	padding: 10px;
	border-radius: 5%;
}

.login-btn:hover {
	background-color: orange;
}
</style>

<body style="padding-top: 150px;">

	<div class="container" style="width: 1100px; height: 900px;">
		<form action="/store/home">
			<div class="row">
				<div class="col-12 text-center"
					style="visibility: hidden; padding-bottom: 10px;">.</div>
				<div class="col-12 text-center">
					<img id="registerCheck" src="/resources/img/paySuccess.png" />
				</div>

				<div class="col-12 text-center">
					<h2>
						<span style="color: #e7ab3c; line-height: 30px;">결제가
							완료되었습니다.</span>
					</h2>
					<br> <br> <br>
					<h2 class="text-left"
						style="padding-bottom: 10px; font-size: 30px;">결제내역</h2>
					<table class="table">
						<thead>
							<tr>
								<th>거래일시</th>
								<th>상품명</th>
								<th>총 상품 금액</th>
								<th>배송비</th>
								<th>포인트 사용</th>
								<th>총 결제 금액</th>
								<th>적립 포인트</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>${fn:substring(pay.paydate,0,19)}</td>
								<td>${payname}</td>
								<td><fmt:formatNumber value="${pay.goodsprice }"
										pattern="#,###" />원</td>
								<c:choose>
									<c:when test="${pay.goodsprice<30000 }">
										<td>2,500원</td>
									</c:when>
									<c:otherwise>
										<td>0원</td>
									</c:otherwise>
								</c:choose>
								<td><fmt:formatNumber value="${pay.usepoint }"
										pattern="#,###" />원</td>
								<td><fmt:formatNumber value="${pay.payprice }"
										pattern="#,###" />원</td>
								<td>${pay.earningpoint }P</td>
							</tr>

						</tbody>
					</table>
					<br>
					<h2 class="text-left"
						style="padding-bottom: 10px; font-size: 30px;">배송지 정보</h2>
					<table class="table">
						<thead>
							<tr>
								<th>이름</th>
								<th>전화번호</th>
								<th>배송지</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td>${pay.deliveryname}</td>
								<td>${pay.deliverytel}</td>
								<td>${pay.deliveryaddress }</td>
							</tr>
						</tbody>
					</table>
					<br>
					<button class="login-btn" style="font-size: 20px;">홈으로</button>
				</div>

			</div>
		</form>
	</div>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
</html>