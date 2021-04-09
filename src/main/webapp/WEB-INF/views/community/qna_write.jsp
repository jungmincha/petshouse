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
<title>질문과 답변 글 작성 페이지</title>

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
<script src="/resources/ckeditor/ckeditor.js"></script>

<!-- <script> 아직...
    function checkLogin() {
        var id = '${member_id}'; // 수정 ''처리
        alert(id);
        // 수정 ''공백 비교
        if (id == '') {
            alert("로그인 후 글쓰기가 가능합니다.");
            return false;
        } else {
            location.href = '/community/tips_write';
        }
    }
</script> -->

</head>

<body style="padding-top:180px">
	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	

	<div class="container" style="width: 800px;">

		

		<form action="${pageContext.request.contextPath}/commu/qna"
			class="needs-validation" enctype="multipart/form-data" method="post">
			
			<input type="hidden" class="form-control" name="memberVO.member_id" value="<sec:authentication property='principal.member_id'/>">
			<h2 style="margin-top: 30px;">질문하기</h2>
			
			
 <input type="file" name="file" multiple="multiple"/>
    
   	<div class="row">
	<select class=" form-control col-2" name="categoryVO.category_id" style="height:38px; margin-left:15px; margin-right:10px;">
			<option value="1">고양이</option>
			<option value="2">강아지</option>
			<option value="3">파충류</option>
			<option value="4">조류</option>
			<option value="5">어류</option>
			<option value="6">기타</option>
	</select>

   
<input type="text" class="form-control" name="title" placeholder="제목"
				style=" margin-bottom: 20px; width:628px;" required><div class="invalid-feedback">없으면 공백 추가!</div>
	</div>
			<textarea class="form-control col" name="content" placeholder="내용"
				style="width: 770px; height: 400px; margin-bottom: 20px; resize: none;" required></textarea>
				<div class="invalid-feedback">없으면 공백 추가!</div>
			

							<div class="form-group row">
							
								<div class="col-sm-9">
									<input type="text" class="form-control" name="hashtag"
										placeholder="해시태그" id="hashtag"
										aria-describedby="hashtagHelp" /> 
								</div>
							</div>
							

			<button type="submit" class="btn btn-warning float-right"
				style="float: right; margin-top: 30px;"
				onclick="location.href='${pageContext.request.contextPath}/commu/qna'">질문
				등록</button>

		</form>
	</div>
<script>
(function () {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  var forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})();
	
	
</script>
	<!-- Footer -->
	<div style="margin-top: 100px">
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

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
