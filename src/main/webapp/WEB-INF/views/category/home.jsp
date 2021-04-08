
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<meta name="description" content="">
<meta name="author" content="">


<title>Insert title here</title>


<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  
  
  
<script src="/resources/sidemenu/https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/sidemenu/js/custom.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap -->
<link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- styles -->
<link href="/resources/sidemenu/css/styles.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<style>
.tab-item {
	width: 1000;
}

a {
	cursor: pointer;
}

select {
	width: 120px;
	height: 30px;
	font-size: 18px;
}

.hero-items {
	   padding-top: 150px;
	}
	
	.single-hero-items {
	   max-height: 580px;
	}
	
	.category, .hotitem {
	   padding-top: 40px;
	}
	
	.product-item {
	   padding-top: 20px;
	}
	
	.recommended {
	   padding-top: 60px;
	}
	
	.best {
	   padding: 80px;
	}
	
	.product-item img{
    	width: 200px;
    	height: 280px;
    }
    	
	span.star-prototype, span.star-prototype>* {
	   height: 16px;
	   background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	   display: inline-block;
	}
	
	span.star-prototype>* {
	   background-position: 0 0;
	   max-width: 80px;
	}

</style>


  

  
  
<script type="text/javascript">

$(document).ready(function() {
    console.log("${category_id}")

    var category = $("#category").val();

    var form = {

       category : category,

       name : "${categoryName}",

    };

    var url = "/category/smallcategory/" + "${category_id}";

    $.ajax({
       type : "POST",
       contentType : 'application/json; charset=utf-8',
       url : url,
       data : JSON.stringify(form),
       cache : false,

       success : function(data) {

          console.log("SUCCESS : ", data);

          $('#input').html(data);
          console.log(id);
          console.log(name);
          console.log(animal);

       },
       error : function(e) {
          console.log("ERROR : ", e);

       }
    });

 }) 




  	function fire_ajax_submit(id, name) {
    		console.log(id);
    		console.log(name);
    		
    		
    		
    		 var category = $("#category").val();
    	
    		
  
   
    	var form={
    			
    			category:category,
    			
    	
    			name:name,

    
    			
    	};
    	
    	    	var url = "/category/smallcategory/"+id;
    	
    	
    $.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
  		url: url,
        data:  JSON.stringify(form), 
        cache : false,
      
        success: function (data) { 
        	
          console.log("SUCCESS : ", data);
       
   $('#input').html(data);
		  console.log(id);
		  console.log(name);
		  console.log(animal);
		
        },
        error: function (e) {
      console.log("ERROR : ", e);
  
        }
    });

}



  	
  	
  	
	function select_submit(arr) {
		console.log(arr);


		 var category = $("#category").val();
	
		


	var form={
			
			category:category,
	
			
	};
    	
    	var url = "/category/"+arr;
    	
    	
    $.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
  		url: url,
        data: JSON.stringify(form), 
        cache : false,
        
        success: function (data) { 
        	
          console.log("SUCCESS : ", data);
       
          $('#input').html(data);
		  console.log(id);

        },
        error: function (e) {
      console.log("ERROR : ", e);
  
        }
    });

}
  	
  	
  	
  	
  	
  
  	 $(document).ready(function() {
  	      $.fn.generateStars = function() {
  	         return this.each(function(i, e) {
  	            $(e).html($('<span/>').width($(e).text() * 16));
  	         });
  	      };

  	      // 숫자 평점을 별로 변환하도록 호출하는 함수
  	      $('.star-prototype').generateStars();
  	   });
  	
  	
  	

</script>




</head>


<body style="padding-top:128px">
   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
   <!-- Page Content -->
   <!-- Product Shop Section Begin -->

  <section class="product-shop spad page-details">
      

   <div class ="container">
   

   
   
	
      <div class="row">
         <div class="col-lg-3">
            <div class="filter-widget">
            </div>
 		    <br><br>
 		   <!-- 카테고리 부트스트랩 start -->
           <div class="sidebar" style="display: block;" >
                <ul class="nav">
                   <li class="submenu">
                 
   
                 
                
                      <!-- 고양이 -->
                     <a href="#" style ="font-size: 25px;"> 
               		 <i class="fas fa-cat"></i>${category[0].categoryname}<span class="caret pull-right"></span>
                     </a>
                     
                     <!-- Sub menu -->
                     <ul>
                       <c:forEach items = "${smallcategory}" var="vo" begin="0" end="6">
 					
                       
                      <li>
                      <a href="#"  style ="font-size: 18px;" onclick="fire_ajax_submit('${vo.category_id}' , '${category[0].categoryname} / ${vo.categoryname}');">
                      ${vo.categoryname}
                      </a>
                      </li>
                       
                          
                          </c:forEach>
                      </ul>    
                      </li>
                      </ul>
                       
                       
                        
                  <!-- 강아지 -->
                   <ul class="nav">
                   <li class="submenu">
                     <a href="#" style ="font-size: 25px;"> 
                     <i class="fas fa-dog"></i>${category[1].categoryname}<span class="caret pull-right"></span>
                     </a>
                     
                        <!-- Sub menu -->
                      <ul>
                           <c:forEach items = "${smallcategory}" var="vo2" begin="7" end="13">
    			      <li>
    			      <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit('${vo2.category_id}' , '${category[1].categoryname} / ${vo2.categoryname}');">
    			      ${vo2.categoryname}
    			      </a>
    			      </li>
                            </c:forEach>
                       </ul>
                       </li>
                       </ul>
                    
                    
                    
                  <!-- 조류 -->
                      <ul class="nav">
                   <li class="submenu">
                  <a href="#" style ="font-size: 25px;">
                     <i class="fas fa-frog"></i>${category[2].categoryname}<span class="caret pull-right"></span>
                  </a>
                  <!-- Sub menu -->
                         <ul>
                           <c:forEach items = "${smallcategory}" var="vo3" begin="14" end="17">
            			 <li>
                          <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit('${vo3.category_id}' , '${category[2].categoryname} / ${vo3.categoryname}');">
                          ${vo3.categoryname}
                          </a>
                          </li>
                             </c:forEach>
                         </ul>
                         </li>
                        </ul>
                    
                    
                    
                        <!-- 어류 -->
                            <ul class="nav">
                   <li class="submenu">
                        <a href="#" style ="font-size: 25px;">
                            <i class="fas fa-fish"></i>${category[3].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                            <c:forEach items = "${smallcategory}" var="vo4" begin="18" end="24">
						    <li>
						    <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit('${vo4.category_id}' , '${category[3].categoryname} / ${vo4.categoryname}');">
						    ${vo4.categoryname}
						    </a>
						    </li>
                        
                          
                          </c:forEach>
                          </ul>
                          </li>
                          </ul>
                    
                        <!-- 파충류 -->
                         <ul class="nav">
                 	     <li class="submenu">
                          <a href="#" style ="font-size: 25px;">
                            <i class="fas fa-crow"></i>${category[4].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                           <c:forEach items = "${smallcategory}" var="vo5" begin="25" end="29">
             			   <li>
             			   <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit('${vo5.category_id}' , '${category[4].categoryname} / ${vo5.categoryname}');">
             			   ${vo5.categoryname}
             			   </a>
             			   </li>
                              </c:forEach>
                           </ul>
                           </li>
                           </ul>
                           
                           
                    
                       <!-- 기타 -->
                        <ul class="nav">
                        <li class="submenu">
                          <a href="#" style ="font-size: 25px;">
                            <i class="fas fa-paw"></i>${category[5].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                            <c:forEach items = "${smallcategory}" var="vo6" begin="30" end="36">
						    <li>
						    <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit('${vo6.category_id}' , '${category[5].categoryname} / ${vo6.categoryname}');">
						    ${vo6.categoryname}
						    </a>
						    </li>
                           </c:forEach>
                       		</ul>
                       		</li>
                            </ul>
                      
                        </div>


                  		<!--  카테고리 부트스트랩 end -->

            
         </div>
         
        
              
         <div class="col-lg-9">
              <div class="row">
                                         
  
  
  <!--가져올 부분-->
	<div id = "input">
	
	<div class="dropdown">
     <button type="button" style="font-size:20px; color:black;background-color:white; border:none; " class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
     전체
    </button>
    <div class="dropdown-menu">
    <a class="dropdown-item" style="font-size:20px;" href="/category/home">최신순</a>
   <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('rowprice')">가격 낮은순</a>
     <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highprice')">가격 높은순</a> 

   
    <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highstar')">별점 높은순</a>
    
     <!--   <a class="dropdown-item" style="font-size:20px;" href="/category/highprice">가격 높은순</a> -->
<!--      <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highprice')">가격 높은순</a>  -->
   <!--    <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('rowprice')">가격 낮은순</a> -->
   
<!--       <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highstar')">별점 높은순</a> -->
      
    
    </div>
  </div>
 
                 
<div class="row text-center">


    <c:forEach items="${rate}" var="rate">
             
                           <div class="product-item">
                                 <div class="pi-text" style="padding:10px;">
                                
                                 <c:forEach items="${goods}" var="goods">
                                    <c:if
                                       test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                                    
                                        
                                       <a href="/admin/goods_detail/${goods.board_id}">
                                       <img src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}"  alt="">
                                          <h5>${goods.goodsVO.goodsname}</h5>
                                       </a>
                                       <div class="product-price">${goods.goodsVO.price}원</div>
                                    </c:if>
                                 </c:forEach>
                                 별점 <span class="star-prototype"> ${rate.avgscore}</span>
                                
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
  <!-- Bootstrap core JavaScript -->
 <!--  <script src="/resources/store/vendor/jquery/jquery.min.js"></script>
   <script
      src="/resources/store/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
   <script src="/resources/js/jquery-3.3.1.min.js"></script>
   <script src="/resources/js/bootstrap.min.js"></script>
   <script src="/resources/js/jquery-ui.min.js"></script>
   <script src="/resources/js/jquery.countdown.min.js"></script>
   <script src="/resources/js/jquery.nice-select.min.js"></script>
   <script src="/resources/js/jquery.zoom.min.js"></script>
   <script src="/resources/js/jquery.dd.min.js"></script>
   <script src="/resources/js/jquery.slicknav.js"></script>
   <script src="/resources/js/owl.carousel.min.js"></script>
   <script src="/resources/js/main.js"></script>  -->

</body>
</html>