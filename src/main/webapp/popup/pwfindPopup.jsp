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
</head>
<style>
.email-btn {
	border: 1px solid;
	background-color: #e7ab3c;
	color: white;
	padding: 10px
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

	<div class="row">
		<div class="col-12 text-center">

			가입하신 이메일을 입력해주세요 <br> <br> <input type="text"
				id="member_id"> <br>
			<hr>

			<button class="email-btn" onclick="checkPw()">확인이메일 전송</button>
		</div>

	</div>


</body>
<script type="text/javascript">
	function checkPw() {
		var member_id = $("#member_id").val();
		$.ajax({
			url : "/login/passwordChange/" + member_id,
			type : "post",
			success : function(data) {
				alert("이메일을 전송했습니다. 이메일 확인 후 비밀번호를 재설정해주세요.");
				window.close();
			},
			error : function() {
				alert("아이디가 없습니다.")
			}
		})

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