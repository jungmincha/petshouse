<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>커뮤니티</title>

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

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
   });
</script>

<style>
    .instagram-photo{
    	padding-top: 30px;
    }
    
    .blog-quote, .knowhow, .sns, .category{
    	padding-top: 60px;
    }
    
    .single-latest-blog img{
    	width: 280px;
    	height: 280px;
	}

	.profile_box {
		width: 40px;
		height: 40px;
		border-radius: 70%;
		overflow: hidden;
		margin: 5px;
	}
	
	.profile {
		width: 40px;
		height: 40px;
		object-fit: cover;
	}
	
	.sns{
		padding-bottom: 60px;
	}
	
	.tag-item{
		padding-top: 20px;
	}

</style>
</head>

<body style="padding-top:200px">
   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
   <!-- Instagram Section Begin -->
   <div class="container">
   	 <div class="instagram-photo col-lg-12">
	       	<div class="insta-item set-bg" data-setbg="/resources/img/commuhome/cat.jpg">
	            <div class="inside-text">
	                <i class="ti-instagram"></i>
	                <h5><a href="/search?keyword=고양이">Cat</a></h5>
	            </div>
	        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/commuhome/dog.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="/search?keyword=강아지">Dog</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/commuhome/reptile2.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="/search?keyword=파충류">Reptile</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/commuhome/bird1.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="/search?keyword=새">Bird</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/commuhome/fish.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="/search?keyword=물고기">Fish</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/commuhome/rabbit.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="/search?keyword=기타">Other</a></h5>
            </div>
        </div>
    </div>
   </div>
   <!-- Instagram Section End -->
        
   <!-- Popularity Section Begin -->
      <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                            <h2>Today's Popularity</h2>
                            <p>SNS
                            <script>
                              	//당일 날짜 출력
	                            let today = new Date();   
								
								let year = today.getFullYear(); // 년
								let month = today.getMonth() + 1;  // 월
								let date = today.getDate();  // 일
								let day = today.getDay();  // 요일
								
								document.write('<span>')
								document.write(year + ' . ' + month + ' . ' + date)
								document.write('</span></p>')
							</script>
                        </div>
                        <div class="blog-large-pic">
                           <a href="/store/commu/home">
                           <img src="/resources/img/commuhome/sns.jpg" alt=""></a>
                        </div>     
                     </div>
                 </div>
              </div>
          </div> 
     </section>             
    <!-- Popularity Section End -->

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
             <a href="/store/commu/category/101?categoryName=고양이 / 사료">    
                    <img src="/resources/img/category/cat.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="/store/commu/category/201?categoryName=강아지 / 사료">
                    <img src="/resources/img/category/dog.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="/store/commu/category/301?categoryName=파충류 / 사료">
                    <img src="/resources/img/category/reptile.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="/store/commu/category/501?categoryName=조류 / 모이">
                    <img src="/resources/img/category/bird.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="/store/commu/category/401?categoryName=어류 / 어항">
                     <img src="/resources/img/category/fish.jpg"></a>
            </div>

            <div class="col-sm-2">
                  <a href="/store/commu/category/601?categoryName=기타 / 사료">
                     <img src="/resources/img/category/other.jpg"></a>
            </div>
       	</div>
       </div>
      <!-- Category Section End -->

      <!-- Knowhow Section Begin -->
  		<section class="knowhow">	
  		  <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>인기 노하우</h2>
                    </div>
                </div>
            </div>
            <div class="row text-center">
                 <div class="product-slider owl-carousel">
                     <c:forEach items="${knowhow}" var="knowhow">                   
                     	<div class="product-item">
                        	<div class="pi-pic">
                                <img src="/resources/img/latest-1.jpg" alt="">
                                 <div class="sale">BEST ${knowhow.rnum}</div>
                            </div>
                        <div class="latest-text">
                        	<div class="tag-list">
                            	<div class="tag-item">
                                    <i class="fa fa-calendar-o"></i> &nbsp;<fmt:formatDate value="${knowhow.pdate}" pattern="yy.MM.dd" />
                                     &nbsp;&nbsp;조회수 ${knowhow.hit}                        
                                </div>                     
                            </div>
	                        <a href="#"><p style="padding-top:10px;"><span style="font-size:20px;">${knowhow.title}</span></p></a>
	                        <!-- <p>${knowhow.content}</p> -->
                        </div>
                        </div>  
                      </c:forEach>
                 </div>
               </div>
             </div>
           </section>    
         <!-- Knowhow Section End -->
         
         <!-- SNS Section Begin -->
  		<section class="sns">	
  		  <div class="container">
           	 <div class="row">
	       		 <div class="sns col-lg-12"> 
					<div class="section-title">
				    	<h2>인기 SNS</h2>
					</div>		
				</div> 
			 </div>  
             <div class="row">   
				<c:forEach items="${sns}" var="sns">
				<div class="col-12 col-lg-3 col-md-4 col-sm-6">
					<div class="user-Info row" style="margin: 20px auto 0px 5px">
						<div class="profile_box">
							<img src="/resources/img/member/profile/${sns.boardVO.memberVO.thumbnail}" class="profile">		
						</div>
						<p>${sns.boardVO.memberVO.nickname}</p>
					</div>
					<div>
						<a href="/commu/sns/${sns.boardVO.board_id}"> 
						 <img src="/resources/img/member/sns/${sns.imgname}" style="width:250px; height:250px;"/></a>		
					</div>
				</div>
				</c:forEach>
			 </div>
            </div>
		</section>
   		<!-- SNS Section End -->

   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>

   <!-- Bootstrap core JavaScript -->
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