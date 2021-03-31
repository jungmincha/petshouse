<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="/resources/sidemenu/css/styles.css" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<style>
.tab-item {
   width: 1000;
}


a{

cursor:pointer;

}


</style>

 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/resources/sidemenu/https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/sidemenu/js/custom.js"></script>

</head>


<body>



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
                       <a onclick ="location.href='/category/bigcategory/${category[0].category_id}'">
                       
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
                  <a onclick ="location.href='/category/bigcategory/${category[1].category_id}'">
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
  <c:forEach items="${bigcategory}" var="dto">
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
</body>
</html>