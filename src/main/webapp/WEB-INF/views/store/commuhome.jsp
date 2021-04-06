<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>storehome</title>

<!-- Link Swiper's CSS -->
 <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

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


 <!-- Swiper JS -->
 <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script>
   $(document).ready(function() {
      $.fn.generateStars = function() {
         return this.each(function(i, e) {
            $(e).html($('<span/>').width($(e).text() * 16));
         });
      };

      // 숫자 평점을 별로 변환하도록 호출하는 함수
      $('.star-prototype').generateStars();

      
        var swiper = new Swiper('.swiper-container', {
          slidesPerView: 1,
          spaceBetween: 30,
          loop: true,
          pagination: {
            el: '.swiper-pagination',
            clickable: true,
          },
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
        });
     
   });
</script>

<style>
  html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 100%;
      height: 100%;
      margin-left: auto;
      margin-right: auto;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
    .instagram-photo{
    	padding-top: 15px;
    }
    
    .blog-quote, .knowhow, .sns{
    	padding-top: 60px;
    }
    
   
</style>
</head>

<body style="padding-top:180px">
   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
     <!-- Instagram Section Begin -->
      <div class="container">
    <div class="instagram-photo">
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-1.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="#">colorlib_Collection</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-2.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="#">colorlib_Collection</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-3.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="#">colorlib_Collection</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-4.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="#">colorlib_Collection</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-5.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="#">colorlib_Collection</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-6.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="#">colorlib_Collection</a></h5>
            </div>
        </div>
    </div>
    </div>
    <!-- Instagram Section End -->
    
    
    
      <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg--9">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                            <h2>Today's Popularity</h2>
                            <p>SNS
                            <script>
	                            let today = new Date();   
								
								let year = today.getFullYear(); // 년도
								let month = today.getMonth() + 1;  // 월
								let date = today.getDate();  // 날짜
								let day = today.getDay();  // 요일
								
								document.write('<span>')
								document.write(year + ' . ' + month + ' . ' + date)
								document.write('</span></p>')
							</script>
                        </div>
                        <div class="blog-large-pic col-lg-9">
                            <img src="/resources/img/blog/blog-detail.jpg" alt="">
                        </div>

                        
        
                    </div>
                </div>
            </div>
 
    <!-- Blog Details Section End -->

       <!-- Latest Blog Section Begin -->
  		<section class="knowhow">
            <div class="row">
                <div class="col-lg-3">
                    <div class="section-title">
                        <h2>오늘의 노하우</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            
               <div class="product-slider owl-carousel">
                     <c:forEach items="${knowhow}" var="knowhow">                   
                           <div class="product-item">
                              <div class="pi-pic">
                                <img src="/resources/img/latest-1.jpg" alt="">
                                 <div class="sale">BEST</div>
                              </div>
                               <div class="latest-text">
                            <div class="tag-list">
                                <div class="tag-item">
                                    <i class="fa fa-calendar-o"></i> &nbsp;<fmt:formatDate value="${knowhow.pdate}" pattern="yyyy.MM.dd" />
                                   &nbsp;조회수 ${knowhow.hit}                        
                                </div>                     
                            </div>
	                            <a href="#">
	                                <h5>${knowhow.title}</h5>
	                            </a>
	                            <p>${knowhow.content}</p>
                        	</div>
                           </div>  
                     </c:forEach>
                  </div>
      
      
        <div class="sns col-lg-3"> 
			                    <div class="section-title">
			                        <h2>오늘의 인기글</h2>
			                    </div>
			                    
			                  </div>   
			      <div class="sns col-lg-9"> </div>
            <c:forEach items="${knowhow}" var="knowhow">
                <div class="col-lg-3 col-md-6">
                    <div class="single-latest-blog">
                        <img src="/resources/img/latest-1.jpg" alt="">
                        <div class="latest-text">
                            <div class="tag-list">
                                <div class="tag-item">
                                    <i class="fa fa-calendar-o"></i><fmt:formatDate value="${knowhow.pdate}" pattern="yyyy.MM.dd" />
                                   &nbsp;조회수 ${knowhow.hit}                        
                                </div>
                            
                            </div>
                            <a href="#">
                                <h5>${knowhow.title}</h5>
                            </a>
                            <p>${knowhow.content}</p>
                        </div>
                    </div>
                </div>
 			</c:forEach>

            </div>
		</section>
        </div>
    </section>
    <!-- Latest Blog Section End -->

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
 
 