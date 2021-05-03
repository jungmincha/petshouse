
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>상품관리</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Css Styles -->
 
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

<script type="text/javascript">
	//delete ajax
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
	// 카테고리 ajax
	function fire_ajax_submit(id) {
		console.log(id);
		var category = {}
		category["category"] = $("#category").val();

		var url = "/admin/goods/category/" + id;

		$.ajax({
			type : "POST",
			contentType : 'application/json; charset=utf-8',
			url : url,
			data : JSON.stringify(category),
			cache : false,

			success : function(data) {

				console.log("SUCCESS : ", data);

				$('#input').html(data);
				console.log(id);

			},
			error : function(e) {
				console.log("ERROR : ", e);

			}
		});

	}
</script>

<style>
 
 body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 60%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 150px;
  left: 0;
  background-color: #f5f5f5;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
  opacity: 0.7;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #fffff;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
 


tr{
	font-size : 16px;
	text-align: center;
}
td{
	font-size : 15px;
	text-align: center;
	}
</style>

</head>


<body style="padding-top: 200px">

  
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
 
	<!-- Page Content -->
	<!-- Product Shop Section Begin -->

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="/admin/goods">상품관리</a>
  <a href="/admin/member_list">회원관리</a>
  <a href="/room">채팅관리</a>
  <a href="/statistics/main/home">통   계</a>

</div>


<span style="font-size:30px;cursor:pointer; position: fixed; top:160px; left : 190px; color:#a6a1a1;" onclick="openNav()"> 관리자홈</span>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "180px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
   


	<div class="container">

		<div class="row">

			  <div class="col-lg-2">
				<%@ include file="/WEB-INF/views/include/category.jsp"%>
			</div>  
			 
			<div class="col-lg-10">
				<div id="input">
				
				  <div class="section-title">
					<h2 style="margin-bottom:20px; font-size:30px; ">상품 관리</h2>
				 </div>  
				<div class="col-lg-10">
								<a class="btn btn-outline-secondary col-sm-1 " style="position:fixed; top:200px; right:200px;" href="/admin/board/registerView">상품게시글등록</a> 
								<a class="btn btn-outline-secondary col-sm-1 " style="position:fixed; top:170px; right:200px;" href="/admin/goods/registerView">상품등록</a>
				 </div>
				 
					<table class="table table-hover">
						<thead>
						<tr>
							<th>상품번호</th>
							<th>상품사진</th>
							<th>상품명</th>
							<th>가격</th>
							<th>재고상태</th>
							<th>등록여부</th>
							<th>삭제</th>
						</tr>
						</thead>
						<c:forEach items="${list}" var="goods">
							<tbody id="goodsList">
							<tr onClick="location.href='/admin/goods/${goods.goods_id}'" style="cursor: pointer;">
								<td>${goods.goods_id}</td>
								<td><img src="/resources/img/admin/goods/${goods.thumbnail}" style="width:70px; height:80px;"/></td>
								<td><div style="font-weight:bold; font-size:15px;">${goods.goodsname}</div></td>
								<td><fmt:formatNumber value="${goods.price}"
										pattern="###,###,###" />원</td>
								<td>${goods.stockVO.stockname}</td>
								<td><span style="font-size: 13px; color: gray;">${goods.pcheck}</span></td>
								<td onclick="event.cancelBubble=true;">
								<a class="a-delete" data-bid='${goods.goods_id}' href="/admin/goods/${goods.goods_id}">삭제</a></td>
							</tr>
							</tbody>
						</c:forEach>
					</table>
				

					<!-- 페이징처리 -->
					<ul class="pagination justify-content-center"
						style="padding-bottom: 50px; padding-top: 50px;">

						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"
								href="goods${pageMaker.makeQuery(pageMaker.startPage - 1) }">Previous</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
							<li class="page-item"><a class="page-link"
								href="goods${pageMaker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>


						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link"
								href="goods${pageMaker.makeQuery(pageMaker.endPage +1) }">
									Next</a></li>
						</c:if>
					</ul>

					<br>
				</div>
			</div> 
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


</body>



<!-- Js Plugins -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>

<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>


</html>