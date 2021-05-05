<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>상품조회</title>
<!-- 제이쿼리 사용하는 cnd -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script> 

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/sidemenu/js/custom.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- Bootstrap -->
<link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="/resources/sidemenu/css/styles.css" rel="stylesheet">
 



<script>
   $(document).ready(function() {
      $.fn.generateStars = function() {
         return this.each(function(i, e) {
            $(e).html($('<span/>').width($(e).text() * 16));
         });
      };
      // 숫자 평점을 별로 변환하도록 호출하는 함수
      $('.star-prototype').generateStars();
   });
   function inputCart() {
      var cart = JSON.parse(sessionStorage.getItem("cartList"));
      if (!cart) {
         console.log("카트생성");
         cart = new Array();
      }
      var goods = new Object();
      goods.board_id = '${goods.board_id}';
      goods.amount = parseInt($("#amount").val());
      goods.psize = $("#psize").val();
      goods.pcolor = $("#pcolor").val();
      console.log(goods);
      cart.push(goods);
      console.log(cart);
      sessionStorage.setItem("cartList", JSON.stringify(cart));
      if (confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?") == true) { //확인
         window.location.assign("/myPage/cart");
      } else { //취소
         return false;
      }
   }

   
</script>
<style>

select {

      text-align-last: center; 
      text-align: center; 
      -ms-text-align-last: center; 
      -moz-text-align-last: center;

    }
    
.profile_box {
	width: 30px;
	height: 30px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile_box2 {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.tab-item {
	width: 1000;
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

.shoppingguide {
	margin: 10px auto 10%;
	max-width: 1100px;
	background: #fff;
	border: 1px #d5d5d5 solid;
	color: #555;
	line-height: 23px;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
	font-size: 8px;
}

table {
	width: 100%;
	boder-collapse: collapse;
}

td, th {
	border-bottom: 1px solid #000000;
}

th {
	background: #FFFFF0;
	text-align: -internal-center;
	font-size: 20px;
}

h2 {
	text-align: center;
}

.owl-carousel .owl-item img {
	display: block;
	width: 130px;
	height: 150px;
}



 

.imgList {
	width: 100%;
	justify-content: space-around;
	align-items: center;
}

.imgC p {
	text-align: center;
}

.modal {
	display: none;
	z-index: 500;
	width: 100%;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.1);
}

.modal button {
	position: absolute;
	top: 3rem;
	right: 3rem;
	background: transparent;
	border: 0;
	color: #ffffff;
	font-size: 3rem;
}

.modalBox {
	position: relative;
	top: 35%;
	left: 50%;
	transform: translate(-50%, -20%);
	background-color: #ffffff;
	width: 30%;
	height: 30%;
	text-align: center;
}

.modalBox img {
	width: 100%;
	border-radius: 5px;
}

.modalBox p {
	color: #ffffff;
	background-color: #000;
	font-size: 2rem;
	padding: .2rem;
}

#bottom {
	margin-left: 28px;
	margin-top: 1px;
}

.pt{
	 width: 140px;
 	 height: 150px;
	 object-fit: cover;

}
</style>

</head>
<body style="padding-top: 80px">



	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Page Content -->
	<!-- Product Shop Section Begin -->

	<section class="product-shop spad page-details">
		<div class="container">

			<div class="row">

				<div class="col-lg-12">
			<input type="hidden" name="board_id" value="${goods.board_id}"> 
			<input type="hidden" name="goods_id" value="${goods.goodsVO.goods_id}"> 				 
			<div style="float: right">
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">  
			<button type="button" id="delete_button" class="btn" style="background-color: #FFC81E;  color:black;" onclick="button_event();">삭제</button>
		    </sec:authorize>  
			</div>
						
							<div class="col-lg-6">
								<div class="product-pic-zoom">
									<img class="product-big-img" height="600px;"
										src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}"
										alt="">
									<div class="zoom-icon">
										<i class="fa fa-search-plus"></i>
									</div>
								</div>
								<div class="product-thumbs">
									<div class="product-thumbs-track ps-slider owl-carousel ">
										<div class="pt active"
											data-imgbigurl="/resources/img/admin/goods/${goods.goodsVO.thumbnail}">
											<img src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}" style="width:140px;  height: 150px; object-fit: cover;"
												   alt="">
										</div>
										<c:forEach var="goods" items="${img}">
											<div class="pt"
												data-imgbigurl="/resources/img/admin/board/${goods.imgname}">
												<img src="/resources/img/admin/board/${goods.imgname}" style="width:140px; height: 150px; object-fit: cover;"
													alt="">
											</div>
										</c:forEach>
									</div>
								</div>
							</div>


							<div class="col-lg-6" style="padding-left: 40px;">
								<div class="product-details">
									<div class="pd-title">
										<input type="hidden" name="board_id" value="${goods.board_id}">
										<input type="hidden" name="goods_id"
											value="${goods.goodsVO.goods_id}"> <input
											type="hidden" name="goods_id" value="${goods.pdate}">


										<span>${goods.categoryVO.categoryname}/${goods.categoryVO.sortname}</span>
										<div style="padding-top: 10px;">
											<h3>${goods.goodsVO.goodsname}</h3>
										</div>


									</div>
									<div class="pd-rating" style="margin: 10px 0px;">

										<c:if test="${one.goodsVO.goods_id eq goods.goodsVO.goods_id}">
											<span class="star-prototype"> ${one.avgscore}</span>
											<span> &nbsp; ${one.count}개 리뷰</span>
										</c:if>

									</div>
									
								
									<div class="pd-desc" style="margin: 20px 0px;">
										<small>${goods.goodsVO.description}</small>
										<h4 style="margin: 30px 0px;">
											<fmt:formatNumber value="${goods.goodsVO.price}"
												pattern="###,###,###" />
											원
										</h4>

									</div>

									<div class="pd-share" style="padding-top: 20px;">
										<div class="p-code">
											<p>
												혜택 : <b>${goods.goodsVO.point}P</b> 적립 <small>(구매금액의
													1% 적립)</small> </br> 배송 : <b>2500원</b> 선결제 <small>(30,000원 이상시
													무료배송)</small>
											</p>
											<small>※ 재고상태 : ${goods.goodsVO.stockVO.stockname}</small></br>
										</div>
									</div>


									<div style=" min-height : 200px; padding-top: 52px; float: fixed;">
										<c:if test="${not empty goods.goodsVO.pcolor}">
											<div class="pd-color-choose">
												<select class="form-control" id="pcolor" name="pcolor" style="width:200px;" > 
													<c:set var="pcolor" value="${goods.goodsVO.pcolor}" />
													<c:set var="color" value="${fn:split(pcolor, ',')}" />
													<c:forEach var="c" items="${color}">
													 	<option value="${c}">${c}</option>
													 </c:forEach>
												</select>
											</div>
										</c:if>



										<script type="text/javascript">
                             				 $(".pd-color-choose .color-item label").on('click',
                                          function() {
                                             $(".pd-color-choose .color-item label").removeClass('activeColor');
                                             $(this).addClass('activeColor');
                                          });
                          				 </script>

										<c:if test="${not empty goods.goodsVO.psize}">
											<div class="pd-size-choose">
											 	<select class="form-control" id="psize" name="psize"  style="width:200px;" > 
													<c:set var="psize" value="${goods.goodsVO.psize}" />
													<c:set var="size" value="${fn:split(psize, ',')}" />
													<c:forEach var="s" items="${size}">
														 <option value="${s}">${s}</option>
													</c:forEach>
												</select>
											</div>
										</c:if>

										<div class="quantity" style="position : absolute; top:500px; ">
											<div class="pro-qty">
												<span class="dec qtybtn">-</span> <input id="amount"
													type="text" value="1"> <span class="inc qtybtn">+</span>
											</div>
											<div onclick="inputCart()" class="primary-btn pd-cart" style="cursor: pointer;">Add To Cart</div>

										</div>
									</div>
								</div>
							</div>
						</div>
				</div>


				    <div class="product-tab">
               <div class="tab-item" >
                  <ul class="nav" role="tablist">
                     <li><a class="active" data-toggle="tab" href="#tab-1"
                        role="tab" style="width:335px; text-align:center;"> 상세정보 </a></li>
                     <li><a data-toggle="tab" href="#tab-2" role="tab" style="width:335px; text-align:center;"> 고객리뷰
                     </a></li>
                     <li><a data-toggle="tab" href="#tab-3" role="tab" style="width:330px; text-align:center;">주문가이드</a></li>
                  </ul>
               </div>
               <div class="tab-item-content">
                  <div class="tab-content">
                     <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                        <div class="product-content">
                           <div class="row">
                              <div class="col-lg-11">
                                  
                                 <img src="/resources/img/admin/goods/츄통령.jpg">
                                 
                              </div>
                           </div>
                        </div>
                     </div>


							<!--                   리뷰 탭2                -->

                     <div class="tab-pane fade" id="tab-2" role="tabpanel" value=8>
                        <div class="customer-review-option" style="width:1000px; float:left;">

                          	 <c:if test="${one.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                              	<span style="font-size: 19px;"><b> &nbsp; ${one.count}개의 리뷰</b></span>
                           	</c:if>
                          	 <hr>
                              <div class="container" style="margin-bottom: 10px;">
                                    <div id="comments"></div>
                              </div>

                              <div class="container">
                                 <div class="col-lg-12 text-center" id="page"></div>
                              </div>
                        
 
                        </div>
                     </div>
                           <!--                   리뷰 탭2 end               -->
					<div class="tab-pane fade" id="tab-3" role="tabpanel">

							<br> <br>
							<div class="shoppingguide" style="width:1000px; float:left;">

							<table>

										<colgroup>
											<col style="width: 20%;">
											<col style="width: 60%;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" style="text-align:center;">상품결제정보</th>
												<td><p>
														고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나
														타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.
														&nbsp; <br> <br>무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹,
														텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>주문 시 입력한
														입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은
														주문은 자동취소 됩니다. <br>

													</p>
													<p>품질보증기준: 전자상거래 소비자 보호법에 의거하여 소비자 청약철회 가능한 기준에 따름.</p>
													<p>구매자가 미성년자일 경우 법정 대리인이 계약에 동의하지 않을 때 구매를 취소할 수 있습니다.</p></td>
											</tr>
											<tr>
												<th scope="row" style="text-align:center;">배송정보</th>
												<td><p>
														펫츠하우스는 대한민국 택배 no.1 우체국택배를 이용하여<br>가장 안전하고, 신속하게 배송하여
														드립니다 :) <br>대부분 출고 다음날에 바로 도착하며 (주말 제외)<br>지역 택배
														기사님들의 일정과 기상상황에 따라 변동이 있을 수 있습니다. <br>기본 배송 준비일은 입고지연
														상품 제외, 2~5일 정도가 소요되고 있습니다.<br>
													</p></td>
											</tr>
											<tr>
												<th scope="row" style="text-align:center;">교환 및 반품정보</th>
												<td><p>
														[교환/반품 안내]<br>물품 수령 후(택배 도착일자 기준) 7일 이내에 Q&amp;A "배송
														후 교환/반품" 게시판 또는 고객센터 [070-7000-0000]
													</p>
													<p>
														로 반드시 접수 해주세요. 글쓰기시 양식이 자동으로 등록되어 있으며, 사전에 신청해 주신 상품에 한해서만
														교환/반품이 가능합니다.<br>접수 시 펫츠하우스에서 우체국 택배 회수접수를 도와드리고
														있습니다.
													</p>

													<p>
														*패킹하여 보내실 때는 물품 수령시와 동일하게 포장해 주세요.<br>택에 손상이 있는 경우에는
														반품과 교환이 모두 불가합니다.<br>성함,주소,전화번호,보내시는 상품,사유등 반품카드 양식에
														맞게 적어 보내주셔야 처리가 가능합니다.
													</p>


													<p>
														&lt;교환반품 불가사항&gt;<br>-상품 수령 후 7일 이상 경과된 경우<br>-상품
														구매시 교환/환불 불가능이 명시되어 있는경우<br>-사용 흔적(집냄새,향수냄새,체취) / 텍
														제거 및 바코드 훼손, 오염이 발견된 상품<br>-세일상품
													</p>
													<p>-배송시 생긴 구김, 마감 박음질, 제작과정에서 발생하는 냄새나 초크자국 등 대량생산으로 인해
														생긴 사유는 불량으로 간주되지 않습니다.</p>
													<p>
														<br>*불량상품의 재발송 시 왕복배송비는 펫츠하우스가 부담합니다.
													</p></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<!-- input ajax 끝나는 곳! -->
		 

	</section>
	<!-- Product Shop Section End -->
 
	
	<!-- 수정 삭제 경고창 -->
	<script type="text/javascript">
		function button_event() {
			if (confirm("정말 삭제하시겠습니까?") == true) { //확인
				var goods_id = $('#goods_id').val();
				var url = "/admin/board/" + goods_id;
				
				$.ajax({
					type : "DELETE",
					url : url,
					cache : false,
					success : function(result) {
						console.log(result);
						if (result == "SUCCESS") {
							$(location).attr('href', '/store/home')
						}
					},
					error : function(e) {
						console.log(e);
					}
				})
				
			} else { //취소
				return;
			}
		}

	
		
	</script>
	<script>
$(function(){
//    이미지 클릭시 해당 이미지 모달
   $(".imgC").click(function(){
      $(".modal").show();
      // 해당 이미지 가겨오기
      var imgSrc = $(this).children("img").attr("src");
      var imgAlt = $(this).children("img").attr("alt");
      $(".modalBox img").attr("src", imgSrc);
      $(".modalBox img").attr("alt", imgAlt);
      
      // 해당 이미지 텍스트 가져오기
      // var imgTit =  $(this).children("p").text();
      // $(".modalBox p").text(imgTit);
      
   // 해당 이미지에 alt값을 가져와 제목으로
      $(".modalBox p").text(imgAlt);
   });
   
   //.modal안에 button을 클릭하면 .modal닫기
   $(".modal button").click(function(){
      $(".modal").hide();
   });
   
   //.modal밖에 클릭시 닫힘
   $(".modal").click(function (e) {
    if (e.target.className != "modal") {
      return false;
    } else {
      $(".modal").hide();
    }
  });
});
</script>
  <script>
		function getFormatDate(date) {
			
			var date = date.substr(0, 10);
			return date; 
		}	
	  </script>
<script type="text/javascript">

      //timerID = setTimeout("getListComment()", 3);
      var start = 0;
      $(document).ready(function() {
         getListReview();

      })

      function getListReview(type) {
         if (type == 2) {

         } else {
            start += 5;
         }
         console.log(start)

         console.log("실행");
         $
               .ajax({
                  type : "POST",
                  url : "/admin/rmorelist",
                  data : {
                     amount : start,
                     goods_id : "${goods.goodsVO.goods_id}" //goods_id 면 goodsVO.goods_id
                  },
                  success : function(data) {
                     $("#comments").empty();   //댓글부분
                     $("#page").empty();    //더보기
                     console.log(data);
                     var review = data.review;

                     html = " "
                     for ( var i in review) {
                        html +="<div class='co-item'><div class='avatar-text'><div class='at-rating'><div class='row'><div class='profile_box'>"
                              +"<a href='/myPage/"+review[i].memberVO.nickname+"'> "
                              +"<img src='/resources/img/member/profile/"+review[i].memberVO.thumbnail+"' name='profile' alt='' class='profile' /></a></div>"
                              +"<div style='padding-top: 8px; padding-left: 5px; font-size: 15px;'>"
                              +"<b>"+review[i].memberVO.nickname+"</b>"
                              +"<span class='star-prototype'> <span class='star' style='width:"+(review[i].ratescore*16)+"px'> </span></div></div></div>"
                           
                              
                        if ( null != review[i].title) {
                           html +="<div class='imgList'>"
                               +"<span class='imgC'> <img style='margin-left: 28px; width: 100px; height: 100px; border-radius: 5px;' src='/resources/img/member/review/"+review[i].title+"' alt='' /> </span></div>"
                        } else {
                           
                        }

                        html += "<div id='bottom'><div>"+review[i].content+"</div><div style='color: gray'>"+getFormatDate(review[i].pdate)+"</div></div>"
                           +"<div class='modal'>"
                           +"<button>&times;</button>"
                           +"<div class='modalBox'>"
                           +"<img src='/resources/img/member/review/"+review[i].title+"' alt=''></div></div>"
                           +"</div></div><hr>"

                     }
                     html +="</div>";
                        
                     $("#comments").append(html);
                     console.log(data.one);
                     if (data.review.length < data.one.count) {
                        html2 = "<button type='button' class='btn btn-disabled' onClick='getListReview()'>더보기 <i class='fa fa-caret-down' aria-hidden='true'></i></button>"

                        $("#page").append(html2);

                     } else {

                     }

                  },
               });
      }

</script>

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
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


</body>

</html>