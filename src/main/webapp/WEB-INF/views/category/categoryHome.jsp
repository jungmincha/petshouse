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


<style>
.tab-item {
   width: 1000;
}




</style>

 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/resources/sidemenu/https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/sidemenu/js/custom.js"></script>


</head>
<body>

<c:forEach items = "${smallcategory}" var = "vo2">
${vo2.categoryname}
</c:forEach>



   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
   <!-- Page Content -->
   <!-- Product Shop Section Begin -->

   <section class="product-shop spad page-details">
   <div class="container">
      <div class="row">
         <div class="col-lg-3">
            <div class="filter-widget">
                     </div>
        <h3>카테고리</h3>
 <br><br>
 <!-- 카테고리 부트스트랩 start -->
  
           <div class="sidebar" style="display: block;">
           <c:forEach items = "${category}" var = "vo">
                <ul class="nav">
                   <li class="submenu">
                      
                      <!-- 고양이 -->
                      
                       <a href="#">
                          <i class="fas fa-cat"></i>${vo.categoryname}<span class="caret pull-right"></span>
                       </a>
                       <!-- Sub menu -->
                       <ul>
                       <c:forEach items = "${smallcategory}" var = "vo2">
                          <li><a href="/resources/sidemenu/login.html">${vo2.categoryname}</a></li>
                         </c:forEach>
                       </ul>    
                       </li>
                       </ul>
                       
                        
                 
                      </c:forEach>
                        </div>
      

                  <!--  카테고리 부트스트랩 end -->

            </div>
         </div>
         
         

         <div class="col-lg-9">
            <div class="row">
               

               

               
<div class="row text-center">

      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">

            <h4 class="card-title">캣냥이</h4>
            <p class="card-text">50000원</p>
            <p class="card-text">상세설명</p>
       
          </div>
          
        </div>
      </div>
      
      
      
       <div class="col-lg-4 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">

            <h4 class="card-title">강아지</h4>
            <p class="card-text">12000원</p>
            <p class="card-text">의류</p>
       
          </div>
          
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