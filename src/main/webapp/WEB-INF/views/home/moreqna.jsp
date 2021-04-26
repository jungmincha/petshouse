<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>펫츠하우스</title>

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
<link rel="stylesheet" href="/resources/css/select-style.css"
	type="text/css">
<link rel="stylesheet" href="/resources/js/select-index.js"
	type="text/css">

<style>
#navbars>li:nth-child(1) {
	background-color: #e7ab3c;
}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #dddddd;
}
b{
color:#FFBF00
}
</style>
<script>

</script>
</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">


		<input type="hidden" name="keyword" value="${param.keyword}">
		<h5>
			<b>'${param.keyword}'</b>에 대한 검색결과 <b>${qcount}</b>건
		</h5>
		<br>
		<br>
		<div id="table">

			<c:forEach items="${moreqna}" var="mq">

				<form action="${pageContext.request.contextPath}/search"
					method="get">
					<a href="/commu/qna/${mq.board_id}">
						<div style="font-weight: normal; font-size: 18px;">${mq.title}</div>
						<div>${mq.content}</div>
					</a>
					<div style="margin-bottom: 10px;">
						<span>${mq.memberVO.nickname}</span> <span
							style="font-size: 13px; color: gray;"><fmt:formatDate
								value="${mq.pdate}" pattern="yyyy.MM.dd" /></span> <span
							style="font-size: 13px; color: gray;"> 조회수 ${mq.hit}</span>
						<c:set var="hashtag" value="${mq.hashtag}" />
						<c:set var="tag" value="${fn:split(hashtag, '#')}" />
						<c:forEach var="t" items="${tag}">
							<c:if test="${not empty mq.hashtag}">
								<span>
									<button id="hashtag" name="keyword" class="btn btn-disabled"
										style="" value="${t}"
										onclick="location.href='${pageContext.request.contextPath}/search'">#${t}</button>
								</span>
							</c:if>
						</c:forEach>
						</div>
				</form>

				<hr>
			</c:forEach>

		</div>

		<div class="ul">
			<ul class="pagination justify-content-center"
				style="padding-bottom: 50px; padding-top: 50px;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="moreqna${pageMaker.makeQuery(pageMaker.startPage - 1) }">
							Previous</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
					<li class="page-item"><a class="page-link"
						href="moreqna${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="moreqna${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

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