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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
   
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


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

.i {
	border-radius: 10px;
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

.clone{
	position: absolute;
	top: 80px;
	right: 25px;	
	opacity: 0.4;
	font-size : 25px;
	color : #fff

}

a:hover {
	
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

<script type="text/javascript">
	function fire_ajax_submit(id) {
		console.log(id);
		var category_id = id;
		var form = {
			category_id : category_id
		};
		var url = "/commu/sns/category/" + id;

		$.ajax({
			type : "POST",
			contentType : 'application/json; charset=utf-8',
			url : url,
			data : JSON.stringify(form),
			cache : false,
			success : function(data) {
				console.log("SUCCESS : ", data);
				$('#input').html(data);
			},
			error : function(e) {
				console.log("ERROR : ", e);
			}
		});
	}
</script>

</head>
<body style="padding-top: 180px; min-height: 1500px;">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Category Section Begin -->
	<div id="input">

		<a class="btn btn-outline-secondary col-sm-1 " id="login"
			style="position: fixed; top: 170px; right: 200px;"
			onclick="location.href='${pageContext.request.contextPath}sns/write_view'">게시글등록</a>
		<div class="container" style="min-height: 1500px;">

 				<div class="section-title">
					<h2 style="margin-bottom:10px; font-size:30px; ">SNS</h2>
				 </div>  


			<div class="row ">
				<div class="col-sm-2">
					<a href="#" onclick="fire_ajax_submit(1);"> <img
						src="/resources/img/category/cat.jpg"></a>
				</div>

				<div class="col-sm-2">
					<a href="#" onclick="fire_ajax_submit(2);"> <img
						src="/resources/img/category/dog.jpg"></a>
				</div>

				<div class="col-sm-2">
					<a href="#" onclick="fire_ajax_submit(3);"> <img
						src="/resources/img/category/reptile.jpg"></a>
				</div>

				<div class="col-sm-2">
					<a href="#" onclick="fire_ajax_submit(4);"> <img
						src="/resources/img/category/bird.jpg"></a>
				</div>

				<div class="col-sm-2">
					<a href="#" onclick="fire_ajax_submit(5);"> <img
						src="/resources/img/category/fish.jpg"></a>
				</div>

				<div class="col-sm-2">
					<a href="#" onclick="fire_ajax_submit(6);"> <img
						src="/resources/img/category/other.jpg"></a>
				</div>
			</div>

			<!-- Category Section End -->





			<div id="snslist" class="row text-center">
				<c:if test="${empty list}">

					<div class="col-12" style="min-height: 200px; margin: 100px auto;">
						<div>등록된 게시글이 없습니다.</div>
					</div>
				</c:if>
				<c:if test="${not empty list}">
					<c:forEach items="${list}" var="sns">
					<input type="hidden" name="board_id" value="${boardVO.board_id}">
						<div class=" col-12 col-md-4 col-lg-3">
 							<div class="user-Info row" style="margin: 20px auto 2px 5px">
								<div class="profile_box ">
	 								<img src="/resources/img/member/profile/${sns.boardVO.memberVO.thumbnail}" name="profile" alt="" class="profile" />
								</div>
								<div style="padding-top: 13px; padding-left: 7px;">${sns.boardVO.memberVO.nickname}</div>

								<a href="/myPage/${sns.boardVO.memberVO.nickname}" style="padding-top: 13px; padding-left: 5px;"> · 팔로우</a>

							</div>

							<div class="shot">
								
								<c:forEach items="${imgCount}" var = "imgCount">
								  <c:if test="${imgCount.boardVO.board_id eq sns.boardVO.board_id and imgCount.count > 1}"> 
								 <i class="far fa-clone clone"></i>
								  </c:if> </c:forEach> 
								  
								<a href="/commu/sns/${sns.boardVO.board_id}"> 
								<img src="/resources/img/member/sns/${sns.imgname }" alt="" style="height: 300px;" class="card-img-top i" />
								
								<span class="count">조회수 ${sns.boardVO.hit}</span></a>
							</div>
							<div class="card-body" style="font-size : 20px; ">
							 	<a href="/commu/sns/${sns.boardVO.board_id}"> <i class="far fa-heart"></i>&nbsp&nbsp${sns.boardVO.plike}</a> &nbsp&nbsp&nbsp&nbsp
									<i class="far fa-comment"></i>
								<c:forEach items="${count}" var="count">  
								
								 <c:if test="${count.pgroup eq sns.boardVO.board_id}"><a href="/commu/sns/${sns.boardVO.board_id}">
							
								 ${count.count}</a></c:if></c:forEach>
							 
							 	</div>

						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-lg-12 text-center">
			 	<c:if test="${snsTotal > 8}">
			 	<input type="hidden" class="snsTotal" value="${snsTotal}" />
				<button type="button" class="btn btn-warning"  onClick="btnClick()">더보기</button>
				 </c:if> 
			</div>
		</div>
	</div>
	<!--  더보기 페이징 처리 -->
	<script type="text/javascript">
   
      var pageNum = 1;
      var check =$('.snsTotal').val() / 8;

      function btnClick() {

         pageNum += 1;
         console.log(pageNum);
         console.log(check);

         if (pageNum > check){
            $(".btn").hide();
         }
         $
               .ajax({
                  type : "POST",
                  url : "/commu/smorelist",
                  data : {
                     pageNum : pageNum
                  },
                  success : function(data) {
                     console.log(data);
                     console.log("here");
                     var sns = data.sns;
                     var snsTotal = data.snsTotal;
                     var imgCount = data.imgCount;
                     var count = data.count;

                     html = " ";
                        for (var i in sns) {
                           html += "<div class='col-12 col-md-4 col-lg-3'>"
                                 + "<div class='user-Info row' style='margin: 20px auto 0px 5px;'>"
                                 + "<div class='profile_box'>"
                                 + "<img src='/resources/img/member/profile/"+sns[i].boardVO.memberVO.thumbnail+"' name='profile' class='profile' /></div>"
                                 + "<div style='padding-top: 13px; padding-left: 7px;'>"
                                 + sns[i].boardVO.memberVO.nickname
                                 + "</div>"
                                 + "<a href='/myPage/" + sns[i].boardVO.memberVO.nickname + "' style='padding-top: 13px; padding-left: 5px;'> · 팔로우</a></div>"
                                 + "<div class='shot'>"
                                 + "<a href='/commu/sns/"+sns[i].boardVO.board_id+"'>"
                                 + "<img src='/resources/img/member/sns/"+ sns[i].imgname + "' style='height: 300px;' class='card-img-top i' />"
                                 + "<span class='count2'>조회수"
                                 + sns[i].boardVO.hit
                                 + "</span></a></div>"
                                 + "<div class='card-body' style='font-size:20px;'><i class='far fa-heart'></i>" + sns[i].boardVO.plike + "&nbsp;&nbsp;&nbsp;&nbsp;";
                                 
                                      for(var j in count){
                                              if(count[j].pgroup == sns[i].boardVO.board_id){
                                                html += "<a href='/commu/sns/"+sns[i].boardVO.board_id + "'>"
                                                     + "<i class='far fa-comment' style='font-size : 25px;'></i>"
                                                      + count[j].count + "</a></div></div>";          
                                              }
                                      }//goods foreach end            
                                    }                                     
                     $("#snslist").append(html);
                       },            
                           //success end
                            error : function(request, status, error) {
                           alert("code:" + request.status + "\n" + "message:"
                                 + request.responseText + "\n" + "error:" + error);
                        } // ajax 에러 시 end 
                       }); //ajax end    
                  };
      
   </script>
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
