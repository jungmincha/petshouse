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
<title>결제페이지</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>

<body style="padding-top:128px">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Shopping Cart Section Begin -->
	<section class="checkout-section spad">
		<div class="container">
			<form action="#" class="checkout-form">
				<div class="row">
					<div class="col-lg-6">
						<div class="checkout-content">
							<a href="#" class="content-btn">Click Here To Login</a>
						</div>
						<h4>Biiling Details</h4>
						<div class="row">
							<div class="col-lg-6">
								<label for="fir">First Name<span>*</span></label> <input
									type="text" id="fir">
							</div>
							<div class="col-lg-6">
								<label for="last">Last Name<span>*</span></label> <input
									type="text" id="last">
							</div>
							<div class="col-lg-12">
								<label for="cun-name">Company Name</label> <input type="text"
									id="cun-name">
							</div>
							<div class="col-lg-12">
								<label for="cun">Country<span>*</span></label> <input
									type="text" id="cun">
							</div>
							<div class="col-lg-12">
								<label for="street">Street Address<span>*</span></label> <input
									type="text" id="street" class="street-first"> <input
									type="text">
							</div>
							<div class="col-lg-12">
								<label for="zip">Postcode / ZIP (optional)</label> <input
									type="text" id="zip">
							</div>
							<div class="col-lg-12">
								<label for="town">Town / City<span>*</span></label> <input
									type="text" id="town">
							</div>
							<div class="col-lg-6">
								<label for="email">Email Address<span>*</span></label> <input
									type="text" id="email">
							</div>
							<div class="col-lg-6">
								<label for="phone">Phone<span>*</span></label> <input
									type="text" id="phone">
							</div>
							<div class="col-lg-12">
								<div class="create-item">
									<label for="acc-create"> Create an account? <input
										type="checkbox" id="acc-create"> <span
										class="checkmark"></span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6"   >
						<div class="checkout-content">
							<input type="text" placeholder="Enter Your Coupon Code">
						</div>
						<div class="place-order">
							<h4>Your Order</h4>
							<div class="order-total">
								<ul class="order-table">
									<li>Product <span>Total</span></li>
									<li class="fw-normal">Combination x 1 <span>$60.00</span></li>
									<li class="fw-normal">Combination x 1 <span>$60.00</span></li>
									<li class="fw-normal">Combination x 1 <span>$120.00</span></li>
									<li class="fw-normal">Subtotal <span>$240.00</span></li>
									<li class="total-price">Total <span>$240.00</span></li>
								</ul>
								<div class="payment-check">
									<div class="pc-item">
										<label for="pc-check"> Cheque Payment <input
											type="checkbox" id="pc-check"> <span
											class="checkmark"></span>
										</label>
									</div>
									<div class="pc-item">
										<label for="pc-paypal"> Paypal <input type="checkbox"
											id="pc-paypal"> <span class="checkmark"></span>
										</label>
									</div>
								</div>
								<div class="order-btn">
									<button type="submit" class="site-btn place-btn">Place
										Order</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

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