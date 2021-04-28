<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${notice_view.title}수정하기</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
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
#navbars>li:nth-child(3) {
   background-color: #e7ab3c;
	}


</style>

</head>

<body style="padding-top:180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="width: 800px;">

		<form action="${pageContext.request.contextPath}/admin/notice/update"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="board_id" value="${notice_view.board_id}" />
			<input type="text" class="form-control" style=" margin-bottom: 20px;"  name="title"value="${notice_view.title}" />
				<textarea id="editor4" name="content">${notice_view.content}</textarea>

			<script>
				CKEDITOR.replace('editor4');
			</script>
			<!-- 					<div class="form-group row">
								<label class="col-sm-3" for="detail_img">상품상세사진</label>
								<div class="input-group col-sm-9">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="file"
											name="file" multiple="multiple" style="display: block;">
										<label class="custom-file-label" for="inputGroupFile02">
											Choose file</label>
									</div>
								</div>
								<br>
							</div>


							<div class="form-group row">
								<div class="col-sm-3"></div>
								<div class="col-sm-9">

									<div id="preview"></div>
								</div>
							</div> -->
							
							
						
				
		<%-- 	<textarea class="form-control col" name="content"
				style="width: 770px; height: 400px; margin-bottom: 20px; resize: none;">${notice_view.content}</textarea> --%>

		<div style="margin-top:30px; float: right;">
			<button type="submit" class="btn btn-warning"	
				onclick="location.href='${pageContext.request.contextPath}/admin/notice'">수정하기</button>
			<a class="btn btn-warning"  href="notice">취소</a>
		</div>
		
		</form>

	</div>

<script type="text/javascript">
	$(document)
			.ready(
					function(e) {
						$("input[type='file']")
								.change(
										function(e) {

											//div 내용 비워주기
											$('#preview').empty();

											var files = e.target.files;
											var arr = Array.prototype.slice
													.call(files);

											//업로드 가능 파일인지 체크
											for (var i = 0; i < files.length; i++) {
												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}
											}

											preview(arr);

										});//file change

						function checkExtension(fileName, fileSize) {

							var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
							var maxSize = 20971520; //20MB

							if (fileSize >= maxSize) {
								alert('파일 사이즈 초과');
								$("input[type='file']").val(""); //파일 초기화
								return false;
							}

							if (regex.test(fileName)) {
								alert('업로드 불가능한 파일이 있습니다.');
								$("input[type='file']").val(""); //파일 초기화
								return false;
							}
							return true;
						}

						function preview(arr) {
							arr
									.forEach(function(f) {

										//파일명이 길면 파일명...으로 처리
										var fileName = f.name;
										if (fileName.length > 10) {
											fileName = fileName.substring(0, 7)
													+ "...";
										}

										//div에 이미지 추가
										var str = '<div style="display: inline-flex; padding: 10px;"><li>';
										str += '<span>' + fileName
												+ '</span><br>';

										//이미지 파일 미리보기
										if (f.type.match('image.*')) {
											var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
											reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
												//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
												str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
												str += '</li></div>';
												$(str).appendTo('#preview');
											}
											reader.readAsDataURL(f);
										}
									});//arr.forEach
						}
					});
</script>

	<!-- Footer -->
	<div style="margin-top: 100px">
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

	<!-- Js Plugins -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.zoom.min.js"></script>
	<script src="/resources/js/jquery.dd.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>

</body>
</html>
