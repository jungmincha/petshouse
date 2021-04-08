<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 추가함 -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${tips_view.title}</title>

<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

<!-- bootstrap css cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 수정 삭제 경고창 -->
<script type="text/javascript">
		function button_event() {
			if (confirm("정말 삭제하시겠습니까?") == true) { //확인
				location.href = '${pageContext.request.contextPath}/commu/tdelete?board_id=${tips_view.board_id}'
			} else { //취소
				return;
			}
		}

		function modify_event() {
			if (confirm("수정하시겠습니까?") == true) { //확인
				location.href = '${pageContext.request.contextPath}/commu/tmodify_page?board_id=${tips_view.board_id}'
			} else { //취소
				return;
			}
		}
</script>
<!-- 수정 삭제 경고창 end-->

</head>

<body style="padding-top:180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="margin-bottom: 40px">
		<div class="head">
			<div style="margin-top: 45px; margin-bottom: 10px;">
				<a class="tips-subtitle" href="tips">노하우</a>
			</div>
			<h3 class="tipstitle" style="font-weight: bold; margin-bottom: 10px;">${tips_view.title}</h3>
		</div>


		<div style="float: right">
			<button type="button" class="btn btn-warning" 
				onclick="modify_event();">수정</button>

			<button type="button" class="btn btn-warning"
				onclick="button_event();">삭제</button>
		</div>




		<table>
			<td>
				<div style="font-size: 20px;">${tips_view.memberVO.nickname}</div>
				<hr>
				<section style="margin-top: 40px; margin-bottom: 20px;">${tips_view.content}</section>
				<section style="margin-top: 40px; margin-bottom: 20px;">${tips_view.hashtag}</section>
				<span style="color: gray">${tips_view.pdate}</span>  <span
				style="color: gray">조회수 ${tips_view.hit}</span>
			</td>
		</table>
		<hr>
	</div>



	<div class="container" style="margin-bottom: 10px;">
		<table>
			<c:forEach items="${comment}" var="cm">
				<div>${cm.memberVO.nickname}</div>
				<div>${cm.content}</div>
				<div>${cm.pdate}</div>

			</c:forEach>

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
