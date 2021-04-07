
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
.table2 {
	display: table;
	margin: 30px 30px 30px 30px;
	width: 700px;
	font-size: 15px;
	font-stretch: extra-condensed;
	text-align: center;
}

h2 {
	text-align: center;
}
</style>
</head>


<body style="padding-top: 180px">


	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Page Content -->
	<!-- Product Shop Section Begin -->




			<div class="container">

			<div class="row">
				 
				<div class="col-lg-2">
				 	<%@ include file="/WEB-INF/views/include/category.jsp"%>  
				</div>
		

				<!--  카테고리 부트스트랩 end -->
				<div class="col-lg-8">
					<div id="input">
						<table class="table2 table-hover " border="1">
							<h2>상품 관리</h2>
							<tr>
								<th>상품번호</th>
								<th>상품명</th>
								<th>가격</th>
								<th>재고상태</th>
								<th>삭제</th>
							</tr>
							<c:forEach items="${list}" var="goods">
								<tr onClick="location.href='/admin/goods/${goods.goods_id}'"
									style="cursor: pointer;">
									<td>${goods.goods_id}</td>
									<td>${goods.goodsname}</td>
									<td><fmt:formatNumber value="${goods.price}"
											pattern="###,###,###" />원</td>
									<td>${goods.stockVO.stockname}</td>
									<td onclick="event.cancelBubble=true;"><a class="a-delete"
										data-bid='${goods.goods_id}'
										href="/admin/goods/${goods.goods_id}">삭제</a></td>
								</tr>
							</c:forEach>
						</table>
						<a class="btn btn-warning float-right"
							href="/admin/board/registerView">상품게시글등록</a> <a
							class="btn btn-warning float-right"
							href="/admin/goods/registerView">상품등록</a>

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
 
