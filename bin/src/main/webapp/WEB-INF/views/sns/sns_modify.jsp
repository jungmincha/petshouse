<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<style>
.box {
	margin: 50px auto;
	width: 500px;
}

#file {
	display: none;
}

#preview {
	width: 660px;
	min-height: 180px;
	padding: 10px;
	background-color: #f5f5f5;
	border-radius: 10px;
}

#preview:empty:before {
	content: attr(data-placeholder);
	color: #999;
	font-size: .9em;
}

.title {
	margin-bottom: 40px;
}

.form-1 {
	width: 1000px;
}

label {
	text-align: cente;
}

.userImg {
	width: 120px;
	height: 150px;
	z-index: none;
}
</style>

</head>
<body style="padding-top: 180px;">



	<!-- header -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<!-- Page Content -->
	<div class="container" style="width: 1100px; min-height: 900px;">

		<div class="col-lg-12">
			<form action="${pageContext.request.contextPath}/commu/sns/modify"
				method="post">
				<input type="hidden" name="board_id" value="${sns.board_id}">

				<div class="title">
					<h2>SNS 수정하기</h2>
				</div>

				<div class="form-group row">
					<input type="submit" class="btn btn-warning "
						style="position: fixed; top: 200px; right: 300px;" value="sns수정">
				</div>


				<div class="form-group row">
					<div class="col-sm-2">카테고리</div>
					<div class="col-lg-6">
						<select class=" form-control" name="categoryVO.category_id"
							style="height: 38px; width: 100px; vertical-align: middle; text-align-last: center">
							<option value="${sns.categoryVO.category_id}">${sns.categoryVO.categoryname}</option>
							<option value="1">고양이</option>
							<option value="2">강아지</option>
							<option value="3">파충류</option>
							<option value="4">조류</option>
							<option value="5">어류</option>
							<option value="6">기타</option>
						</select>


					</div>
				</div>





				<div class="form-group row">
					<label class="col-sm-2"></label>
					<div class="input-group col-lg-7 ">
						<div id='image_preview '>
							<div id='preview'>
								<c:forEach items="${img}" var="sns">
									<img src="/resources/img/member/sns/${sns.imgname}"
										class="userImg" alt="" />
								</c:forEach>
							</div>
						</div>
					</div>
				</div>


				<div class="form-group row">
					<label class="col-sm-2">사진소개</label>
					<div class="col-lg-8">
						<textarea name="content" cols="40" rows="7" class="form-control"
							placeholder="사진에 대해서 설명해주세요." required>${sns.content}</textarea>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-2">해시태그</label>
					<div class="col-lg-8">
						<input type="text" name="hashtag" class="form-control"
							placeholder="해시태그를 입력해주세요." value="${sns.hashtag}" required>
						<small id="hashtagHelp" class="form-text text-muted"> 예)
							#강아지 #고양이 </small>
					</div>
				</div>
			</form>
		</div>

	</div>




	<script>
		(function() {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll('.needs-validation')

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
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
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
