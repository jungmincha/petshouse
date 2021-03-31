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
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 다운드롭 부트스트랩 -->
 <!-- <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
  
  <!-- 추가코드 -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script> -->
<!-- 부트스트랩 끝 -->
<title>category</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="/resources/sidemenu/css/styles.css" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
 <!--CDN 링크 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/sidemenu/js/custom.js"></script>
 <script src="/resources/sidemenu/https://code.jquery.com/jquery.js"></script>
  
  
  <style>
.tab-item {
   width: 1000;
   
}

a{

cursor:pointer;

}
</style>
  
  
  
<script type="text/javascript">
/*
$(document).ready(function () {

    $("#search-form").submit(function (event) {

        event.preventDefault();

        fire_ajax_submit();

    }); */

  	function fire_ajax_submit() {

    	var category = {}
    category["category"] = $("#category").val();

   

    	
    	var url = "/category/bigcategory/${category[0].category_id}";
    	
    

    $.ajax({
        type: "POST",
        contentType: "application/json",
  		url: url,
      
      
        async : true,
     	data : category,
        cache : false,
    
        success: function (data) { 
          console.log("SUCCESS : ", data);
          
        $('#input').html(data); 
	
    
 /*          $('.container').html(data); */
    /*         $(location).attr('/category/bigcategory') ; */
   
 
            
        },
        error: function (e) {
      console.log("ERROR : ", e);
         

        }
    });

}
    
    
 

</script>






</head>
<body>



   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
   <!-- Page Content -->
   <!-- Product Shop Section Begin -->

   <section class="product-shop spad page-details">

   <div class ="container">
   <!--가져올 부분-->
	<div id = "input">
   
   
      <div class="row">
         <div class="col-lg-3">
            <div class="filter-widget">
                     </div>
  <h3>카테고리</h3> 
 <br><br>
 <!-- 카테고리 부트스트랩 start -->

           <div class="sidebar" style="display: block;" >
                <ul class="nav">
                   <li class="submenu" >
                   
                   
   
                      <!-- 고양이 -->
                     <a href="#" onclick="fire_ajax_submit();"> 
                 <%-- <a  onclick ="location.href='/category/bigcategory/${category[0].category_id}'"> --%>
                       
                          <i class="fas fa-cat"></i>${category[0].categoryname}<span class="caret pull-right"></span>
                       </a>
                       
                       
                       
                       <!-- Sub menu -->
                       <ul>
                       <c:forEach items = "${smallcategory}" var="vo" begin="0" end="6">

                       
                          <li><a href="">${vo.categoryname}</a></li>
                        
                          
                          </c:forEach>
                       </ul>    
                       </li>
                       </ul>
                       
                        
                  <!-- 강아지 -->
                   <ul class="nav">
                   <li class="submenu">
                     <a href="javascript:void(0);" onclick="fire_ajax_submit();"> 
               <%--    <a  onclick ="location.href='/category/bigcategory/${category[1].category_id}'"> --%>
                     <i class="fas fa-dog"></i>${category[1].categoryname}<span class="caret pull-right"></span>
                        </a>
                        <!-- Sub menu -->
                        <ul>
                           <c:forEach items = "${smallcategory}" var="vo2" begin="7" end="13">

                       
                          <li><a href="">${vo2.categoryname}</a></li>
                        
                          
                          </c:forEach>
                        </ul>
                        </li>
                       </ul>
                    
                  <!-- 조류 -->
                      <ul class="nav">
                   <li class="submenu">
                  <a onclick ="location.href='/category/bigcategory/${category[2].category_id}'">
                     <i class="fas fa-frog"></i>${category[2].categoryname}<span class="caret pull-right"></span>
                  </a>
                  <!-- Sub menu -->
                         <ul>
                           <c:forEach items = "${smallcategory}" var="vo3" begin="14" end="17">

                       
                          <li><a href="">${vo3.categoryname}</a></li>
                        
                          
                          </c:forEach>
                         </ul>
                         </li>
                        </ul>
                    
                        <!-- 어류 -->
                            <ul class="nav">
                   <li class="submenu">
                         <a onclick ="location.href='/category/bigcategory/${category[3].category_id}'">
                            <i class="fas fa-fish"></i>${category[3].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                            <c:forEach items = "${smallcategory}" var="vo" begin="18" end="24">

                       
                          <li><a href="">${vo.categoryname}</a></li>
                        
                          
                          </c:forEach>
                        </ul>
                        </li>
                       </ul>
                    
                        <!-- 파충류 -->
                         <ul class="nav">
                   <li class="submenu">
                        <a onclick ="location.href='/category/bigcategory/${category[4].category_id}'">
                            <i class="fas fa-crow"></i>${category[4].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                           <c:forEach items = "${smallcategory}" var="vo" begin="25" end="29">

                       
                          <li><a href="">${vo.categoryname}</a></li>
                        
                          
                          </c:forEach>
                        </ul>
                        </li>
                       </ul>
                    
                       <!-- 기타 -->
                        <ul class="nav">
                   <li class="submenu">
                        <a onclick ="location.href='/category/bigcategory/${category[5].category_id}'">
                            <i class="fas fa-paw"></i>${category[5].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                            <c:forEach items = "${smallcategory}" var="vo" begin="30" end="36">

                       
                          <li><a href="">${vo.categoryname}</a></li>
                        
                          
                          </c:forEach>
                        </ul>
                        </li>
                      </ul>
                      
                        </div>


                  <!--  카테고리 부트스트랩 end -->

            
         </div>
         
         

         <div class="col-lg-9">
            <div class="row">
               

               

               
<div class="row text-center">
  <c:forEach items="${goods}" var="dto">
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">

            <h4 class="card-title">${dto.goodsname}</h4>
            <p class="card-text">${dto.price}원</p>
            <p class="card-text">${dto.description}</p>
          
       
          </div>
          
        </div>
      </div>
      </c:forEach>
      
      
      </div>

         
         
         
         
</div>
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