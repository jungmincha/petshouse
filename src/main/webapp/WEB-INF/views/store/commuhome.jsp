<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
    
    .instagram-photo, .Popularity, .category, .knowhow{
    	padding-bottom: 50px;
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
		padding-bottom: 200px;
	}
	
	.tag-list{
		padding-top: 15px;
	}
	
	.knowhow_hit{
		position: absolute;
	    bottom: 15px;
	    right: 30px;
	    font-size: 15px;
	    color: #fff;
	    text-shadow: 0 0 4px rgb(0 0 0 / 50%);
	}
		
	.sns_hit{
		position: absolute;
	    bottom: 80px;
	    right: 40px;
	    font-size: 14px;
	    color: #fff;
	    text-shadow: 0 0 4px rgb(0 0 0 / 50%);
	}
	
	a:link {
		text-decoration: none;
		color: #333333;
	}
	
	a:visited {
		text-decoration: none;
		color: #333333;
	}
	
	a:active {
		text-decoration: none;
		color: #333333;
	}
	
	a:hover {
		text-decoration: none;
	}
	
	#navbars>li:nth-child(2) {
  		background-color: #e7ab3c;
	}

</style>
</head>

<body style="padding-top:200px">
   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
    <!-- login check -->
    <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
			<input type="hidden" id="member_id" value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>
   
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
        <div class="insta-item set-bg" data-setbg="/resources/img/commuhome/reptile.jpg">
            <div class="inside-text">
                <i class="ti-instagram"></i>
                <h5><a href="/search?keyword=파충류">Reptile</a></h5>
            </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/commuhome/bird.jpg">
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
        <div class="Popularity container">
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
                           <a href="/commu/sns/4598">
                           <img src="/resources/img/commuhome/sns.jpg" alt=""></a>
                        </div>     
                     </div>
                 </div>
              </div>
          </div>         
    <!-- Popularity Section End -->

     <!-- Category Section Begin -->
      <div class="Category container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section-title">
                  <h2>Category</h2>
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
  		  <div class="knowhow container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2><a href="/commu/tips">인기 노하우</a></h2>
                    </div>
                </div>
            </div>
            <div class="row">
                 <div class="product-slider owl-carousel">
                     <c:forEach items="${knowhow}" var="knowhow">                   
                     	<div class="product-item">
                        	<div class="pi-pic">
                        		<a href="/commu/tips/${knowhow.boardVO.board_id}">
                                <img src="/resources/img/tips/${knowhow.imgname}" style="border-radius:5px; height:200px;" alt=""></a>
                                <span class="knowhow_hit">조회수 ${knowhow.boardVO.hit}</span>
                                 <div class="sale">BEST ${knowhow.boardVO.rnum}</div>
                            </div>
                        <div class="latest-text">
                        	<div class="tag-list">                    		                     
                                  <a href="/commu/tips/${knowhow.boardVO.board_id}"><span style="font-size:15px; font-weight:bold; margin-top:9px;">${knowhow.boardVO.title}</span></a>                                
                                  <p style="font-size: 14px;">${knowhow.boardVO.memberVO.nickname}</p>                                       
                            </div>                
                        </div>
                        </div>  
                      </c:forEach>
                 </div>
               </div>
             </div>  
         <!-- Knowhow Section End -->
         
         <!-- SNS Section Begin -->
  		  <div class="sns container">
           	 <div class="row">
	       		 <div class="col-lg-12" style="padding-bottom:20px;"> 
					<div class="section-title">
				    	<h2><a href="/commu/sns">인기 SNS</a></h2>
					</div>		
				</div> 
			 </div>  
             <div class="row">   
				<c:forEach items="${sns}" var="sns">
				<div class="col-12 col-lg-3 col-md-4 col-sm-6 text-center">
					<div class="user-Info row" style="margin: 0px auto 0px 5px">
						<div class="profile_box">
							<a href="/myPage/${sns.boardVO.memberVO.nickname}">
							<img src="/resources/img/member/profile/${sns.boardVO.memberVO.thumbnail}" class="profile">
						</div>
						<p style="padding-top:10px;">${sns.boardVO.memberVO.nickname}</p></a>	
						<a href="/myPage/${sns.boardVO.memberVO.nickname}" style="padding:10px 0px 0px 30px;" onclick="checkLogin();">팔로우</a>
					</div>
					<div>
						<a href="/commu/sns/${sns.boardVO.board_id}"> 
						<img src="/resources/img/member/sns/${sns.imgname}" style="border-radius:5px; width:250px; height:230px; margin-bottom:0px;"/>
						<span class="sns_hit">조회수 ${sns.boardVO.hit}</span></a>	
					</div>
					<div class="card-body" style="font-size:17px;">		
						<a href="/commu/sns/${sns.boardVO.board_id}"><i class="far fa-heart"></i>&nbsp;&nbsp;${sns.boardVO.plike}</a>
						<c:forEach items="${comment}" var="comment">  
							<c:if test="${comment.pgroup eq sns.boardVO.board_id}">
								<a href="/commu/sns/${sns.boardVO.board_id}">
								<i class="far fa-comment" style="margin-left:15px;"></i>&nbsp;&nbsp;${comment.count}</a>								
							</c:if>
						</c:forEach>
					</div>
				</div>
				</c:forEach>
			 </div>
            </div>
   		<!-- SNS Section End -->
   		
   	<script>
   		//로그인 여부 체크
   		var member_id = $("#member_id").val();
   		
   		function checkLogin() {
   			console.log(member_id);
   			if(member_id == undefined){
   				event.preventDefault();
   				alert("로그인 후 이용 가능합니다.");
   				location.href = '/login/login';
   			}
   		}
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