<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #dddddd;
}

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

.more {
	font-size: 13px;
	padding: 0.01px;
}
</style>
<script>

</script>
</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">


		<form action="${pageContext.request.contextPath}/moregoods"
			method="get">
			<input type="hidden" name="keyword" value="${param.keyword}">
			<span style="font-size: 20px; font-weight: bold;">스토어</span> <span>
				<button style="float: right" class="more btn btn-disabled"
					type="submit">더보기</button>
			</span>
		</form>
		<hr>



		<div id="table" class="row text-center"
			style="margin-top: 20px; margin-left: 5px;">
			<c:forEach items="${moregoods}" var="gs">
				<div class="product-item col-sm-3">
					<div class="pi-pic">
						<a href="/admin/goods_detail/${gs.board_id}"> <img
							src="/resources/img/admin/goods/${gs.goodsVO.thumbnail}" alt=""
							style="width: 160px; height: 230px; border-radius: 6px;"></a>
					</div>
					<div class="pi-text">
						<h6>${gs.goodsVO.goodsname}</h6>
						<div class="product-price">${gs.goodsVO.price}원</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<form action="${pageContext.request.contextPath}/moretips"
			method="get">
			<input type="hidden" name="keyword" value="${param.keyword}">
			<span style="font-size: 20px; font-weight: bold;">노하우</span> <span>
				<button style="float: right" class="more btn btn-disabled"
					type="submit">더보기</button>
			</span>
		</form>
		<hr>

		<div id="table" class="row text-center"
			style="margin-top: 20px; margin-left: 5px;">

			<c:forEach items="${moretips}" var="ts">
				<div class="product-item col-sm-3">
					<a href="/commu/tips/${ts.boardVO.board_id}">
						<div class="pi-pic">
						<img src="/resources/img/tips/${ts.imgname}" alt=""
								style="border-radius: 5px; height: 150px;">
						</div>
						<div class="pi-text" style="text-align: left; padding-top: 5px;">
							<h6 style="font-size: 15px; font-weight: bold;">${ts.boardVO.title}</h6>
						</div>
					</a>
					<div style="font-size: 14px; text-align: left;">${ts.boardVO.memberVO.nickname}</div>
					<div style="font-size: 13px; color: gray; text-align: left;">조회수
						${ts.boardVO.hit}</div>
				</div>
			</c:forEach>
		</div>


		<form action="${pageContext.request.contextPath}/moreqna" method="get">
			<input type="hidden" name="keyword" value="${param.keyword}">
			<span style="font-size: 20px; font-weight: bold;">질문과 답변</span> <span>
				<button style="float: right" class="more btn btn-disabled"
					type="submit">더보기</button>
			</span>
		</form>
		<hr>


		<div>
			<c:forEach items="${moreqna}" var="qs">
				<a href="/commu/qna/${qs.board_id}">
					<form action="${pageContext.request.contextPath}/commu/qnatag"
						method="post">
						<div style="font-weight: normal; font-size: 18px;">${qs.title}</div>
						<ul class="pd-tags">
							<div>${qs.content}</div>
							<span>${qs.memberVO.nickname}</span>
							<span style="font-size: 13px; color: gray;">${qs.pdate}</span>
							<span style="font-size: 13px; color: gray;"> 조회수 ${qs.hit}</span>
							<c:set var="hashtag" value="${qs.hashtag}" />
							<c:set var="tag" value="${fn:split(hashtag, ' ')}" />
							<c:forEach var="t" items="${tag}">
								<span><button id="hashtag" name="keyword"
										class="btn btn-disabled" style="" value="${t}"
										onclick="location.href='${pageContext.request.contextPath}/commu/qnatag'">${t}</button></span>
							</c:forEach>

						</ul>
					</form>
				</a>
				<hr>
			</c:forEach>

		</div>
	</div>

	<!-- Blog Section End -->

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