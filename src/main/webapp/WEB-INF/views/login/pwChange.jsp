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
<title>Insert title here</title>
<!-- Google Font -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>

.email-btn {
	border: 1px solid;
	background-color: #e7ab3c;
	color: white;
	padding: 10px;
	font-size: 25px;
}

.email-btn:hover {
	background-color: orange;
}

</style>
<body>
	<br>

	<div class="section-title">
		<h2 style="margin-bottom: 20px; font-size: 30px;">비밀번호 재설정</h2>
	</div>
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form ">
						<form action="/login/passwordChange/change" method="post"
							id="myForm">
							<input type="hidden" name="member_id" value="${member_id}" />
							<div class="group-input">
								<label class="control-label" for="pwd">비밀번호</label> <input
									class="form-control" type="password" name="password"
									id="password" style="font-size: 13pt" /> <span id="pwdRegErr"
									class="help-block" style="font-size: 10pt">8글자 이상 입력하세요.</span>
							</div>

							<div class="group-input">
								<label class="control-label" for="rePwd">비밀번호 재확인</label> <input
									class="form-control" type="password" name="rePwd" id="rePwd"
									style="font-size: 13pt" /> <span id="rePwdErr"
									class="help-block" style="font-size: 10pt">비밀번호가 일치하지
									않습니다. 다시 입력해 주세요.</span>
							</div>
							<div class="text-center">
								<button class="email-btn" onclick="check()">수정 완료</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#pwdRegErr").hide();
		$("#rePwdErr").hide();
	});
	$("#password").keyup(function() {
		console.log("")
		var pwd = $(this).val();
		// 비밀번호 검증할 정규 표현식
		var reg = /^.{8,}$/;
		if (reg.test(pwd)) {//정규표현식을 통과 한다면
			$("#pwdRegErr").hide();
			successState("#password");
		} else {//정규표현식을 통과하지 못하면
			$("#pwdRegErr").show();
			errorState("#password");
		}
	});

	$("#rePwd").keyup(function() {
		var rePwd = $(this).val();
		var pwd = $("#password").val();
		// 비밀번호 같은지 확인
		if (rePwd == pwd) {//비밀번호 같다면
			$("#rePwdErr").hide();
			successState("#rePwd");
		} else {//비밀번호 다르다면
			$("#rePwdErr").show();
			errorState("#rePwd");
		}
	});
	// 공백 체크
	function check() {
		event.preventDefault();
		if ($("#password").val() == "") {
			alert("비밀번호를 입력하세요.");
		} else if ($("#rePwd").val() == "") {
			alert("비밀번호 재확인을 입력하세요.");
		} else {
			$("#myForm").submit();
			alert("비밀번호 변경이 완료되었습니다. 로그인해주세요")
		}

	}

	// 성공 상태로 바꾸는 함수
	function successState(sel) {
		$(sel).parent().removeClass("has-error").addClass("has-success").find(
				".glyphicon").removeClass("glyphicon-remove").addClass(
				"glyphicon-ok").show();

		//$("#myForm button[type=submit]").removeAttr("disabled");
	};

	// 에러 상태로 바꾸는 함수
	function errorState(sel) {
		$(sel).parent().removeClass("has-success").addClass("has-error").find(
				".glyphicon").removeClass("glyphicon-ok").addClass(
				"glyphicon-remove").show();

		//$("#myForm button[type=submit]").attr("disabled", "disabled");
	};
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