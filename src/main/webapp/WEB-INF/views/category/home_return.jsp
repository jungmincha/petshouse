
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<meta name="description" content="">
<meta name="author" content="">


<title>Insert title here</title>


<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->


<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

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

	})

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
				console.log(id);

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


<body style="padding-top: 128px">
	<!-- header -->



	<c:forEach items="${goods}" var="goods">
		<div class="product-item">
			<div class="pi-text" style="padding: 10px;">
				<a href="/admin/goods_detail/${goods.board_id}"> <img
					src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}" alt="">
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

</body>
</html>