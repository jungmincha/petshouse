<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<!-- Google Font -->
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

<style>
p {
	margin: 20px 0px;
}

.i {
	width: 269px;
	height: 269px;
	object-fit: cover;
}

body {
  font-family: Arial;
  margin: 0;
  
}

.sidebar-section{
	position : relative;
	min-height : 100%;
	padding-left:40px;
	margin-left:20px;
	border-left : 1px solid #ededed;
 	 
 
}
* {
  box-sizing: border-box;
}

 

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
  width:730px;
  margin : 10px auto;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 40px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}




.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

 

.profile_box {
	width: 30px;
	height: 30px;
	border-radius: 70%;
	overflow: hidden;
	margin : 5px;
}

.profile_box2 {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
	margin : 5px;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
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
		//댓글 작성 로그인 체크
		$('#cw').click(function() {
			checkLogin();
		});
	});
	
	
</script>
<script type="text/javascript">
	function button_event() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href = '${pageContext.request.contextPath}/commu/delete?board_id=${qna_view.board_id}'
		} else { //취소
			return;
		}
	}

	function modify_event() {
		if (confirm("수정하시겠습니까?") == true) { //확인
			location.href = '${pageContext.request.contextPath}/commu/modify_page?board_id=${qna_view.board_id}'
		} else { //취소
			return;
		}
	}
</script>
</head>
<body style="padding-top: 200px">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	
<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="member_id"
			value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>
	
	
 <div class="mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
				<input type="hidden" name="board_id" value="${board_id}">	
				
				
 						${sns.categoryVO.categoryname}
 						<c:forEach var="img" items="${img}">
		   				<div class="mySlides">
		   			 
						 <img src="/resources/img/member/sns/${img.imgname}" style="width:70%; height:70%;">
						</div>
						</c:forEach>
 				 <div style="text-align:center">
 				 <span class="dot" onclick="currentSlide(1)"></span> 
  					<span class="dot" onclick="currentSlide(2)"></span> 
  					<span class="dot" onclick="currentSlide(3)"></span> 
 
  					<span class="dot" onclick="currentSlide(4)"></span> 
 					 <span class="dot" onclick="currentSlide(5)"></span>
					</div>  
   
    
 					 <a class="prev" onclick="plusSlides(-1)">❮</a>
  					<a class="next" onclick="plusSlides(1)">❯</a>

    
 
	
							 
								 <div class="row user_info"> 
								 
 								 <div class="profile_box"> <img src="/resources/img/member/profile/${sns.memberVO.thumbnail}"
								name="profile" alt="" class="profile" /> &nbsp&nbsp</div>
								<span class="nickname">  ${sns.memberVO.nickname} &nbsp&nbsp</span>
								<span class="pdate">  ${sns.pdate}&nbsp&nbsp</span>
								<span style="color: gray"> 조회수 ${sns.hit}</span>
							     </div>
							 
							<p>${sns.content}</p>
							
 							<c:set var="hashtag" value="${sns.hashtag}" /> 
 							<c:set var="tag" value="${fn:split(hashtag, ' ')}" /> 
 							<c:forEach var="t" items="${tag}">

							<a href="xxx">${t}</a>

							</c:forEach>
						 
						    </div>
						 
				 
				<div class="col-lg-3">
					<div class="sidebar-section"    >
					
					<div class="archive-posts">
					<div class="row">
				 <div class="profile_box2">
					<img src="/resources/img/member/profile/${sns.memberVO.thumbnail}"
								name="profile" alt="" class="profile" /></div> 
							<h4>${sns.memberVO.nickname}</h4>
							&nbsp&nbsp&nbsp<a href="#">팔로우</a>
					</div>	
	  
						</div><br><br>
						
						<div class="recent-posts">
							<h4>Recent Posts</h4>
							<ul>
								 
								<li><a href="single-news.html">Fall in love with the fresh orange</a></li>
								<li><a href="single-news.html">Why the berries always look delecious</a></li>
							</ul>
						</div><br><br>
						
						
					</div>
				</div></div>
			</div>
	 </div>
 

<div class="container" style="margin-top:100px;">

		<input type="hidden" id="pgroup" value="${sns.board_id}">
		<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
			<input type="hidden" id="member_id"
				value="<sec:authentication property="principal.member_id"/>">
		</sec:authorize>
		<div>
			<div>
				<h4><strong>댓글&nbsp(${count})</strong></h4>
			</div>
			<div>
			<div id = "inputContent" style = "width : 1000px;">
				<table class="table" style="margin: 10px; ">
					<td class="row">
					
					<textarea style="resize: none;"
							class="form-control col-7" id="content" placeholder="댓글을 입력하세요"></textarea>
						<button class="col-1 btn btn-warning"   onClick="getComment()">등록</button>
						
					</td>

				</table>
			</div></div>
		</div>


		<div class="container">

			<div id="comment" style = "width : 800px;">

				<c:forEach items="${comment}" var="m">
					<div class="row"><div class="profile_box">
					<img src="/resources/img/member/profile/${m.memberVO.thumbnail}"
								name="profile" alt="" class="profile" /></div>${m.memberVO.nickname}</div>
					<div>${m.content}</div>
					<div>${m.pdate}"</div>
					<hr>
				</c:forEach>

			</div>


			<div class="container">
				<form id="commentListForm" name="commentListForm" method="post">
					<div id="commentList"></div>
				</form>
			</div>
		</div>
	</div>

 
 
 
 <script type="text/javascript">
	 var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}

 
function getFormatDate(pdate) {

	   var date = date.substr(0, 17);
	   var date = date.split("T");
	   var date = date[0] + " " + date[1];
	   return pdate; 
	}
	</script> 
	 
	 
	<div style="margin-top: 500px;">
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>
	
		<script type="text/javascript">
		// 댓글 작성 및 ajax로 댓글 불러오기 프로필사진, 닉네임, 내용, 날짜 넘김
		function getComment() {
	
			var member_id = $("#member_id").val();
			var thumbnail = $("#thumbnail").val();
			console.log(member_id);
			var pgroup = $("#pgroup").val();
			var content = $("#content").val();
			
			$.ajax({
				url : "/commu/sns/comment",
				type : "post",
				data : {
					member_id : member_id,
					pgroup : pgroup,
					content : content,
					thumbnail : thumbnail
				},
				success : function(data) {
							
					html = "<div class='row'><div class='profile_box'><img src='/resources/img/member/profile/" + data.memberVO.thumbnail +"' class='profile'></div>" + data.memberVO.nickname + "</div>"
							+ "<div>" + data.content + "</div>" + "<div>"
							+ data.pdate + "</div> <hr>"

					$("#comment").prepend(html);
							document.getElementById("content").value=''; 	
					// $("#content").empty();
							
				}, //ajax 성공 시 end$
			
/* 
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error); */

				// } // ajax 에러 시 end

			})
		}
	</script>
 
</body>


<!-- Js Plugins -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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