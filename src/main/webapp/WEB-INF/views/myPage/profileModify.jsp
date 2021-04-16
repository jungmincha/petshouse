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
<title>register</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>


<style>
.profile_box {
	width: 30px;
	height: 30px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.thumbnail {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>

</head>
<body style="padding-top: 180px">



	<!-- header -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<!-- Page Content -->
	<div class="container" style="text-align: center;">
		<form action="${pageContext.request.contextPath}/myPage/modify"
			method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="member_id" id="member_id"
				value="<sec:authentication  property="principal.member_id"/>">
				
				
			<img style="width: 200px; height: 200px;" id="preview-image"
				name="preview-image" class="profile_box"
				src="/resources/img/member/profile/<sec:authentication  property="principal.thumbnail"/>">


			<div class="form-group row">
				<label class="col-sm-3" for="thumbnail">프로필 이미지</label>
				<div class="input-group col-sm-6">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="thumbnail"
							name="file" multiple="multiple" style="display: block;">
						<label class="custom-file-label">
							프로필수정하기 </label>
					</div>
				</div>

			</div>


			<button type="submit" class="btn " id="check"
				style="background-color: #e7ab3c">수정하기</button>


		</form>

	</div>


	<script>
	 
		
		
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const thumbnail = document.getElementById("thumbnail")
	thumbnail.addEventListener("change", e => {
	    readImage(e.target)
	})
	
	 $("#thumbnail").change(function(){
	 if(this.files && this.files[0]) {
	  var reader = new FileReader;
	
	 reader.readAsDataURL(this.files[0]);
	}
	}); 

			 
			</script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>
