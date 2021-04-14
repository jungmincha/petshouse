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
<title>followview</title>

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

<style>
	.profile-info{
		padding-top: 200px;
	}
	.top {
	   background-color: #e7ab3c;
	   border-radius: 10px;
	   cursor: pointer; 
	   position: fixed; 
	   right: 5px; 
	   font-size: 15px; 
	   bottom: 500px;
	   padding:10px;
	}
</style>
</head>

<body>
   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   `
    <!-- Login Check -->
    <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
			<input type="hidden" id="follower" value="<sec:authentication property="principal.member_id" var="follower_id" />">		
	</sec:authorize>

	<!-- Profile Section -->
     <div class="profile-info container">
      	<div class="row col-lg-12">
      		<div class="profile-info_name">
      			<input type="hidden" id="member" value="doriya0830@gmail.com" />doriya0830@gmail.com
      		</div>
      	</div>
      	<div class="row col-lg-12">
      		<div class="profile-info_follow-state"> 		
            	<a href="/store/myPage/followerlist/${member_info.member_id}" class="follower">팔로워<span>${follower}</span></a>
            	<a href="/store/myPage/followinglist/${member_info.member_id}">팔로잉<span>${following}</span></a>
	        </div>

	        <!-- 본인 계정인 경우 수정 버튼 발생-->
	        <c:if test="${member_info.member_id eq follower_id}">
				<ul class="navbar-nav">
					<li class="nav-item dropdown">
					   <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> 내정보 </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/main/logout_processing">로그아웃</a>
							<a class="dropdown-item" href="#">계정삭제</a> 
							<a class="dropdown-item" href="/main/user/secret_user">계정공개범위</a>
						</div>
					</li>
				</ul>
			</c:if>
			
			<!-- 본인 계정이 아닌 경우 팔로우 버튼 발생-->
			<c:if test="${member_info.member_id ne follower_id}">	
				<c:if test="${followcheck == 0}">							
					<div class="col-lg-12">
		        		<button type="button" class="follow btn-info" onclick="follow();">팔로우</button>
			        </div>	   
		        </c:if>		
		        <c:if test="${followcheck != 0}">							
					<div class="col-lg-12">
		        		<button type="button" class="unfollow btn-info" onclick="unfollow();">언팔로우</button>
			        </div>	   
		        </c:if>		
			</c:if>
	     </div>
  	</div>
  	
  	<script>
	   	var member_id = $('#member').val();  
	   	console.log(member_id);
	  	
	   	//팔로우 요청
	    function follow(){  		    	
	    	$.ajax({
	    		type :"POST",
		        url :"/store/myPage/follow/" + member_id,     
		        success :function(data){
		           console.log(data);	
		           $('.follower').empty();
		           $('.follower').append('팔로워<span>' + data.follower + '</span></a>');            
		           $('.follow').remove();	          
		           $('.profile-info').append('<button type="button" class="unfollow btn-info" onclick="unfollow();">언팔로우</button>');               
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
		        url :"/store/myPage/unfollow/" + member_id,
		        success :function(data){
		        	console.log(data);	
		        	$('.follower').empty();
			        $('.follower').append('팔로워<span>' + data.follower + '</span></a>');     
		            $('.unfollow').remove();		           
		            $('.profile-info').append('<button type="button" class="follow btn-info" onclick="follow();">팔로우</button>'); 
		        },
		        error: function(e){
			    	console.log(e);
			    }
	   		});//ajax end
		};//unfollow end
	</script>
  	
   <!-- top scroll -->
   <div class="top" onclick="window.scrollTo(0,0);">top</div>	
	
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

