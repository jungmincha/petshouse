<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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

<style>
p {
	margin: 20px 0px;
}

.i {
	width: 269px;
	height: 269px;
	object-fit: cover;
}
</style>
</head>
<body style="padding-top: 170px">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Category Section Begin -->
	<div class="container">
		<h2>SNS</h2> 
			<a class="btn btn-warning float-right" href="/commu/sns/write_view">게시글등록</a>
		 

		<div class="row ">
			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/cat.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/dog.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/reptile.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/bird.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/fish.jpg"></a>
			</div>

			<div class="col-sm-2">
				<a href=" "> <img src="/resources/img/category/other.jpg"></a>
			</div>
		</div>

		<!-- Category Section End -->


		
		<div class="row">

			<div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">

				<a href="#">팔로우</a>
				<div class="card">
					<img src="/resources/img/admin/goods/cat1.jpg" alt=""
						class="card-img-top i" />
					<div class="card-body">
						<div>
							<div class="w3-border w3-center w3-padding">

								<i class="fa fa-heart" style="font-size: 16px; color: red"></i>
								<span class="rec_count"></span>


								<button class="w3-button w3-black w3-round" id="rec_update">
									<i class="fa fa-heart" style="font-size: 16px; color: red"></i>
									&nbsp;<span class="rec_count"></span>
								</button>

							</div>
						</div>


						<h5 class="card-title">Lorem</h5>
						<p class="card-text">Lorem ipsum dolor sit amet</p>

					</div>
				</div>
			</div>
			<div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">
				<a href="#">팔로우</a>
				<div class="card">
					<img src="/resources/img/admin/goods/cat2.jpg" alt=""
						class="card-img-top i" />
					<div class="card-body">
						<h5 class="card-title">Lorem</h5>
						<p class="card-text">Lorem ipsum dolor sit amet</p>

					</div>
				</div>
			</div>
			<div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">
				<a href="#">팔로우</a>
				<div class="card">
					<img src="/resources/img/admin/goods/cat4.jpg" alt=""
						class="card-img-top i" />
					<div class="card-body">
						<h5 class="card-title">Lorem</h5>
						<p class="card-text">Lorem ipsum dolor sit amet</p>

					</div>
				</div>
			</div>
			<div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">
				<a href="#">팔로우</a>
				<div class="card">
					<img src="/resources/img/admin/goods/부뚜냥.png" alt=""
						class="card-img-top i" />
					<div class="card-body">
						<h5 class="card-title">Lorem</h5>
						<p class="card-text">Lorem ipsum dolor sit amet</p>

					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">
				<a href="#">팔로우</a>
				<div class="card">
					<img src="/resources/img/admin/goods/호호.jpg" alt=""
						class="card-img-top i" />
					<div class="card-body">
						<h5 class="card-title">Lorem</h5>
						<p class="card-text">Lorem ipsum dolor sit amet</p>

					</div>
				</div>
			</div>
			<div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">
				<a href="#">팔로우</a>
				<div class="card">
					<img src="/resources/img/admin/goods/cat1.jpg" alt=""
						class="card-img-top i" />
					<div class="card-body">
						<h5 class="card-title">Lorem</h5>
						<p class="card-text">Lorem ipsum dolor sit amet</p>

					</div>
				</div>
			</div>
			<div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">
				<a href="#">팔로우</a>
				<div class="card">
					<img src="/resources/img/admin/goods/cat1.jpg" alt=""
						class="card-img-top i" />
					<div class="card-body">
						<h5 class="card-title">Lorem</h5>
						<p class="card-text">Lorem ipsum dolor sit amet</p>

					</div>
				</div>
			</div>
			<div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">
				<a href="#">팔로우</a>
				<div class="card">
					<img src="/resources/img/admin/goods/cat2.jpg" alt=""
						class="card-img-top i" />
					<div class="card-body">
						<h5 class="card-title">Lorem</h5>
						<p class="card-text">Lorem ipsum dolor sit amet</p>

					</div>
				</div>
			</div>
		</div>
	</div>














	<script>
		$(document)
				.ready(
						function() {

							var heartval = $
							{
								heart
							}
							;

							if (heartval > 0) {
								console.log(heartval);
								$("#heart").prop("src",
										"/resources/images/like2.png");
								$(".heart").prop('name', heartval)
							} else {
								console.log(heartval);
								$("#heart").prop("src",
										"/resources/images/like1.png");
								$(".heart").prop('name', heartval)
							}

							$(".heart")
									.on(
											"click",
											function() {

												var that = $(".heart");

												var sendData = {
													'boardId' : '${boardVO.boardId}',
													'heart' : that.prop('name')
												};
												$
														.ajax({
															url : '/board/heart',
															type : 'POST',
															data : sendData,
															success : function(
																	data) {
																that.prop(
																		'name',
																		data);
																if (data == 1) {
																	$('#heart')
																			.prop(
																					"src",
																					"/resources/images/like2.png");
																} else {
																	$('#heart')
																			.prop(
																					"src",
																					"/resources/images/like1.png");
																}

															}
														});
											});
						});
	</script>








	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>


<!-- Js Plugins -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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

</html>