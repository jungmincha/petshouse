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
#navbars>li:nth-child(3) {
   background-color: #e7ab3c;
}

</style>


</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
	<input type="hidden" id="member_id" name="member_id"
		value="<sec:authentication property="principal.member_id"/>">
	<input type="hidden" id="nickname" name="nickname"
		value="<sec:authentication property="principal.nickname"/>">
</sec:authorize>

	<div class="container">
	<div class="row">
	<h3 style="margin-bottom:15px;">공지 사항</h3>      
		
		
  			<!-- 관리자에게만 작성버튼 띄우기 -->
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<div class="col-lg-12">
					<button class="btn btn-outline-secondary" id="nw"
						style="margin-left: 65px; float:right;  margin-bottom:20px;"
						onclick="location.href='${pageContext.request.contextPath}notice/write'">공지 작성</button>
			 	</div> 
			</sec:authorize>

				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						
					</thead>
					<c:forEach items="${notice}" var="nt">
						<tbody id="noticeList">
							<tr>
								<td><span>${nt.rnum}</span></td>
								<td><a
									href="${pageContext.request.contextPath}/admin/notice/${nt.board_id}">
										<div style="font-weight: bold; font-size: 18px;">${nt.title}</div>
								</a></td>
								<td><span>${nt.memberVO.nickname}</span></td>
								<td><span>${nt.hit}</span></td>
								<td><span style="font-size: 13px; color: gray;">
								<fmt:formatDate value="${nt.pdate}" pattern="yyyy.MM.dd" /></span></td>
						
								
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
