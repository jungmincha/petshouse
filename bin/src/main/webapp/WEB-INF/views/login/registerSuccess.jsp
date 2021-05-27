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

<body style="padding-top: 180px;">
	<div class="container" style="width: 700px; height: 600px;">
		<form action="/login/login">
			<div class="row">
				<div class="col-12 text-center"
					style="visibility: hidden; padding-bottom: 10px;">회원 가입이
					완료되었습니다.</div>
				<div class="col-12 text-center">
					<img id="registerCheck" src="/resources/img/registerCheck.jpg" />
				</div>

				<div class="col-12 text-center">
					<h2>
						<span style="color: #e7ab3c; line-height: 30px;">펫츠하우스</span> 회원
						가입이 완료되었습니다.
					</h2>
					<br>
					<h5 style="line-height: 30px;">
						가입하신 이메일로 인증 메일을 보냈습니다. <br>이메일 인증이 완료되어야 로그인이 가능합니다.<span
							style="font-weight: bold;"> (소셜 회원가입 시 인증 X)</span>
					</h5>
					<br>
					<button class="login-btn" style="font-size: 20px;">로그인으로</button>
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