<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>프로필</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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

<Style>
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

</Style>

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
							<h3 style="margin-bottom:10px;">${member.nickname}</h3>
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
								<a href="/admin/goods_detail/${review.board_id}"> 
								<img src="/resources/img/admin/goods/${review.goodsVO.thumbnail}"/></a>														
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
    	  
    	  if (pageNum > check) {
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
    	          var rate = data.goodsscore;
					 	      
    	          html = "";	

    	           for(var i in review){
    	        	  html += "<div class='col-lg-4 col-md-4 col-sm-4 wrap--profile text-center'>"
	      	          	   + "<a href='/admin/goods_detail/'" + review[i].board_id + "'><img src='/resources/img/admin/goods/"+review[i].goodsVO.thumbnail + "' /></a>"
	       	          	   + "<h6 style='padding-top:10px;'>" + review[i].goodsVO.goodsname + "</h6>";
	       	          for(var j in rate){	   
	      	          	   if(review[i].goodsVO.goods_id == rate[j].goodsVO.goods_id){
	      	          			html += "<span class='star-prototype'> <span class='star' style='width:"+(rate[j].avgscore*16)+"px'> </span></span>" 
	      	          			     + "&nbsp; <span>리뷰" + rate[j].count + "</span>";
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
</body>

<!-- Js Plugins -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
</html>												
														