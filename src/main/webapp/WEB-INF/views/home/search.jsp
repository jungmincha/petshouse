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
<script type="text/javascript">
	$(document).ready(function() {
		$.fn.generateStars = function() {
			return this.each(function(i, e) {
				$(e).html($('<span/>').width($(e).text() * 16));
			});
		};

		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();
	})
</script>
<style>
#navbars>li:nth-child(1) {
   background-color: #e7ab3c;
}


.count {
	position: absolute;
	bottom: 80px;
	right: 30px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}

.count2 {
	position: absolute;
	bottom: 10px;
	right: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}

.count3 {
	position: absolute;
	bottom: 10px;
	right: 20px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #dddddd;
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

.more {
	font-size: 13px;
	padding: 0.01px;
}

.profile_box {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile {
	width: 40px;
	height: 40px;
	object-fit: cover;
}

#sc {
	color: #FFBF00;
	font-weight: bold;
	font-size: 20px;
}

#mb {
	color: #FFBF00;
}
</style>

	
	<script>
		$(document).ready(function(){
			function add(){
				var gc = $('#gcount').val();
				var tc = $('#tcount').val();
				var qc = $('#qcount').val();
				var sc = $('#scount').val();
			
			
				var add = parseInt(gc)+parseInt(tc)+parseInt(qc)+parseInt(sc);
				console.log(add);
				
				var total = document.createElement('div');
				total.id = "ddd"
				
				document.getElementById("table").appendChild(total);
			
				
			}
			add();
		 });
	</script>

</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">

	<div id="total"></div>
	<input type="hidden" id="gcount" value="${gcount}">
	<input type="hidden" id="tcount" value="${tcount}">
		<input type="hidden" id="qcount" value="${qcount}">
	<input type="hidden" id="scount" value="${scount}">
	
		<c:if test="${gcount != 0}">
			<form action="${pageContext.request.contextPath}/moregoods"
				method="get">
				<input type="hidden" name="keyword" value="${param.keyword}">					
				<span style="font-size: 20px; font-weight: bold;">스토어 </span><span
					id="sc">${gcount} </span> <span>
					<button id="mb" style="float: right" class="more btn btn-disabled"
						type="submit">더보기</button>
				</span>

			</form>
			<hr>



			<div id="table" class="row text-center"
				style="margin-top: 20px; margin-left: 5px; margin-bottom: 30px;">
				<c:forEach items="${moregoods}" var="gs">
					<div class="product-item col-sm-3">
						<div class="pi-pic">
							<a href="/admin/goods_detail/${gs.board_id}"> <img
								src="/resources/img/admin/goods/${gs.goodsVO.thumbnail}" alt=""
								style="width: 160px; height: 230px; border-radius: 6px;"></a>
						</div>
						<div class="pi-text">
							<h6>${gs.goodsVO.goodsname}</h6>
							<div class="product-price">${gs.goodsVO.price}원</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>

		<c:if test="${scount != 0}">
			<form action="${pageContext.request.contextPath}/moresns"
				method="get">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<span style="font-size: 20px; font-weight: bold;">SNS </span> <span
					id="sc">${scount} </span> <span>
					<button id="mb" style="float: right" class="more btn btn-disabled"
						type="submit">더보기</button>
				</span>

			</form>
			<hr>

			<div id="table" class="row text-center"
				style="margin-left: 5px; margin-bottom: 30px;">


				<div id="snslist" class="row text-center">
					<c:forEach items="${moresns}" var="ms">
						<div class=" col-12 col-md-4 col-lg-3">

							<div class="user-Info row" style="margin: 20px auto 0px 5px">
								<div class="profile_box ">

									<img
										src="/resources/img/member/profile/${ms.boardVO.memberVO.thumbnail}"
										name="profile" alt="" class="profile" />
								</div>
								<div style="padding: 7px">${ms.boardVO.memberVO.nickname }
								</div>
								<a href="/myPage/${ms.boardVO.memberVO.nickname}"
									style="padding: 7px;"> 팔로우</a>


							</div>

							<div class="pi-pic shot">
								<a href="/commu/sns/${ms.boardVO.board_id}"> <img
									src="/resources/img/member/sns/${ms.imgname}" alt=""
										style="border-radius: 5px; height:250px; width:250px;" /><span
									class="count">조회수 ${ms.boardVO.hit}</span></a>
							</div>
							<div class="card-body">좋아요${ms.boardVO.plike}//댓글수</div>
						</div>


					</c:forEach>
				</div>
			</div>
		</c:if>

		<c:if test="${tcount != 0}">
			<form action="${pageContext.request.contextPath}/moretips"
				method="get">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<span style="font-size: 20px; font-weight: bold;">노하우 </span><span
					id="sc">${tcount}</span> <span>
					<button id="mb" style="float: right" class="more btn btn-disabled"
						type="submit">더보기</button>
				</span>

			</form>
			<hr>

			<div id="table" class="row text-center"
				style="margin-left: 5px; margin-bottom: 30px;">

				<c:forEach items="${moretips}" var="ts">
					<div class="product-item col-sm-3">
						<a href="/commu/tips/${ts.boardVO.board_id}">
							<div class="pi-pic shot">
								<img src="/resources/img/tips/${ts.imgname}" alt=""
									style="border-radius: 5px; height: 150px;"> <span
									class="count3">조회수 ${ts.boardVO.hit}</span>
							</div>
							<div class="pi-text" style="text-align: left; padding-top: 5px;">
								<h6 style="font-size: 15px; font-weight: bold;">${ts.boardVO.title}</h6>
							</div>
						</a>
						<div style="font-size: 14px; text-align: left;">${ts.boardVO.memberVO.nickname}</div>
					</div>
				</c:forEach>
			</div>
		</c:if>


		<c:if test="${qcount != 0}">
			<form action="${pageContext.request.contextPath}/moreqna"
				method="get">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<span style="font-size: 20px; font-weight: bold;">질문과 답변 </span> <span
					id="sc">${qcount} </span> <span>
					<button id="mb" style="float: right" class="more btn btn-disabled"
						type="submit">더보기</button>
				</span>
			</form>

			<hr>


			<div>
				<c:forEach items="${moreqna}" var="qs">
					<a href="/commu/qna/${qs.board_id}">

						<form action="${pageContext.request.contextPath}/search" method="get">
							<div style="font-weight: normal; font-size: 18px;">${qs.title}</div>
							<ul class="pd-tags">
								<div>${qs.content}</div>
								<span>${qs.memberVO.nickname}</span>
								<span style="font-size: 13px; color: gray;"><fmt:formatDate	value="${qs.pdate}" pattern="yyyy.MM.dd" /></span>
								<span style="font-size: 13px; color: gray;"> 조회수 ${qs.hit}</span>
								<c:set var="hashtag" value="${qs.hashtag}" />
								<c:set var="tag" value="${fn:split(hashtag, '#')}" />
								<c:forEach var="t" items="${tag}">
									<span> 
									<c:if test="${not empty qs.hashtag}">
										<button id="hashtag" name="keyword" class="btn btn-disabled" style="" value="${t}"
											onclick="location.href='${pageContext.request.contextPath}/search'">#${t}</button>
									</c:if>
									</span>
		</c:forEach>

		</ul>
		</form>
		</a>
		<hr>
		</c:forEach>

	</div>
	</c:if>
	</div>

	<!-- Blog Section End -->

	<div style="margin-top: 90px;">
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