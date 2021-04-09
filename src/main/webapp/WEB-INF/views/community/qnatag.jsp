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



a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
a:hover {text-decoration:none;}

</style>


</head>

<body style="padding-top:180px">
	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	

	
	<!-- 게시글 끌고와야함 글 제목, 사진?, 작성자, 날짜, 댓글수, 해시태그? 그리고 테이블은 td만 쓰면 될듯..? -->

	<div class="container">
	
	
	<c:forEach items="${qtag}" var="qt">
		<table class="table table-hover">
		
			<thead>
			</thead>
			<tbody>
				<td> <a href="${pageContext.request.contextPath}/commu/qna_view?board_id=${qt.board_id}">
					<div style="font-weight:bold; font-size:18px;">${qt.title}</div>
					<div>${qt.content}</div> 
					<span>${qt.memberVO.nickname}</span> 
					<span style="font-size:13px; color:gray;">${qt.pdate}</span> <span style="font-size:13px; color:gray;"> 조회수 ${qt.hit}</span>
					<div>${qt.hashtag}</div> 
					</a>
				</td>

			</tbody>
		</table>
		</c:forEach>
	</div>


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
