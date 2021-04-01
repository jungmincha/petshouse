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
							<tbody id="goods">

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
									<li class="cart-total">Total <span ></span></li>
								</ul>
								<a href="#" class="proceed-btn">PROCEED TO CHECK OUT</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<form oninput="x.value=parseInt(a.value)+parseInt(b.value)">
		<input type="range" id="a" value="50">100 + <input
			type="number" id="b" value="200"> =
		<output name="x" for="a b"></output>
	</form>

	<!-- Shopping Cart Section End -->

	<script>
		$(document)
				.ready(
						function() {
							console.log("실행")
							//배열 선언
							var cartList = new Array();
							cartList = JSON.parse(sessionStorage
									.getItem("cartList"));
							console.log(cartList)
							//ajax 호출
							$
									.ajax({
										url : "/myPage/cartList",
										type : "post",
										dataType : 'json',
										data : {
											"cartList" : cartList
										},
										success : function(data) {
											console.log(data[1].board_id);
											var html = "";
											for (var i = 1; i <= data.length; i++) {
												console.log(i + "번 실행")
												html += "<tr>"
														+ "<td class='cart-pic first-row'><img src='/resources/img/cart-page/product-1.jpg' alt=''></td>"
														+ "<td class='cart-title first-row'>"
														+ "<h5>"
														+ "<a href='/admin/goods_detail/"+data[i-1].board_id+"' style='color:#000000'>"+data[i - 1].goodsVO.goodsname+"</a>"
														+ "</h5>"
														+ "</td>"
														+ "<td class='p-price first-row' style='color:#000000'>"
														+ "<input style='border:none; text-align:right;' type='text' id='a"+i+"' value='"+data[i-1].goodsVO.price+"' readonly size='7px'>"
														+ "원</td>"
														+ "<td class='qua-col first-row'>"
														+ "	<div class='quantity'> <div class='pro-qty'> <span class='dec qtybtn' onclick='total"
														+ i
														+ "(-1)'>-</span> <input type='text' id='b"
														+ i
														+ "' value='1' readonly> <span class='inc qtybtn' onclick='total"
														+ i
														+ "(1)'>+</span> </div> </div>"
														+ "</td> <td class='total-price first-row' style='color:#000000'>"
														+ "<input style='border:none; text-align:right;' type='text' id='x"+i+"' value='' readonly size='7px'>"
														+ "원</td> <td class='close-td first-row'><i class='ti-close'></i></td>  </tr>"
												html += "<script DEFER> $(document).ready(function total"
														+ i
														+ "()"

														+ "{ var num1 = document.getElementById('a"
														+ i
														+ "');"
														+ "var num1s = num1.value; "

														+ "var num1b = parseInt(num1s); var num2 = document.getElementById('b"
														+ i
														+ "'); "

														+ "var num2s = num2.value; var num2b = parseInt(num2s);"

														+ "var num3t; var ops = 'mul'; "
														+ " switch (ops) { "
														+ " case 'plus': num3t = num1b + num2b; document.getElementById('x"
														+ i
														+ "').value = num3t; break;"
														+ "case 'mul': num3t = num1b * num2b; document.getElementById('x"
														+ i
														+ "').value = num3t; break; } }); "
														+ "</script"+">"
												html += "<script DEFER> function total"
														+ i
														+ "(v)"

														+ "{ var num1 = document.getElementById('a"
														+ i
														+ "');"
														+ "var num1s = num1.value; "
														+ "var num1b = parseInt(num1s); var num2 = document.getElementById('b"
														+ i
														
														+ "'); "
													
														+ "var num2s = num2.value; var num2b = parseInt(num2s) + v;"
														+ "var num3t; var ops = 'mul'; "
														+" console.log(num2b);"
														+ " switch (ops) { "
														+ " case 'plus': num3t = num1b + num2b; document.getElementById('x"
														+ i
														+ "').value = num3t; break;"
														+ "case 'mul': num3t = num1b * num2b; document.getElementById('x"
														+ i
														+ "').value = num3t; console.log(num3t); break; } }; "
														+ "</script"+">"
											}

											html += "<script defer src='/resources/js/jquery-3.3.1.min.js'> </script"+">"
													+ "<script DEFER src='/resources/js/bootstrap.min.js'> </script"+">"
													+ "<script defer src='/resources/js/jquery-ui.min.js'> </script"+">"
													+ "<script defer src='/resources/js/jquery.countdown.min.js'> </script"+">"
													+ "<script defer src='/resources/js/jquery.nice-select.min.js'> </script"+">"
													+ "<script defer src='/resources/js/jquery.zoom.min.js'> </script"+">"
													+ "<script defer src='/resources/js/jquery.dd.min.js'> </script"+">"
													+ "<script defer src='/resources/js/jquery.slicknav.js'> </script"+">"
													+ "<script defer src='/resources/js/owl.carousel.min.js'> </script"+">"
													+ "<script DEFER src='/resources/js/main.js'> </script"+">"

											$("#goods").append(html);

										},
										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
										}

									});
						});
	
	</script>
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