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
<title>펫츠하우스</title>

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
</style>
</head>
<body style="padding-top: 170px">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Category Section Begin -->
	<div class="container">
		<h2>SNS</h2>
		<a class="btn btn-warning float-right" href="/commu/sns/write_view">게시글등록</a>


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


 
			<div id="snslist" class = row text-center"> 
			<c:forEach items="${list}" var="sns">

				<div class="card-feed  col-12 col-md-4 col-lg-3">

					<div class="user-Info row" style="margin: 20px auto 0px 5px">
							
						
						<div class="profile_box "><a href="/myPage/${sns.boardVO.memberVO.nickname}" style="color:black">
						<img src="/resources/img/member/profile/${sns.boardVO.memberVO.thumbnail}"
								name="profile" alt="" class="profile" />
						</div>
						${sns.boardVO.memberVO.nickname} ＊ 팔로우</a>
						
					</div>
					<div class="card">
						<a href="/commu/sns/${sns.boardVO.board_id}"> <img
							src="/resources/img/member/sns/${sns.imgname }" alt=""
							style="height: 300px;" class="card-img-top i" /></a>
						<div class="card-body">
							<div class="w3-border w3-center w3-padding">
							  <button class="w3-button w3-black w3-round" id="rec_update">
									<i class="fa fa-heart" style="font-size: 16px; color: red"></i>
									&nbsp;<span class="rec_count"></span>
								</button>
							</div>
							
							
							<p class="card-text">${sns.boardVO.content}</p>
						</div>
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
    	        url :"/commu/sns/morelist",
    	        data : {
    	        	pageNum: pageNum 
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var sns = data.sns;
					
    	          html = " "
    	           for(var i in sns){
    	        	  html +="<div class='card-feed  col-12 col-md-4 col-lg-3'>"
    	        	  		+"<div class='user-Info row' style='margin:20px auto 0px 5px'>
    	        	  		+"<div class='profile_box'>
    	        	  		+ "<img src='/resources/img/member/profile/" + ${sns.boardVO.memberVO.thumbnail}+"' name='profile' alt='' class='profile' /></div>"
							 +"<p>" + sns[i].boardVO.memberVO.nickname + "'<p>"
							 +"<a href='#'>팔로우</a><p><small>상태메시지</small></p></div>"
							 +"<div class='card'>
  							 +"<a href='/commu/sns/" + ${sns.boardVO.board_id} +"'>"   	          	
	       	          		 +"<img src='/resources/img/member/sns/" + ${sns.imgname} + "'>"
	       	          		 +"</div>"
     							+"</div>"
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