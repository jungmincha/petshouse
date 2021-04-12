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
<title>${qna_view.title}</title>

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

<!-- 수정 삭제 경고창 -->

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
<!-- 수정 삭제 경고창 end-->
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


</style>
</head>


<body style="padding-top: 170px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


<!-- content -->
	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="member_id"
			value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>
	
	<div class="container" style="margin-bottom: 40px">
		<div class="head">
			<div style="margin-top: 45px; margin-bottom: 10px;">
				<a class="qna-subtitle" href="qna">질문과 답변</a>
			</div>
			<h3 class="qnatitle" style="font-weight: bold; margin-bottom: 10px;">${qna_view.title}</h3>
		</div>

		<div style="float: right">
			<button type="button" class="btn btn-warning"
				onclick="modify_event();">수정</button>

			<button type="button" class="btn btn-warning"
				onclick="button_event();">삭제</button>
		</div>

		<table>
			<td>
				<div style="font-size: 20px;">${qna_view.memberVO.nickname}</div>
				<hr>
				<section style="margin-top: 60px; margin-bottom: 20px;">${qna_view.content}</section>
				<form action="${pageContext.request.contextPath}/commu/qnatag"
				method="post">
				<ul class="pd-tags">
					<c:set var="hashtag" value="${qna_view.hashtag}" />
					<c:set var="tag" value="${fn:split(hashtag, ' ')}" />
					
					<c:forEach var="t" items="${tag}">
					<button id="hashtag" name="keyword" value="${t}" class="btn btn-disabled" onclick="location.href='${pageContext.request.contextPath}/commu/qnatag'">${t}</button>
					</c:forEach>
					
				</ul> </form> <span style="color: gray;">${qna_view.pdate}</span> <span
				style="color: gray">조회수 ${qna_view.hit}</span>
			</td>
		</table>

	</div>


	<div class="container">

		<input type="hidden" id="pgroup" value="${qna_view.board_id }">
		<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
			<input type="hidden" id="member_id"
				value="<sec:authentication property="principal.member_id"/>">
		</sec:authorize>
		<div>
			<div>
				<span><strong>댓글 </strong></span>
			</div>
			<div>
				<table class="table" style="margin-bottom: 50px;">

					<td class="row"><textarea style="resize: none;"
							class="form-control col-11" id="content" placeholder="댓글을 입력하세요"></textarea>
						<button id="cw" class="col-1 btn btn-outline-secondary" onClick="getComment()">등록</button>
					</td>

				</table>
			</div>
		</div>


		<div class="container" style="margin-bottom: 10px;">

			<div id="comment">

				<c:forEach items="${comment}" var="dto">
					<div>${dto.memberVO.nickname}</div>
					<div>${dto.content}</div>
					<div>${dto.pdate}"</div>
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


	<div style="margin-top: 20px;">
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

	<script type="text/javascript">
		// 댓글 작성 및 ajax로 댓글 불러오기
		function getComment() {
	
			var member_id = $("#member_id").val();
			console.log(member_id);
			var pgroup = $("#pgroup").val();
			var content = $("#content").val();
			$.ajax({
				url : "/commu/qna_view/insert",
				type : "post",
				data : {
					member_id : member_id,
					pgroup : pgroup,
					content : content
				},
				success : function(data) {

					html = "<div>" + data.memberVO.nickname + "</div>"
							+ "<div>" + data.content + "</div>" + "<div>"
							+ data.pdate + "</div> <hr>"

				
					 $("#comment").prepend(html); 
					document.getElementById("content").value='';
		
							
				}, //ajax 성공 시 end$
			
/* 
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error); */

				// } // ajax 에러 시 end

			})

		}
	</script>
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
