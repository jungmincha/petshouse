
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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


<script type="text/javascript">
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

	function fire_ajax_submit(id) {

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

			},

			error : function(e) {
				console.log("ERROR : ", e);

			}
		});

	}
</script>

<style>
 
 
#navbars>li:nth-child(3) {
   background-color: #e7ab3c;
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

tr{
	font-size : 18px;
	font-weight: bold;
	text-align: center;
}
td{
	font-size : 15px;
	text-align: center;
	}
</style>
</head>


<body style="padding-top: 50px">



	<div class="container">
		<div class="row">
			  

			<!--  카테고리 부트스트랩 end -->
			<c:if test="${empty list2}">
							
							<div class="col-12" style="margin:250px auto; font-size : 30px; text-align: center;">
								<div>등록된 상품이 없습니다.</div>
							</div>
			</c:if>
			<c:if test="${not empty list2}">
			
			<div class="col-lg-12">
				 <div class="section-title">
					<h2 style="margin-bottom:20px;">상품 관리</h2>
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
					<c:forEach items="${list2}" var="goods">
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
								href="goods/category${pageMaker.makeQuery(pageMaker.startPage - 1) }">Previous</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
							<li class="page-item"><a class="page-link"
								href="goods/category${pageMaker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>


						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link"
								href="goods/category${pageMaker.makeQuery(pageMaker.endPage +1) }">
									Next</a></li>
						</c:if>
					</ul>
				 
				 
			</div></c:if>
		</div>
	</div>




</body>





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

</html>