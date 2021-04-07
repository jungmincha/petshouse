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
</head>

<body style="padding-top:180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<!-- Blog Section Begin -->
	<section class="blog-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
					<div class="blog-sidebar">

						<a class="btn btn-warning" style="width: 265px;" href="tips_write">노하우
							작성하기</a><br> <br>

						<div class="search-form">
							<h4>노하우 검색</h4>
							<form
								action="${pageContext.request.contextPath}/commu/tipssearch"
								method="post">
								<input type="text" name="keyword" placeholder="검색해보세요">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
						<div class="blog-catagory">
							<h4>Categories</h4>
							<ul>
								<li><a href="#">Fashion</a></li>
								<li><a href="#">Travel</a></li>
								<li><a href="#">Picnic</a></li>
								<li><a href="#">Model</a></li>
							</ul>
						</div>
						<div class="recent-post">
							<h4>Recent Post</h4>
							<div class="recent-blog">
								<a href="#" class="rb-item">
									<div class="rb-pic">
										<img src="img/blog/recent-1.jpg" alt="">
									</div>
									<div class="rb-text">
										<h6>The Personality Trait That Makes...</h6>
										<p>
											Fashion <span>- May 19, 2019</span>
										</p>
									</div>
								</a> <a href="#" class="rb-item">
									<div class="rb-pic">
										<img src="img/blog/recent-2.jpg" alt="">
									</div>
									<div class="rb-text">
										<h6>The Personality Trait That Makes...</h6>
										<p>
											Fashion <span>- May 19, 2019</span>
										</p>
									</div>
								</a> <a href="#" class="rb-item">
									<div class="rb-pic">
										<img src="img/blog/recent-3.jpg" alt="">
									</div>
									<div class="rb-text">
										<h6>The Personality Trait That Makes...</h6>
										<p>
											Fashion <span>- May 19, 2019</span>
										</p>
									</div>
								</a> <a href="#" class="rb-item">
									<div class="rb-pic">
										<img src="img/blog/recent-4.jpg" alt="">
									</div>
									<div class="rb-text">
										<h6>The Personality Trait That Makes...</h6>
										<p>
											Fashion <span>- May 19, 2019</span>
										</p>
									</div>
								</a>
							</div>
						</div>
						<div class="blog-tags">
							<h4>Product Tags</h4>
							<div class="tag-item">
								<a href="#">Towel</a> <a href="#">Shoes</a> <a href="#">Coat</a>
								<a href="#">Dresses</a> <a href="#">Trousers</a> <a href="#">Men's
									hats</a> <a href="#">Backpack</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-9 order-1 order-lg-2">
					
						<c:forEach items="${tsearch}" var="ts">
							<table class="table table-hover">
								<tbody>
									<td>
									<a href="${pageContext.request.contextPath}/commu/tips_view?board_id=${ts.board_id}">
											<div style="font-weight: bold; font-size: 18px;">${ts.title}</div>
											<div>${ts.content}</div> <span>${ts.memberVO.nickname}</span>
											<span style="font-size: 13px; color: gray;">${ts.pdate}</span>
											<span style="font-size: 13px; color: gray;"> 조회수
												${ts.hit}</span>
									</a>
									</td>
								</tbody>
							</table>
						</c:forEach>
					
				</div>
			</div>

		</div>
	</section>
	<!-- Blog Section End -->

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