<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SNS</title>

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
<link rel="stylesheet" href="/resources/css/select-style.css"
	type="text/css">
<link rel="stylesheet" href="/resources/js/select-index.js"
	type="text/css">

<style>
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

.i{
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.4);
	 border-radius: 10px;
	
}
.count{
	position: absolute;
    bottom: 80px;
    right: 30px;
    font-size: 13px;
    color: #fff;
    text-shadow: 0 0 4px rgb(0 0 0 / 50%);
}

.count2{
	position: absolute;
    bottom: 10px;
    right: 10px;
    font-size: 13px;
    color: #fff;
    text-shadow: 0 0 4px rgb(0 0 0 / 50%);


}


</style>
<script>
	//로그인 체크
	$(document).ready(function() {
		var member_id = $("#member_id").val();

		function checkLogin() {
			if (member_id == undefined) {
				alert("로그인 후 글을 작성해주세요.");
				location.href = '/login/login';
			}
		}
		$('#login').click(function() {
			checkLogin();
		});
		
	});
</script>

</head>
<body style="padding-top: 170px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Category Section Begin -->
	<div class="container">
		<h2>SNS</h2>
		<a class="btn btn-outline-secondary col-sm-2 float-right"  id = "login" onclick="location.href='${pageContext.request.contextPath}sns/write_view'">게시글등록</a>


		<div class="row ">
			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/cat.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/dog.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/reptile.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/bird.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/fish.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/other.jpg"></a>
			</div>
		</div>

		<!-- Category Section End -->


		<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="member_id"
			value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>
	
 
			<div id="snslist" class = "row text-center"> 
			<c:forEach items="${list}" var="sns">

				<div class=" col-12 col-md-4 col-lg-3" >

					<div class="user-Info row" style="margin: 20px auto 0px 5px">
						<div class="profile_box ">
							
							<img
								src="/resources/img/member/profile/${sns.boardVO.memberVO.thumbnail}"
								name="profile" alt="" class="profile" />
						</div>
						<div style="padding:7px"> ${sns.boardVO.memberVO.nickname } </div>
					<a href="/myPage/${sns.boardVO.memberVO.nickname}" style="padding:7px;"> 팔로우</a>
						 
		
					</div>
					 
					<div class="shot">
						<a href="/commu/sns/${sns.boardVO.board_id}"> <img
							src="/resources/img/member/sns/${sns.imgname }" alt=""
							style="height: 300px;" class="card-img-top i" /><span class="count">조회수 ${sns.boardVO.hit}</span></a></div>
						<div class="card-body">
							 
							좋아요${sns.boardVO.plike}//댓글수
						</div>
					 
				</div>
			</c:forEach>
		</div>
		<div class="col-lg-12 text-center">
			<button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
		</div>
	</div>

	<!-- 더보기 페이징 처리 -->
	<script type="text/javascript">
      var pageNum = 1;
     
      function btnClick(){

    	  pageNum += 1;
    	  console.log(pageNum);
    	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/commu/smorelist",
    	        data : {
    	        	pageNum: pageNum 
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var sns = data.sns;
					
    	          html = " "
    	           for(var i in sns){
    	        	  html +="<div class='card-feed  col-12 col-md-4 col-lg-3'>"
    	        	 	 +"<div class='user-Info row' style='margin: 20px auto 0px 5px'>"
    	        	 	 +"<div class='profile_box'>"
    	        	 	 +"<img src='/resources/img/member/profile/"+sns[i].boardVO.memberVO.thumbnail+"'name='profile' alt='' class='profile' /></div>"
    	        	 	 +"<p style='padding:5px;'>"+sns[i].boardVO.memberVO.nickname +"</p>"
    	        	 	 +"<a href='/myPage/" + sns[i].boardVO.memberVO.nickname + "' style='padding:6px'>팔로우</a>"
    	        	 	 +"</div>"
    	        	 	 +"<div class='card'>"
    	        		+"<a href='/commu/sns/"+sns[i].boardVO.board_id+"'> "
    	        		+"<img src='/resources/img/member/sns/"+sns[i].imgname +"' alt='' style='height: 300px;' class='card-img-top i' />"
    	        		
    	        		+"<span class='count2'>조회수 "+ sns[i].boardVO.hit + "</span></a></div>"
    	        		+"<div class='card-body'>좋아요//댓글수"
    	        		 
    	        	  	+"</div></div></div>"
    	           }
    	        
    	           
    	            $("#snslist").append(html); 
    	          
    	        }, 	        
    	        //success end
    	        error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end
    	    }); //ajax end	 
    	}; //click end	
	</script>

	<!-- Footer -->
	<div style="margin-top: 100px">
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

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
