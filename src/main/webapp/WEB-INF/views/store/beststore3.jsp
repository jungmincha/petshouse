<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>beststore</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   type="text/css" />
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
<!-- jquery cdn -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <script type="text/javascript">
    $(document).ready(function(){	
		$.fn.generateStars = function() {
    	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
    	};

    	// 숫자 평점을 별로 변환하도록 호출하는 함수
    	$('.star-prototype').generateStars();
    })
    </script>

  <script type="text/javascript">
   $(document).ready(function(){
      $(".category").on('click',function(){
         
         getList();
         
         function getList() {
            $.ajax({
               type: 'GET',
               url: $(this).attr('href'),
               cache : false,
               dataType: 'json',

               success: function(result) {
               //console.log(result);
                  $('.category').children().remove();
                 
                  var htmls="";
               
                    $(".category").html("");   

                    $(result).each(function(){   
                    
                       //다이어리
                    	   htmls +='<tr class="table-light"><td>'+ this.category_id +'</td></tr>';
     	                  
                  
                    });//result end
                    
                    console.log(htmls);
                 
                    $(".category").append(htmls); 
                 
                 }//sucess end
            });//ajax end
         }//getList end
      });//change
   });//document function
</script>
  
<style>
    .single-banner{
    	padding-bottom: 40px;
    }

    
    span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    display: inline-block;
	}
 
	span.star-prototype > * {
	    background-position: 0 0;
	    max-width:80px; 
	}
	
	
  </style>
</head>

<body>
 <!-- header -->
 <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <!-- Best Products  -->
    <section class="latest-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Best Products</h2>
                    </div>
                </div> 
             </div>
          
         	<!-- category -->
         	<section class="category">
             <div class="row"> 
             <c:forEach items="${category}" var="category">          
                <div class="col-lg-2">                                                                  
	               <a onclick="" href="/store/best/${category.category_id}" value="${category.category_id}"><img src="/resources/img/category/fish.jpg"></a>                                     
                </div>
             </c:forEach>
             </div>   
          
  		  <!-- Category End -->   
  		  
            <!-- Goods -->
            <div class="goods">
             <div class="row">
           <c:forEach items="${rate}" var="rate">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
             
                            <div class="sale">Best ${rate.rnum}</div>     
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name"> </div>
                            <c:forEach items="${goods}" var="goods"> 
                             		<c:if test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
						            	  <a href="/admin/goods_detail/${goods.board_id}">
                                			<h5>${goods.goodsVO.goodsname}</h5>               
                           				 </a>                       
		                            	<div class="product-price">
		                             	    ${goods.goodsVO.price}원                           
		                           		 </div>
		                            </c:if> 
                            </c:forEach> 
						  별점 <span class="star-prototype"> ${rate.avgscore}</span> <span> &nbsp; 리뷰 ${rate.count}</span>         
                        </div>                    
                    </div>     
                </div>
                </c:forEach>
            </div>
         </div>
         </section>
         </div>
    </section>
     <!-- Goods End -->
    
   <!-- Footer -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 
   <!-- Bootstrap core JavaScript -->
   <script src="/resources/store/vendor/jquery/jquery.min.js"></script>
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
   <script src="/resources/js/main.js"></script>
</body>
</html>
  

  