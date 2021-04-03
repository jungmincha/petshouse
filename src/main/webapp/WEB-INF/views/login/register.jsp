<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous">
	
</script>
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
<style>
/* .help-block 을 일단 보이지 않게 설정 */
#myForm .help-block {
	display: none;
}
/* glyphicon 을 일단 보이지 않게 설정 */
#myForm .glyphicon {
	display: none;
}
</style>
<script language="javascript">
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		$('#address').val(roadFullAddr);
	}
</script>
</head>

<body style="padding-top:128px">
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<!-- Register Section Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2>회원가입</h2>

						<form action="/login/register/insert" method="post" id="myForm">

							<div class="group-input">
								<label class="control-label" for="member_id">이메일</label> <input
									class="form-control" type="text" name="member_id"
									id="member_id" style="font-size: 13pt" /> <span id="emailErr"
									class="help-block" style="font-size: 10pt">올바른 이메일 형식이
									아닙니다. 다시 입력해 주세요.</span> <span id="overlapErr" class="help-block"
									style="font-size: 10pt">중복된 이메일 입니다.</span>
							</div>

							<div class="group-input ">
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
							<div class="group-input">
								<label class="control-label" for="name">이름</label> <input
									class="form-control" type="text" name="name" id="name"
									style="font-size: 13pt" />
							</div>
							<div class="group-input">
								<label class="control-label" for="nickname">닉네임</label> <input
									class="form-control" type="text" name="nickname" id="nickname"
									style="font-size: 13pt" />
							</div>
							<div class="group-input">
								<label class="control-label" for="tel">전화번호</label> <input
									class="form-control" type="text" name="tel" id="tel"
									style="font-size: 13pt" />
							</div>
							<div class="group-input">
								<label class="control-label" for="address">주소</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<input type="button" class="form-control" onClick="goPopup();"
											value="주소검색" style="font-size: 10pt; background-color:#000000;color:#ffffff
											; font-weight: bold" />
									</div>
									<input class="form-control" type="text"
										style="font-size: 13pt;" id="address" name="address" />
								</div>
							</div>

							<div class="group-input">
								<label class="control-label" for="category">관심사</label> <select
									class="form-control" id="category" name="categoryVO.category_id">
									<c:forEach items="${category}" var="category">

										<option value="${category.category_id}">${category.categoryname }</option>
									</c:forEach>

								</select>
							</div>

							<input type="hidden" name="logintypeVO.logintype_id" value="1">
							<input type="hidden" name="roleVO.role_id" value="1">
							<button type="submit" class="site-btn register-btn"
								style="font-size: 15pt">가입완료</button>
						</form>
						<br>
						<div class="switch-login">
							<span style="font-size: 11pt">이미 아이디가 있으신가요?&nbsp; </span> <a
								href="/login/login" class="or-login" style="font-size: 11pt">로그인</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Register Form Section End -->

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>

<script>
	//아이디 입력란에 keyup 이벤트가 일어 났을때 실행할 함수 등록 
	$("#member_id")
			.keyup(
					function() {
						//입력한 문자열을 읽어온다.

						var id = $(this).val();

						//ajax 요청을 해서 서버에 전송한다.
						$
								.ajax({
									method : "post",
									url : "/login/register/idCheck",
									data : {
										inputId : id
									},
									success : function(data) {
										console.log(data);

										if (data) {//사용 가능한 아이디 라면 
											$("#overlapErr").hide();

											var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

											// 성공한 상태로 바꾸는 함수 호출
											if (reg.test(id)) {//정규표현식을 통과 한다면
												$("#emailErr").hide();

												successState("#member_id");
											} else {//정규표현식을 통과하지 못하면
												$("#emailErr").show();
											
												errorState("#member_id");
											}

										} else {//사용 가능한 아이디가 아니라면 
											$("#overlapErr").show();
											errorState("#member_id");
										}
									}
								});
					});
	$("#password").keyup(function() {
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

	// 성공 상태로 바꾸는 함수
	function successState(sel) {
		$(sel).parent().removeClass("has-error").addClass("has-success").find(
				".glyphicon").removeClass("glyphicon-remove").addClass(
				"glyphicon-ok").show();

		$("#myForm button[type=submit]").removeAttr("disabled");
	};
	// 에러 상태로 바꾸는 함수
	function errorState(sel) {
		$(sel).parent().removeClass("has-success").addClass("has-error").find(
				".glyphicon").removeClass("glyphicon-ok").addClass(
				"glyphicon-remove").show();

		$("#myForm button[type=submit]").attr("disabled", "disabled");
	};
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