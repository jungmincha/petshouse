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
<title>펫츠하우스</title>

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
		$('#tw').click(function() {
			checkLogin();
		});
		
	});
</script>

</head>


<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- content -->
	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="member_id"
			value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>


	<div class="container">


		<div class="container">

			<div class="filter-control">
				<ul>
					<li class="active">인기 노하우</li>
				</ul>
			</div>
			<div class="product-slider owl-carousel" id="box">

				<c:forEach items="${rate}" var="rate">
					<c:if test="${rate.rnum le 10}">
						<div class="product-item">
							<div class="pi-pic">

								<div class="product-item">
									<a
										href="${pageContext.request.contextPath}/commu/tips_view?board_id=${rate.board_id}">
										<img src="/resources/img/qna/201489577_128.jpg" alt=""
										style="border-radius: 5px; height: 150px;">
										<h6 style="font-size: 15px; font-weight: bold;">${rate.title}</h6>
									</a>
									<div style="font-size: 14px;">${rate.memberVO.nickname}</div>
									<div style="font-size: 13px; color: gray;">조회수
										${rate.hit}</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<!-- 동물 카테고리, 정렬, 글쓰기 버튼 -->
		<div class=" row" style="margin-top:100px;padding-bottom: 30px;">

			<select id="selectPet" class="form-control col-2"
				name="categoryVO.category_id"
				style="margin-left: 40px; text-align: center">

				<option value="0">동물</option>
				<option value="1">고양이</option>
				<option value="2">강아지</option>
				<option value="3">파충류</option>
				<option value="4">조류</option>
				<option value="5">어류</option>
				<option value="6">기타</option>
			</select><span class="col-lg-7"></span>

			<button class="btn btn-outline-secondary col-lg-2" id="tw"
				style="margin-left: 42px"
				onclick="location.href='${pageContext.request.contextPath}tips_write'">노하우
				작성</button>
		</div>

		<div id="table" class="row text-center"
			style="margin-top: 20px; margin-left: 5px;">

			<c:forEach items="${tips}" var="tp">
				<div class="product-item col-sm-3">
					<a
						href="${pageContext.request.contextPath}/commu/tips_view?board_id=${tp.board_id}">
						<div class="pi-pic">
							<img src="/resources/img/qna/201489577_128.jpg" alt=""
								style="border-radius: 5px; height: 150px;">
						</div>
						<div class="pi-text" style="text-align: left; padding-top: 5px;">
							<h6 style="font-size: 15px; font-weight: bold;">${tp.title}</h6>
					</a>
					<div style="font-size: 14px;">${tp.memberVO.nickname}</div>
					<div style="font-size: 13px; color: gray;">조회수 ${tp.hit}</div>
				</div>
		</div>
		</c:forEach>
		<br /> <br />
	</div>

	<!-- 페이징 -->
	<div class="ul">
		<ul class="pagination justify-content-center"
			style="padding-bottom: 50px; padding-top: 50px;">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link"
					href="tips${pageMaker.makeQuery(pageMaker.startPage - 1) }">
						Previous</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
				<li class="page-item"><a class="page-link"
					href="tips${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a class="page-link"
					href="tips${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
			</c:if>
		</ul>
		<!-- 페이징 끝 -->
	</div>
	</div>
	</div>

	<!-- Blog Section End -->
	<script type="text/javascript">
		// 해당 동물의 글을 끌고올거야
		$('#selectPet')
				.change(
						function() {
							var category_id = $(this).val();
							console.log(category_id);

							$
									.ajax({
										url : "/commu/tips/pet",
										type : "get",
										data : {
											category_id : category_id,
										},
										success : function(data) {

											console.log(data);
											$("#table").empty();
											var html = "<div id='table' class='table row text-center' style='margin-top:20px; margin-left:5px;'>"
											for (var i = 1; i <= data.length; i++) {

												html += "<div class='product-item col-sm-4' >"
														+ "<a href='${pageContext.request.contextPath}/commu/tips_view?board_id="
														+ data[i - 1].board_id
														+ "'>"
														+ "<div class='pi-pic'>"
														+ "<img src='/resources/img/qna/201489577_128.jpg' alt='' style='border-radius:5px;height:150px;'>"
														+ "</div>"
														+ "<div class='pi-text'  style='text-align:left; padding-top:5px;'>	"					
														+ "<h6 style='font-size:15px;font-weight:bold;'>"
														+ data[i - 1].title
														+ "</h6>"
														+ "</a>"
														+ "<div style='font-size:14px;'>"
														+ data[i - 1].memberVO.nickname  
														+ "</div>"
														+ "<div style='font-size:13px; color:gray;'>조회수" 
														+ data[i - 1].hit 
														+ "</div>"							
														+ "</div>"
														+ "</div>"
														+ "<br /> <br />"
											}
											html += "</div>"
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