<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf_parameter" content="${_csrf.parameterName}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
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
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.pi {
	padding-left: 20px
}

.pimg {
	width: 70px;
	height: 70px;
}

a:link {
	color: white;
}

a:visited {
	color: white;
}
</style>
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<body style="padding-top: 100px">

	<!-- 쇼핑카트 섹션 -->
	<section class="shopping-cart spad">
		<div class="section-title">
			<h2 style="margin-bottom: 20px; font-size: 30px;">장바구니</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- 카트 테이블 -->
					<div class="cart-table">
						<form id="cart" name="form" method="post" action="/myPage/payPage">
							<table>
								<thead>
									<tr>
										<th style="width: 5%"><input type="checkbox" id="allCk"></th>
										<th style="width: 15%">상품 이미지</th>
										<th class="text-center">상품 이름</th>
										<th>가격</th>
										<th>수량</th>
										<th>옵션</th>
										<th>금액</th>
										<th><i class="ti-close" onclick="allCartDelete()"
											style='cursor: pointer'></i></th>
									</tr>
								</thead>
								<!-- 장바구니 목록 불러오기 -->
								<tbody id="goods">
									<!-- 총합 계산 및 결제 페이지 이동 시 필요 -->
									<input type='hidden' name='board_id' />
									<input type='hidden' name="sum" />
									<input type='hidden' name='name' />
									<input type='hidden' name='amount' />
									<input type='hidden' name='psize' />
									<input type='hidden' name='pcolor' />
									<input type='hidden' name='thumbnail' />
								</tbody>

							</table>
						</form>
					</div>
					<!-- 카트 테이블 end -->

					<!-- 최종 금액 확인 -->
					<div class="row">
						<div class="col-lg-12 offset-lg-12">
							<div class="proceed-checkout text-right">
								<ul>

									<li class="cart-total" style="font-size: 20px">총 주문금액
										:&nbsp; <span class="total">0원</span>
									</li>
								</ul>
								<a href="#" onclick="payPage()" class="proceed-btn"
									style='cursor: pointer; font-size: 20px;'>주문하기 </a>
							</div>
						</div>
					</div>
					<!-- 최종 금액 확인 end -->
				</div>
			</div>
		</div>
	</section>

</body>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$(document)
			.ready(
					//장바구니 목록 불러오기
					function() {

						//배열 선언

						var cartList = sessionStorage.getItem("cartList");
						console.log(cartList);
						//ajax 호출
						$
								.ajax({
								
									url : "/myPage/cartList",
									type : "post",
									dataType : 'json',
									contentType : 'application/json; charset=UTF-8',
									data : cartList,
									success : function(data) {
										var cartList = JSON
												.parse(sessionStorage
														.getItem("cartList"));

										var html = "";
										for (var i = 1; i <= data.length; i++) {
											var amount;
											var psize;
											var pcolor;

											for (var j = 0; j < cartList.length; j++) {

												if (cartList[j].board_id == data[i - 1].board_id) {
													amount = cartList[j].amount;
													psize = cartList[j].psize;
													pcolor = cartList[j].pcolor;
													cartList.splice(j, 1);
													break;
												}
											}

											html += "<tr id='tr"+i+"'>"
													+ "<td class='cart-title first-row text-center'><input onclick='summary()' id='ck"
													+ i
													+ "' type='checkbox' name='board_id' value='"
													+ data[i - 1].board_id
													+ "'></input></td>"
													+ "<td class='cart-title first-row text-center'> <a href='/admin/goods_detail/"+data[i-1].board_id+"'> <img src='/resources/img/admin/goods/"+data[i-1].goodsVO.thumbnail+"' class='pimg'> </a></td> "
													+ "<td class='cart-title first-row text-center'>"
													+ "<h5>"
													+ "<a href='/admin/goods_detail/"+data[i-1].board_id+"'  >"
													+ data[i - 1].goodsVO.goodsname
													+ "</a>"
													+ "</h5>"
													+ "</td>"
													+ "<td class='p-price first-row text-center' style='color:#000000'>"
													+ "<input style='border:none; text-align:right; ' type='text' id='a"
													+ i
													+ "' value='"
													+ priceFormat(data[i - 1].goodsVO.price)
													+ "' readonly size='7px' >"
													+ "원</td>"
													+ "<td class='qua-col first-row text-center'>"
													+ "	<div class='quantity'> <div class='pro-qty'> <span class='dec qtybtn' onclick='total"
													+ i
													+ "(-1)'>-</span> <input name='amount' type='text' id='b"
														+ i
														+ "' value='"+amount+"' readonly > <span class='inc qtybtn' onclick='total"
													+ i
													+ "(1)'>+</span> </div> </div>"
													+ "</td> <td class='total-price first-row text-center' style='color:#000000'> "
											if (pcolor != "" && psize != "") {
												console.log(pcolor);
												html += pcolor + " / " + psize
											} else if (pcolor == ""
													&& psize != "") {
												html += psize

											} else if (pcolor != ""
													&& psize == "") {
												html += pcolor

											}

											html += "</td><td class='total-price first-row text-center' style='color:#000000'>"
													+ "<input style='border:none; text-align:right;' type='text' id='sum"
														+ i
														+ "' value='' readonly size='7px' name='sum' >원</td>"
													+ "<td class='close-td first-row'><i class='ti-close' onclick='cartDelete("
													+ i
													+ ")' > <input type='hidden' name='name' value='"+data[i - 1].goodsVO.goodsname+"' ><input type='hidden' name='psize' value='"+psize+"' ><input type='hidden' name='pcolor' value='"+pcolor+"' > <input type='hidden' name='thumbnail' value='"+data[i-1].goodsVO.thumbnail+"' ></td>"
													+ "</tr>"

											// 상품 별 합 계산() ready
											html += "<script DEFER>"
													+ "$(document).ready(function total"
													+ i
													+ "()"
													+ "{  var num1 = document.getElementById('a"
													+ i
													+ "');"
													+ "var num1s = stringNumberToInt(num1.value); "
													+ "var num1b = parseInt(num1s); var num2 = document.getElementById('b"
													+ i
													+ "'); "
													+ "var num2s = num2.value; var num2b = parseInt(num2s) ;"
													+ "var num3t; var ops = 'mul'; "
													+ " switch (ops) { "
													+ " case 'plus': num3t = num1b + num2b; document.getElementById('sum"
													+ i
													+ "').value = num3t; break;"
													+ "case 'mul': num3t = num1b * num2b; document.getElementById('sum"
													+ i
													+ "').value = priceFormat(num3t); break; } }); "
													+ "</script"+">"
											// 상품 별 합 계산()		
											html += "<script DEFER> function total"
													+ i
													+ "(v)"
													+ "{ var num1 = document.getElementById('a"
													+ i
													+ "');"
													+ "var num1s = stringNumberToInt(num1.value); "
													+ "var num1b = parseInt(num1s); var num2 = document.getElementById('b"
													+ i
													+ "'); "
													+ "var num2s = num2.value; var num2b = parseInt(num2s) + v;"
													+ "var num3t; var ops = 'mul'; "
													+ " switch (ops) { "
													+ " case 'plus': num3t = num1b + num2b; document.getElementById('sum"
													+ i
													+ "').value = num3t; break;"
													+ "case 'mul': num3t = num1b * num2b; document.getElementById('sum"
													+ i
													+ "').value = priceFormat(num3t);  break; } summary() }; "
													+ "</script"+">"

										}
										// main.js
										html += "<script DEFER src='/resources/js/main.js'> </script"+">"

										// tbody에 기록
										$("#goods").append(html);
										var cartList = sessionStorage
												.getItem("cartList");
										if (cartList.length == 2) {
											alert("카트가 비었습니다.")
										}
									}, //ajax 성공 시 end

									error : function(request, status, error) {
										//alert("code:" + request.status
										//+ "\n" + "message:"
										//+ request.responseText
										//+ "\n" + "error:" + error);
										alert("카트가 비었습니다.")
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
		summary();

	});

	// 해당 상품 삭제
	function cartDelete(i) {
		var tr = '#tr' + i;
		var trObj = $(tr).remove();
		cartList = JSON.parse(sessionStorage.getItem('cartList'));
		cartList.splice(i - 1, 1);
		sessionStorage.setItem('cartList', JSON.stringify(cartList));
		summary();
	}

	// 카트 총 합 계산
	function summary() {
		var sum = 0;
		var count = this.form.board_id.length;
		for (var i = 1; i < count; i++) {
			if (this.form.board_id[i].checked == true) {
				sum += parseInt(stringNumberToInt(this.form.sum[i].value));
				console.log(sum)
			}
		}
		$('.total').html(priceFormat(sum) + '원');
	}

	// 전체 카트 삭제
	function allCartDelete() {
		$('#goods').remove();
		var cartList = new Array();
		sessionStorage.setItem('cartList', JSON.stringify(cartList));
		$('.total').html(0 + '원');
	}

	// 결제 페이지 이동
	function payPage() {
		event.preventDefault();
		var payGoods = new Array();

		var count = this.form.board_id.length;
		for (var i = 1; i < count; i++) {
			if (this.form.board_id[i].checked == true) {
				var goods = new Object();
				goods.board_id = parseInt(this.form.board_id[i].value);
				goods.amount = parseInt(this.form.amount[i].value);
				goods.psize = this.form.psize[i].value;
				goods.pcolor = this.form.pcolor[i].value;
				goods.name = this.form.name[i].value;
				goods.sum = parseInt(stringNumberToInt(this.form.sum[i].value));
				goods.thumbnail = this.form.thumbnail[i].value;
				payGoods.push(goods);
			}
		}
		if (payGoods.length == 0) {
			alert("결제할 상품을 선택해주세요.")
		} else {

			sessionStorage.setItem("payGoods", JSON.stringify(payGoods));
			window.location.assign("/myPage/payPage");
		}

	}
	// 숫자 콤마찍기
	function priceFormat(n) {
		var n = n.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		return n;
	}
	// 콤마 풀기
	function stringNumberToInt(stringNumber) {
		return parseInt(stringNumber.replace(/,/g, ''));
	}
</script>
<!-- Js Plugins -->

<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
</html>