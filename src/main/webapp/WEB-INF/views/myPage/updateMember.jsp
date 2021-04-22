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
<title>회원정보수정</title>


<style>
/* .help-block 을 일단 보이지 않게 설정 */
#myForm .help-block {
	display: none;
}
/* glyphicon 을 일단 보이지 않게 설정 */
#myForm .glyphicon {
	display: none;
}

#preview-image {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
}

.filebox {
	padding-left: 170px;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body style="padding-top: 128px">

	<!-- Register Section Begin -->
	<div class="register-login-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<div class="register-form">
						<h2>회원정보 수정</h2>

						<form action="/myPage/updateMember/insert" method="post"
							id="myForm" enctype="multipart/form-data">
							<div class="filebox">


								<img style="width: 200px; height: 200px;" id="preview-image"
									name="preview-image" class="profile_box"
									src="/resources/img/member/profile/<sec:authentication  property="principal.thumbnail"/>">

								<br> <br> <label for="thumbnail"
									style="font-size: 17px; text-align: center; font-weight: bold;">수정하기</label>
								<label
									style="font-size: 17px; text-align: center; font-weight: bold;"
									onclick="defaultImage()">기본이미지</label>


								<div class="custom-file">
									<input type="file" class="custom-file-input" id="thumbnail"
										name="file" multiple="multiple" style="display: block;">
								</div>
								<input type="hidden" name="thumbnail" id="thumbnail2"
									value="<sec:authentication  property="principal.thumbnail"/>">
							</div>
							<div class="group-input">
								<label class="control-label" for="member_id">이메일</label> <input
									class="form-control" type="text" name="member_id"
									id="member_id" style="font-size: 13pt" readonly
									value="<sec:authentication  property="principal.member_id"/>" />
							</div>

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

							<div class="group-input">
								<label class="control-label" for="name">이름</label> <input
									class="form-control" type="text" name="name" id="name"
									style="font-size: 13pt" readonly
									value="<sec:authentication property="principal.name"/>" />
							</div>

							<div class="group-input">
								<label class="control-label" for="nickname">닉네임</label> <input
									class="form-control" type="text" name="nickname" id="nicknames"
									style="font-size: 13pt"
									value="<sec:authentication property="principal.nickname"/>" /><span
									id="nicknameError" class="help-block" style="font-size: 10pt">중복된
									닉네임 입니다.</span>
							</div>

							<div class="group-input">
								<label class="control-label" for="tel">전화번호</label> <input
									class="form-control" type="text" name="tel" id="tel"
									style="font-size: 13pt"
									value="0<sec:authentication property="principal.tel"/>" /><span
									id="telError" class="help-block" style="font-size: 10pt">중복된
									전화번호 입니다.</span>
							</div>
							<div class="group-input">
								<label class="control-label" for="address">주소</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<input type="button" class="form-control" onClick="goPopup();"
											value="주소검색"
											style="font-size: 10pt; background-color: #000000; color: #ffffff; font-weight: bold" />
									</div>
									<input class="form-control" type="text"
										style="font-size: 13pt;" id="address" name="address" readonly
										value="<sec:authentication property="principal.address"/>" />
								</div>
							</div>
							<sec:authentication property="principal.categoryVO.category_id"
								var="check" />
							<div class="group-input">
								<label class="control-label" for="category">관심사</label> <select
									class="form-control" id="category"
									name="categoryVO.category_id" style="font-size: 16px">

									<c:forEach items="${category}" var="category">
										<c:choose>
											<c:when test="${category.category_id eq check}">
												<option selected="selected" value="${category.category_id}">${category.categoryname }</option>
											</c:when>

											<c:otherwise>
												<option value="${category.category_id}">${category.categoryname }</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>

								</select>
							</div>

							<input type="hidden" name="logintypeVO.logintype_id" value="1">
							<input type="hidden" name="roleVO.role_id" value="1">
							<button type="submit" class="site-btn register-btn"
								style="font-size: 15pt" onclick="check()">수정완료</button>
							<br> <br>
							<hr>
							<br>
							<button type="submit" class="btn-info float-right"
								style="font-size: 15pt;" onclick="deleteMember()">회원탈퇴</button>
						</form>
						<br>


					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Register Form Section End -->

	<input id="checkNic" type="hidden"
		value="<sec:authentication
			property='principal.nickname' />">
	<input id="checkTel" type="hidden"
		value="<sec:authentication
			property='principal.tel' />">
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script>
function deleteMember(){
	event.preventDefault();
	if(confirm("회원이 작성한 게시물과 회원의 모든 정보가 삭제됩니다. 정말 탈퇴하시겠습니까? ") ==true){
		alert("탈퇴 실행")
		$.ajax({
			method : "get",
			url : "/myPage/updateMember/delete",
			success : function(data) {
				alert("회원탈퇴가 정상적으로 완료되었습니다. 로그인 창으로 이동합니다.");
				window.location.href = '/login/logout';
			}
		});
	}
	
	
}
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

	// 닉네임 체크
	$("#nicknames").keyup(function() {
		//입력한 문자열을 읽어온다.

		var nickname = $(this).val();
		if (nickname == $("#checkNic").val()) {
			$("#nicknameError").hide();
			successState("#nicknames");
		} else {
			//ajax 요청을 해서 서버에 전송한다.
			$.ajax({
				method : "post",
				url : "/login/register/nicknameCheck",
				data : {
					nickname : nickname
				},
				success : function(data) {
					console.log(data);

					if (data) {
						$("#nicknameError").hide();
						successState("#nicknames");

					} else {

						$("#nicknameError").show();
						errorState("#nicknames");
					}
				}
			});
		}

	});

	// 전화번호 중복 조회
	$("#tel").keyup(function() {
		//입력한 문자열을 읽어온다.

		var tel = $(this).val();
		if (tel == $("#checkTel").val()) {
			$("#telError").hide();
			successState("#tel");
		} else {
			$.ajax({
				method : "post",
				url : "/login/register/telCheck",
				data : {
					tel : tel
				},
				success : function(data) {
					console.log(data);

					if (data) {
						$("#telError").hide();
						successState("#tel");

					} else {
						$("#telError").show();
						errorState("#tel");
					}
				}
			});

		}

		//ajax 요청을 해서 서버에 전송한다.

	});

	// 공백 체크
	function check() {
		event.preventDefault();

		if ($("#nicknames").val() == "") {
			alert("닉네임을 입력하세요.");
		} else if ($("#tel").val() == "") {
			alert("전화번호를 입력하세요.");
		} else if ($("#address").val() == "") {
			alert("주소를 입력하세요.");
		} else if ($(".has-error").length > 0) {
			alert("잘못입력하셨습니다. 수정 필요 : " + $(".has-error").length + "개");
		} else {
			$("#myForm").submit();
			alert("정상적으로 수정되었습니다.다시 로그인해주세요.")
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

	// 도로명 주소 검색
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr, zipNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		$('#address').val("(" + zipNo + ")" + roadFullAddr);
	}
	
	// 이미지 업로드
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            
	            previewImage.src = e.target.result
	          
	        }
	        // reader가 이미지 읽도록 하기
	       
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const thumbnail = document.getElementById("thumbnail")
	thumbnail.addEventListener("change", e => {
		
	    readImage(e.target)
	})
	
	function defaultImage(){
		 const previewImage = document.getElementById("preview-image");
         previewImage.src = "/resources/img/member/profile/profile.jpg";
         $("#thumbnail2").val("profile.jpg");
        $("#thumbnail").val(""); 
		
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