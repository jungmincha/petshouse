<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

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

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script>

$(function() {

    $("#sel").change(function() {
    	
    	location.href="/map/home"
    	
    });

});

</script>



</head>
<body style="padding-top:180px">

  <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
 	<div class="container" style="width: 800px;">

                 <select  id="sel" style="border:none; font-size:22px;">
 		<option value='${location}' selected>${location}</option>
   		 <option value="relocaion" >위치 다시 설정하기</option>
    
			</select>
                
               <br>
                 <br>
               
       
        <h4>${nickname}</h4> 
            <br>
            
            
<form action="/map/write" method="post" enctype="multipart/form-data">
 <input id="location" type="hidden" name="location" value="${location}" /> 
<%--   <input id="nicknamen" type="hidden" name="nickname" value="${nickname}" />  --%>
<%--  <input id="member_id" type="hidden" name="member_id" value="${member_id}" />  --%>
<input type="hidden" name="member_id" value="<sec:authentication property="principal.member_id"/>">
								 
    
	<div class="row">
				<select name="hashtag" id="hashtag" class=" form-control col-2" 
					style="height: 38px; margin-left: 15px; margin-right: 10px;">
				<option value="우리동네질문">우리동네질문</option>
				<option value="분실/실종센터">분실/실종센터</option>
				<option value="일상">일상</option>
				<option value="맛집">맛집</option>
				<option value="취미생활">취미생활</option>
				<option value="여행">여행</option>
				<option value="기타">기타</option>
				</select> 
				
				<input type="text" class="form-control" name="title"
					placeholder="제목" style="margin-bottom: 20px; width: 628px;">
			</div>




<input placeholder="닉네임" class="form-control" id="nickname" 
type="text" name="nickname" style="margin-bottom: 20px; width: 770px; background-color:white;" value="${nickname}" disabled>


<textarea class="form-control col" name="content" placeholder="내용"
				style="width: 770px; height: 400px; margin-bottom: 20px; resize: none;"></textarea>
<div class="form-group row">
<input type="file" name="file" multiple="multiple"/>
   
</div>

<input style="margin-bottom: 20px; width: 300px;"  placeholder="전송" class="form-control" type = "submit" value = "작성 완료" >

<a style="margin-bottom: 20px; width: 300px; text-align: center;"  class="form-control" href = "/map/board?location=${location}&nickname=${nickname}&member_id=${member_id}">목록으로</a>


						
						
						
		     
</form>      
         </div>           
               
   
  
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>  


 <!-- Js Plugins -->
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