<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<!-- 수정 삭제 경고창 -->
<script type="text/javascript">
	function button_event() {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			location.href = '${pageContext.request.contextPath}/commu/tdelete?board_id=${tips_view.board_id}'
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

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #dddddd;
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
</head>

<body style="padding-top: 180px">

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

	<div class="container" style="margin-bottom: 40px">
		<div class="head">
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
								 
 								 <div class="profile_box" style="margin-left:16px;"> <a href="/myPage/${tips_view.memberVO.nickname}"><img src="/resources/img/member/profile/${tips_view.memberVO.thumbnail}"
								name="profile" alt="" class="profile" /> &nbsp&nbsp</a></div>
								<span class="nickname" style="padding:6px;"> <b> ${tips_view.memberVO.nickname} &nbsp&nbsp</b></span>
							
							     </div>
				<hr>
				<section style="margin-top: 40px; margin-bottom: 20px;">${tips_view.content}</section>
				<form action="${pageContext.request.contextPath}/commu/tipstag"
					method="post">
					<ul class="pd-tags">
						<c:set var="hashtag" value="${tips_view.hashtag}" />
						<c:set var="tag" value="${fn:split(hashtag, ' ')}" />

						<c:forEach var="t" items="${tag}">
							<button id="hashtag" name="keyword" value="${t}"
								class="btn btn-disabled"
								onclick="location.href='${pageContext.request.contextPath}/commu/tipstag'">${t}</button>
						</c:forEach>

					</ul>
				</form> <span style="color: gray">${tips_view.pdate}</span> <span
				style="color: gray">조회수 ${tips_view.hit}</span>
			</td>
		</table>

	</div>


	<div class="container">

		<input type="hidden" id="pgroup" value="${tips_view.board_id }">
		<div>
			<div>
				<strong> 댓글 ${count}</strong>
				<br><br>
			</div>
			<div>
				<div class="table" style="margin-bottom: 50px;">

					<div class="row"><textarea style="resize: none; margin-left:60px;"
							class="form-control col-10" id="content" placeholder="댓글을 입력하세요"></textarea>
						<button id="cw" class="col-1 btn btn-outline-secondary"
							onClick="getComment()">등록</button>

				</div>
			</div>
			</div>
			</div>
	

		<div class="container" style="margin-bottom: 10px;">
		<c:forEach items="${tcomment}" var="tcm">
			 <div id="tcomment">
 					<!-- 여기서부터 시큐리티 권한을준다 -->
			    <sec:authentication property="principal" var="pinfo" />
			    <sec:authorize access="isAuthenticated()">	
	
				<!-- 현재 접속된 닉네임과 댓글보드에 저장된 닉네임을 비교해서 일치 하면 보이게 함 -->
			<c:if test="${pinfo.nickname eq tcm.memberVO.nickname}">
		
			<a class="a-del" style="float: right;"  href="/commu/tips/comment/delete?board_id=${tcm.board_id}"><b>삭제</b></a>
			</c:if> 
			</sec:authorize> 

				
					<div class="row"><div class="profile_box"><a href="/myPage/${tcm.memberVO.nickname}">
					<img src="/resources/img/member/profile/${tcm.memberVO.thumbnail}"
						name="profile" alt="" class="profile" /></a></div>
						<div style="padding:8px;"><b>${tcm.memberVO.nickname}</b></div></div>
					<div style="padding-left:32px;">${tcm.content}</div>
					<div style="padding-left:32px;">${tcm.pdate}</div>
					<hr>
				</div></c:forEach>

		</div>




               
		<div class="container">
			<form id="commentListForm" name="commentListForm" method="post">
				<div id="TcommentList"></div>
			</form>
		</div>
	</div>
	</div>

	<div class="later col-lg-12 text-center">
		<button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
	</div>

	<script type="text/javascript">
	
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
					console.log(data);

					html = 
					"<a class='a-del' style='float:right;' href='/commu/tips/comment/delete/" + data.board_id + "'><b>삭제</b></a>"
					+"<div class='row'><div class='profile_box'><a href='/myPage/ "+data.memberVO.nickname+"'><img src='/resources/img/member/profile/" + data.memberVO.thumbnail +"' class='profile'></a></div><div style='padding:8px;'><b>" + data.memberVO.nickname + "</b></div></div>"
					+ "<div style='padding-left:32px;'>" + data.content + "</div>" + "<div style='padding-left:32px;'>"
					+ data.pdate + "</div><hr>"
					

					$("#tcomment").prepend(html);
					document.getElementById("content").value = '';


				}, //ajax 성공 시 end$
/* 
			 error : function(request, status, error) {
			 alert("code:" + request.status + "\n" + "message:"
			 + request.responseText + "\n" + "error:" + error); 

			 } // ajax 에러 시 end */
			})
		}
		
		// 댓글 삭제
		$(".a-del").click(function(event) { //id는 한번만 calss는 여러번 선택 가능.
		
		   //하나의 id는 한 문서에서 한 번만 사용이 가능(가장 마지막 혹은 처음게 선택). 하나의 class는 
		
		   event.preventDefault(); 
		  
		
		   var tr = $(this).parent();//자바스크립트 클로저

		   $.ajax({
		      type : 'DELETE', //method
		      url : $(this).attr("href"), //주소를 받아오는 것이 두 번째 포인트.
		      cache : false,
		      success : function(result) {
		         console.log("result: " + result);
		         if (result == "SUCCESS") {
		            $(tr).remove();
		            alert("삭제되었습니다.");
		         }
		      },
		      errer : function(e) {
		         console.log(e);
		      }
		   }); //end of ajax
		 }); // 삭제 종료
		
		 
		 
		 
		
		//더보기
		var pageNum = 1;

		function btnClick() {

			pageNum += 1;
			console.log(pageNum);

			$.ajax({
				type : "POST",
				url : "/commu/tmorelist",
				data : {
					pageNum : pageNum,
					board_id : "${tips_view.board_id}"
				},
				success : function(data) {
					console.log(data);
					var tcomment = data.tcomment;

					html = " "
					for ( var i in tcomment) {
						html += "<div id='tcomment'>" + "<div>"
						+"<div class='row'><div class='profile_box'>"
						+"<a href='/myPage/ "+tcomment[i].memberVO.nickname+"'><img src='/resources/img/member/profile/"+tcomment[i].memberVO.thumbnail+"'name='profile' alt='' class='profile' />"
						+"</a></div><div style='padding:8px;'><b>"+tcomment[i].memberVO.nickname+"</b></div></div>"
						+ "<div style='padding-left:32px;'>" + tcomment[i].content + "</div>"
						+ "<div style='padding-left:32px;'>" + tcomment[i].pdate + "</div>"
						+ "<hr>"

						+ "</div>"
					}

					$("#tcomment").append(html);

				},
				/* //success end
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end */
			}); //ajax end	 
		}; //click end	
		
				

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
