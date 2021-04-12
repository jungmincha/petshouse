<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>register</title>


<style>
.table_center {
	display: table;
	margin: 50px auto;
	width: 800px;
	
	font-size: 15px;
	font-stretch: extra-condensed;
}

h2 {
	text-align: center;
}

select {
	width: 100px; /* 원하는 너비설정 */
	padding: .4em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url('이미지 경로') no-repeat 95% 50%;
	/* 네이티브 화살표를 커스텀 화살표로 대체 */
	border-radius: 5px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.box {
	margin: 50px auto;
	width: 500px;
}

.file {
	width: 500px;
	height: 500px;
}



}
.container{
	margin: 10px auto  ;

}
</style>

</head>
<body style="padding-top: 180px">



	<!-- header -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<!-- Page Content -->
	 <div class="container">
	<div class="col-lg-12  ">
		<form id="board" name="board" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/admin/board/register"
			method="post">

			<fieldset>
			<h2>상품 게시글 등록</h2>
				
				<input type="submit" class="btn" 
										style="background-color: #e7ab3c; float:right;" value="게시글등록">
					
							<div class="form-group">
								<label for="exampleSelect2">등록되지 않은 상품리스트</label> <select
									class="form-control" id="goodsVO.goods_id" name="goodsVO.goods_id">
									<c:forEach items="${goods}" var="goods">
										<option value="${goods.goods_id}">
											${goods.goods_id}/${goods.goodsname}/${goods.price}/${goods.pcolor}/${goods.psize}/${goods.categoryVO.categoryname}/${goods.categoryVO.sortname}
											/${goods.stockVO.stockname}</option>
									</c:forEach>
								</select>
							</div>


							 <div class="form-group row">
								<label class="col-sm-3">상세설명</label>
								<div class="col-sm-9">
									<textarea name="content" cols="30" rows="5"
										class="form-control" required></textarea>
								</div>
							</div> 
							<div class="form-group row">
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
								 
								
							</div>


							<div class="form-group row">
								<label class="col-sm-3">해시태그</label>
								<div class="col-sm-9">

									<input type="text" class="form-control" name="hashtag"
										placeholder="해시태그를 걸어주세요" id="hashtag"
										aria-describedby="hashtagHelp" /> <small id="hashtagHelp"
										class="form-text text-muted"> 예) #강아지 #고양이 </small>


								</div>
							</div>

						
					
					<div class="col-sm-12">

									<div id="preview"></div>
								</div>
					
					
				
			</fieldset>
		</form>
	</div>
	</div>

	<script>
		
	</script>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

<script type="text/javascript">
	$(document).ready(
			function(e) {
				$("input[type='file']").change(
					function(e) {

							//div 내용 비워주기
								$('#preview').empty();

								var files = e.target.files;
								var arr = Array.prototype.slice.call(files);

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
			 arr.forEach(function(f) {

			//파일명이 길면 파일명...으로 처리
			var fileName = f.name;
			if (fileName.length > 10) {
			fileName = fileName.substring(0, 7)
					+ "...";
			}

			//div에 이미지 추가
			var str = '<div style="display: inline-flex; padding: 10px;">';
										 

			//이미지 파일 미리보기
			if (f.type.match('image.*')) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
				//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
				str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=150 />';
				str += '</div>';
				$(str).appendTo('#preview');
			}
				reader.readAsDataURL(f);
			}
		});//arr.forEach
	}
	});
	
	
	
	
</script>
</html>
