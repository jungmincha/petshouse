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
#navbars>li:nth-child(1) {
   background-color: #e7ab3c;
}

.count {
	position: absolute;
	bottom: 80px;
	right: 30px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}

.count2 {
	position: absolute;
	bottom: 10px;
	right: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}
#hashtag {
	font-size: 13px;
	padding: 0.01px;
}
#hashtag:hover{
background-color:#dddddd;
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

.more {
	font-size: 13px;
	padding: 0.01px;
}

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
<script>

</script>
</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">

		
		<input type="hidden" name="keyword" value="${param.keyword}">
		
		<h5><b>'${param.keyword}'</b>에 대한 검색결과 <b>${scount}건</b></h5>
			<br><br>
			<div id="table" class="row text-center"
				style="margin-left: 5px; margin-bottom: 30px;">


				<div id="snslist" class="row text-center">
					<c:forEach items="${moresns}" var="ms">
						<div class=" col-12 col-md-4 col-lg-3">

							<div class="user-Info row" style="margin: 20px auto 0px 5px">
								<div class="profile_box ">

									<img
										src="/resources/img/member/profile/${ms.boardVO.memberVO.thumbnail}"
										name="profile" alt="" class="profile" />
								</div>
								<div style="padding: 7px">${ms.boardVO.memberVO.nickname }
								</div>
								<a href="/myPage/${ms.boardVO.memberVO.nickname}"
									style="padding: 7px;"> 팔로우</a>


							</div>

							<div class="pi-pic shot">
								<a href="/commu/sns/${ms.boardVO.board_id}"> <img
									src="/resources/img/member/sns/${ms.imgname}" alt=""
										style="border-radius: 5px;height:250px; width:250px;" /><span
									class="count">조회수 ${ms.boardVO.hit}</span></a>
							</div>
							<div class="card-body">좋아요${ms.boardVO.plike}//댓글수</div>
						</div>


					</c:forEach>
				</div>
			</div>
						 <div class="later col-lg-12 text-center">
            <button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
	 </div>
	        
	</div>
<script type="text/javascript">
      var pageNum = 1;
     
      function btnClick(){

    	  pageNum += 1;
    	  console.log(pageNum);
    	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/snsmorelist",
    	        data : {
    	        	pageNum: pageNum,
    	        	keyword:"${param.keyword}"
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var snslist = data.snslist;
					
    	          html = " "
    	           for(var i in snslist){
    	        	  html +="<div class='col-12 col-md-4 col-lg-3' >"
    	        	  +"<div class='user-Info row' style=' margin: 20px auto 0px 5px' >"
    	        	  +"<div class='profile_box'>"
    	        	  +"<img src='/resources/img/member/profile/"+snslist[i].boardVO.memberVO.thumbnail+"}'  name=' profile'  alt=''  class=' profile'  /></div>"
    	        	  +"<div style='padding: 7px' >"+snslist[i].boardVO.memberVO.nickname+"</div>"
    	        	  +"<a href='/myPage/"+snslist[i].boardVO.memberVO.nickname+"' style=' padding: 7px;' > 팔로우</a></div>"
    	        	  +"<div class='shot' > <a href=' /commu/sns/"+snslist[i].boardVO.board_id+"' > "
    	        	  +"<img src='/resources/img/member/sns/"+snslist[i].imgname+"'  alt=''  style='height: 300px;'  class='card-img-top i'  />"
    	        	  +"<span class='count' >조회수 "+snslist[i].boardVO.hit+"</span></a> </div>"
    	        	  +"<div class='card-body' >좋아요"+snslist[i].boardVO.plike+"//댓글수</div> </div>"
    	           }
    	           
    	            $("#table").append(html); 
    	          
    	        }, 	        
    	        //success end
    	         error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end 
    	    }); //ajax end	 
      };
   </script>
   
   

	<!-- Blog Section End -->

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