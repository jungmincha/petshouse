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
<title>질문과 답변 글 작성 페이지</title>

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
		<form action="${pageContext.request.contextPath}/commu/qna"
			method="post">


			<p>닉네임 넣어야함</p>
			<input type="text" class="form-control" name="title" placeholder="제목">
			<textarea id="editor4"  name="content" placeholder="내용"></textarea>
			<input type="text" class="form-control" name="hashtag" placeholder="해시태그">

			<script>
					CKEDITOR.replace('editor4');
				</script>

			<button type="submit" class="btn btn-warning float-right"
				style="float: right; margin-top: 30px;"
				onclick="location.href='${pageContext.request.contextPath}/commu/qna'">질문
				등록</button>



		</form>

	</div>


	<div style="margin-top: 100px">

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	</div>
</body>
</html>
