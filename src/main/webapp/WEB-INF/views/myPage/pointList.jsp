<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<!-- 날짜 선택 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker2").datepicker();
	});
	$(document).ready(
			function() {
				$.datepicker.setDefaults({
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
			})
</script>
<style>
table {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table td {
	width: 300px;
}

table th {
	font-size: 20px;
}
</style>
</head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<body style="padding-top: 180px">

	<div class="container">
		<div class="blog-details-inner">
			<h2>포인트 사용내역</h2>
			<div class="row">

				<div class="col-md-8">
					기간별 조회
					<button>1주일</button>
					<button>1개월</button>

					<span> Date: <input type="text" id="datepicker"> <input
						type="text" id="datepicker2">
					</span>
				</div>
				<div class="col-md-4 text-right">
					<h4>사용가능 포인트 : ${pointSum.sum} P</h4>
				</div>
			</div>

			<div class="posted-by">

				<div class="pb-text">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>적립 일자</th>
								<th>적립 내용</th>
								<th>포인트</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pointList}" var="pointVO">
								<tr>
									<td><fmt:formatDate value="${pointVO.pdate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${pointVO.pointtypeVO.pointtypename }</td>

									<c:choose>
										<c:when test="${pointVO.pscore < 0 }">
											<td style="color: red;">${pointVO.pscore}</td>
										</c:when>
										<c:otherwise>
											<td>${pointVO.pscore}</td>
										</c:otherwise>
									</c:choose>


								</tr>

							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

</body>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
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