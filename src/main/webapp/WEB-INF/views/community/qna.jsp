<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>질문과 답변</title>

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
#navbars>li:nth-child(2) {
	background-color: #e7ab3c;
}

.jumbotron {
	text-align: center;
	background-color: #FAFAFA !important;
	margin-top: -29px;
}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #F2EFFB;
}

body::-webkit-scrollbar {
	width: 15px;
}

body::-webkit-scrollbar-thumb {
	background-color: #CCCCCC;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

body::-webkit-scrollbar-track {
	background-color: #FFF;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

#content {
	display: block;
	width: auto;
	margin-top: 0.3rem;
	margin-bottom: 0.3rem;
	white-space: normal;
	font-size: 0.9rem;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.input {
	background-image:
		url(https://cdn1.iconfinder.com/data/icons/hawcons/32/698627-icon-111-search-256.png);
	background-position: 13px center;
	background-size: contain;
	background-repeat: no-repeat;
	border: 1px solid #ccc;
	padding: 5px 5px;
	text-indent: 30px;
	width: 120px;
}

.search input {
	width: 55%;
	margin-left: 23%;
	height: 40px;
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
		$('#qw').click(function() {
			checkLogin();
		});
		
	});
</script>

</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="member_id"
			value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>

	<!-- 질문과 답변 검색창 -->

	<div class="jumbotron">
		<a class="qna-subtitle" href="/commu/qna">
			<h3>
				<b>질문과 답변</b>
			</h3>
		</a>
		<div style="font-size: 15px">내 반려동물에 대한 모든 궁금증을 남겨보세요!</div>
		<br>

		<form action="${pageContext.request.contextPath}/commu/qnasearch"
			method="post">
			<div class="search">
				<input rel="search" class="input form-control mr-sm-8" type="text"
					name="keyword" style="text-align: center;"
					placeholder="궁금한 것을 검색해보세요">
			</div>
		</form>
	</div>

	<!-- 질문과 답변 검색창 end -->
	<div class="container">
		<!-- 동물 카테고리 글쓰기 버튼 -->

		<div style="float: right;">
			<button class="btn btn-outline-secondary" id="qw"
				onclick="location.href='${pageContext.request.contextPath}qna/write'">질문
				작성</button>
		</div>

		<div style="float: left; margin-bottom: 30px;">

			<select id="selectPet" class="form-control"
				name="categoryVO.category_id" style="text-align-last: center">

				<option value="0">동물</option>
				<option value="1">고양이</option>
				<option value="2">강아지</option>
				<option value="3">파충류</option>
				<option value="4">조류</option>
				<option value="5">어류</option>
				<option value="6">기타</option>
			</select>


		</div>

		<!-- 동물 카테고리 글쓰기 버튼 end -->



		<!-- qna 글 끌고오기 -->
		<table class="table">
			<c:forEach items="${qna}" var="qna">
				<tbody id="qnaList">
					<td>
						<form action="${pageContext.request.contextPath}/search"
							method="get">
							<a href="/commu/qna/${qna.board_id}">
								<div
									style="font-weight: bold; font-size: 18px; margin-top: 10px;">${qna.title}</div>
								<div id="content">${qna.content}</div>
							</a>
							<div style="margin-bottom: 10px;">
								<span>${qna.memberVO.nickname}</span> <span
									style="font-size: 13px; color: gray;"> <fmt:formatDate
										value="${qna.pdate}" pattern="yy.MM.dd" /></span> <span
									style="font-size: 13px; color: gray;"> 조회수 ${qna.hit}</span>
								<c:set var="hashtag" value="${qna.hashtag}" />
								<c:set var="tag" value="${fn:split(hashtag, '#')}" />
								<c:forEach var="t" items="${tag}">
									<c:if test="${not empty qna.hashtag}">
										<span><button id="hashtag" name="keyword"
												class="btn btn-disabled" value="${t}"
												onclick="location.href='${pageContext.request.contextPath}/search'">#${t}</button></span>
									</c:if>
								</c:forEach>
							</div>
						</form>
					</td>
				</tbody>
			</c:forEach>
		</table>
		<!-- qna 글 끌고오기 end-->


		<!-- 페이징 -->
		<div class="ul">
			<ul class="pagination justify-content-center"
				style="padding-bottom: 50px; padding-top: 50px;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="qna${pageMaker.makeQuery(pageMaker.startPage - 1) }">
							Previous</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
					<li class="page-item"><a class="page-link"
						href="qna${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="qna${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<script type="text/javascript">
		// 해당 동물의 글을 끌고올거야
		$('#selectPet')
				.change(
						function() {
							var category_id = $(this).val();
							console.log(category_id);

							$
									.ajax({
										url : "/commu/qna/pet",
										type : "get",
										data : {
											category_id : category_id,
										},
										success : function(data) {

											console.log(data);
											$(".table").empty();
											var html = "<table class='table'>";
											for (var i = 1; i <= data.length; i++) {

												html += "<tbody id='qnaList'><td>"
														+ "<a href='/commu/qna/"+data[i - 1].board_id+"'>"
														+ "<div style='font-weight: bold; font-size: 18px;'>"
														+ data[i - 1].title
														+ "</div>"
														+ "<div>"
														+ data[i - 1].content
														+ "</div> <span>"
														+ data[i - 1].memberVO.nickname
														+ "</span>"
														+ "<span style='font-size: 13px; color: gray;'>"
														+ data[i - 1].pdate
														+ "</span> "
														+ "<span style='font-size: 13px; color: gray;'> 조회수 "
														+ data[i - 1].hit
														+ "</span>"
														+ "</a>"
														+ "</td></tbody>"

											}
											html += "</table>"
											$(".ul").prepend(html).trigger( "create" );
											
										}, //ajax 성공 시 end

										/* error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);

										} // ajax 에러 시 end */

									})
							
							
						})
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
