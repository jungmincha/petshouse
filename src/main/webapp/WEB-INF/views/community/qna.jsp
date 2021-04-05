<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>질문과 답변</title>

<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

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
<link rel="stylesheet" href="/resources/css/select-style.css" type="text/css">
<link rel="stylesheet" href="/resources/js/select-index.js" type="text/css">

<style>
.jumbotron {
	text-align: center;
}

.qcontent {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 1000px;
	height: 20px;
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

</style>

</head>

<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container">
		<div class="jumbotron">
			<h3 class="display-5">질문과 답변</h3>
			<hr class="my-4">
			<form action="${pageContext.request.contextPath}/commu/qnasearch"
				method="post">
				<div class="questions-header__form__search col">
					<span aria-hidden="true"></span> 
					<input class="form-control mr-sm-8" type="text" name="keyword" style="text-align: center; height: 60px;"
						placeholder="내 반려동물에 대한 모든 궁금증!">
				</div>
			</form>
		</div>
	</div>

	<!-- 동물 카테고리, 정렬, 글쓰기 버튼 -->
	<div class="container" style="padding-bottom: 30px;">
				
		<select id="selectPet" name="categoryVO.category_id"  style="vertical-align: middle; text-align-last: center">

		<option value="1">고양이</option>
		<option value="2">강아지</option>
		<option value="3">파충류</option>
		<option value="4">조류</option>
		<option value="5">어류</option>
		<option value="6">기타</option>
		</select> 
		
	
		<a class="btn btn-warning float-right" href="qna_write">질문하기</a>
	</div>


	<!-- 게시글 끌고와야함 글 제목, 사진?, 작성자, 날짜, 댓글수, 해시태그? 그리고 테이블은 td만 쓰면 될듯..? -->

	<div class="container">
		<c:forEach items="${qna}" var="qna">
			<table class="table table-hover">
				<tbody>
					<td><a
						href="${pageContext.request.contextPath}/commu/qna_view?board_id=${qna.board_id}">
							<div style="font-weight: bold; font-size: 18px;">${qna.title}</div>
							<div>${qna.content}</div>
							 <span>${qna.memberVO.nickname}</span> 
							 <span style="font-size: 13px; color: gray;">${qna.pdate}</span> 
							 <span style="font-size: 13px; color: gray;"> 조회수 ${qna.hit}</span> 
							 <a>키워드 버튼 나열</a>
					</a></td>
				</tbody>
			</table>
		</c:forEach>
	</div>

	<!-- 페이징 -->
	<ul class="pagination justify-content-center"
		style="padding-bottom: 50px; padding-top: 50px;">
		<c:if test="${pageMaker.prev}">
			<li class="page-item"><a class="page-link"
				href="qna${pageMaker.makeQuery(pageMaker.startPage - 1) }">
					Previous</a></li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
			var="idx">
			<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
			<li class="page-item"><a class="page-link"
				href="qna${pageMaker.makeQuery(idx)}">${idx}</a></li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li class="page-item"><a class="page-link"
				href="qna${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
		</c:if>
	</ul>



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
