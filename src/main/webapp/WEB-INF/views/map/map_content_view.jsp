<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>펫츠타운</title>

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
<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<style>
a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
a:hover {text-decoration:none;}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}
#hashtag:hover{
background-color:#dddddd;
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




 <script type="text/javascript">
	
		function button_event() {
			
			
			if (confirm("삭제하시겠습니까?") == true) { //확인
				location.href = '/map/delete?board_id=${content_view.board_id}&location=${location}&nickname=${nickname}&member_id=${member_id}'
			} else { //취소
				return;
			}
		}

		function modify_event() {
			if (confirm("수정하시겠습니까?") == true) { //확인
				location.href = '/map/modify_view/${content_view.board_id}?location=${location}&nickname=${nickname}&member_id=${member_id}'
			} else { //취소
				return;
			}
		}
		
		
	</script>



</head>
<body style="padding-top:128px">

  <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
    <!-- Map Section Begin -->

  
           
    <!-- Map Section Begin -->

    <!-- Contact Section Begin -->
	<section class="contact-section spad" style="padding-bottom:150px;">
 		<div class="container">
			<div class="row">
   				<div class="col-lg-12">
              
				<!-- 위치 다시 선정하기 -->
					<i class="fas fa-paw"></i><span style= "font-size: 20px;"> ${location}</span>
					<br> <br>
					<i class="fas fa-paw"></i><a href="/map/home"><span style= "font-size: 18px;"> 위치 다시 설정하기</span></a>
					<br> <br>			
 					

    
													
				<!-- 좋아요 구현 -->
													
					<!-- Profile Section -->
     				<div style="float:right;"class="profile-info container">
      					<div class="row col-lg-12" >
      						<div class="profile-info_name">
      							<input type="hidden" id="board_id" value="${board_id}"/>
      						</div>
      					</div>
      					
      					<div class="row col-lg-12">
      						<div class="profile-info_follow-state">
      						    		 	
            					<a href="#likeModal" class="like_amount" data-toggle="modal" style="float:right;"><span>좋아요${like_amount}</span></a>
	        				</div>

							<!-- likelist Modal start -->
							<div class="modal" id="likeModal" >
								<div class="modal-dialog">
									<div class="modal-content">
		      
			       						<!-- Modal Header -->
										<div class="modal-header">
			          						<h4 class="modal-title">좋아요한 회원 목록</h4>
			          						<button type="button" class="close" data-dismiss="modal">&times;</button>
			        					</div>
			        
			        					<!-- Modal body -->
			       						<div class="likelist modal-body">
			          						<c:forEach items="${likelist}" var="likelist">
			          							<p><a href="/myPage/${likelist.memberVO.nickname}">${likelist.memberVO.nickname}</a></p>          	
			          						</c:forEach>
			        					</div>
			        
			        					<!-- Modal footer -->
			        					<div class="modal-footer">
			          						<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
			       						</div>
		                
									</div> 	<!-- modal-content end -->														
								</div>
							</div>
							<!-- like list Modal end -->
		
							<!-- 본인이 좋아요 누른 게시글이 아닌 경우 좋아요 버튼 발생 이미 눌렀던 경우는 좋아요 취소버튼 발생하게 구현해야 할것!-->
							
							<c:if test="${likecheck == 0}">	 			
							<div class="col-lg-12">
		        				<a href="javascript:void(0);" class="like" style="cursor:hand;" onclick="like();"><img src="/resources/img/location/before_like.png" style="width:30px;  "></a>
			       			
			       			</div>	   
		  					</c:if>	
		  						
							<c:if test="${likecheck != 0}" >					
							<div class="col-lg-12">
								<a href="javascript:void(0);" class="likecancel" style="cursor:hand;" onclick="likecancel();"><img src="/resources/img/location/after_like.png" style="width:30px;  "></a>
							</div>	   
							</c:if>	 
					
							
      					</div> <!-- row col-lg-12 end -->
      				</div> <!-- profile-info end -->
					<!-- Profile Section -->
				  	
					<script type="text/javascript">
				  	 
					//좋아요 요청
				    function like(){  	
				    	var board_id = $('#pgroup').val();  
					 	// var member_id = $('#member_id').val();  
					 
						console.log(board_id);
						console.log("이게머야"+board_id);
						// console.log(member_id);
							
				    	$.ajax({
				    		type :"POST",
					        url :"/map/like/" + board_id,   
					        success :function(data){
					           console.log(data);	
					           console.log(data.like_amount)
					           var likelist = data.likelist;
					          
 								html = "";
					           
					           for(var i in likelist){
					        	   html += "<p>" + likelist[i].memberVO.nickname + "</p>";
					           }
					           
					           $('.like_amount').empty();
					           $('.like_amount').append('좋아요<span>' + data.like_amount + '</span></a>');                 
					           $('.likelist').empty();
					           $('.likelist').append(html);
					           $('.like').remove();	          
					           $('.profile-info').append('<a href="javascript:void(0);" class="likecancel" style="cursor:hand;  padding-left:14px;" onclick="likecancel();"><img src="/resources/img/location/after_like.png" style="width:30px;"></a>');               
					        },
					        error: function(e){
						    	console.log(e);
						    }
				   		});//ajax end
					};//like end
					    
					//좋아요 취소
					function likecancel(){  
						var board_id = $('#pgroup').val();
						// var member_id = $('#member_id').val();
					
					   	console.log(board_id);
						// console.log(member_id);
					   	
				    	$.ajax({
				    		type :"DELETE",
					        url :"/map/likecancel/" + board_id,
							success :function(data){
								console.log(data);	
					        	console.log(data.like_amount)
					        	var likelist = data.likelist;
						          
								html = "";//꼭 써줘야 할것!
					        	
								for(var i in likelist){
									html += "<p>" + likelist[i].memberVO.nickname + "</p>";
					         	}
						           
								$('.like_amount').empty();
								$('.like_amount').append('좋아요<span >' + data.like_amount + '</span></a>');                 
								$('.likelist').empty();
						        $('.likelist').append(html);
					            $('.likecancel').remove();		           
					            $('.profile-info').append('<a href="javascript:void(0);" class="like" style="cursor:hand;  padding-left:14px;" onclick="like();"><img src="/resources/img/location/before_like.png" style="width:30px; "></a>'); 
					        },
					        error: function(e){
						    	console.log(e);
						    }
				   		});//ajax end
					};//likecancel end
						
					</script>
		
					<form action="/map/modify" method="post">
						<input id="location" type="hidden" name="location" value="${location}"/> 
						<input type="hidden" name="member_id" value="<sec:authentication property="principal.member_id"/>">
						<input type="hidden" id="nickname" name="nickname" value="<sec:authentication property="principal.nickname"/>"> 
						
						<div class="container" style="margin-bottom: 40px">
						<table>
								<tr>
								<td>
								<hr>
									<!-- 작성자 이름과 프로필 사진 -->
									<div class="col-lg-12">
									<div class="user-Info row">
									<div class="profile_box ">

									<img src="/resources/img/member/profile/${content_view.memberVO.thumbnail}" name="profile" alt="" class="profile" />
									</div>
									<div style="padding:12px"> ${content_view.memberVO.nickname} </div>	
									
									<div style="margin-left:750px;">
									
								<!-- 현재 접속된 닉네임과 댓글보드에 저장된 닉네임을 비교해서 일치 하면 보이게 함 -->
								<sec:authentication property="principal" var="buttonhidden" />
								<sec:authorize access="isAuthenticated()">	
								<!-- 수정 삭제 버튼 -->
								<c:if test="${buttonhidden.nickname eq content_view.memberVO.nickname}">
									<button  style="background-color: #FFC81E;  color:black; "  id="modify_button" type="button" class="btn btn-warning" onclick="modify_event();">수정</button>
									<button style="background-color: #FFC81E;  color:black; " id="delete_button" type="button" class="btn btn-warning" onclick="button_event();">삭제</button>
								
								</c:if>
								
								</sec:authorize>
								<button style="background-color: #FFC81E;  color:black; " id="delete_button" type="button" class="btn btn-warning" onclick="reloc_event();">목록으로</button> 
								
								</div>
									
								
									</div>
									</div><br>
									
									
									
										<!--게시글 사진 -->
								<div class="col-lg-12">		
								<div class="row">	
								<c:forEach var="photo" items="${photo}">							
								<img src="/resources/img/location/${photo.imgname}"
								style="width: 780px; height: 450px; object-fit: cover; border-radius: 10px;">
								<br>
								<br>
								</c:forEach>
								</div>
								</div>	
									
									<section style="margin-top: 60px; margin-bottom: 20px;">
										${content_view.content}
									</section>
									
										<span style="font-size: 13px; color: gray;"><fmt:formatDate value="${content_view.pdate}" pattern="yyyy.MM.dd" /></span>
									<span style="color: gray">조회수 ${content_view.hit}</span>
								</td>
								</tr>
							</table>
						</div> <!-- container end -->
					</form>  
					
					 <!-- 댓글 start -->
					<div class="container">

				<input type="hidden" id="pgroup" value="${content_view.board_id}">
				<div>
				<div>
				<strong id="count"> 댓글 ${qcount}</strong> <br> <br>
				</div>
				<div class="table" style="margin-bottom: 50px;">
				<div class="row">
					<div class="col-11">
					<textarea style="resize: none;" class="form-control" id="content"
							placeholder="댓글을 입력하세요 (최대 200자)"></textarea>
					</div>
					<div class="col-1">
						<button style="height: 60px; width: 80px; margin-left: -30px;"
							id="cw" class="btn btn-outline-secondary" onClick="getComment()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
	<sec:authentication property="principal" var="pinfo" />
	</sec:authorize>
	
	<div class="container" style="margin-bottom: 10px;">
		<div id="comments"></div>
	</div>

	<div class="container">
		<div class="later col-lg-12 text-center" id="page"></div>
	</div>
					
		<script>
		$(document).ready(function() {
			$('#content').on('keyup', function() {
				if ($(this).val().length > 200) {
					$(this).val($(this).val().substring(0, 200));
				}
			});

		});
	</script>			
					
	<script type="text/javascript">
		//timerID = setTimeout("getListComment()", 3);
		var start = 0;
		$(document).ready(function() {
			getListComment();

		})

		function getListComment(type) {
			if (type == 2) {

			} else {
				start += 5;
			}
			console.log(start)

			console.log("실행");
			$
					.ajax({
						type : "POST",
						url : "/map/cmorelist",
						data : {
							amount : start,
							board_id : "${content_view.board_id}"
						},
						success : function(data) {
							$("#comments").empty();
							$("#page").empty();
							console.log(data);
							var comments = data.comments;

							html = " "
							for ( var i in comments) {
								html += "<div>"
								if ("${pinfo.nickname}" == comments[i].memberVO.nickname) {
									html += "<a class='a-del' style='float:right;' href='/map/map_view/delete/" + comments[i].board_id + "'><b>삭제</b></a>"
								} else {
									html += "<a style='float:right; visibility:hidden;'>여백</a>"
								}

								html += "<div class='row'>"
										+ "<div class='profile_box'>"
										+ "<a href='/myPage/"+comments[i].memberVO.nickname+"'>"
										+ "<img src='/resources/img/member/profile/"+comments[i].memberVO.thumbnail+"'name='profile' alt='' class='profile' />"
										+ "</a></div><div style='padding-top:10px; padding-left:10px;'><b>"
										+ "<a href='/myPage/"+comments[i].memberVO.nickname+"'>"
										+ comments[i].memberVO.nickname
										+ "</a></b></div></div>"
										+ "<div style='padding-left:60px;'>"
										+ comments[i].content + "</div>"
										+ "<div style='padding-left:60px;'>"
										+ transferTime(comments[i].pdate)
										+ "</div><hr></div>"

							}
							$("#count").text("댓글 " + data.commentTotal + "개");
							$("#comments").append(html);
							console.log(data.commentTotal);
							if (data.comments.length < data.commentTotal) {
								html2 = "<button type='button' class='btn btn-warning' onClick='getListComment()'>더보기</button>"

								$("#page").append(html2);

							} else {

							}

						},
					});
		}
		// 댓글 작성 및 ajax로 댓글 불러오기
		function getComment() {

			var member_id = $("#member_id").val();
			var thumbnail = $("#thumbnail").val();
			console.log(member_id);
			var pgroup = $("#pgroup").val();
			var content = $("#content").val();
			console.log(content);
			$.ajax({
				url : "/map/map_view/insert",
				type : "post",
				data : {
					member_id : member_id,
					pgroup : pgroup,
					content : content,
					thumbnail : thumbnail
				},
				success : function(data) {

					document.getElementById("content").value = '';
					getListComment(2);
				},
			})

		}
		// 댓글 삭제
		$(document).on('click', '.a-del', function() {
			//id는 한번만 calss는 여러번 선택 가능.

			//하나의 id는 한 문서에서 한 번만 사용이 가능(가장 마지막 혹은 처음게 선택). 하나의 class는 

			event.preventDefault();
			
			if (confirm("삭제하시겠습니까?") == true) { //확인
				

			$.ajax({
				type : 'DELETE', //method
				url : $(this).attr("href"), //주소를 받아오는 것이 두 번째 포인트.
				cache : false,
				success : function(result) {
					
					console.log("result: " + result);
						
					if (result == "SUCCESS") {						
					
						getListComment(2);
					}
				},
				error : function(e) {
					console.log(e)
				}
			}); //end of ajax
			
			} else { //취소
				return;
			}
		}); // 삭제 종료	
		</script>
		
		<script>
		function transferTime(times) {
			var now = new Date();

			var sc = 1000;
			var today = new Date(times);
			//지나간 초
			var pastSecond = parseInt((now - today) / sc, 10);

			var date;
			var hour;
			var min;
			var str = "";

			var restSecond = 0;
			if (pastSecond > 86400) {
				date = parseInt(pastSecond / 86400, 10);
				restSecond = pastSecond % 86400;
				str = date + "일 ";

			} else if (pastSecond > 3600) {
				hour = parseInt(pastSecond / 3600, 10);
				restSecond = pastSecond % 3600;
				str = str + hour + "시간 전";

			} else if (pastSecond > 60) {
				min = parseInt(pastSecond / 60, 10);
				restSecond = pastSecond % 60;
				str = str + min + "분 전";
			} else {
				str = pastSecond + "초 전";
			}

			return str;
		}
		
		</script>
		
				</div>           
			</div>
			</div>
	</section>
  
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>  
   <!-- Footer -->
   
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
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
			captionText.innerHTML = dots[slideIndex - 1].alt;
		}
		
		
		function reloc_event(){
			
			location.href="/map/board?location=${location}&nickname=${nickname}&member_id=${member_id}";
		}
		
		

		
	</script>
   
   
  
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