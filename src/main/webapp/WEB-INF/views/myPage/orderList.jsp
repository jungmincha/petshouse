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
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<style>
.pimg {
	width: 80px;
	height: 80px;
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
</style>
</head>
<body style="padding-top: 180px;">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<div class="jumbotron"></div>
			</div>
			<div class="col-lg-3"></div>
		</div>

		<div class="row">
			<div class="col-lg-1"></div>

			<div class="col-lg-12">
				<div class="jumbotron"
					style="padding-top: 40px; padding-bottom: 70px">
					<div class="row ">
						<div class="col-lg-2 text-center">입금대기</div>

						<div class="col-lg-2 text-center">결제완료</div>
						<div class="col-lg-2 text-center">배송준비</div>
						<div class="col-lg-2 text-center">배송중</div>
						<div class="col-lg-2 text-center">배송완료</div>
						<div class="col-lg-2 text-center">구매확정</div>
					</div>

				</div>
			</div>

			<div class="col-lg-1"></div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="blog-details-inner">
					<div class="posted-by">
						<div class="row">
							<div class="col-lg-4">
								<div class="pb-pic">
									<img src="/resources/img/products/product-1.jpg" class="pimg"
										alt="">
								</div>
								<div class="pb-text">
									<a href="#">
										<h5>303123122 / 2021.04.08</h5>
									</a>
									<p>다용도 책상 테이블</p>
								</div>
							</div>
							<div class="col-lg-2"></div>
							<div class="col-lg-4">
								<span style="font-size: 20px">색상 - 빨강</span><br> <span
									style="font-size: 20px">29000원</span><br>

							</div>
							<div class="col-lg-2">
								<span style="font-size: 20px"><button>배송추적</button></span><br>

								<!-- 모달 버튼 -->
								<span style="font-size: 20px"><button id="myBtn">리뷰
										작성</button></span><br>

								<!-- The Modal -->
								<div id="myModal" class="modal">

									<!-- Modal content -->
									<div class="modal-content" style="width: 690px; height: 900px;">
										<div class="close">&times;</div>
										<div style="text-align: center; font-weight: bold;">
											<h4>리뷰 쓰기</h4>
										</div>

										<div class="container">

											<form id=""
												action="${pageContext.request.contextPath}/경로를 넣어주세요"
												method="Post">

												<div class="rbox">포토 리뷰 500P, 일반 리뷰 100P</div>

												<!-- 상품사진, 상품명 -->
												<div style="margin-top: 15px;">
													<div class="pb-pic">
														<img src="/resources/img/products/product-1.jpg"
															class="pimg" alt="">
													</div>
													<div class="pb-text" style="line-height: 80px;">상품 이름
														넣으세요</div>
												</div>

												<!-- 별점 -->
												<div class="rsub">별점 평가</div>
												<div class="form-group row">
													<div class="form-group">
														<div class="rate">
															<input type="radio" id="star5" name="ratescore" value="5"
																required /> <label for="star5" title="text">5
																stars</label> <input type="radio" id="star4" name="ratescore"
																value="4" /> <label for="star4" title="text">4
																stars</label> <input type="radio" id="star3" name="ratescore"
																value="3" /> <label for="star3" title="text">3
																stars</label> <input type="radio" id="star2" name="ratescore"
																value="2" /> <label for="star2" title="text">2
																stars</label> <input type="radio" id="star1" name="ratescore"
																value="1" /> <label for="star1" title="text">1
																star</label>
														</div>
													</div>
												</div>
												<!-- 별점 end -->

												<!-- 사진 등록 -->
												<div class="rsub">
													사진 등록 <span class="sub">(선택)</span>
												</div>
												<div class="form-group row">

													<div class="imgpart" style="margin: auto; width: 100%;">
														<img id="preview-image"
															src="https://dummyimage.com/400x1/ffffff&text=+">
														<div class="form-group"></div>
													</div>
													<div class="input-group col-12">
														<div class="custom-file">
															<input type="file" class="custom-file-input" id="image"
																name="image" style="display: block;"> <label
																class="custom-file-label" for="inputGroupFile02">사진을
																등록해주세요</label>
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
															id="review" placeholder="리뷰를 등록해주세요." required></textarea>
													</div>
												</div>
												<!-- 리뷰 작성 end -->

												<span>
													<button type="submit" class="btn btn-warning"
														style="margin: auto; width: 100%;"
														onclick="location.href='${pageContext.request.contextPath}/경로를 입력하세요.'">리뷰
														등록</button>
												</span>
											</form>
										</div>
									</div>
								</div>
								<!-- modal-content end -->

							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>


	<script>
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
	            previewImage.src = e.target.result
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

var btn = document.getElementById("myBtn");

var span = document.getElementsByClassName("close")[0];                                          

btn.onclick = function() {
    modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

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