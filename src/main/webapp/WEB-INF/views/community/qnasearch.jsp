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


<style>

.jumbotron {
	text-align: center;
}

.qcontent{
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 1000px;
  height: 20px;
}

a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
a:hover {text-decoration:none;}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}
#hashtag:hover{
background-color:#dddddd;
}

</style>


</head>

<body style="padding-top:180px">
	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- 검색창 검색한 내용 유지시켜야함.. -->
	
	<div class="container">
		<div class="jumbotron">
			<h3 class="display-5">무엇이든 물어보세요!</h3>
			<hr class="my-4">
			<form action="${pageContext.request.contextPath}/commu/qnasearch" method="post">
				<div class="questions-header__form__search col">
					<span aria-hidden="true"></span> 
					<input class="form-control mr-sm-8" type="text"name="keyword" style="magin-left:50px; text-align: center; height: 60px;" placeholder="내 반려동물에 대한 모든 궁금증!">
				
				</div>
			</form>
		</div>
	</div>

		<!--  <a class="btn btn-warning float-right" href="qna_write">질문하기</a> -->
	
	</div>

	<!-- 게시글 끌고와야함 글 제목, 사진?, 작성자, 날짜, 댓글수, 해시태그? 그리고 테이블은 td만 쓰면 될듯..? -->

	<div class="container">



		<table class="table">
			<c:forEach items="${qsearch}" var="qs">
				<tbody>
					<td><a href="/commu/qna/${qs.board_id}">
							<form action="${pageContext.request.contextPath}/commu/qnatag" method="post">
								<div style="font-weight: bold; font-size: 18px;">${qs.title}</div>
								<ul class="pd-tags">
									<div>${qs.content}</div>
									<span>${qs.memberVO.nickname}</span>
									<span style="font-size: 13px; color: gray;">${qs.pdate}</span>
									<span style="font-size: 13px; color: gray;"> 조회수 ${qs.hit}</span>
									<c:set var="hashtag" value="${qs.hashtag}" />
									<c:set var="tag" value="${fn:split(hashtag, ' ')}" />
									<c:forEach var="t" items="${tag}">
										<span><button id="hashtag" name="keyword"
												class="btn btn-disabled" style=""
												value="${t}"
												onclick="location.href='${pageContext.request.contextPath}/commu/qnatag'">${t}</button></span>
									</c:forEach>

								</ul>
							</form>
					</a></td>
				</tbody>
			</c:forEach>
		</table>
		</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
