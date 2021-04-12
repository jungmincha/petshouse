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
		function modify_event() {
			if (confirm("수정하시겠습니까?") == true) { //확인
				location.href = '${pageContext.request.contextPath}/admin/nodify_page?board_id=${notice_view.board_id}'
			} else { //취소
				return;
			}
		}
</script>

</head>


<body style="padding-top: 170px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container" style="margin-bottom: 40px">
		<div class="head">
			<div style="margin-top: 45px; margin-bottom: 10px;">
				<a class="noti-subtitle" href="notice">공지사항</a>
			</div>
			<h3 class="noticetitle"
				style="font-weight: bold; margin-bottom: 10px;">${notice_view.title}</h3>
		</div>
		
		<div style="float: right">
			<button type="button" class="btn btn-warning"
				onclick="modify_event();">수정</button>
		</div>
		
		<table>
			<td>
				<div style="font-size: 20px;">${notice_view.memberVO.nickname}</div>
				<hr>
				<section style="margin-top: 60px; margin-bottom: 20px;">${notice_view.content}</section>
					<c:forEach  items="${img}" var="img">
											<div class="pt"
												data-imgbigurl="/resources/img/admin/notice/${img.imgname}">
												<img src="/resources/img/admin/notice/${img.imgname}"
													alt="">
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
