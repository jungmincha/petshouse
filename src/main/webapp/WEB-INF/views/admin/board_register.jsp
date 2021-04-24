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
 
 
 

.file {
	width: 500px;
	height: 500px;
}

 
#file {
	display: none;
}
#preview {
	width: 700px;
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
</style>

</head>
<body style="padding-top: 180px">



	<!-- header -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<!-- Page Content -->
	<div class="container">
		<div class="col-lg-12">
			<form id="board" name="board" enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/admin/board/register"
				method="post">

				<fieldset>
					<h2>상품 게시글 등록</h2>

					<input type="submit" class="btn"
						style="background-color: #e7ab3c; float: right;" value="게시글등록">

					<div class="form-group row" style="padding-top:70px;">
						<label class="col-sm-2">등록되지 않은 상품</label>
						 <div class="col-sm-8">
						 <select class="form-control" id="goodsVO.goods_id" name="goodsVO.goods_id">
							 <c:forEach items="${goods}" var="goods">
								<option value="${goods.goods_id}">
									${goods.goods_id}/${goods.goodsname}/${goods.price}/${goods.pcolor}/${goods.psize}/${goods.categoryVO.categoryname}/${goods.categoryVO.sortname}
									/${goods.stockVO.stockname}</option>
							</c:forEach>
						</select>
						</div>
					</div>


					<div class="form-group row">
						<label class="col-sm-2">상세설명</label>
						<div class="col-sm-8">
							<textarea name="content" cols="25" rows="5" class="form-control"
								required></textarea>
						</div>
					</div>
					
					
					<div class="form-group row ">
						<div class="col-sm-2">사진</div>
						<div class="col-sm-8">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="btnAtt"
									multiple="multiple" name="btnAtt" style="display: block;"
									required> 
									<label class="custom-file-label">사진을 선택하세요.</label>
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

 


				</fieldset>
			</form>
		</div>
	</div>

 
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
 

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
 
</body>
</html>
