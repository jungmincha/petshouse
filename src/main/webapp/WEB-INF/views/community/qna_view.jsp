<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>질문과 답변 글 조회</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="margin-bottom:40px">
		<div class="head">
			<div style="margin-top: 45px; margin-bottom: 10px;">
				<a class="qna-subtitle" href="qna">질문과 답변</a>
			</div>
			<h3 class="qnatitle" style="font-weight: bold; margin-bottom: 10px;">${qna_view.title}</h3>
		</div>

		<table>
			<td>
				<div style="font-size: 20px;">${qna_view.memberVO.nickname}</div>

				<section style="margin-top:40px; margin-bottom:20px;">${qna_view.content}</section>

				<span style="color: gray">${qna_view.pdate}</span> <span
				style="color: gray">조회수 ${qna_view.hit}</span>
			</td>
		</table>
	</div>


		<!-- comment인데 아직 멀었음요 -->
		<%@ include file="/WEB-INF/views/include/comment.jsp"%>

	<div style="margin-top: 20px;">
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>
</body>
</html>
