<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카테고리</title>

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<meta name="viewport" content="width=device-width, initial-scale=1">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/sidemenu/js/custom.js"></script>

<!-- Bootstrap -->
<link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- font-awesome -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"	rel="stylesheet"> -->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	data-search-pseudo-elements></script>

<!-- styles -->
<link href="/resources/sidemenu/css/styles.css" rel="stylesheet">

<style>
a {
	cursor: pointer;
}

.single-banner {
	padding-bottom: 40px;
}

.product-item {
	padding-top: 40px;
}

.section-title {
	padding-top: 150px;
}

.product-item img {
	width: 200px;
	height: 280px;
}

span.star-prototype, span.star-prototype>* {
	height: 16px;
	background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	display: inline-block;
}

span.star-prototype>* {
	background-position: 0 0;
	max-width: 80px;
}

#navbars>li:nth-child(3) {
	background-color: #e7ab3c;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		console.log("${category_id}")

		var category = $("#category").val();

		var form = {
			category : category,
			name : "${categoryName}",
		};

		var url = "/category/smallcategory/" + "${category_id}";

		$.ajax({
			type : "POST",
			contentType : 'application/json; charset=utf-8',
			url : url,
			data : JSON.stringify(form),
			cache : false,
			success : function(data) {
				console.log("SUCCESS : ", data);

				$('#input').html(data);
				console.log(id);
				console.log(name);
				console.log(animal);
			},
			error : function(e) {
				console.log("ERROR : ", e);
			}
		});

	});

	function fire_ajax_submit(id, name) {
		console.log(id);
		console.log(name);

		var category = $("#category").val();

		var form = {
			category : category,
			name : name,
		};

		var url = "/category/smallcategory/" + id;

		$.ajax({
			type : "POST",
			contentType : 'application/json; charset=utf-8',
			url : url,
			data : JSON.stringify(form),
			cache : false,
			success : function(data) {
				console.log("SUCCESS : ", data);
				$("#changeLang").remove();
				$('#input').html(data);
				console.log(id);
				console.log(name);
				console.log(animal);
			},
			error : function(e) {
				console.log("ERROR : ", e);
			}
		});
	}

	function chageLangSelect() {
		var target = document.getElementById("selectBox");

		console.log('선택된 옵션 value 값='
				+ target.options[target.selectedIndex].value);

		var category = $("#category").val();

		var form = {
			category : category,
		};

		var url = "/category/" + target.options[target.selectedIndex].value;

		$.ajax({
			type : "POST",
			contentType : 'application/json; charset=utf-8',
			url : url,
			data : JSON.stringify(form),
			cache : false,
			success : function(data) {
				console.log("SUCCESS : ", data);

				$('#input').html(data);
			},
			error : function(e) {
				console.log("ERROR : ", e);
			}
		});
	}

	$(document).ready(function() {

		$.fn.generateStars = function() {
			return this.each(function(i, e) {
				$(e).html($('<span/>').width($(e).text() * 16));
			});
		};

		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();
	});
</script>

</head>

<body style="padding-top: 50px">
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- header -->

	<!-- Page Content -->


	<div class="container">

		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>카테고리</h2>
				</div>
			</div>
		</div>

		<!-- 카테고리 부트스트랩 start -->
		<div class="col-lg-2">
			<div class="sidebar" style="display: block;">

				<!-- 카테고리 고양이 start -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 20px;">
							<i class="fas fa-cat"></i> ${category[0].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- small category menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo" begin="0" end="6">
								<li><a href="#" style="font-size: 15px;"
									onclick="fire_ajax_submit('${vo.category_id}' , '${category[0].categoryname} / ${vo.categoryname}');">
										${vo.categoryname} </a></li>
							</c:forEach>
						</ul> <!-- small category menu --></li>
				</ul>
				<!-- 카테고리 고양이 end -->

				<!-- 카테고리 강아지 start -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 20px;">
							<i class="fas fa-dog"></i> ${category[1].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- small category menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo2" begin="7" end="13">
								<li><a href="#" style="font-size: 15px;"
									onclick="fire_ajax_submit('${vo2.category_id}' , '${category[1].categoryname} / ${vo2.categoryname}');">
										${vo2.categoryname} </a></li>
							</c:forEach>
						</ul> <!-- small category menu --></li>
				</ul>
				<!-- 카테고리 강아지 end -->

				<!-- 카테고리 조류 start -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 20px;">
							<i class="fas fa-frog"></i> ${category[2].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- small category menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo3" begin="14" end="17">
								<li><a href="#" style="font-size: 15px;"
									onclick="fire_ajax_submit('${vo3.category_id}' , '${category[2].categoryname} / ${vo3.categoryname}');">
										${vo3.categoryname} </a></li>
							</c:forEach>
						</ul> <!-- small category menu --></li>
				</ul>
				<!-- 카테고리 조류 end -->

				<!-- 카테고리 어류 start -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 20px;">
							<i class="fas fa-fish"></i> ${category[3].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- small category menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo4" begin="18" end="24">
								<li><a href="#" style="font-size: 15px;"
									onclick="fire_ajax_submit('${vo4.category_id}' , '${category[3].categoryname} / ${vo4.categoryname}');">
										${vo4.categoryname} </a></li>
							</c:forEach>
						</ul> <!-- small category menu --></li>
				</ul>
				<!-- 카테고리 어류 end -->

				<!-- 카테고리 파충류 start -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 20px;">
							<i class="fas fa-crow"></i> ${category[4].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- small category menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo5" begin="25" end="29">
								<li><a href="#" style="font-size: 15px;"
									onclick="fire_ajax_submit('${vo5.category_id}' , '${category[4].categoryname} / ${vo5.categoryname}');">
										${vo5.categoryname} </a></li>
							</c:forEach>
						</ul> <!-- small category menu --></li>
				</ul>
				<!-- 카테고리 파충류 end -->

				<!-- 카테고리 기타 start -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 20px;">
							<i class="fas fa-paw"></i> ${category[5].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- small category menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo6" begin="30" end="36">
								<li><a href="#" style="font-size: 15px;"
									onclick="fire_ajax_submit('${vo6.category_id}' , '${category[5].categoryname} / ${vo6.categoryname}');">
										${vo6.categoryname} </a></li>
							</c:forEach>
						</ul> <!-- small category menu --></li>
				</ul>
				<!-- 카테고리 기타 end -->

			</div>
		</div>
		<!--  카테고리 부트스트랩 end -->

		<!--가져올 부분-->
		<div class="row" id="changeLang">
			<div class="col-md-10">

				<select name="selectBox" id="selectBox"
					style="border: none; font-size: 20px" onchange="chageLangSelect()">
					<option style="font-size: 20px;" value="home_return">전체</option>
					<option style="font-size: 20px;" value="rowprice">가격 낮은순</option>
					<option style="font-size: 20px;" value="highprice">가격 높은순</option>
					<option style="font-size: 20px;" value="highstar">별점 높은순</option>
					<option style="font-size: 20px;" value="highreview">리뷰 많은순</option>
				</select>
			</div>
		</div>
		<!--가져올 부분-->


		<div id="input" class="row">
			<c:forEach items="${goods}" var="goods">

				<div class="product-item">
					<div class="pi-text" style="padding: 10px;">
						<a href="/admin/goods_detail/${goods.board_id}"> <img
							src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}"
							alt="">
							<h5>${goods.goodsVO.goodsname}</h5>
						</a>
						<div class="product-price">
							<fmt:formatNumber value="${goods.goodsVO.price}" pattern="#,###" />
							원
						</div>
						<c:forEach items="${rate}" var="rate">
							<c:if test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
								
								별점 <span class="star-prototype"> ${rate.avgscore}</span>
								<span>&nbsp; 리뷰 ${rate.count}</span>
							</c:if>
						</c:forEach>
					</div>
				</div>

			</c:forEach>

		</div>

		<!-- 페이징 -->
		<%-- <div class="ul">
			<ul class="pagination justify-content-center"
				style="padding-bottom: 50px; padding-top: 50px;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="home${pageMaker.makeQuery(pageMaker.startPage - 1) }">
							Previous</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
					<li class="page-item"><a class="page-link"
						href="home${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="home${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
				</c:if>
			</ul>
		</div> --%>



	</div>
	<!-- container end -->




	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- Footer -->

	<!-- Bootstrap core JavaScript -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.zoom.min.js"></script>
	<script src="/resources/js/jquery.dd.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		console.log($(".product-item").hasClass("star-prototype"));
	})
</script>
</html>