<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 추가함 -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${notice_view.title}</title>

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

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
a:link {
	text-decoration: none;
	color: #333333;
}

a:visited {
	text-decoration: none;
	color: #333333;
}

a:active {
	text-decoration: none;
	color: #333333;
}

a:hover {
	text-decoration: none;
}
</style>

<script type="text/javascript">

function button_event() {
	if (confirm("정말 삭제하시겠습니까?") == true) { //확인
		location.href = '${pageContext.request.contextPath}/admin/ndelete/${notice_view.board_id}'
	} else { //취소
		return;
	}
}
		function modify_event() {
			if (confirm("수정하시겠습니까?") == true) { //확인
				location.href = '${pageContext.request.contextPath}/admin/notice/modify/${notice_view.board_id}'
			} else { //취소
				return;
			}
		}
</script>

</head>


<body style="padding-top: 170px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="member_id"
			value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>
	
		<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="nickname"
			value="<sec:authentication property="principal.nickname"/>">
	</sec:authorize>


	<div class="container" style="margin-bottom: 40px">
		<div class="head">
			<div style="margin-top: 45px; margin-bottom: 10px;">
				<a class="noti-subtitle" href="/admin/notice">공지사항</a>				
				<input type="hidden" name="board_id" value="${notice_view.board_id}">
			</div>
			<h3 class="noticetitle"
				style="font-weight: bold; margin-bottom: 10px;">${notice_view.title}</h3>
		</div>
		
			<!-- 관리자에게만 버튼 띄우기 -->
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<div style="float: right">
				<button type="button" id="modify_button" class="btn btn-secondary"
				onclick="modify_event();">수정</button>

			<button type="button" id="delete_button" class="btn btn-secondary"
				onclick="button_event();">삭제</button>
				</div>
			</sec:authorize>

		
		<table>
			<td>
				<div style="font-size: 20px;">${notice_view.memberVO.nickname}</div>
				<hr>
				<section style="margin-top: 60px; margin-bottom: 20px;">${notice_view.content}</section>
					
		   				<c:forEach  items="${img}" var="notice">
		   				<div class="mySlides">
						 <img src="/resources/img/admin/notice/${notice.imgname}" style="width:100%; height:600px;">
						</div>
						</c:forEach>
						
			<span style="font-size: 13px; color: gray;">
								<fmt:formatDate value="${notice_view.pdate}" pattern="yyyy.MM.dd" /></span>
				<span style="font-size: 13px;  color: gray">조회수 ${notice_view.hit}</span>
			</td>
		</table>

	</div>

	<div style="margin-top: 20px;">
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

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

</body>
</html>
