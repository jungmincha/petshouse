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
	  	var follower_id = $("#follower").val();
	   	 
	   	//로그인 여부 체크   	
		$('#btn').click(function(e){
			console.log(follower_id);
			
			if(follower_id == undefined){
				e.preventDefault();				
				alert("로그인 후 팔로우 가능합니다.");
				location.href = '/login/login';
			}
			
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
			<input type="hidden" id="follower" value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>
	
	 <!-- Profile Section -->
     <div class="profile-info container">
      	<div class="row col-lg-12">
      	<form action="/store/myPage/followview/${member_info.member_id}" method="post">  	
      		<input type="hidden" name="memberVO.member_id" value="${member_info.member_id}">
	        <input type="submit" id="btn" value="팔로우">
	    </form>
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
