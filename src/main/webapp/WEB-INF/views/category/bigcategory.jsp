<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>register</title>





<style>
.tab-item {
	width: 1000;
}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>








</head>
<body>



	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- Page Content -->
	<!-- Product Shop Section Begin -->

	<section class="product-shop spad page-details">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="filter-widget">
					<h4 class="fw-title">카테고리</h4>
					
					
					
						<div class="form-group row">
            
               <div class="col-sm-9">
                     <label></label>
                      <select class="category1" class="form-control" style="vertical-align:middle; text-align-last:center">
                       <option value="">동물</option>
                      </select>
 <br/>
                      <label></label>
                      <select class="category2" class="form-control" style="vertical-align:middle; text-align-last:center">
                          <option value="">상품</option>
                      </select>
               </div>
            </div>
				
				
				</div>
				
				

					<script>
 			
			
  		/* 	function readImage(input) {
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
  			});  */
  			
  			
  		
  		// 컨트롤러에서 데이터 받기
  		var jsonData = JSON.parse('${category}');
  		console.log(jsonData);

  		var cate1Arr = new Array();
  		var cate1Obj = new Object();

  		// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
  		for(var i = 0; i < jsonData.length; i++) {
  		 
  		 if(jsonData[i].level == "1") {
  		  cate1Obj = new Object();  //초기화
  		  cate1Obj.category_id = jsonData[i].category_id;
  		  cate1Obj.categoryname = jsonData[i].categoryname;
  		  cate1Arr.push(cate1Obj);
  		 }
  		}

  		// 1차 분류 셀렉트 박스에 데이터 삽입
  		var cate1Select = $("select.category1")

  		for(var i = 0; i < cate1Arr.length; i++) {
  		 cate1Select.append("<option value='" + cate1Arr[i].category_id + "'>"
  		      + cate1Arr[i].categoryname + "</option>"); 
  		}


 		
  		$(document).on("change", "select.category1", function(){

  			 var cate2Arr = new Array();
  			 var cate2Obj = new Object();
  			 
  			 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
  			 for(var i = 0; i < jsonData.length; i++) {
  			  
  			  if(jsonData[i].level == "2") {
  			   cate2Obj = new Object();  //초기화
  			   cate2Obj.category_id = jsonData[i].category_id;
  			   cate2Obj.categoryname = jsonData[i].categoryname;
  			   cate2Obj.code = jsonData[i].code;
  			   
  			   cate2Arr.push(cate2Obj);
  			  }
  			 }
  			 
  			 var cate2Select = $("select.category2");
  			 
  			 /*
  			 for(var i = 0; i < cate2Arr.length; i++) {
  			   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
  			        + cate2Arr[i].cateName + "</option>");
  			 }
  			 */
  			 
  			 cate2Select.children().remove();

  			 $("option:selected", this).each(function(){
  			  
  			  var selectVal = $(this).val();  
  			  cate2Select.append("<option value=''>전체</option>");
  			  
  			  for(var i = 0; i < cate2Arr.length; i++) {
  			   if(selectVal == cate2Arr[i].code) {
  			    cate2Select.append("<option value='" + cate2Arr[i].category_id + "'>"
  			         + cate2Arr[i].categoryname + "</option>");
  			   }
  			  }
  			  
  			 });
  			 
  			});
	</script>
				
				
				

				
			</div>
			
			

			<div class="col-lg-9">
				<div class="row">
					

					

					
<div class="row text-center">
  <c:forEach items="${bigcategory}" var="vo">
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">

            <h4 class="card-title">${vo.goodsname}</h4>
            <p class="card-text">${vo.price}원</p>
            <p class="card-text">${vo.description}</p>
       
          </div>
          
        </div>
      </div>
      </c:forEach>
      
      
      </div>

								
				
			</div>
		</div>
	</div>
	</section>
	<!-- Product Shop Section End -->
	
	
	
	
	



	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>
