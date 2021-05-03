<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>상품관리</title>
<!-- Google Font -->
 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<!-- Custom fonts for this template-->
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
 
<!-- Custom styles for this template-->
<link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

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

.table {
		display: table;
		width: 800px;
		font-size: 20px;
		font-stretch: extra-condensed;
		text-align: center;
	}
	
	h2 {
		text-align: center;
		padding-bottom: 20px;
	}
	
	.goods{
		padding-top:100px;
	}

tr {
	font-size: 16px;
	text-align: center;
}

th {
	font-size: 15px;
	text-align: center;
}

</style>

</head>
</head>

<body>


			<!-- Main Content -->
			 
				 	<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>

				<div class="container">

					<div class="row">

						 	
							<%@ include file="/WEB-INF/views/include/category.jsp"%>
					 

						<div class="col-lg-8">
							<div id="input">

								<div class="goods">
								<h2>상품 관리</h2>
								 </div>
								<div class="col-lg-8">
									<a class="btn btn-outline-secondary col-sm-1 "
										style="position: fixed; top: 80px; right: 150px;"
										href="/admin/board/registerView">상품게시글등록</a> <a
										class="btn btn-outline-secondary col-sm-1 "
										style="position: fixed; top: 120px; right: 150px;"
										href="/admin/goods/registerView">상품등록</a>
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
											<tr onClick="location.href='/admin/goods/${goods.goods_id}'"
												style="cursor: pointer;">
												<td>${goods.goods_id}</td>
												<td><img
													src="/resources/img/admin/goods/${goods.thumbnail}"
													style="width: 70px; height: 80px;" /></td>
												<td><div style="font-weight: bold; font-size: 15px;">${goods.goodsname}</div></td>
												<td><fmt:formatNumber value="${goods.price}"
														pattern="###,###,###" />원</td>
												<td>${goods.stockVO.stockname}</td>
												<td><span style="font-size: 13px; color: gray;">${goods.pcheck}</span></td>
												<td onclick="event.cancelBubble=true;"><a
													class="a-delete" data-bid='${goods.goods_id}'
													href="/admin/goods/${goods.goods_id}">삭제</a></td>
											</tr>
										</tbody>
									</c:forEach>
								</table>


								<!-- 페이징처리 -->
								<ul class="pagination justify-content-center"
									style="padding-bottom: 50px; padding-top: 50px; margin:0 auto;">

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



			</div>
			<!-- End of Page Wrapper -->

		 
  <!-- Container End  -->  
    
  
		
			<!-- Bootstrap core JavaScript-->
			<script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
			<script
				src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script
				src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="/resources/admin/js/sb-admin-2.min.js"></script>

			  
			<!-- Page level custom scripts -->
			<script src="/resources/admin/js/demo/chart-area-demo.js"></script>
			<script src="/resources/admin/js/demo/chart-pie-demo.js"></script>
</body>
</html>

