<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>공지사항</title>

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
</style>
<script>
	$(document).ready(function() {
		$('.a-delete').click(function(event) {

			event.preventDefault();

			var trObj = $(this).parent().parent();

			$.ajax({
				type : "DELETE",
				url : $(this).attr("href"),
				cache : false,
				success : function(result) {
					console.log(result);
					if (result == "SUCCESS") {
						//getList();
						$(trObj).remove();

					}
				},
				error : function(e) {
					console.log(e);
				}
			})

		});
	});
</script>
</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
	<div class="row">
	<h3 style="margin-bottom:20px;">공지 사항 관리</h3>

		
		<!-- 게시글 끌고오기 -->

		
			<div class="col-lg-12">
			<button class="btn btn-outline-secondary col-sm-1" id="nw"
			style="margin-left: 65px; float:right;  margin-bottom:20px;"
			onclick="location.href='${pageContext.request.contextPath}notice_write'">공지 작성</button>

				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
							<th>삭제</th>
					</thead>
					<c:forEach items="${notice}" var="nt">
						<tbody id="noticeList">
							<tr>

								<td><span>${nt.board_id}</span></td>
								<td><a
									href="${pageContext.request.contextPath}/admin/notice_view?board_id=${nt.board_id}">
										<div style="font-weight: bold; font-size: 18px;">${nt.title}</div>
								</a></td>
								<td><span>${nt.memberVO.nickname}</span></td>
								<td><span>${nt.hit}</span></td>
								<td><span style="font-size: 13px; color: gray;">
								<fmt:formatDate value="${nt.pdate}" pattern="yyyy.MM.dd" /></span></td>
								<td onclick="event.cancelBubble=true;"><a class="a-delete"
									data-bid='${nt.board_id}' href="/admin/notice/${nt.board_id}">삭제</a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

			</div>
		</div>


		<!-- 페이징 -->
		<div class="ul">
			<ul class="pagination justify-content-center"
				style="padding-bottom: 50px; padding-top: 50px;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="notice${pageMaker.makeQuery(pageMaker.startPage - 1) }">
							Previous</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
					<li class="page-item"><a class="page-link"
						href="notice${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="notice${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<!-- container end -->
	<script>
	
	var date =getFormatDate($('.pdate').val());
	console.log($('.pdate').val());
	
	function getFormatDate(date) {
	
        var date = date.substr(0, 10);
        
        console.log(date);
        return date; 
     }
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
