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
<!-- Css Styles -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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

/* 헤더 컬러 부여*/
#navbars>li:nth-child(1) {
	background-color: #e7ab3c;
}

span.star-prototype, span.star-prototype>*, span.star, span.star>* {
	height: 16px;
	background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	display: inline-block;
}

span.star-prototype>*, span.star>* {
	background-position: 0 0;
	max-width: 80px;
}
/* 구간 나누기 */
.tab {
	margin-bottom: 50px;
}

hr {
	padding-bottom: 1rem;
}

/* 노하우 조회수 */
.count {
	position: absolute;
	bottom: 37px;
	right: 20px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}
/* sns 조회수*/
.count2 {
	position: absolute;
	bottom: 90px;
	right: 50px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}

img {
	border-radius: 8px;
}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #dddddd;
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
	float: right;
	font-size: 17px;
}

.clone{
	position: absolute;
	top: 65px;
	right: 45px;	
	opacity: 0.4;
	font-size : 20px;
	color : #fff

}

#searchzero{
text-align:center;
margin-top:90px;
}
</style>

</head>

<body style="padding-top: 180px;">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container" style="min-height:600px;">
	<input type="hidden" name="keyword" value="${param.keyword}">
		
		
		<div id="cap">
		
		</div>
		<!-- 검색량 출력 -->
		<div  style="margin-top: 30px;">
			<h5>
				<b>'${param.keyword}'</b>에 대한 검색결과 <span><b id="totalcount" style="color: #FFBF00;"> </b>건</span>
			</h5>
			<br><br>
		</div>
		<div id="total"></div>
		<input type="hidden" id="gcount" value="${gcount}"> 
		<input type="hidden" id="tcount" value="${tcount}"> 
		<input type="hidden" id="qcount" value="${qcount}"> 
		<input type="hidden" id="scount" value="${scount}">

<c:if test="${gcount == 0 && tcount==0 && qcount ==0 && scount ==0}">

					<div id="searchzero" class="col-12">
						 <img  src="/resources/img/storehome/search.png">
					</div>
				</c:if>

		<c:if test="${gcount != 0}">
			<form action="${pageContext.request.contextPath}/moregoods"
				method="get">
				<input type="hidden" name="keyword" value="${param.keyword}">
				<span style="font-size: 20px; font-weight: bold;">스토어 </span><span
					id="sc">${gcount} </span> <span>
					<button id="mb" class="btn btn-disabled" type="submit">더보기</button>
				</span>

			</form>
			<hr>

			<div id="table" class="row"
				style="margin-top: 20px; margin-left: 5px;">

				<c:forEach items="${moregoods}" var="mg">
					<div class="product-item col-sm-3">
						<div class="pi-pic">
							<a href="/admin/goods_detail/${mg.board_id}">
							<img src="/resources/img/admin/goods/${mg.goodsVO.thumbnail}" alt="" style="height:260px;"></a>
						</div>

						<div class="pi-text">
							<a href="/admin/goods_detail/${mg.board_id}">
								<h5>${mg.goodsVO.goodsname}</h5>
							</a>
							<div class="product-price">${mg.goodsVO.price}원</div>
							<c:forEach items="${rate}" var="rate">
								<c:if test="${rate.goodsVO.goods_id eq mg.goodsVO.goods_id}">
									<span class="star-prototype"> ${rate.avgscore}</span>
									<span> &nbsp; ${rate.count}개 리뷰</span>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>


		<div class="tab">
			<c:if test="${scount != 0}">
				<form action="${pageContext.request.contextPath}/moresns"
					method="get">
					<input type="hidden" name="keyword" value="${param.keyword}">
					<span style="font-size: 20px; font-weight: bold;">SNS </span> <span
						id="sc">${scount} </span> <span>
						<button id="mb" class="btn btn-disabled" type="submit">더보기</button>
					</span>

				</form>
				<hr>



				<div id="snslist" class="row">
					<c:forEach items="${moresns}" var="ms">
						<div class="col-12 col-md-4 col-lg-3 ">

							<div class="user-Info row" style="margin: 0px auto 0px 5px">
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
							
							<c:forEach items="${imgCount}" var = "imgCount">
							  <c:if test="${imgCount.boardVO.board_id eq sns.boardVO.board_id and imgCount.count > 1}"> 
								 <i class="far fa-clone clone"></i>
								</c:if> </c:forEach>
							
								<a href="/commu/sns/${ms.boardVO.board_id}"> <img
									src="/resources/img/member/sns/${ms.imgname}"
									style="height: 250px; width:250px;" alt="" /><span
									class="count2">조회수 ${ms.boardVO.hit}</span></a>
							</div>
							<div
								style="font-size: 20px; text-align: center; margin-top: 8px; margin-bottom: 30px;">
								<i class="far fa-heart" style="font-size: 25px;"></i>&nbsp&nbsp${ms.boardVO.plike}
								&nbsp&nbsp&nbsp&nbsp
								<a href="/commu/sns/${ms.boardVO.board_id}"></a>
							<i class="far fa-comment"  style="font-size : 25px;"></i>
							<c:forEach items="${ccount}" var="count">  
							<c:if test="${count.pgroup eq ms.boardVO.board_id}">
							${count.count}</c:if></c:forEach></div>
						</div>

 

					</c:forEach>
				</div>

			</c:if>

			<div class="tab">
				<c:if test="${tcount != 0}">
					<form action="${pageContext.request.contextPath}/moretips"
						method="get">
						<input type="hidden" name="keyword" value="${param.keyword}">
						<span style="font-size: 20px; font-weight: bold;">노하우 </span><span
							id="sc">${tcount}</span> <span>
							<button id="mb" class=" btn btn-disabled" type="submit">더보기</button>
						</span>

					</form>
					<hr>

					<div id="table" class="row"
						style="margin-top: 1rem; margin-bottom: 1rem;">

						<c:forEach items="${moretips}" var="mt">
							<div class="product-item col-sm-6 col-md-4 col-lg-3 ">
								<div class="pi-pic shot">
									<a href="/commu/tips/${mt.boardVO.board_id}"> <img
										src="/resources/img/tips/${mt.imgname}" alt=""
										style="height: 180px;"> <span class="count">조회수
											${mt.boardVO.hit}</span> <span
										style="font-size: 15px; font-weight: bold;">${mt.boardVO.title}</span>
									</a>
								</div>
								<div style="font-size: 14px; text-align: left;">${mt.boardVO.memberVO.nickname}</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</div>

			<div class="tab">
				<c:if test="${qcount != 0}">
					<form action="${pageContext.request.contextPath}/moreqna"
						method="get">
						<input type="hidden" name="keyword" value="${param.keyword}">
						<span style="font-size: 20px; font-weight: bold;">질문과 답변 </span> <span
							id="sc">${qcount} </span> <span>
							<button id="mb" class="btn btn-disabled" type="submit">더보기</button>
						</span>
					</form>

					<hr>



					<c:forEach items="${moreqna}" var="qs">


						<form action="${pageContext.request.contextPath}/search"
							method="get">
							<a href="/commu/qna/${qs.board_id}">
								<div style="font-weight: normal; font-size: 18px;">${qs.title}</div>
								<div>${qs.content}</div>
							</a>
							<div style="margin-bottom: 10px;">
								<span>${qs.memberVO.nickname}</span> <span
									style="font-size: 13px; color: gray;"><fmt:formatDate
										value="${qs.pdate}" pattern="yyyy.MM.dd" /></span> <span
									style="font-size: 13px; color: gray;"> 조회수 ${qs.hit}</span>
								<c:set var="hashtag" value="${qs.hashtag}" />
								<c:set var="tag" value="${fn:split(hashtag, '#')}" />
								<c:forEach var="t" items="${tag}">
									<span> <c:if test="${not empty qs.hashtag}">
											<button id="hashtag" name="keyword" class="btn btn-disabled"
												style="" value="${t}"
												onclick="location.href='${pageContext.request.contextPath}/search'">#${t}</button>
										</c:if>
									</span>
								</c:forEach>
							</div>
						</form>

						<hr>
					</c:forEach>


				</c:if>
			</div>
		</div>
	</div>


<script>
$(document).ready(function(){
	
		var gc = $('#gcount').val();
		var sc = $('#scount').val();
		var qc = $('#qcount').val();
		var tc = $('#tcount').val();
		
		var add = parseInt(gc)+parseInt(sc)+parseInt(qc)+parseInt(tc);
		console.log(add);
		
		var total = document.createElement('span');
		total.id="ddd"
		
		document.getElementById("totalcount").appendChild(total);
		
		$('#ddd').text(add)
	
});
</script>
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