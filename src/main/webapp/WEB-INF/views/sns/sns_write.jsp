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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<style>
.table_center {
	display: table;
	margin: 50px auto;
	width: 1000px;
	font-size: 15px;
	font-stretch: extra-condensed;
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

.top {
	background-color: #e7ab3c;
	border-radius: 10px;
	cursor: pointer;
	position: fixed;
	right: 5px;
	font-size: 15px;
	bottom: 500px;
	padding: 10px;
}

#preview:empty:before {
	content: attr(data-placeholder);
	color: #999;
	font-size: .9em;
}

.title{

margin-bottom: 40px;

}
.form-1 {
	width: 1000px;
}

label {
	text-align: cente;
}
</style>

</head>
<body style="padding-top: 180px; ">



	<!-- header -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<!-- Page Content -->
	<div class="container" style="width: 1100px; min-height:900px;">
		<div class="top" onclick="window.scrollTo(0,0);">top</div>
		<div class="col-lg-12">
			<form id="sns" name="sns" class="needs-validation" 	action="${pageContext.request.contextPath}/commu/sns/write"
				enctype="multipart/form-data"	method="post">
				
				<div class="title">
				<h2>사진 올리기</h2> 
				</div>
				
				<div class="form-group row">
				 <input type="submit" class="btn btn-warning " 
						  style="position:fixed; top: 150px; right: 400px;  " value="sns등록">
				</div>
								 
				<div class="form-1">
				<div class="form-group row">
				<div class="col-sm-2">카테고리</div>
					<div class="col-lg-6" >
					<select class=" form-control" name="categoryVO.category_id"
						style="height: 38px; width:100px;  vertical-align: middle; text-align-last: center" >
						<option value="1">고양이</option>
						<option value="2">강아지</option>
						<option value="3">파충류</option>
						<option value="4">조류</option>
						<option value="5">어류</option>
						<option value="6">기타</option>
					</select>
					
						 
					</div></div>
					
					
						<div class="form-group row ">
							<div class="col-sm-2">사진</div>
							<div class="col-sm-8">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="btnAtt"
									    multiple="multiple" name="btnAtt"
										style="display: block;" required> <label
										class="custom-file-label" for="inputGroupFile02">사진을
										선택하세요.</label>
								</div>
							</div>
						</div>



						<div class="form-group row">
							<label class="col-sm-2"></label>
							<div class="input-group col-lg-7 ">
								<div id='image_preview '>
									<div id='preview'
										data-placeholder='이미지를 첨부 하려면 파일 선택 버튼을 클릭하거나 이미지를 드래그앤드롭 하세요 *최대 10장까지'></div>
								</div>
							</div>
						</div>



						<div class="form-group row">
							<label class="col-sm-2">사진소개</label>
							<div class="col-lg-8">
								<textarea name="content" cols="40" rows="7"
									class="form-control" placeholder="사진에 대해서 설명해주세요." required></textarea>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-2">해시태그</label>
							<div class="col-lg-8">
								<input type="text" name="hashtag" class="form-control"
									placeholder="해시태그를 입력해주세요." required>
								 <small id="hashtagHelp"
										class="form-text text-muted"> 예) #강아지 #고양이 </small>
							</div>
						</div>



 
							<!-- Modal -->
							<!-- <div class="modal fade" id="Modal" tabindex="-1" role="dialog"
									aria-labelledby="ModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="ModalLabel">확인창</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">상품등록하시겠습니까?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">닫기</button>
												<button type="submit" class="btn btn-warning"
													style="background-color: #e7ab3c">등록하기</button>
											</div>
										</div>
									</div> -->


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
)('preview', 'btnAtt')

</script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
