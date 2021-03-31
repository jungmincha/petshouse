<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>장바구니</title>

<!-- Google Font -->
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

<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">
						<table>
							<thead>
								<tr>
									<th>상품 이미지</th>
									<th class="p-name">상품 이름</th>
									<th>가격</th>
									<th>수량</th>
									<th>금액</th>
									<th><i class="ti-close"></i></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="">
									<tr>
										<td class="cart-pic first-row"><img
											src="/resources/img/cart-page/product-1.jpg" alt=""></td>
										<td class="cart-title first-row">
											<h5>Pure Pineapple</h5>
										</td>
										<td class="p-price first-row">$60.00</td>
										<td class="qua-col first-row">
											<div class="quantity">
												<div class="pro-qty">
													<input type="text" value="1">
												</div>
											</div>
										</td>
										<td class="total-price first-row">$60.00</td>
										<td class="close-td first-row"><i class="ti-close"></i></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="cart-buttons">
								<a href="#" class="primary-btn continue-shop">Continue
									shopping</a> <a href="#" class="primary-btn up-cart">Update
									cart</a>
							</div>
							<div class="discount-coupon">
								<h6>Discount Codes</h6>
								<form action="#" class="coupon-form">
									<input type="text" placeholder="Enter your codes">
									<button type="submit" class="site-btn coupon-btn">Apply</button>
								</form>
							</div>
						</div>
						<div class="col-lg-4 offset-lg-4">
							<div class="proceed-checkout">
								<ul>
									<li class="subtotal">Subtotal <span>$240.00</span></li>
									<li class="cart-total">Total <span>$240.00</span></li>
								</ul>
								<a href="#" class="proceed-btn">PROCEED TO CHECK OUT</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

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