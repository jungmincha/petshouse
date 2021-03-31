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
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="member" />
		<form id="email_form">
			<input type="text" name="certify" value="${member.certify}">
			<input type="hidden" name="member_id" value="${member.member_id}"> <input
				type="hidden" name="name" value="${member.name}">
		</form>

	</sec:authorize>

	<button id="email_send_buttton">이메일 인증하기</button>

	<script type="text/javascript">
		$('#email_send_buttton').on('click', function() {
			$.ajax({
				url : "/login/email/send",
				type : "GET",
				data : $("#email_form").serialize(),
				success : function(data) {
					alert("이메일이 전송되었습니다.")
				},
				error : function(e) {
					console.log(e);
				}
			});
		});
	</script>
</body>
</html>