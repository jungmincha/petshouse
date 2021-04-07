
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


<body>



	<div class="container">
		<div class="row">
			<div class="col-lg-2"></div>


			<!--  카테고리 부트스트랩 end -->

			<div class="col-lg-20">

				<table class="table2 table-hover" border="1">

					<h2>상품 관리</h2>
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>가격</th>
						<th>재고상태</th>
						<th>등록여부</th>
						<th>삭제</th>
					</tr>
					<c:forEach items="${list2}" var="goods">
						<tr onClick="location.href='/admin/goods/${goods.goods_id}'"
							style="cursor: pointer;">
							<td>${goods.goods_id}</td>
							<td>${goods.goodsname}</td>
							<td><fmt:formatNumber value="${goods.price}"
									pattern="###,###,###" />원</td>
							<td>${goods.stockVO.stockname}</td>
							<td>${goods.pcheck}</td>
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
			</div>
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