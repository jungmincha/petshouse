<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

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

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script>
	$(function() {

		$("#sel").change(function() {

			location.href = "/map/home"

		});

	});
</script>

<style>
.jumbotron {
	text-align: center;
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

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #dddddd;
}

.top {
	background-color: #e7ab3c;
	border-radius: 10px;
	cursor: pointer;
	position: fixed;
	right: 5px;
	font-size: 15px;
	bottom: 500px;
	padding: 10px;
}

body::-webkit-scrollbar {
	width: 10px;
}

body::-webkit-scrollbar-thumb {
	background-color: #666666;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

body::-webkit-scrollbar-track {
	background-color: #CCCCCC;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
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

</style>



</head>
<body style="padding-top: 128px">

	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Login Check -->



	<!-- Contact Section Begin -->
	<section class="contact-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<!-- 위치 다시 선정하기 -->
					<select id="sel" style="border: none; font-size: 22px;">
						<option value='${location}' selected>${location}</option>
						<option value="relocaion">위치 다시 설정하기</option>
					</select> <br> <br>

		

					<!-- 글작성 폼 -->
					<form action="/map/write_view" method="get">
						<!-- 전달할 값들 -->
						<input id="location" type="hidden" name="location"
							value="${location}" /> <input type="hidden" id="member_id"
							name="member_id"
							value="<sec:authentication property="principal.member_id"/>">
				


						<!-- 커뮤니티 카테고리별 분류 셀렉트 BOX -->
						<div class=" row" style="padding-bottom: 30px;">
							<select name="hashtag" id="hashtag" class="form-control col-sm-1"
								style="margin-left: 15px; text-align-last: center; font-size: 18px;">
								<option value="전체">전체</option>
								<option value="우리동네질문">우리동네질문</option>
								<option value="분실/실종센터">분실/실종센터</option>
								<option value="일상">일상</option>
								<option value="맛집">맛집</option>
								<option value="취미생활">취미생활</option>
								<option value="여행">여행</option>
								<option value="기타">기타</option>

							</select> <span class="col-sm-9"></span>

							<button class="btn btn-outline-secondary col-sm-1" id="qw"
								style="margin-left: 65px;" type="submit">글 작성</button>
						</div>
					</form>

					<br />



						<!-- board 테이블 -->
						<table class="table">
						<c:forEach items="${list}" var="list">
						
							<tbody id="mapList">
								<td>
								<a href="/map/board/${list.boardVO.board_id}?location=${location}&member_id=${member_id}">

								
									
								
											
										<!-- 회원 썸네일 -->
										<div class="user-Info row" style="margin: 20px auto 0px 5px">
									    <div class="profile_box ">
										<img src="/resources/img/member/profile/${list.boardVO.memberVO.thumbnail}" name="profile" alt="" class="profile" />
										</div>
										<div style="padding:7px"> ${list.boardVO.memberVO.nickname} </div>	
										</div>
										
										
									
										
						
											<!-- 게시글 정보 -->
											<span style="font-size: 13px; color: gray;"><fmt:formatDate value="${list.boardVO.pdate}" pattern="yyyy.MM.dd" /></span>
											<span style="font-size: 13px; color: gray;"> 조회수${list.boardVO.hit}</span>
											<span style="font-size: 13px; color: gray;"> 좋아요${list.boardVO.plike}</span>
											<span style="font-size: 13px; color: gray;">${list.boardVO.hashtag}</span>
																							
											<!-- 게시글 썸네일 -->			
											<div><img src="/resources/img/location/${list.imgname}" style="width:400px; height:350px;">
											<br>	
											<br>
											<div>${list.boardVO.content}</div></a>
								
								 <!-- 해시태그 --> 
								<c:set var="hashtag" value="${list.boardVO.hashtag}" />
									<c:set var="tag" value="${fn:split(hashtag, ' ')}" /> 
									<c:forEach var="t" items="${tag}">
										<span><button id="hashtag" name="keyword"
												class="btn btn-disabled" style="" value="${t}"
												onclick="location.href='${pageContext.request.contextPath}/map/qnatag'">${t}</button></span>
									</c:forEach>
								
								
								
								</td>
							</tbody>
						</c:forEach>

					</table>




					<!-- 페이징 -->
					<div class="ul">
						<ul class="pagination justify-content-center"
							style="padding-bottom: 50px; padding-top: 50px;">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link"
									href="board?location=${location}&member_id=${member_id}${pageMaker.makeQuery(pageMaker.startPage - 1) }">
										Previous</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
								<li class="page-item"><a class="page-link"
									href="board?location=${location}&member_id=${member_id}${pageMaker.makeQuery(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link"
									href="board?location=${location}&member_id=${member_id}${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
							</c:if>
						</ul>
					</div>


				</div>

			</div>
		</div>
	</section>

	<script type="text/javascript">
		$('#hashtag')
				.change(
						function() {
							var hashtag = $(this).val();
							var location = $('#location').val();
							console.log("너의 해시태그는 뭐니?" + hashtag);
							console.log("너의 장소는 뭐니?" + location);

							if (hashtag == "전체") {
								console.log(hashtag);
								window.location.href = "/map/board?location=${location}&nickname=${nickname}&member_id=${member_id}";
							}

							var url = "/map/location/tag";
						
							$.ajax({
										url : url,
										type : "get",
										data : {
											hashtag : hashtag,
											location : location,
										},
										success : function(data) {

											console.log(data);
											$(".table").empty();
											var html = "<table class='table'>";
											for (var i = 1; i <= data.length; i++) {

												html += "<tbody id='qnaList'><td>"
														+ "<a href='${pageContext.request.contextPath}/commu/qna_view?board_id="
														+ data[i - 1].boardVO.board_id
														+ "'>"

														+ "<div style='font-weight: bold; font-size: 18px;'>"
														+ data[i - 1].boardVO.title
														+ "</div>"
														+ "<div>"
														+ data[i - 1].content
														+ "</div> <span>"
														+ data[i - 1].boardVO.memberVO.nickname
														+ "</span>"
														+ "<span style='font-size: 13px; color: gray;'>"
														+ data[i - 1].boardVO.pdate
														+ "</span> "
														+ "<span style='font-size: 13px; color: gray;'> 조회수 "
														+ data[i - 1].boardVO.hit
														+ "</span>"
														+ "</a>"
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




</body>
</html>