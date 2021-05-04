<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>storehome</title>

<!-- bootstrap css cdn --<!-- > -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
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
    	width: 120px;
    	height: 280px;
    }
    	
	span.star-prototype, span.star-prototype>*, span.star, span.star>* {
	   height: 16px;
	   background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	   display: inline-block;
	}
	
	span.star-prototype>*, span.star>* {
	   background-position: 0 0;
	   max-width: 80px;
	}
	
	#navbars>li:nth-child(1) {
  		background-color: #e7ab3c;
	}

</style>

<script>
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

<body>
   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   `
   <!-- Banner Section Begin -->
      <div class="hero-items owl-carousel">
         <div class="container">
            <div class="single-hero-items set-bg"
               data-setbg="/resources/img/storehome/banner_01.jpg">
               <div class="row">
                  <div class="col-lg-9 offset-lg-1">
                     <span>Cat, Toy</span>
                     <h1>Today's HOT</h1>
                     <p></p>
                     <a href="/store/commu/category/106?categoryName=고양이 / 장난감" class="primary-btn">Shop Now</a>                   
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="single-hero-items set-bg"
               data-setbg="/resources/img/storehome/banner_02.jpg">
               <div class="row">
                  <div class="col-lg-9 offset-lg-1">
                     <span>Dog, Snack</span>
                     <h1 style="color: #d3d3d3">Today's HOT</h1>
                     <p></p>
                     <a href="/store/commu/category/202?categoryName=강아지 / 간식/영양제" class="primary-btn">Shop Now</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="single-hero-items set-bg"
               data-setbg="/resources/img/storehome/banner_03.jpg">
               <div class="row">
                      <div class="col-lg-9 offset-lg-1">
                     <span>Dog, Food</span>
                     <h1 style="color: #eeeeee">Today's HOT</h1>
                     <p></p>
                     <a href="/store/commu/category/201?categoryName=강아지 / 사료" class="primary-btn">Shop Now</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="single-hero-items set-bg"
               data-setbg="/resources/img/storehome/banner_04.jpg">
               <div class="row">
                      <div class="col-lg-9 offset-lg-1">
                     <span>Dog, Clothes</span>
                     <h1 style="color: #eeeeee">Today's HOT</h1>
                     <p></p>
                     <a href="/store/commu/category/205?categoryName=강아지 / 의류/패션" class="primary-btn">Shop Now</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Banner Section End -->

      <!-- Category Section Begin -->
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section-title">
                  <h2 class="category">Category</h2>
               </div>
            </div>
         </div>
           <div class="row">
            <div class="col-lg-2 col-md-2 col-sm-2">
             <a href="/store/commu/category/101?categoryName=고양이 / 사료">    
                    <img src="/resources/img/category/cat.jpg"></a>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-2">
                  <a href="/store/commu/category/201?categoryName=강아지 / 사료">
                    <img src="/resources/img/category/dog.jpg"></a>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-2">
                  <a href="/store/commu/category/301?categoryName=파충류 / 사료">
                    <img src="/resources/img/category/reptile.jpg"></a>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-2">
                  <a href="/store/commu/category/501?categoryName=조류 / 모이">
                    <img src="/resources/img/category/bird.jpg"></a>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-2">
                  <a href="/store/commu/category/401?categoryName=어류 / 어항">
                     <img src="/resources/img/category/fish.jpg"></a>
            </div>

            <div class="col-lg-2 col-md-2 col-sm-2">
                  <a href="/store/commu/category/601?categoryName=기타 / 사료">
                     <img src="/resources/img/category/other.jpg"></a>
            </div>
         </div>
      <!-- Category Section End -->

       <!-- Hot Item section Begin -->
         <section class="hotitem">
            <div class="row">
               <div class="col-lg-3 col-sm-3">
                  <div class="product-large set-bg" data-setbg="/resources/img/storehome/hot_banner_01.jpg">
                     <h2>Hot Item</h2>
                     <a href="/store/best">More</a>
                  </div>
               </div>
               <div class="col-sm-8 offset-lg-1">
                  <div class="filter-control">
                     <ul>
                        <li class="active">Products</li>
                     </ul>
                  </div>
                  <div class="product-slider owl-carousel">
                     <c:forEach items="${rate}" var="rate">
                        <c:if test="${rate.rnum le 10}">
                           <div class="product-item">
                              <div class="pi-pic">                                                    
                              <c:forEach items="${goods}" var="goods">
                               <c:if test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                                 <a href="/admin/goods_detail/${goods.board_id}"><img src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}" alt=""></a>
                                	 <div class="sale">BEST&nbsp;&nbsp;${rate.rnum}</div>
                                 </c:if>
                               </c:forEach>  
                              </div>
                              
                              <div class="pi-text">
                                 <div class="catagory-name"></div>
                             	   <c:forEach items="${goods}" var="goods">
                             		 <c:if test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                                       <a href="/admin/goods_detail/${goods.board_id}">
                                          <h5>${goods.goodsVO.goodsname}</h5>
                                       </a>
                                       <div class="product-price">${goods.goodsVO.price}원</div>
                                		<span class="star-prototype"> ${rate.avgscore}</span>
                                 		&nbsp; <span>리뷰 ${rate.count}</span>
                                 	 </c:if>
                                 </c:forEach>
                              </div>
                           </div>
                        </c:if>
                     </c:forEach>
                </div>
                </div>
             </div>
         </section>
         <!-- Hot Item section End -->

         <!-- Recommended Item Begin -->
         <section class="recommended">     
            <div class="deal-of-week set-bg spad" style="margin:0px;" data-setbg="/resources/img/storehome/re_banner.jpg">
               <div class="col-12 col-md-6 text-center">
                  <div class="section-title">
                     <h2>Recommended Product</h2>
                     <p>펫츠하우스의 추천 상품!!을 만나보세요</p>
                     <div class="product-price">
                        29,900원 <span>/ BirdCage</span>
                     </div>
                  </div>
                  <div class="countdown-timer" id="countdown">
                     <div class="cd-item">
                        <span>7</span>
                        <p>Days</p>
                     </div>
                     <div class="cd-item">
                        <span>12</span>
                        <p>Hrs</p>
                     </div>
                     <div class="cd-item">
                        <span>40</span>
                        <p>Mins</p>
                     </div>
                     <div class="cd-item">
                        <span>52</span>
                        <p>Secs</p>
                     </div>
                  </div>
                  <a href="/admin/goods_detail/5384" class="primary-btn">Shop Now</a>
               </div>
            </div>
         </section>
         <!-- Recommended Item End -->

         <!-- Best Item Begin -->
         <section class="best">
            <div class="row">
                  <div class="col-lg-12 section-title">
                     <h2>Best Products</h2>
               	  </div>
            </div>
            <div class="cate row" style="padding-bottom: 30px;">
            	<c:forEach items="${rate}" var="rate">
                  <div class="col-lg-3 col-sm-6">
                     <div class="product-item">                   
  
                        <div class="pi-pic">                     
                           <c:forEach items="${goods}" var="goods">
                                 <c:if test="${goods.goodsVO.goods_id eq rate.goodsVO.goods_id}">
                                    <a href="/admin/goods_detail/${goods.board_id}"><img src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}" alt=""></a>   
	                           		<div class="sale">Best&nbsp;&nbsp;${rate.rnum}</div>		                         
	                        	</c:if>
	                        </c:forEach>
                       	</div>
                        
                        <div class="pi-text">
                           <div class="catagory-name"></div>
                              <c:forEach items="${goods}" var="goods">
                                 <c:if test="${goods.goodsVO.goods_id eq rate.goodsVO.goods_id}"> 
                                 <a href="/admin/goods_detail/${goods.board_id}">
                                    <h5>${goods.goodsVO.goodsname}</h5>
                                 </a>
                           <div class="product-price">${goods.goodsVO.price}원</div>
                              <span class="star-prototype"> ${rate.avgscore}</span>
                              <span> &nbsp; 리뷰 ${rate.count}</span>
                              	</c:if>
                              </c:forEach>
                        </div>
                     </div>
                  </div>
               </c:forEach>                      
            </div>
             
              <c:if test="${fn:length(count) > 8}">
                <input type="hidden" class="count" value="${fn:length(count)}" />
	            <div class="col-lg-12 text-center" style="padding-bottom: 80px;">  
	            	<button id="morebtn" type="button" class="btn btn-disabled" onClick="btnClick()">더보기 
	            	<i class="fa fa-caret-down"aria-hidden="true"></i></button>
		        </div>
		      </c:if>
	    
           </section> 
         <!-- Best Item End -->
		</div>
      <!-- /.container -->
      
<!-- 더보기 페이징 처리 -->
<script>
	var pageNum = 1;
	var check = $('.count').val() / 8;
     
	function btnClick(){
		pageNum += 1;
    	  
		if (pageNum >= check) {
			$(".btn").hide();
		}
    	  
		console.log(pageNum);
		console.log(check);
    	  		  
		$.ajax({
			type :"POST",
			url :"/store/morelist",
			data : {
				pageNum: pageNum 
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var rate = data.rate;
    	           var goods = data.goods;
					
    	          html = "";
    	           for(var i in rate){
    	        	  html += "<div class='col-lg-3 col-sm-6'> <div class='product-item'>  <div class='pi-pic'>";
    	        	for(var j in goods){
	       	          	if(goods[j].goodsVO.goods_id == rate[i].goodsVO.goods_id){
	       	          	html +="<a href='/admin/goods_detail/" + goods[j].board_id + "'><img src='/resources/img/admin/goods/"+goods[j].goodsVO.thumbnail + "'>"
	       	          		 + "<div class='sale'>Best&nbsp;&nbsp;" + rate[i].rnum + "</div>"       
	       	          		 + "</div> <div class='pi-text'> <div class='catagory-name'> </div>"
	       	         	 	 + "<a href='/admin/goods_detail/" + goods[j].board_id + "'> <h5>" + goods[j].goodsVO.goodsname + "</h5></a>"
	       	         	 	 + "<div class='product-price'>" + goods[j].goodsVO.price + "원</div>"
	       	        	 	 + "<span class='star-prototype'> <span class='star' style='width:"+(rate[i].avgscore*16)+"px'> </span>" + "</span>"       	         	
	       	         	 	 + "<span> &nbsp; 리뷰 " + rate[i].count + "</span> </div> </div> </div> </div>";       	          	       	          	
	       	          	}//if end 
    	        	}//goods foreach end      	   
    	           } //bestrate foreach end
    	           
    	           if(rate.length == 8){
		        		html += "<div class='btn col-lg-12 text-center'>"  
		            		 + "<button id='morebtn' type='button' class='btn btn-disabled' onClick='btnClick()'>더보기<i class='fa fa-caret-down' aria-hidden='true'></i></button></div>";		        		
		        	}
    	           
    	           $('.btn').remove();
    	           $(".cate").append(html); 
    	          
    	        }, 	        
    	        //success end
    	        error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end
    	    }); //ajax end	 
    	}; //click end	
      </script>
      
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>

   <!-- Bootstrap core JavaScript -->
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

