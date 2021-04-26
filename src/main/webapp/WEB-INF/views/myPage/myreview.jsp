<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<title>프로필</title>

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
	.user-profile__container {
		border-radius: 4px;
		border: 1px solid #dadce0;
		text-align: center;
		min-height: 300px;
		margin: 20px auto;
	}

	.box {
		width: 130px;
		height: 130px;
		border-radius: 70%;
		overflow: hidden;
		margin: 10px auto;
	}
	
	.profile {
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.review{
		padding-top: 20px;
		padding-left: 20px;
		padding-bottom: 50px;
	}
	
	.review img{
		width:250px; 
		height:250px;
		border-radius: 8px;
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
	
	span.star-prototype, span.star-prototype>*, span.star, span.star>* {
	   height: 16px;
	   background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	   display: inline-block;
	}
	
	span.star-prototype>*, span.star>* {
	   background-position: 0 0;
	   max-width: 80px;
	}

	#navbars>li:nth-child(4) {
  		background-color: #e7ab3c;
	}
	
	.btn{
		margin-bottom: 100px;
	}

</style>

</head>
<body style="padding-top: 200px;">
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="min-height: 900px;">
    	<div class="row">
			<div class="col-lg-3 wrap--profile">	
				<form id="myPage" name="myPage" action="${pageContext.request.contextPath}/commu/thumbnail" method="post">
					<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
						<input type="hidden" id="member_id" value="<sec:authentication property="principal.member_id" var="follower_id" />">
					</sec:authorize>
						
				<div class="user-profile__container">
					<div class="user-profile__profile-image box" style="background: #BDBDBD;">
						<a href="/myPage/${member.nickname}">
						<img src="/resources/img/member/profile/${member.thumbnail}" class="profile" /></a>
					</div>

					<div class="profile-info">
						<div class="profile-info__name">
							<input type="hidden" id="member" value="${member.nickname}" />
							<a href="/myPage/${member.nickname}"><h3 style="margin-bottom:10px;">${member.nickname}</h3></a>
							<p>구매한 상품</p>
						</div>				
					</div>
					</div>
					</form>
				</div>
				<!-- profile Content End-->
				
				<div class="col-lg-9 wrap--profile">	
					<!-- 리뷰 게시글 조회 -->
					<div class="review row">							
						<div class="col-12"> 
							<span style="font-size:20px;font-weight:bold;">리뷰 (${reviewTotal})</span><hr />
						</div>										
						<c:forEach items="${review}" var="review">
							<div class="col-lg-4 col-md-4 col-sm-4 text-center" style="padding-bottom:20px;">	
								<c:forEach items="${boardlist}" var="boardlist">
									<c:if test="${boardlist.goodsVO.goods_id eq review.goodsVO.goods_id}">	
										<a href="/admin/goods_detail/${boardlist.board_id}">
										<img src="/resources/img/admin/goods/${boardlist.goodsVO.thumbnail}"/></a>
									</c:if>		
								</c:forEach>												
								<h6 style="padding-top:10px;">${review.goodsVO.goodsname}</h6>
										
								<c:forEach items="${goodsscore}" var="rate">
		                      		<c:if test="${rate.goodsVO.goods_id eq review.goodsVO.goods_id}">
				                       	<span class="star-prototype"> ${rate.avgscore}</span>
		                                &nbsp; <span>리뷰 ${rate.count}</span>
		                            </c:if>
	                            </c:forEach>
							</div>
						</c:forEach>
					</div>
					<div class="row">		
						<div class="col-12 text-center"> 	
							<c:if test="${reviewTotal > 9}">
					            <input type="hidden" class="reviewTotal" value="${reviewTotal}" />
						        <button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
						   </c:if>
						</div>	
					</div>
				</div>					
			</div>
		</div>

	<!-- 더보기 페이징 처리 -->
    <script>
 
      var nickname = $('#member').val();  
      var pageNum = 1;
      var check = $('.reviewTotal').val() / 9;
     
      function btnClick(){
    	  pageNum += 1;
    	  
    	  if (pageNum >= check) {
              $(".btn").hide();
           }
    	  console.log(pageNum);
    	  console.log(check);
    	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/myPage/review/" + nickname,
    	        data : {
    	        	pageNum: pageNum 
    	        },
    	        success :function(data){
    	          console.log(data);
    	          var review = data.review;
    	          var boardlist = data.boardlist;		 	      
    	          var rate = data.goodsscore;
    	         
    	          html = "";	

    	           for(var i in review){
    	        	  html += "<div class='col-lg-4 col-md-4 col-sm-4 text-center' style='padding-bottom:20px;'>";
    	        	  
    	        	  for(var j in boardlist){
    	        		  if(boardlist[j].goodsVO.goods_id == review[i].goodsVO.goods_id){
    	        			  html += "<a href='/admin/goods_detail/" + boardlist[j].board_id + "'>"
    	        			  	   + "<img src='/resources/img/admin/goods/" + boardlist[j].goodsVO.thumbnail + "' /></a>";
    	        		  }
    	        	  }//boardlist foreach end
    	        	  
    	        	  html += "<h6 style='padding-top:10px;'>" + review[i].goodsVO.goodsname + "</h6>";
    	        	  
	       	          for(var k in rate){	   
	      	          	   if(review[i].goodsVO.goods_id == rate[k].goodsVO.goods_id){
	      	          			html += "<span class='star-prototype'> <span class='star' style='width:"+(rate[k].avgscore*16)+"px'> </span></span>" 
	      	          			     + "&nbsp; <span>리뷰" + rate[k].count + "</span>";
	      	          	   } //if end 
	       	          } //rate foreach end 	           												
	     
	       	     	  html += "</div>"; 
    	        	}//review foreach end      	     	           
    	        	
    	           $(".review").append(html); 
    	          
    	        }, 	        
    	        //success end
    	        error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end
    	    }); //ajax end	 
    	}; //click end	
      </script>

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
														