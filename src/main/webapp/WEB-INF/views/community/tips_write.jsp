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
<title>노하우 글쓰기</title>
<!-- <script src="/resources/ckeditor/ckeditor.js"></script> -->
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script src = "/resources/ckeditor/ckeditor.js"></script>
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

<!-- bootstrap css cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

#navbars>li:nth-child(2) {
   background-color: #e7ab3c;
}

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

#hashtag{
margin-top:20px;
}
</style>
</head>

<body style="padding-top: 180px">
	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="width: 800px;">

		<form action="${pageContext.request.contextPath}/commu/tips/write"
			enctype="multipart/form-data" method="post">

			<input type="hidden" class="form-control" name="memberVO.member_id"
				value="<sec:authentication property='principal.member_id'/>">
			<h2 style="margin-top: 30px;">노하우</h2><br>

					<div class="form-group row ">
							<div class="col-lg-8">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="file"
									     name="file"
										style="display: block;" required> <label
										class="custom-file-label">표지를 장식할 사진을 골라주세요! </label>
								</div>
							</div>
						</div>
						
						
						<div class="form-group row">	
							<div class="input-group col-lg-8 ">
								<div id='preview' data-placeholder='표지 권장 사이즈 1200x400'></div>
							</div>
						</div>
						
			<div class="row">
				<select class=" form-control col-2" name="categoryVO.category_id"
					style="height: 38px; margin-left: 15px; margin-right: 10px;">
					<option value="1">고양이</option>
					<option value="2">강아지</option>
					<option value="3">파충류</option>
					<option value="4">조류</option>
					<option value="5">어류</option>
					<option value="6">기타</option>
				</select> 
				<input type="text" maxlength="30" class="form-control" name="title"
					placeholder="제목을 입력해주세요 최대(30자)" style="margin-bottom: 20px; width: 628px;" required>
			</div>

			<textarea id="editor4" name="content" required></textarea>

			
			<script>
				CKEDITOR.replace('editor4',{

					//CKEDITOR.replace와 id("description")를 잘 적어주면 그 태그가 smart editor 스타일로 바뀌게 된다. 
					 
					    filebrowserUploadUrl : '${pageContext.request.contextPath}/commu/ckUpload'

					//파일을 업로드 해야하기 때문에 filebrowserUploadUrl을 사용하고, 서버쪽에 코드를 완성해주어야 한다.

					});
					</script>
			
			
			<div class="form-group row">
				<div class="col">
					<input type="text" class="form-control" name="hashtag"
						maxlength="30" placeholder="#해시태그를 입력해주세요" id="hashtag"
						aria-describedby="hashtagHelp" />
				</div>
			</div>

			<div style="margin-top: 30px; float: right;">
				<button type="submit" class="btn btn-warning">노하우 등록</button>
				<a class="btn btn-warning" href="/commu/tips">취소</a>
			</div>
		</form>
	</div>

	<!-- Footer -->
	<div style="margin-top: 100px">
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
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
