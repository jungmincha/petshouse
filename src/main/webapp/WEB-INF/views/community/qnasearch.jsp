<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

<!-- bootstrap css cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
#navbars>li:nth-child(2) {
   background-color: #e7ab3c;
}

.jumbotron {
	text-align: center;
	background-color:#FAFAFA !important;
	margin-top:-29px;
}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover{
background-color:#dddddd;
}

.input {
    background-image: url(https://cdn1.iconfinder.com/data/icons/hawcons/32/698627-icon-111-search-256.png);
    background-position: 13px center;
    background-size: contain;
    background-repeat: no-repeat;
    border: 1px solid #ccc;
    padding: 5px 5px;
    text-indent: 30px;  
    width: 120px;
}

.search input{
width:50%;
margin-left:25%;
}

b{
color:#FFBF00
}
#searchzero{
text-align:center;
margin-top:90px;
}
</style>

</head>

<body style="padding-top:180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- 질문과 답변 검색창 -->

	<div class="jumbotron">
		<a class="qna-subtitle" href="/commu/qna">
			<h3>
				<strong>질문과 답변</strong>
			</h3>
		</a>
		<div style="font-size: 15px">내 반려동물에 대한 모든 궁금증을 남겨보세요!</div>
		<br>

		<form action="${pageContext.request.contextPath}/commu/qnasearch"
			method="post">
			<div class="search">
				<input rel="search" class="input form-control mr-sm-8" type="text"
					name="keyword" style="text-align: center;" value="${param.keyword}">
			</div>
		</form>
	</div>


	<div class="container">

		<div style="margin-top: 30px;">
			<input type="hidden" name="keyword" value="${param.keyword}">
			<h5>
				<b>'${param.keyword}'</b>에 대한 검색결과 <b>${qscount}</b>건
			</h5>
			<br> <br>
		</div>

<!-- 검색결과 -->
		<table class="table">
		
		<c:if test="${qscount ==0}">

					<div id="searchzero" class="col-12">
						 <img  src="/resources/img/storehome/search.png">
					</div>
				</c:if>
		
		
			<c:forEach items="${qsearch}" var="qs">
				<tbody>
					<td>				
							<!-- 해시태그용 폼 태그-->
							<form action="${pageContext.request.contextPath}/search" method="get"> 
							
							<a href="/commu/qna/${qs.board_id}">
								<div style="font-weight: bold; font-size: 18px; margin-bottom:3px;">${qs.title}</div>
								<div style=" margin-bottom:3px;">${qs.content}</div>
							</a>
								<span>${qs.memberVO.nickname}</span> 
								<span style="font-size: 13px; color: gray;">
								<fmt:formatDate value="${qs.pdate}" pattern="yy.MM.dd" /></span>
								<span style="font-size: 13px; color: gray;"> 조회수 ${qs.hit}</span>
								
								<c:set var="hashtag" value="${qs.hashtag}" />
								<c:set var="tag" value="${fn:split(hashtag, '#')}" />
								<c:forEach var="t" items="${tag}">
									<c:if test="${not empty qs.hashtag}">
										<span>
										<button id="hashtag" name="keyword" class="btn btn-disabled" value="${t}"
												onclick="location.href='${pageContext.request.contextPath}/search'">#${t}</button>
										</span>
									</c:if>
								</c:forEach>
							</form>
					</td>
				</tbody>
			</c:forEach>
		</table>
	</div>
<!-- 검색결과 end-->

	<!-- Footer -->
	<div style="margin-top:80px;">
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

</body>
</html>
