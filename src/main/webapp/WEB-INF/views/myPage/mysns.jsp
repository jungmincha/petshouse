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

<Style>
	.user-profile__container {
		border-radius: 4px;
		border: 1px solid #dadce0;
		text-align: center;
		min-height: 400px;
		margin: 20px auto;
	}
	
	.sns_container{
		border-radius: 4px;
		border: 1px solid #dadce0;
		text-align: center;
		min-height: 200px;	
	}
	
	.sns_container div{
		height:200px; 
		line-height:200px;
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
	
	.sns{
		padding-top: 20px;
		padding-left: 20px;
		padding-bottom: 50px;
	}
	
	.sns img{
		width:250px; 
		height:250px;
		border-radius: 8px;
	}
	
	.sns_hit{
		position: absolute;
	    bottom: 65px;
	    right: 35px;
	    font-size: 15px;
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
						<img src="/resources/img/member/profile/${member.thumbnail}" class="profile" />
					</div>

					<div class="profile-info">
						<div class="profile-info__name">
							<input type="hidden" id="member" value="${member.nickname}" />
							<h3>${member.nickname}</h3>
						</div>
						<div class="follow-state">
							<a href="#followerModal" class="follower" data-toggle="modal">팔로워<span class="highlight">${follower}&nbsp;&nbsp;</span> </a>
				          	<a href="#followingModal" data-toggle="modal">팔로잉<span class="highlight">${following}</span></a>
						</div>
				
						<!-- follower list Modal start -->
					    <div class="modal" id="followerModal">
						  <div class="modal-dialog">
				  	    	  <div class="modal-content">			      
									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">팔로워 회원 목록</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
										        
									<!-- Modal body -->
									<div class="followerlist modal-body">
										<c:forEach items="${followerlist}" var="followerlist">
											<p>${followerlist.follower_id}</p>          	
										</c:forEach>
									</div>
										        
									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
									</div>            
								</div>
							</div>
						</div>
						<!-- follower list Modal end -->
								   
						<!-- following list Modal start -->
						<div class="modal" id="followingModal">
							<div class="modal-dialog">
								<div class="modal-content">
								      
									<!-- Modal Header -->
									<div class="modal-header">
								       <h4 class="modal-title">팔로잉 회원 목록</h4>
								       <button type="button" class="close" data-dismiss="modal">&times;</button>
								    </div>
								        
								    <!-- Modal body -->
								    <div class="modal-body">
								        <c:forEach items="${followinglist}" var="followinglist">
								          	<p>${followinglist.nickname}</p>          	
								        </c:forEach>
								    </div>
								        
								    <!-- Modal footer -->
								    <div class="modal-footer">
								        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
								    </div>
								 </div>
							</div>
						</div>
						<!-- following list Modal end -->
							 
						<!-- 본인 계정인 경우 수정 버튼 발생, principal로 확인-->	   	
						<c:if test="${member.member_id eq follower_id}">
							<div class="profile-info__actions" style = "padding-top : 50px;">
								<a class="btn btn-warning" href="/myPage/view" style="color:black">설정</a>
							</div>
						</c:if>
								
						<!-- 본인 계정이 아닌 경우 팔로우 버튼 발생, principal로 확인-->	   	
						<c:if test="${member.member_id ne follower_id}">	
							<c:if test="${followcheck == 0}">							
								<div class="profile-info__actions" style = "padding-top : 50px;">
					        		<button type="button" class="follow btn-warning" onclick="follow();">팔로우</button>
						        </div>	   
					        </c:if>		
				    	    <c:if test="${followcheck != 0}">							
								<div class="profile-info__actions" style = "padding-top : 50px;">
					     			<button type="button" class="unfollow btn-warning" onclick="unfollow();">언팔로우</button>
								</div>	   
							</c:if>		
						</c:if>					
					</div>
					</div>
					</form>
				</div>
				<!-- profile Content End-->
				
				<div class="col-lg-9 wrap--profile">	
					<!-- SNS 게시글 조회 -->
					<div class="sns row">							
						<div class="col-12"> 
							<span style="font-size:20px;font-weight: bold;">SNS (${snsCount})</span><hr />					
						</div>	
						
					</div>
				</div>
			</div>
		 
		</div>
		
		
	<!-- 팔로우 기능 -->
	<script>
	   	var nickname = $('#member').val();  
	   	console.log(nickname);
	  	
	   	//팔로우 요청
	    function follow(){  	         
	    	$.ajax({
	    		type :"POST",
		        url :"/myPage/follow/" + nickname,     
		        success :function(data){
		           console.log(data);	
		           var followerlist = data.followerlist;
		          
		           html = "";
		           for(var i in followerlist){
		        	   html += "<p>" + followerlist[i].follower_id + "</p>";
		           }
		           
		           $('.follower').empty();
		           $('.follower').append('팔로워<span>' + data.follower + '</span></a>');                 
		           $('.followerlist').empty();
		           $('.followerlist').append(html);
		           $('.follow').remove();	          
		           $('.profile-info').append('<button type="button" class="unfollow btn-warning" onclick="unfollow();">언팔로우</button>');               
		        },  
		        error: function(e){
			    	console.log(e);
			    }
	   		});//ajax end
		};//follow end
	    
		//팔로우 취소
		function unfollow(){  
	    	$.ajax({
	    		type :"POST",
		        url :"/myPage/unfollow/" + nickname,
		        success :function(data){
		        	console.log(data);	
		        	var followerlist = data.followerlist;
			          
		        	html = "";
			        for(var i in followerlist){
			        	html += "<p>" + followerlist[i].follower_id + "</p>";
			        }    
			           
		        	$('.follower').empty();
			        $('.follower').append('팔로워<span>' + data.follower + '</span></a>');  
			        $('.followerlist').empty();
			        $('.followerlist').append(html);
		            $('.unfollow').remove();		           
		            $('.profile-info').append('<button type="button" class="follow btn-warning" onclick="follow();">팔로우</button>'); 
		        },
		        error: function(e){
			    	console.log(e);
			    }
	   		});//ajax end
		};//unfollow end
	</script>
	
	
	<!-- 더보기 페이징 처리 -->
    <script>
   	$(document).ready(function() {
		getSnslist();
	})
	
	  var nickname = $('#member').val(); 
      var pageNum = 0;
      var check = $('.snsTotal').val() / 9;
     
      function getSnslist(){
    	  pageNum += 1;
    	  
    	  if (pageNum > check) {
              $(".btn").hide();
           }
    	  
    	  console.log(pageNum);
    	  console.log(check);
    	  		  
    	  	$.ajax({
    	        type :"GET",
    	        url :"/myPage/moresns/" + nickname,
    	        data : {
    	        	pageNum: pageNum 
    	        },
    	        success :function(data){
    	          console.log(data);
    	          var sns = data.sns;
    	          var snsTotal = data.snsTotal;
					 	      
    	          html = "";
    	           for(var i in sns){
    	        	  html += "<div class='col-lg-4 col-md-4 col-sm-4 wrap--profile text-center'>"
	      	          	   + "<a href='/commu/sns/'" + sns[i].boardVO.board_id + "'><img src='/resources/img/member/sns/"+sns[i].imgname + "' /></a>"
	       	          	   + "<span class='sns_hit'>조회수" + sns[i].boardVO.hit + "</span>"       	         	
	       	         	   + "<h6 style='margin::10px 0px 30px 0px;'>" + sns[i].boardVO.content + "</h6>";       	          	       	          	
    	        	}//sns foreach end      	   
    	           
    	           if(snsCount > 9){
		        		html += "<div class='col-lg-12 text-center'>"  
		        			 += "<input type='hidden' class='snsTotal' value='" + snsTotal + "'/>"
		            		 + "<button type='button' class='btn btn-warning' onClick='btnClick()'>더보기</button> </div>";			      
    	           }
    	        	
    	           $(".sns").append(html); 
    	          
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
														