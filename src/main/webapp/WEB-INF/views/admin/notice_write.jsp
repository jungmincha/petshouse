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
<title>공지사항</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
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
#navbars>li:nth-child(3) {
   background-color: #e7ab3c;
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

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


<div class="container" style="width: 800px;">

		<form action="${pageContext.request.contextPath}/admin/notice/register"
			enctype="multipart/form-data" method="post">

			<input type="hidden" class="form-control" name="memberVO.member_id"
				value="<sec:authentication property='principal.member_id'/>">
				
			<h2 style="margin-top: 30px;margin-bottom: 30px;">공지사항 작성</h2>


				<input type="text" class="form-control" name="title"
					placeholder="제목" style="margin-bottom: 20px;">

		<textarea class="form-control col" name="content" placeholder="내용"
				style="width: 770px; height: 400px; margin-bottom: 20px; resize: none;"></textarea>


			<div class="form-group row ">
			
							<div class="col-sm-6">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="file"
									    multiple="multiple" name="file"
										style="display: block;"> <label
										class="custom-file-label" for="inputGroupFile02">사진을
										선택하세요.</label>
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-12"></label>
							<div class="input-group col-lg-7 ">
								<div id='image_preview '>
									<div id='preview'
										data-placeholder='이미지를 첨부 하려면 파일 선택 버튼을 클릭하거나 이미지를 드래그앤드롭 하세요 *최대 10장까지'></div>
								</div>
							</div>
						</div>
						
		<div style="margin-top:30px; float: right;">
			<button type="submit" class="btn btn-warning"
				onclick="location.href='${pageContext.request.contextPath}/admin/notice'">공지
				등록</button>
			<a class="btn btn-warning"  href="notice">취소</a>
		</div>
		
		</form>
	</div>

	<script>
	
	( /* preview : 이미지들이 들어갈 위치 id, btn : file tag id */
	  imageView = function imageView(preview, btn){

	    var attZone = document.getElementById(preview);
	    var btnAtt = document.getElementById(btn)
	    var sel_files = [];
	    
	    // 이미지와 체크 박스를 감싸고 있는 div 속성
	    var div_style = 'display:inline-block;position:relative;'
	                  + 'width:121px;height:150px;margin:3px; ;z-index:1';
	    // 미리보기 이미지 속성
	    var img_style = 'width:100%;height:100%;z-index:none';
	    // 이미지안에 표시되는 체크박스의 속성
	   
	    var chk_style = 'position:absolute;font-size:13px;'
	        + 'right:0px;top:0px;z-index:999;opacity:.8;';
	        
	    btnAtt.onchange = function(e){
	      var files = e.target.files;
	      var fileArr = Array.prototype.slice.call(files)
	      for(f of fileArr){
	        imageLoader(f);
	      }
	    }  
	    
	  
	    // 탐색기에서 드래그앤 드롭 사용
	    attZone.addEventListener('dragenter', function(e){
	      e.preventDefault();
	      e.stopPropagation();
	    }, false)
	    
	    attZone.addEventListener('dragover', function(e){
	      e.preventDefault();
	      e.stopPropagation();
	      
	    }, false)
	  
	    attZone.addEventListener('drop', function(e){
	      var files = {};
	      e.preventDefault();
	      e.stopPropagation();
	      var dt = e.dataTransfer;
	      files = dt.files;
	      for(f of files){
	        imageLoader(f);
	      }
	      
	    }, false)
	    

	    
	    /*첨부된 이미리들을 배열에 넣고 미리보기 */
	    imageLoader = function(file){
	      sel_files.push(file);
	      var reader = new FileReader();
	      reader.onload = function(ee){
	        let img = document.createElement('img')
	        img.setAttribute('style', img_style)
	        img.src = ee.target.result;
	        attZone.appendChild(makeDiv(img, file));
	      }
	      
	      reader.readAsDataURL(file);
	    }
	    
	    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
	    makeDiv = function(img, file){
	      var div = document.createElement('div')
	      div.setAttribute('style', div_style)
	      
	      var btn = document.createElement('input')
	      btn.setAttribute('type', 'button')
	      btn.setAttribute('value', 'X')
	      btn.setAttribute('delFile', file.name);
	      btn.setAttribute('style', chk_style);
	      btn.onclick = function(ev){
	        var ele = ev.srcElement;
	        var delFile = ele.getAttribute('delFile');
	        for(var i=0 ;i<sel_files.length; i++){
	          if(delFile== sel_files[i].name){
	            sel_files.splice(i, 1);      
	          }
	        }
	        
	        dt = new DataTransfer();
	        for(f in sel_files) {
	          var file = sel_files[f];
	          dt.items.add(file);
	        }
	        btnAtt.files = dt.files;
	        var p = ele.parentNode;
	        attZone.removeChild(p)
	      }
	      div.appendChild(img)
	      div.appendChild(btn)
	      return div
	    }
	  }
	)('preview', 'file')
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
