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
<title>follow</title>

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
$(document).ready(function(){ 	 
   	var member_id = $("#member_id").val();   	 
   	var page_id = $("#page_id").val();   
   	
   	function checkLogin() {
		 if(member_id == undefined){
			 alert("로그인 후 이용 가능합니다.");
			 location.href = '/login/login';
		 }
	 }
    $(".btn").click(function () {
    	checkLogin();
    	console.log(member_id);
    	console.log(page_id);
 		
   	});

	
	
});
</script>

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
			<input type="hidden" id="member_id" value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>
	
	<!-- Profile Section -->
     <div class="profile-info container">
      	<div class="row col-lg-12">
      		<div class="profile-info_name">
      			<input type="hidden" id="page_id" value="yeanhee@naver.com" />yeanhee@naver.com
      		</div>
      	</div>
      	<div class="row col-lg-12">
      		<div class="profile-info_follow-state">
            	<a href="">팔로워<span>5</span></a>
            	<a href="">팔로잉<span>10</span></a>
	        </div>
	        
	        <!-- 본인 계정인 경우 수정 버튼 발생-->
	        <c:if test="${member_info.member_id eq 'yeanhee@naver.com'}">
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
			<c:if test="${member_info.member_id eq 'doriya0830@gmail.com'}">							
				<div class="col-lg-12">
	        		<button type="button" class="btn btn-info" onclick="">팔로우</button>
		        </div>				
			</c:if>
	     </div>
  	</div>
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

