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

<title>주문배송내역</title>
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
.pimg {
	width: 80px;
	height: 80px;
}

#pimg {
	width: 130px;
	height: 130px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.8); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	overflow: auto;
	background-color: #fefefe;
	margin: 2% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.rbox {
	border-radius: 5px;
	line-height: 1;
	letter-spacing: -0.4px;
	font-size: 16px;
	-webkit-box-direction: normal;
	margin: 0;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	margin-top: 30px;
	height: 45px;
	background-color: #BBB;
	padding: 0 16px;
	color: #fff;
	font-weight: 700;
}

.rate {
	float: left;
	height: 46px;
	padding: 0 10px;
}

.rate:not(:checked)>input {
	position: absolute;
	top: -9999px;
}

.rate:not(:checked)>label {
	float: right;
	width: 1em;
	overflow: hidden;
	white-space: nowrap;
	cursor: pointer;
	font-size: 30px;
	color: #ccc;
}

.rate:not(:checked)>label:before {
	content: '★ ';
}

.rate>input:checked ~ label {
	color: #ffd233;
}

.rate:not(:checked)>label:hover, .rate:not(:checked)>label:hover ~ label
	{
	color: #ffd233;
}

.rate>input:checked+label:hover, .rate>input:checked+label:hover ~ label,
	.rate>input:checked ~ label:hover, .rate>input:checked ~ label:hover ~
	label, .rate>label:hover ~ input:checked ~ label {
	color: #ffd233;
}

#image {
	cursor: pointer;
}

.rsub {
	margin-top: 20px;
	margin-bottom: 10px;
	font-size: 16px;
	font-weight: bold;
}

.sub {
	font-size: 13px;
}

.custom-file label {
	display: inline-block;
	padding: .5em .75em;
	color: black;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fff;
	cursor: pointer;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.custom-file label:active {
	background-color: #ffd233;
}

/* 스크롤바 */
.modal-content {
	width: 250px;
	height: 140px;
	overflow: auto;
}

.modal-content::-webkit-scrollbar {
	width: 10px;
}

.modal-content::-webkit-scrollbar-thumb {
	background-color: #666666;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.modal-content::-webkit-scrollbar-track {
	background-color: #CCCCCC;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

/* 리뷰창 스크롤바 */
#review {
	width: 250px;
	height: 140px;
	overflow: auto;
}

#review::-webkit-scrollbar {
	width: 10px;
}

#review::-webkit-scrollbar-thumb {
	background-color: #666666;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#review::-webkit-scrollbar-track {
	background-color: #CCCCCC;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}
a>p:hover {
	color: #e7ab3c;
}
a>span{
	font-weight: bold;
	font-size: 19px;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
</head>
<body style="padding-top: 180px;">

	<!-- 본문 -->
	<div class="container" id="orderList">
		<input type="hidden" id="memberName"
			value="<sec:authentication property="principal.name"/>">

		<div class="row">
			<div class="col-lg-1"></div>
			<a onclick="allOrder()" style="font-size: 22px">전체 <span
				style="font-size: 22px">${payCounts[0]}</span></a>
			<div class="col-lg-12">
				<div class="jumbotron"
					style="padding-top: 40px; padding-bottom: 70px;">
					<div class="row ">
						<div class="col-lg-2 text-center">
							<a onclick="listOrder(1)" style="font-size: 22px">결제완료<br>
								<br> <span style="font-size: 22px">${payCounts[1]}</span></a>
						</div>
						<div class="col-lg-2 text-center">
							<a onclick="listOrder(2)" style="font-size: 22px">배송준비<br>
								<br> <span style="font-size: 22px">${payCounts[2]}</span></a>
						</div>
						<div class="col-lg-2 text-center">
							<a onclick="listOrder(3)" style="font-size: 22px">배송중<br>
								<br> <span style="font-size: 22px">${payCounts[3]}</span></a>
						</div>
						<div class="col-lg-2 text-center">
							<a onclick="listOrder(4)" style="font-size: 22px">배송완료<br>
								<br> <span style="font-size: 22px">${payCounts[4]}</span></a>
						</div>
						<div class="col-lg-2 text-center">
							<a onclick="listOrder(5)" style="font-size: 22px">구매확정<br>
								<br> <span style="font-size: 22px">${payCounts[5]}</span></a>
						</div>
						<div class="col-lg-2 text-center">
							<a onclick="listOrder(6)" style="font-size: 22px">교환/환불/취소<br>
								<br> <span style="font-size: 22px">${payCounts[6] + payCounts[7] + payCounts[8]}</span></a>
						</div>
					</div>

				</div>
			</div>

			<div class="col-lg-1"></div>
		</div>

	</div>
	<!-- 본문 끝 -->

	<!-- 배송조회 -->
	<input type="hidden" class="form-control" id="t_key" name="t_key"
		value="b6qZIhyVpYgicymScLeVNQ">
	<input type="hidden" class="form-control" name="t_code" id="t_code"
		placeholder="택배사 코드">
	<input type="hidden" class="form-control" name="t_invoice"
		id="t_invoice" placeholder="운송장 번호">
	<!-- 배송조회 end -->

</body>
<!-- 모달 시작 -->
<div id="myModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content" style="width: 600px; height: 710px;">
		<div class="row">
			<div class="col-4">
				<div class="close" style="font-size: 30px; float: left">&times;</div>
			</div>
			<div class="col-4">
				<div style="text-align: center; font-weight: bold;">
					<h4>리뷰 쓰기</h4>
				</div>
			</div>
			<div class="col-4"></div>

		</div>


		<div class="container">

			<form class=" needs-validation"
				action="/myPage/orderList/review/insert" method="Post" name="review"
				enctype="multipart/form-data">
				<input type="hidden" name="goodsVO.goods_id" id="goods_id" value="">
				<input type="hidden" name="paystate_id" id="paystate_id" value="">
				<div class="rbox">포토 리뷰 500P, 일반 리뷰 100P</div>

				<!-- 상품사진, 상품명 -->
				<div style="margin-top: 15px;">
					<div class="row">
						<div class="col-3 pb-pic">
							<img src="" id="pimg">
						</div>
						<div class="col-6">
							<p id="goodsName"></p>
							<p id="goodsoption" style="font-size: 12px;"></p>
						</div>

					</div>

				</div>

				<!-- 별점 -->
				<div class="rsub">별점 평가</div>
				<div class="form-group row">
					<div class="form-group">
						<div class="rate">
							<input type="radio" id="star5" name="ratescore" value="5"
								required /> <label for="star5" title="text">5 stars</label> <input
								type="radio" id="star4" name="ratescore" value="4" /> <label
								for="star4" title="text">4 stars</label> <input type="radio"
								id="star3" name="ratescore" value="3" /> <label for="star3"
								title="text">3 stars</label> <input type="radio" id="star2"
								name="ratescore" value="2" /> <label for="star2" title="text">2
								stars</label> <input type="radio" id="star1" name="ratescore" value="1" />
							<label for="star1" title="text">1 star</label>
							<div class="invalid-feedback">없으면 공백 추가!</div>
						</div>
					</div>
				</div>

				<!-- 별점 end -->

				<!-- 사진 등록 -->
				<div class="rsub">
					사진 등록 <span class="sub">(선택)</span>
				</div>
				<div class="form-group row">

					<div id="preview"></div>

					<div class="input-group col-12">
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="image"
								name="file" style="display: block;" multiple="multiple">
							<label class="custom-file-label" for="inputGroupFile02">사진을
								등록해주세요 (최대 1장)</label>
						</div>
					</div>
				</div>
				<!-- 사진등록 end -->

				<!-- 리뷰 작성 -->
				<div>
					<div class="rsub">리뷰 작성</div>
					<div>
						<textarea class="form-control" name="content"
							style="margin: auto; width: 100%; height: 100px; resize: none;"
							id="content" placeholder="리뷰를 등록해주세요." required></textarea>
						<div class="invalid-feedback">없으면 공백 추가!</div>
					</div>
				</div>
				<!-- 리뷰 작성 end -->

				<span>
					<button type="submit" class="btn btn-warning"
						style="margin: auto; width: 100%;">리뷰 등록</button>
				</span>
			</form>
		</div>
	</div>
</div>
<!-- 모달 끝 -->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<form name="iniform" method="get">
	<input type="hidden" name="receipt_id" id="popReceipt_id" value="">
</form>

<script>

// 전체 오더리스트 조회
	$(document)
			.ready(
					function() {
						allOrder();					
					});

	// 전체 리스트 조회
	function allOrder(pageNum,amount){
		
			var url ="/myPage/orderList/ajax/"+"${paystate}";
						$
								.ajax({
									url : url,
									type : "get",
									data : {
										pageNum : pageNum,
										amount : amount

									},
									success : function(data) {
										$(".payList").remove();
										$(".pagination").remove();	
										var html = "";
										var option ="";
										console.log(data);
										for (var i = 1; i <= data.pay.length; i++) {
											html += "<div class='row payList'> <div class='col-lg-1'> </div> <div class='col-lg-12'>"
													+ "<div class='blog-details-inner'>"
													+ "<div class='posted-by'>"
													if(data.pay[i-1].payGoodsVO.length >1){
														html += "<button type='button' class='btn ' data-toggle='collapse' data-target='#demo"+i+"'>▼</button>"
													}
													html += " <div class='row'> <div class='col-lg-5'> <div class='pb-pic'>"
													+ "<img src='/resources/img/admin/goods/"+data.pay[i-1].payGoodsVO[0].boardVO.goodsVO.thumbnail+"' class='pimg'> </div>"
													+ "<div class='pb-text'> <a href='#' onclick='orderPopup("+data.pay[i-1].pay_id+",\""+data.pay[i-1].receipt_id+"\")'> <span>"
													+ data.pay[i - 1].pay_id
													+ " / "
													+ getFormatDate(data.pay[i - 1].paydate)
													+ "</span> </a> <a href='/admin/goods_detail/"+data.pay[i-1].payGoodsVO[0].boardVO.board_id+"'><p style='font-size: 22px'>"
													+ data.pay[i - 1].payGoodsVO[0].boardVO.goodsVO.goodsname
													+ "</p></a>"
													if(data.pay[i - 1].payGoodsVO[0].pcolor != null && data.pay[i - 1].payGoodsVO[0].psize != null){
														html += "<span style='font-size: 13px'>옵션 - "+data.pay[i - 1].payGoodsVO[0].pcolor+" / "+data.pay[i - 1].payGoodsVO[0].psize+"</span>" 
														option = "옵션 - "+data.pay[i - 1].payGoodsVO[0].pcolor+" / "+data.pay[i - 1].payGoodsVO[0].psize
													} else if(data.pay[i - 1].payGoodsVO[0].pcolor != null && data.pay[i - 1].payGoodsVO[0].psize == null){
														html += "옵션 - "+data.pay[i - 1].payGoodsVO[0].pcolor
														option = "옵션 - "+data.pay[i - 1].payGoodsVO[0].pcolor
													} else if(data.pay[i - 1].payGoodsVO[0].pcolor == null && data.pay[i - 1].payGoodsVO[0].psize != null){
														html += "옵션 - "+data.pay[i - 1].payGoodsVO[0].psize
														option = "옵션 - "+data.pay[i - 1].payGoodsVO[0].psize
													}
											
													html +="</div>"
													+ "</div> <div class='col-lg-1'></div> <div class='col-lg-3' style='text-align: center;'> <br> <span style='font-size: 18px;'>총 금액 : "
													+ data.pay[i - 1].payprice
													+ "원</span><br> <span  style='font-size: 18px;'>수량 : "
													+ data.pay[i - 1].payGoodsVO[0].amount
													+ "</span>"
													switch (data.pay[i-1].paystateVO.paystate_id){
													case 1 :
														html += "</div> <div class='col-lg-3'  style='text-align: right;'><span style='font-size: 20px'>상품준비중<br><span style='font-size: 20px'><button onclick='payCancel(\""+data.pay[i-1].receipt_id+"\")'>결제취소</button></span></div> </div>"
															break;
														case 2 :
														html += "</div> <div class='col-lg-3'  style='text-align: right;'><span style='font-size: 20px'><br>배송준비중</span></div> </div>"
															break;
														case 3 :
															html += "</div> <div class='col-lg-3' style='text-align: right;'><span style='font-size: 20px'><br><button onclick='delivery("+data.pay[i-1].t_key+","+data.pay[i-1].t_invoice+")'>배송조회</button></span>"
																+ "</div> </div>" 
																break;
														case 4 :
															html += "</div> <div class='col-lg-3' style='text-align: right;'> <span style='font-size: 20px'><button onclick='delivery("+data.pay[i-1].t_key+","+data.pay[i-1].t_invoice+")'>배송조회</button><br>"
																+ "<button>구매확정</button></span>"
																+ "</div> </div>"
																break;
														case 5 :
															html += "</div> <div class='col-lg-3' style='text-align: right;'>"
																+ "<span style='font-size: 20px'><br><button id='myBtn' onclick='modals("+data.pay[i - 1].payGoodsVO[0].boardVO.goodsVO.goods_id+" ,\""+data.pay[i - 1].payGoodsVO[0].boardVO.goodsVO.thumbnail+"\",\""+data.pay[i-1].payGoodsVO[0].boardVO.goodsVO.goodsname+"\", "+data.pay[i-1].paystateVO.paystate_id+" , \""+option+"\")'>리뷰 작성</button></span>"
																+ "</div> </div>" 
																break;
														case 6 :
															html += "</div> <div class='col-lg-3' style='text-align: right;'>"
																+ "<span style='font-size: 20px'><br>취소된 결제</span>"
																+ "</div> </div>" 
																break;
														case 7 :
															html += "</div> <div class='col-lg-3' style='text-align: right;'>"
																+ "<span style='font-size: 20px'>교환처리<br><button onclick='delivery("+data.pay[i-1].t_key+","+data.pay[i-1].t_invoice+")'>배송조회</button></span> "
																+ "</div> </div>" 
																break;
														case 8 :
															html += "</div> <div class='col-lg-3' style='text-align: right;'>"
																+ "<span style='font-size: 20px'><br>환불처리</span>"
																+ "</div> </div>" 
																break;
														default :
															break;
													}
													if( data.pay[i - 1].payGoodsVO.length>1){
														html +=" <hr><div class='row collapse in' id='demo"+i+"'> "
														option ="";
														for (var j = 1; j < data.pay[i - 1].payGoodsVO.length; j++) {
															html += " <div class='col-lg-5'> <div class='pb-pic'>"
																	+ "<img src='/resources/img/admin/goods/"+data.pay[i-1].payGoodsVO[j].boardVO.goodsVO.thumbnail+"' class='pimg'> </div>"
																	+ "<div class='pb-text'><a href='/admin/goods_detail/"+data.pay[i-1].payGoodsVO[j].boardVO.board_id+"'>  <p style='font-size: 22px'>"
																	+ data.pay[i - 1].payGoodsVO[j].boardVO.goodsVO.goodsname
																	+ "</p></a>"
																	if(data.pay[i - 1].payGoodsVO[j].pcolor != null && data.pay[i - 1].payGoodsVO[j].psize != null){
																		html += "<span style='font-size: 13px'>옵션 - "+data.pay[i - 1].payGoodsVO[j].pcolor+" / "+data.pay[i - 1].payGoodsVO[j].psize+"</span>" 
																		option = "옵션 - "+data.pay[i - 1].payGoodsVO[j].pcolor+" / "+data.pay[i - 1].payGoodsVO[j].psize
																	} else if(data.pay[i - 1].payGoodsVO[j].pcolor != null && data.pay[i - 1].payGoodsVO[j].psize == null){
																		html += "옵션 - "+data.pay[i - 1].payGoodsVO[j].pcolor
																		option = "옵션 - "+data.pay[i - 1].payGoodsVO[j].pcolor
																	} else if(data.pay[i - 1].payGoodsVO[j].pcolor == null && data.pay[i - 1].payGoodsVO[j].psize != null){
																		html += "옵션 - "+data.pay[i - 1].payGoodsVO[j].psize
																		option = "옵션 - "+data.pay[i - 1].payGoodsVO[j].psize
																	}
																	html += "</div>"
																	+ "</div> <div class='col-lg-1'></div> <div class='col-lg-3' style='text-align: center;'> <br>"
																	+ "<span  style='font-size: 18px'>수량 : "
																	+ data.pay[i - 1].payGoodsVO[j].amount
																	+ "</span>"
																	+ "</div> <div class='col-lg-3'  style='text-align: right;'> <br>"
																	if(data.pay[i-1].paystateVO.paystate_id==5){
																		html += "<span style='font-size: 20px'><button id='myBtn' onclick='modals("+data.pay[i - 1].payGoodsVO[j].boardVO.goodsVO.goods_id+" ,\""+data.pay[i - 1].payGoodsVO[j].boardVO.goodsVO.thumbnail+"\",\""+data.pay[i-1].payGoodsVO[j].boardVO.goodsVO.goodsname+"\", "+data.pay[i-1].paystateVO.paystate_id+" , \""+option+"\")'>리뷰 작성</button></span>"
																	}
																	html +="</div>"	
																
																	if(j < data.pay[i-1].payGoodsVO.length-1){
																		html += "<div class='col-lg-12'><br></div>"
																	}
														}
														html +="</div>"	
													}
													html +="</div></div></div></div></div>"
										}
										
										html += "<div class='container'><ul class='pagination'  style='justify-content: center;'><c:if test='"+data.pageMaker.prev+"'>"
										+"<li class='page-item'> <a class='page-link' onclick='allOrder("+(data.pageMaker.startPage-1)+","+data.pageMaker.amount+")"'>«</a></li> </c:if>"
										for(var i = data.pageMaker.startPage; i<=data.pageMaker.endPage;i++){
										html += "<li class='page-item'> <a class='page-link' onclick='allOrder("+i+","+data.pageMaker.cri.amount+")'>"+i+"</a></li> "	}
										html += "<c:if test='${"+data.pageMaker.next +"&&"+ data.pageMaker.endPage+"> 0}'> <li class='page-item'> <a class='page-link' onclick='allOrder("+(data.pageMaker.endPage+1)+","+data.pageMaker.amount+")"'> »</a></li> </c:if></ul></div>"	
										$("#orderList").append(html);
									}, //ajax 성공 시 
									error : function(request, status, error) {
										
									} // ajax 에러 시 end

								});
						
					}
	
	// 버튼 클릭시 리스트 조회
	function listOrder(paystate,pageNum,amount) {
		
		
		$
				.ajax({
					url : "/myPage/orderList/ajax/"+paystate,
					type : "get",
					data : {
						pageNum : pageNum,
						amount : amount
					},
					success : function(data) {
						$(".payList").remove();
						$(".pagination").remove();	
						var html = "";
						var option ="";
						console.log(data);
						for (var i = 1; i <= data.pay.length; i++) {
							html += "<div class='row payList'> <div class='col-lg-1'> </div> <div class='col-lg-12'>"
									+ "<div class='blog-details-inner'>"
									+ "<div class='posted-by'>"
									if(data.pay[i-1].payGoodsVO.length >1){
										html += "<button type='button' class='btn ' data-toggle='collapse' data-target='#demo"+i+"'>▼</button>"
									}
									html += " <div class='row'> <div class='col-lg-5'> <div class='pb-pic'>"
									+ "<img src='/resources/img/admin/goods/"+data.pay[i-1].payGoodsVO[0].boardVO.goodsVO.thumbnail+"' class='pimg'> </div>"
									+ "<div class='pb-text'> <a href='#' onclick='orderPopup("+data.pay[i-1].pay_id+",\""+data.pay[i-1].receipt_id+"\")'> <span>"
									+ data.pay[i - 1].pay_id
									+ " / "
									+ getFormatDate(data.pay[i - 1].paydate)
									+ "</span> </a> <a href='/admin/goods_detail/"+data.pay[i-1].payGoodsVO[0].boardVO.board_id+"'><p style='font-size: 22px'>"
									+ data.pay[i - 1].payGoodsVO[0].boardVO.goodsVO.goodsname
									+ "</p></a>"
									if(data.pay[i - 1].payGoodsVO[0].pcolor != null && data.pay[i - 1].payGoodsVO[0].psize != null){
										html += "<span style='font-size: 13px'>옵션 - "+data.pay[i - 1].payGoodsVO[0].pcolor+" / "+data.pay[i - 1].payGoodsVO[0].psize+"</span>" 
										option = "옵션 - "+data.pay[i - 1].payGoodsVO[0].pcolor+" / "+data.pay[i - 1].payGoodsVO[0].psize
									} else if(data.pay[i - 1].payGoodsVO[0].pcolor != null && data.pay[i - 1].payGoodsVO[0].psize == null){
										html += "옵션 - "+data.pay[i - 1].payGoodsVO[0].pcolor
										option = "옵션 - "+data.pay[i - 1].payGoodsVO[0].pcolor
									} else if(data.pay[i - 1].payGoodsVO[0].pcolor == null && data.pay[i - 1].payGoodsVO[0].psize != null){
										html += "옵션 - "+data.pay[i - 1].payGoodsVO[0].psize
										option = "옵션 - "+data.pay[i - 1].payGoodsVO[0].psize
									}
							
									html +="</div>"
									+ "</div> <div class='col-lg-1'></div> <div class='col-lg-3' style='text-align: center;'> <br> <span style='font-size: 18px;'>총 금액 : "
									+ data.pay[i - 1].payprice
									+ "원</span><br> <span  style='font-size: 18px;'>수량 : "
									+ data.pay[i - 1].payGoodsVO[0].amount
									+ "</span>"
									switch (data.pay[i-1].paystateVO.paystate_id){
									case 1 :
										html += "</div> <div class='col-lg-3'  style='text-align: right;'><span style='font-size: 20px'>상품준비중<br><span style='font-size: 20px'><button onclick='payCancel(\""+data.pay[i-1].receipt_id+"\")'>결제취소</button></span></div> </div>"
											break;
										case 2 :
										html += "</div> <div class='col-lg-3'  style='text-align: right;'><span style='font-size: 20px'><br>배송준비중</span></div> </div>"
											break;
										case 3 :
											html += "</div> <div class='col-lg-3' style='text-align: right;'><span style='font-size: 20px'><br><button onclick='delivery("+data.pay[i-1].t_key+","+data.pay[i-1].t_invoice+")'>배송조회</button></span>"
												+ "</div> </div>" 
												break;
										case 4 :
											html += "</div> <div class='col-lg-3' style='text-align: right;'> <span style='font-size: 20px'><button onclick='delivery("+data.pay[i-1].t_key+","+data.pay[i-1].t_invoice+")'>배송조회</button><br>"
												+ "<button>구매확정</button></span>"
												+ "</div> </div>"
												break;
										case 5 :
											html += "</div> <div class='col-lg-3' style='text-align: right;'>"
												+ "<span style='font-size: 20px'><br><button id='myBtn' onclick='modals("+data.pay[i - 1].payGoodsVO[0].boardVO.goodsVO.goods_id+" ,\""+data.pay[i - 1].payGoodsVO[0].boardVO.goodsVO.thumbnail+"\",\""+data.pay[i-1].payGoodsVO[0].boardVO.goodsVO.goodsname+"\", "+data.pay[i-1].paystateVO.paystate_id+" , \""+option+"\")'>리뷰 작성</button></span>"
												+ "</div> </div>" 
												break;
										case 6 :
											html += "</div> <div class='col-lg-3' style='text-align: right;'>"
												+ "<span style='font-size: 20px'><br>취소된 결제</span>"
												+ "</div> </div>" 
												break;
										case 7 :
											html += "</div> <div class='col-lg-3' style='text-align: right;'>"
												+ "<span style='font-size: 20px'>교환처리<br><button onclick='delivery("+data.pay[i-1].t_key+","+data.pay[i-1].t_invoice+")'>배송조회</button></span> "
												+ "</div> </div>" 
												break;
										case 8 :
											html += "</div> <div class='col-lg-3' style='text-align: right;'>"
												+ "<span style='font-size: 20px'><br>환불처리</span>"
												+ "</div> </div>" 
												break;
										default :
											break;
									}
									if( data.pay[i - 1].payGoodsVO.length>1){
										html +=" <hr><div class='row collapse in' id='demo"+i+"'> "
										option ="";
										for (var j = 1; j < data.pay[i - 1].payGoodsVO.length; j++) {
											html += " <div class='col-lg-5'> <div class='pb-pic'>"
													+ "<img src='/resources/img/admin/goods/"+data.pay[i-1].payGoodsVO[j].boardVO.goodsVO.thumbnail+"' class='pimg'> </div>"
													+ "<div class='pb-text'><a href='/admin/goods_detail/"+data.pay[i-1].payGoodsVO[j].boardVO.board_id+"'>  <p style='font-size: 22px'>"
													+ data.pay[i - 1].payGoodsVO[j].boardVO.goodsVO.goodsname
													+ "</p></a>"
													if(data.pay[i - 1].payGoodsVO[j].pcolor != null && data.pay[i - 1].payGoodsVO[j].psize != null){
														html += "<span style='font-size: 13px'>옵션 - "+data.pay[i - 1].payGoodsVO[j].pcolor+" / "+data.pay[i - 1].payGoodsVO[j].psize+"</span>" 
														option = "옵션 - "+data.pay[i - 1].payGoodsVO[j].pcolor+" / "+data.pay[i - 1].payGoodsVO[j].psize
													} else if(data.pay[i - 1].payGoodsVO[j].pcolor != null && data.pay[i - 1].payGoodsVO[j].psize == null){
														html += "옵션 - "+data.pay[i - 1].payGoodsVO[j].pcolor
														option = "옵션 - "+data.pay[i - 1].payGoodsVO[j].pcolor
													} else if(data.pay[i - 1].payGoodsVO[j].pcolor == null && data.pay[i - 1].payGoodsVO[j].psize != null){
														html += "옵션 - "+data.pay[i - 1].payGoodsVO[j].psize
														option = "옵션 - "+data.pay[i - 1].payGoodsVO[j].psize
													}
													html += "</div>"
													+ "</div> <div class='col-lg-1'></div> <div class='col-lg-3' style='text-align: center;'> <br>"
													+ "<span  style='font-size: 18px'>수량 : "
													+ data.pay[i - 1].payGoodsVO[j].amount
													+ "</span>"
													+ "</div> <div class='col-lg-3'  style='text-align: right;'> <br>"
													if(data.pay[i-1].paystateVO.paystate_id==5){
														html += "<span style='font-size: 20px'><button id='myBtn' onclick='modals("+data.pay[i - 1].payGoodsVO[j].boardVO.goodsVO.goods_id+" ,\""+data.pay[i - 1].payGoodsVO[j].boardVO.goodsVO.thumbnail+"\",\""+data.pay[i-1].payGoodsVO[j].boardVO.goodsVO.goodsname+"\", "+data.pay[i-1].paystateVO.paystate_id+" , \""+option+"\")'>리뷰 작성</button></span>"
													}
													html +="</div>"	
												
													if(j < data.pay[i-1].payGoodsVO.length-1){
														html += "<div class='col-lg-12'><br></div>"
													}
										}
										html +="</div>"	
									}
									html +="</div></div></div></div></div>"
						}
						html += "<div class='container'><ul class='pagination'  style='justify-content: center;'><c:if test='"+data.pageMaker.prev+"'>"
						+"<li class='page-item'> <a class='page-link' onclick='listOrder("+paystate+","+(data.pageMaker.startPage-1)+","+data.pageMaker.amount+")"'>«</a></li> </c:if>"
						for(var i = data.pageMaker.startPage; i<=data.pageMaker.endPage;i++){
						html += "<li class='page-item'> <a class='page-link' onclick='listOrder("+paystate+","+i+","+data.pageMaker.cri.amount+")'>"+i+"</a></li> "	}
						html += "<c:if test='${"+data.pageMaker.next +"&&"+ data.pageMaker.endPage+"> 0}'> <li class='page-item'> <a class='page-link' onclick='listOrder("+paystate+","+(data.pageMaker.endPage+1)+","+data.pageMaker.amount+")"'> »</a></li> </c:if></ul></div>"
						$("#orderList").append(html);
					}, //ajax 성공 시 
					error : function(request, status, error) {
						
					} // ajax 에러 시 end

				}) }
	
	//공백확인용...
	(function () {
	'use strict'

	// Fetch all the forms we want to apply custom Bootstrap validation styles to
	var forms = document.querySelectorAll('.needs-validation')

	// Loop over them and prevent submission
	Array.prototype.slice.call(forms)
	.forEach(function (form) {
	form.addEventListener('submit', function (event) {
	if (!form.checkValidity()) {
	event.preventDefault()
	event.stopPropagation()
	}

	form.classList.add('was-validated')
	}, false)
	})
	})();

	//사진
	$(document)
	.ready(
	function(e) {
	$("input[type='file']")
	.change(
	function(e) {

	//div 내용 비워주기
	$('#preview').empty();

	var files = e.target.files;
	var arr = Array.prototype.slice
	.call(files);

	//업로드 가능 파일인지 체크
	for (var i = 0; i < files.length; i++) {
	if (!checkExtension(
	files[i].name,
	files[i].size)) {
	return false;
	}
	}

	preview(arr);

	});//file change

	function checkExtension(fileName, fileSize) {

	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 20971520; //20MB

	if (fileSize >= maxSize) {
	alert('파일 사이즈 초과');
	$("input[type='file']").val(""); //파일 초기화
	return false;
	}

	if (regex.test(fileName)) {
	alert('업로드 불가능한 파일이 있습니다.');
	$("input[type='file']").val(""); //파일 초기화
	return false;
	}
	return true;
	}

	function preview(arr) {
	arr
	.forEach(function(f) {

	//파일명이 길면 파일명...으로 처리
	var fileName = f.name;
	if (fileName.length > 10) {
	fileName = fileName.substring(0, 7)
	+ "...";
	}

	//div에 이미지 추가
	var str = '<div style="display: inline-flex; padding: 10px;">';

	//이미지 파일 미리보기
	if (f.type.match('image.*')) {
	var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
	str += '<ul><img src="'+e.target.result+'" title="'+f.name+'" width=300 height=300 />';
	str += '</ul></div>';
	$(str).appendTo('#preview');
	}
	reader.readAsDataURL(f);
	}
	});//arr.forEach
	}
	});

	//사진
	function readImage(input) {
	// 인풋 태그에 파일이 있는 경우
	if(input.files && input.files[0]) {
	// 이미지 파일인지 검사 (생략)
	// FileReader 인스턴스 생성
	const reader = new FileReader()
	// 이미지가 로드가 된 경우
	reader.onload = e => {
	const previewImage = document.getElementById("preview-image")
	
	}
	// reader가 이미지 읽도록 하기
	reader.readAsDataURL(input.files[0])
	}
	}
	// input file에 change 이벤트 부여
	const thumbnail = document.getElementById("image")
	thumbnail.addEventListener("change", e => {
	readImage(e.target)
	})

	$("#image").change(function(){
	if(this.files && this.files[0]) {
	var reader = new FileReader;

	reader.readAsDataURL(this.files[0]);
	}
	}); 

	//모달
	var modal = document.getElementById('myModal');

	var span = document.getElementsByClassName("close")[0];                                          

	function modals(goods_id , thumbnail, title, paystate_id, option){
		modal.style.display = "block";
		$("#goods_id").val(goods_id);
		$("#pimg").attr("src", "/resources/img/admin/goods/"+thumbnail);
		$("#goodsName").text("상품명 : "+title);
		$("#paystate_id").val(paystate_id);
		$("#goodsoption").text(option);
	}

	span.onclick = function() {
	modal.style.display = "none";
	}

	window.onclick = function(event) {
	if (event.target == modal) {
	modal.style.display = "none";
	}
	}  
	
	// 배송조회
	function delivery(t_code,t_invoice){
		console.log(t_code);
		console.log(t_invoice);
		$("#t_code").val(t_code); // 택배사 코드
		$("#t_invoice").val(t_invoice); //운송장 번호
		var _left = Math.ceil(( window.screen.width - 570 )/2);
		var _top = Math.ceil(( window.screen.height - 420 )/2);
		var pop = window.open("/popup/deliveryPopup.jsp", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes, left="+_left+", top="+_top);
	}
	
	// 시간 포맷 함수
	function getFormatDate(date) {

		var date = date.substr(0, 10);
	
		return date; 
	}
	// 카트 갯수 확인
	$(document).ready(function() {
		console.log("실행")
		var count = 0;
		if (sessionStorage.getItem("cartList") != null) {
			count = JSON.parse(sessionStorage.getItem("cartList")).length;
		}

		if (count > 0) {
			html = "<span id='cartCount'>" + count + "</span>"
			$("#cartCount").append(html)
		}

	})
	
	// 주문상세정보 팝업
	function orderPopup(pay_id,receipt_id){
		event.preventDefault();
		
		var _left = Math.ceil(( window.screen.width - 800 )/2);
		var _top = Math.ceil(( window.screen.height - 600 )/2);
		window.open("", "pop",
					"width=800,height=600, scrollbars=yes, resizable=yes, left="+_left+", top="+_top);
		$("#popReceipt_id").val(receipt_id);
		iniform.target="pop";
		console.log(receipt_id);
		iniform.action="/myPage/orderList/popup/"+pay_id;
		iniform.submit();
	}
	// 결제 취소
	function payCancel(receipt_id) {
		console.log("실행");
    	$.ajax({
			url : "/myPage/orderList/payCancel/"+receipt_id,
			type : "post",
			data :{
				name : $("#memberName").val(),
				reason : "개인사유"
				
			},
			success : function(data) {
				alert("정상적으로 취소되었습니다.");
				
			},
			error : function(request, status, error){
				
				
			}
		
		})
		
    }
</script>
<script>
	//위치기반 인증 자바스크립트 함수
	function location_auth() {

		try {
			var member_id = document.getElementById("member_id").value;
		} catch (e) {
			console.error(e);
			alert("로그인 후 이용 가능합니다.");
			location.href = "/login/login";
		}

		var location_security = document.getElementById("location_security").value;
		var member_id = document.getElementById("member_id").value;
		var nickname = document.getElementById("nickname").value;
		//var location = document.getElementById("location").value; 
		console.log(location_security);

		if (location_security == null) {

			location.href = "/map/home";

		} else {

			location.href = "/map/board?location=" + location_security
					+ "&member_id=" + member_id + "&nickname=" + nickname;

			console.log(location_security);
			console.log(member_id);
			console.log(nickname);

		}

	}
	

	
</script>
<!-- Js Plugins -->
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
</html>