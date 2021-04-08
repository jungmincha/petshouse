<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="/resources/css/select-style.css"
	type="text/css">
<link rel="stylesheet" href="/resources/js/select-index.js"
	type="text/css">

<style>
.jumbotron {
	text-align: center;
	background-color: #EEE9E9 !important;
	height: 300px;
}

.qcontent {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 1000px;
	height: 20px;
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
</style>

</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="container">
		<div class="jumbotron">
			<h3 class="display-5">질문과 답변</h3>
			<br>
			<hr>
			<br>
			<form action="${pageContext.request.contextPath}/commu/qnasearch"
				method="post">
				<div class="questions-header__form__search col">
					<span aria-hidden="true"></span> <input
						class="form-control mr-sm-8" type="text" name="keyword"
						style="text-align: center; height: 60px;"
						placeholder="내 반려동물에 대한 모든 궁금증!">
				</div>
			</form>
		</div>


		<!-- 동물 카테고리, 정렬, 글쓰기 버튼 -->
		<div class=" row" style="padding-bottom: 30px;">

			<select id="selectPet" class="form-control col-sm-1"
				name="categoryVO.category_id"
				style="margin-left: 15px; text-align-last: center">

				<option value="0">동물</option>
				<option value="1">고양이</option>
				<option value="2">강아지</option>
				<option value="3">파충류</option>
				<option value="4">조류</option>
				<option value="5">어류</option>
				<option value="6">기타</option>
			</select> <span class="col-sm-9"></span> <a class="btn btn-warning col-sm-1 "
				style="margin-left: 65px;" href="qna_write">질문하기</a>
		</div>

		<!-- 게시글 끌고오기 -->

		
			<table class="table table-hover">
			<c:forEach items="${qna}" var="qna">
				<tbody id="qnaList">
					<td><a href="${pageContext.request.contextPath}/commu/qna_view?board_id=${qna.board_id}">
							<div style="font-weight: bold; font-size: 18px;">${qna.title}</div>
							<div>${qna.content}</div> <span>${qna.memberVO.nickname}</span> 
							<span style="font-size: 13px; color: gray;">${qna.pdate}</span> 
							<span style="font-size: 13px; color: gray;"> 조회수 ${qna.hit}</span>
					</a></td>
				</tbody>
				</c:forEach>
			</table>
		


		<!-- 페이징 -->
		<div class="ul row">
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
											var html = "<table class='table table-hover'>";
											for (var i = 1; i <= data.length; i++) {

												html += "<tbody id='qnaList'><td>"
														+ "<a href='${pageContext.request.contextPath}/commu/qna_view?board_id="
														+ data[i - 1].board_id
														+ "'>"
														+ data[i - 1].categoryVO.category_id
														+ "<div style='font-weight: bold; font-size: 18px;'>"
														+ data[i - 1].title
														+ "</div>"
														+ "<div>"
														+ data[i - 1].content
														+ "</div> <span>"
														+ data[i - 1].memberVO.nickname
														+ "</span>"
														+ "<span style='font-size: 13px; color: gray;'>"+data[i - 1].pdate+"</span> "
														+ "<span style='font-size: 13px; color: gray;'> 조회수 "
														+ data[i - 1].hit
														+ "</span>" + "</a>"
														+ "</td></tbody>"

											}	
											html += "</table>"
											$(".ul").prepend(html);

										}, //ajax 성공 시 end

										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);

										} // ajax 에러 시 end

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
