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
	
	.qna{
		padding-top: 20px;
		padding-left: 20px;
		padding-bottom: 50px;
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
							<p>작성한 질문과답변</p>
						</div>				
					</div>
					</div>
					</form>
				</div>
				<!-- profile Content End-->
				
				<div class="col-lg-9 wrap--profile">	
					<!-- 질문과답변 게시글 조회 -->
					<div class="qna row">							
						<div class="col-12"> 
							<span style="font-size:20px;font-weight: bold;">질문과답변 (${qnaTotal})</span><hr />
						</div>	
						<div class="col-12"> 
							<c:forEach items="${qna}" var="qna">
								<form action="/commu/qnatag" method="get">
									<a href="/commu/qna/${qna.board_id}">
										<div style="font-weight: normal; font-size: 18px;">${qna.title}</div>
											<div>${qna.content}</div>									
												<span style="font-size: 15px; color: gray;"><fmt:formatDate value="${qna.pdate}" pattern="yyyy-MM-dd" /></span>
												<span style="font-size: 15px; color: gray;">조회수 ${qna.hit}</span>
									</a>
										<c:forEach var="hashtag" items="${qna.hashtag}">
											<c:if test="${not empty hashtag}">
												<span>&nbsp; ${hashtag}</span>
											</c:if>
										</c:forEach>
								</form>
								<hr />
							</c:forEach>
						 </div>
					</div>
					<div class="row">		
						<div class="col-12 text-center"> 	
							<c:if test="${qnaTotal > 10}">
					            <input type="hidden" class="qnaTotal" value="${qnaTotal}" />
						        <button id="morebtn" type="button" class="btn btn-disabled" onClick="btnClick()">더보기 
		            			<i class="fa fa-caret-down"aria-hidden="true"></i></button>
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
      var check = $('.qnaTotal').val() / 10;
     
      function btnClick(){
    	  pageNum += 1;
    	  
    	  if (pageNum >= check) {
              $(".btn").hide();
           }
    	  console.log(pageNum);
    	  console.log(check);
    	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/myPage/qna/" + nickname,
    	        data : {
    	        	pageNum: pageNum 
    	        },
    	        success :function(data){
    	          console.log(data);
    	          var qna = data.qna;
					 	      
    	          html = "<div class='col-12'>";	

    	           for(var i in qna){
    	        	  html += "<form action='/commu/qnatag' method='get'>"
	      	          	   + "<a href='/commu/qna/'" + qna[i].board_id + "'>"  
	      	          	   + "<div style='font-weight: normal; font-size: 18px;'>" + qna[i].title + "</div>"
	       	          	   + "<div>" + qna[i].content + "</div>"  	         	
	       	          	   + "<span style='font-size:15px; color:gray;'>" + getFormatDate(qna[i].pdate) + "</span>"
	       	         	   + "<span style='font-size:15px; color:gray;'> 조회수 " + qna[i].hit + "</span></a>";
	       	        
	       	         if(qna[j].hashtag != null){
	       	        	html += "<span>&nbsp;" + qna[j].hashtag + "</span>";    	  
	       	         }
	       	         
	       	         html += "</form><hr />";	           
    	           }//qna foreach end      	     	           
    	        	
    	           $(".qna").append(html); 
    	          
    	        }, 	        
    	        //success end
    	        error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end
    	    }); //ajax end	 
    	}; //click end	
      </script>
      
      <script>
		function getFormatDate(date) {
			
			var date = date.substr(0, 10);
			return date; 
		}	
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
														