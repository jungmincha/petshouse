<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- bootstrap css cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

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
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
   $(document).ready(function() {
      $.fn.generateStars = function() {
         return this.each(function(i, e) {
            $(e).html($('<span/>').width($(e).text() * 16));
         });
      };

      // 숫자 평점을 별로 변환하도록 호출하는 함수
      $('.star-prototype').generateStars();
      
      //category home 이동 
      function fire_ajax_submit(id) {
      	console.log(id);
      	var category_id = id;
  		
  		var form = {
  				category_id: category_id
  		};    
  		
      	var url = "/category/smallcategory/"+id;
      		
      $.ajax({
          type: "POST",
          contentType: 'application/json; charset=utf-8',
    		url: url,
          data: JSON.stringify(form), 
          cache : false,
          
          success: function (data) {         	
            console.log("SUCCESS : ", data); 
          },
          
          error: function (e) {
       	   console.log("ERROR : ", e);
          }
      });
      };
   });
</script>

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
                  <div class="col-lg-1"></div>
                  <div class="col-lg-9">
                     <span>Cat, Toy</span>
                     <h1>Today's HOT</h1>
                     <p></p>
                     <a href="#" class="primary-btn">Shop Now</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="single-hero-items set-bg"
               data-setbg="/resources/img/storehome/banner_02.jpg">
               <div class="row">
                  <div class="col-lg-1"></div>
                  <div class="col-lg-9">
                     <span>Dog, Snack</span>
                     <h1 style="color: #d3d3d3">Today's HOT</h1>
                     <p></p>
                     <a href="#" class="primary-btn">Shop Now</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="single-hero-items set-bg"
               data-setbg="/resources/img/storehome/banner_03.jpg">
               <div class="row">
                  <div class="col-lg-1"></div>
                  <div class="col-lg-9">
                     <span>Dog, Food</span>
                     <h1 style="color: #eeeeee">Today's HOT</h1>
                     <p></p>
                     <a href="#" class="primary-btn">Shop Now</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="single-hero-items set-bg"
               data-setbg="/resources/img/storehome/banner_04.jpg">
               <div class="row">
                  <div class="col-lg-1"></div>
                  <div class="col-lg-9">
                     <span>Dog, Clothes</span>
                     <h1 style="color: #eeeeee">Today's HOT</h1>
                     <p></p>
                     <a href="#" class="primary-btn">Shop Now</a>
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
            <div class="col-sm-2">
             <a href="#" onclick ="fire_ajax_submit(1);">    
                    <img src="/resources/img/category/cat.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="" onclick="location.href='/category/smallcategory/201';">
                    <img src="/resources/img/category/dog.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="/category/smallcategory/301">
                    <img src="/resources/img/category/reptile.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="/category/smallcategory/401">
                    <img src="/resources/img/category/bird.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="/category/smallcategory/501">
                     <img src="/resources/img/category/fish.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="/category/smallcategory/601">
                     <img src="/resources/img/category/other.jpg"></a>
            </div>
         </div>
      <!-- Category Section End -->

       <!-- Hot Item section Begin -->
         <section class="hotitem">
            <div class="row">
               <div class="col-sm-3">
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
                                 <img src="/resources/img/admin/${goods.goodsVO.thumbnail}" alt="">
                               </c:if>
							  </c:forEach>
							  
                                 <div class="sale">BEST ${rate.rnum}</div>
                                 <c:forEach items="${goods}" var="goods">
                                  <c:if test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                                 <ul>
                                    <li class="w-icon active"><a href="#"><i
                                          class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="/admin/goods_detail/${goods.board_id}">+ Quick View</a></li>
                                 </ul>
                                 </c:if>
                                 </c:forEach>
                              </div>
                              <div class="pi-text">
                                 <div class="catagory-name"></div>
                                 <c:forEach items="${goods}" var="goods">
                                    <c:if
                                       test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                                       <a href="/admin/goods_detail/${goods.board_id}">
                                          <h5>${goods.goodsVO.goodsname}</h5>
                                       </a>
                                       <div class="product-price">${goods.goodsVO.price}원</div>
                                    </c:if>
                                 </c:forEach>
                                 <span class="star-prototype"> ${rate.avgscore}</span>
                                 &nbsp; <span>리뷰 ${rate.count}</span>
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
            <div class="deal-of-week set-bg spad" data-setbg="/resources/img/storehome/re_banner.jpg">
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
                  <a href="/admin/goods_detail/361" class="primary-btn">Shop Now</a>
               </div>
            </div>
         </section>
         <!-- Recommended Item End -->

         <!-- Best Item Begin -->
         <section class="best">
            <div class="row">
               <div class="col-lg-12">
                  <div class="section-title">
                     <h2>Best Products</h2>
                  </div>
               </div>
            </div>
            <div class="row">
               <c:forEach items="${bestrate}" var="bestrate">
                  <div class="col-lg-3 col-sm-6">
                     <div class="product-item">
                        <div class="pi-pic">
                        
                           <c:forEach items="${goods}" var="goods">
                                 <c:if test="${goods.goodsVO.goods_id eq bestrate.goodsVO.goods_id}">
                                    <img src="/resources/img/admin/${goods.goodsVO.thumbnail}" alt="">
                                 </c:if>
                           </c:forEach>
                           
                           <div class="sale">Best ${bestrate.rnum}</div>
                           <div class="icon">
                              <i class="icon_heart_alt"></i>
                           </div>
                           <c:forEach items="${goods}" var="goods">
                              <c:if test="${bestrate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="/admin/goods_detail/${goods.board_id}">+ Quick View</a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                           <div class="catagory-name"></div>
                           
                                 <a href="/admin/goods_detail/${goods.board_id}">
                                    <h5>${goods.goodsVO.goodsname}</h5>
                                 </a>
                                 <div class="product-price">${goods.goodsVO.price}원</div>
                              </c:if>
                           </c:forEach>
                           <span class="star-prototype"> ${bestrate.avgscore}</span> <span>
                              &nbsp; 리뷰 ${bestrate.count}</span>
                        </div>
                     </div>
                  </div>
               </c:forEach>                      
            </div>
           </section>
         <!-- Best Item End -->
            
            	<!-- 페이징 -->
<script> 
var total_page = "<?=$total_page?>"; 
var now_page = "<?=$page?>"; 
var roll_page = now_page;

$(window).scroll(function() { 
	var chkBtm = parseInt($(document).height()) - parseInt($(window).height()); 

	if (chkBtm == $(window).scrollTop()) { 
		roll_page++; 

		if (roll_page <= total_page) { 
			callContent(roll_page, 'append'); 
		} 
	} else if ($(window).scrollTop() == 0) { 
		now_page--; 
		if (now_page > 0) { 
			callContent(now_page, 'prepend'); 
		} 
	} 
}); 

function callContent(a, b) { 
	var url = "<?=G5_BBS_URL?>/board.php?bo_table=<?=$bo_table?>&page=" + a; 
	var tbody = ""; 
	var thtml = ""; 
	$.ajax({ 
		type: "POST", 
		url: url, 
		dataType: "html", 
		success: function(html) { 
			tbody = html.split('<article>'); 
			thtml = tbody[1].split('</article>'); 
			setTimeout(function() { 
				if (b == 'append') { 
					 $("#fboardlist").append(thtml[0]); 
				} 
			}, 1000); 
		}, 
		error: function(xhr, status, error) { 
			alert(error); 
		} 
	}); 
}
</script>
<ul class="pagination justify-content-center" style="padding-bottom: 50px; padding-top: 20px;">
					<c:if test="${pageMaker.prev}">
						<li class="page-item"><a class="page-link" href="home${pageMaker.makeQuery(pageMaker.startPage - 1) }"> Previous</a></li>
					</c:if>
			
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
						<li class="page-item"><a class="page-link" href="home${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
			
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a class="page-link" href="home${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
					</c:if>
				</ul>
      </div>
      <!-- /.container -->

   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>

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

