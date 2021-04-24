<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 추가함 -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${tips_view.title}</title>

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

<script>
	//로그인 체크
	$(document).ready(function() {
		var member_id = $("#member_id").val();

		function checkLogin() {
			if (member_id == undefined) {
				alert("먼저 로그인 해주세요");
				
			}
		}

		//좋아요  로그인 체크
		$('.like').click(function() {
			checkLogin();
		});
	});
</script>

<!-- 수정 삭제 경고창 -->
<script type="text/javascript">
	function button_event() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			var board_id = $('#board_id').val();
			var url = "/commu/tdelete/" + board_id;
			
			$.ajax({
				type : "DELETE",
				url : url,
				cache : false,
				success : function(result) {
					console.log(result);
					if (result == "SUCCESS") {
						$(location).attr('href', '/commu/tips')
					}
				},
				error : function(e) {
					console.log(e);
				}
			})
			
		} else { //취소
			return;
		}
	}

	function modify_event() {
		if (confirm("수정하시겠습니까?") == true) { //확인
			location.href = '${pageContext.request.contextPath}/commu/tmodify_page?board_id=${tips_view.board_id}'
		} else { //취소
			return;
		}
	}
</script>
<!-- 수정 삭제 경고창 end-->
<style>
.bottom{
color: gray;
margin-top:20px;
margin-bottom:20px;
}
#navbars>li:nth-child(2) {
   background-color: #e7ab3c;
}

#hashtag {
	font-size: 15px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #dddddd;
}

.profile_box {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile_box2 {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.plike{
left:100%;
}

</style>
</head>

<body style="padding-top: 150px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="nickname"
			value="<sec:authentication property="principal.nickname"/>">
	</sec:authorize>
	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="member_id"
			value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>
	
	
	
	<input type="hidden" id="board_id" name="board_id" value="${tips_view.board_id}">

	<div class="container">
		<div class="head">
			<c:forEach var="img" items="${img}">
				<img style="height: 500px; width: 1200px;"
					src="/resources/img/tips/${img.imgname}">
			</c:forEach>
			<div style="margin-top: 45px; margin-bottom: 10px;">
				<a class="tips-subtitle" href="/commu/tips">노하우</a>
			</div>
			<h3 class="tipstitle" style="font-weight: bold; margin-bottom: 10px;">${tips_view.title}</h3>
		</div>



		<div style="float: right">
			<button type="button" id="modify_button" class="btn btn-warning"
				onclick="modify_event();">수정</button>

			<button type="button" id="delete_button" class="btn btn-warning"
				onclick="button_event();">삭제</button>
		</div>


		<table>
			<td>
				<div class="row user_info">

					<div class="profile_box" style="margin-left: 16px;">
						<a href="/myPage/${tips_view.memberVO.nickname}"><img
							src="/resources/img/member/profile/${tips_view.memberVO.thumbnail}"
							name="profile" alt="" class="profile" /> &nbsp&nbsp</a>
					</div>
					<span class="nickname" style="padding: 6px;"> <b>
							${tips_view.memberVO.nickname} &nbsp&nbsp</b></span>

				</div>
			
<hr>


				<section style="margin-top: 40px; margin-bottom: 20px; min-height:90px;">${tips_view.content}</section>
			
				<div class="bottom">
				
				<span class="row col-lg-12" style="padding-left:20px;">
							 
							<!-- 본인이 좋아요 누른 게시글이 아닌 경우 좋아요 버튼 발생 이미 눌렀던 경우는 좋아요 취소버튼 발생하게 구현해야 할것!-->
							<span class="row">
							
							
							<c:if test="${likecheck == 0}">
								<span class="col-lg-12">
									<a href="javascript:void(0);" class="like"
										style="cursor: hand;" onclick="like();"><img
										src="/resources/img/location/before_like.png"
										style="width: 26px;  "></a>
									

								</span>
							</c:if>

							<c:if test="${likecheck != 0}">
								<span class="col-lg-12">
									<a href="javascript:void(0);" class="likecancel"
										style="cursor: hand;" onclick="likecancel();"><img
										src="/resources/img/location/after_like.png"
										style="width:26px; "></a>
										
								</span>
							</c:if>
							<span class="profile-info_follow-state row  ">
							
								<span class="profile-info" ></span>
									<a href="#likeModal" class="like_amount" data-toggle="modal"
									style="float: right; padding:10px; font-size:15px;">  ${like_amount}  </a>
							</span>
						
						</span></span>
						
					 <form action="${pageContext.request.contextPath}/search"
							method="get">
					
							<span> <fmt:formatDate
										value="${tips_view.pdate}" pattern="yy.MM.dd" /></span> &nbsp&nbsp
							<span> 조회수 ${tips_view.hit}</span>&nbsp&nbsp
								<c:set var="hashtag" value="${tips_view.hashtag}" />
								<c:set var="tag" value="${fn:split(hashtag, '#')}" />
								<c:forEach var="t" items="${tag}">
									<c:if test="${not empty tips_view.hashtag}">
										<span><button id="hashtag" name="keyword"
												class="btn btn-disabled" value="${t}"
												onclick="location.href='${pageContext.request.contextPath}/search'">#${t}</button></span>
									</c:if>
								</c:forEach>
							
						</form>
				</span>
						<!-- row col-lg-12 end -->
				</div>
				<hr>
			</td>
		</table>

	</div>
	
		<!-- 좋아요 구현 -->

							

								
			
				

					<!-- likelist Modal start -->
					<div class="modal" id="likeModal">
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
										<p>${likelist.memberVO.nickname}</p>
									</c:forEach>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-warning"
										data-dismiss="modal">Close</button>
								</div>

							</div>
							<!-- modal-content end -->
						</div>
					</div>
					<!-- like list Modal end -->


	<div class="container">

		<input type="hidden" id="pgroup" value="${tips_view.board_id }">
		<div>
			<div>
				<strong id="count"> 댓글 ${count}</strong> <br> <br>
			</div>
			<div>
				<div class="table" style="margin-bottom: 50px;">

					<div class="row">
					<div class="col-11">
						<textarea style="resize: none;"
							class="form-control" id="content" placeholder="댓글을 입력하세요 (최대 200자)"></textarea></div>
						<div class="col-1"><button style="height:60px; width:80px; margin-left:-30px;" id="cw" class="btn btn-outline-secondary"
							onClick="getComment()">등록</button></div>

					</div>
				</div>
			</div>
		</div>

		<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
	<sec:authentication property="principal" var="pinfo" />
	</sec:authorize>
		<div class="container" style="margin-bottom: 10px;">
			<div id="tcomment"></div>
		</div>





		<div class="container">

			<div class="later col-lg-12 text-center" id="page"></div>
		</div>
	</div>

<script>
$(document).ready(function(){
	$('#content').on('keyup',function(){
		if($(this).val().length > 200){
			$(this).val($(this).val().substring(0,200));
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
			console.log(start);

			console.log("실행");
			$
					.ajax({
						type : "POST",
						url : "/commu/tmorelist",
						data : {
							amount : start,
							board_id : "${tips_view.board_id}"
						},
						success : function(data) {
							$("#tcomment").empty();
							$("#page").empty();
							console.log(data);
							var tcomment = data.tcomment;

							html = " "
							for ( var i in tcomment) {
								html += "<div>"
								if ("${pinfo.nickname}" == tcomment[i].memberVO.nickname) {
									html += "<a class='a-del' style='float:right;' href='/commu/tips/comment/delete/" + tcomment[i].board_id + "'><b>삭제</b></a>"
								} else {
									html += "<a style='float:right; visibility:hidden;'>여백</a>"
								}

								html += "<div class='row'>"
										+ "<div class='profile_box'>"
										+ "<a href='/myPage/"+tcomment[i].memberVO.nickname+"'>"
										+ "<img src='/resources/img/member/profile/"+tcomment[i].memberVO.thumbnail+"'name='profile' alt='' class='profile' />"
										+ "</a></div><div style='padding-top:10px; padding-left:10px;'><b>"
										+ "<a href='/myPage/"+tcomment[i].memberVO.nickname+"'>"
										+ tcomment[i].memberVO.nickname
										+ "</a></b></div></div>"
										+ "<div style='padding-left:60px;'>"
										+ tcomment[i].content + "</div>"
										+ "<div style='padding-left:60px;'>"
										+ transferTime(tcomment[i].pdate)
										+ "</div><hr></div>"

							}
							$("#count").text("댓글 " + data.commentTotal + "개");
							$("#tcomment").append(html);
							if (data.tcomment.length < data.commentTotal) {
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
				url : "/commu/tips_view/insert",
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

			$.ajax({
				type : 'DELETE', //method
				url : $(this).attr("href"), //주소를 받아오는 것이 두 번째 포인트.
				cache : false,
				success : function(result) {
					console.log("result: " + result);
					if (result == "SUCCESS") {
						alert("삭제되었습니다.");
						getListComment(2);
					}
				},
				error : function(e) {
					console.log(e)
				}
			}); //end of ajax
		}); // 삭제 종료

		//수정 삭제 버튼 띄우기
		window.onload = function() {

			console.log("${tips_view.memberVO.nickname}"); //게시글에 입력된 닉네임

			console.log("${nickname}"); //현재 접속하고 있는 회원정보 닉네임 이전 페이지에서 principal.nickname 값을 받아와 줬다

			var contentnickname = "${tips_view.memberVO.nickname}";

			var nickname = $("#nickname").val();

			if (nickname !== contentnickname) {//현재 접속된 닉네임과 입력된 닉네임이 불일치 하면  삭제버튼이 사라진다.

				$("#delete_button").hide();

				$("#modify_button").hide();

			}

		}
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
	
		<script type="text/javascript">
						//좋아요 요청
						function like() {
							var board_id = $('#pgroup').val();
							// var pre_nickname = $('#nickname').val();  

							console.log(board_id);

							$
									.ajax({
										type : "POST",
										url : "/commu/tips_view/like/" + board_id,
										success : function(data) {
											console.log(data);
											console.log(data.like_amount)
											var likelist = data.likelist;

											html = "";

											for ( var i in likelist) {
												html += "<p>"
														+ likelist[i].memberVO.nickname
														+ "</p>";
											}

											$('.like_amount').empty();
											$('.like_amount').append(
													'<span>' + data.like_amount
															+ '</span></a>');
											$('.likelist').empty();
											$('.likelist').append(html);
											$('.like').remove();
											$('.profile-info')
													.append(
															'<a href="javascript:void(0);" class="likecancel" style="cursor:hand;  padding-left:30px;" onclick="likecancel();"><img src="/resources/img/location/after_like.png" style="width:25px;"></a>');
										},
										error : function(e) {
											console.log(e);
										}
									});//ajax end
						};//like end

						//좋아요 취소
						function likecancel() {
							var board_id = $('#pgroup').val();
							// var pre_nickname = $('#nickname').val();

							console.log(board_id);

							$
									.ajax({
										type : "DELETE",
										url : "/commu/tips_view/likecancel/"
												+ board_id,
										success : function(data) {
											console.log(data);
											console.log(data.like_amount)
											var likelist = data.likelist;

											html = "";//꼭 써줘야 할것!

											for ( var i in likelist) {
												html += "<p>"
														+ likelist[i].memberVO.nickname
														+ "</p>";
											}

											$('.like_amount').empty();
											$('.like_amount').append(
													'<span >'
															+ data.like_amount
															+ '</span></a>');
											$('.likelist').empty();
											$('.likelist').append(html);
											$('.likecancel').remove();
											$('.profile-info')
													.append(
															'<a href="javascript:void(0);" class="like" style="cursor:hand;  padding-left:30px;" onclick="like();"><img src="/resources/img/location/before_like.png" style="width:25px; "></a>');
										},
										error : function(e) {
											console.log(e);
										}
									});//ajax end
						};//likecancel end
					</script>

	<div style="margin-top: 20px;">
		<!-- Footer -->
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
