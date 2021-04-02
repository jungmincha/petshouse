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

	<!-- 쇼핑카트 섹션 -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">

						<table>
							<thead>
								<tr>
									<th>전체선택<br> <input type="checkbox" id="allCk">
									</th>
									<th>상품 이미지</th>
									<th class="p-name">상품 이름</th>
									<th>가격</th>
									<th>수량</th>
									<th>금액</th>
									<th><i class="ti-close"></i></th>
								</tr>
							</thead>
							<!-- 장바구니 목록 불러오기 -->
							<tbody id="goods">
							</tbody>

						</table>

					</div>
					<div class="row">
						<div class="col-lg-12 offset-lg-12">
							<div class="proceed-checkout">
								<ul>
								
									<li class="cart-total">Total <span class="total"></span></li>
								</ul>
								<a href="#" class="proceed-btn">PROCEED TO CHECK OUT</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 쇼핑카트 섹션 end -->

	<script>
		
		$(document)
				.ready(
						//장바구니 목록 불러오기
						function() {

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

											var html = "";
											for (var i = 1; i <= data.length; i++) {

												html += "<tr>"
														+ "<td><input id='ck"+i+"' type='checkbox'></input></td>"
														+ "<td class='cart-pic first-row'><img src='/resources/img/cart-page/product-1.jpg' alt=''></td>"
														+ "<td class='cart-title first-row'>"
														+ "<h5>"
														+ "<a href='/admin/goods_detail/"+data[i-1].board_id+"' style='color:#000000'>"
														+ data[i - 1].goodsVO.goodsname
														+ "</a>"
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
														+ "<input style='border:none; text-align:right;' type='text' id='x"
														+ i
														+ "' value='' readonly size='7px' class='value' >"
														+ "원</td> <td class='close-td first-row'><i class='ti-close'></i></td>  </tr>"
												// 상품 별 합 계산()
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
												// 상품 별 합 계산()		
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
														+ " switch (ops) { "
														+ " case 'plus': num3t = num1b + num2b; document.getElementById('x"
														+ i
														+ "').value = num3t; break;"
														+ "case 'mul': num3t = num1b * num2b; document.getElementById('x"
														+ i
														+ "').value = num3t;  break; } summary() }; "
														+ "</script"+">"
											}

											html += "<script DEFER> $(document).ready(function() {var sum = 0; 	$('.value').each(function() {"
													+ "sum += Number($(this).val()); }); $('.total').html(sum+'원'); });"
													+"function summary() {"
													+"var sum = 0;"
													+"$('.value').each(function() { sum += Number($(this).val()); });"
													+"$('.total').html(sum + '원'); 	};"	
													+ "</script"+">"
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

										}, //ajax 성공 시 end

										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
										} // ajax 에러 시 end

									});// 장바구니 목록 함수 end
						});
		// 전체 선택
		$('#allCk').click(function() {
			var checked = $('#allCk').is(':checked');

			if (checked)
				$('input:checkbox').prop('checked', true);

			if (!checked)
				$('input:checkbox').prop('checked', false);

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