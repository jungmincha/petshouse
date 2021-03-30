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
<title>질문과 답변 글 수정 페이지</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>

</head>

<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="width: 800px;">
		<form action="${pageContext.request.contextPath}/commu/modify"
			method="post">

			<input type="hidden" name="board_id" value="${qna_view.board_id}" />
			<input size="98" type="text" name="title" value="${qna_view.title}" />
			<textarea rows="10" cols="100" name="content">${qna_view.content}</textarea>
			<input size="98" type="text" name="hashtag"
				value="${qna_view.hashtag}" />



			<textarea id="editor4" name="editor4"></textarea>

			<script>
					CKEDITOR.replace('editor4');
				</script>

			<button type="submit" class="btn btn-warning float-right"
				style="float: right; margin-top: 30px;"
				onclick="location.href='${pageContext.request.contextPath}/commu/qna'">수정하기</button>



		</form>

	</div>


	<div style="margin-top: 100px">

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	</div>
</body>
</html>
