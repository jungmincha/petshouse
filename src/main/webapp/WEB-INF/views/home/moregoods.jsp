<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>펫츠하우스</title>
<!-- bootstrap css cdn -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

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


<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>

#navbars>li:nth-child(1) {
   background-color: #e7ab3c;
}
#hashtag {
	font-size: 13px;
	padding: 0.01px;
}
#hashtag:hover{
	background-color:#dddddd;
}
span.star-prototype, span.star-prototype>*, span.star, span.star>* {
	height: 16px;
	background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    display: inline-block;
	}
	
span.star-prototype>*, span.star>* {
	background-position: 0 0;
	max-width: 80px;
	}
	
img{
border-radius:8px;
}

b{
color:#FFBF00
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$.fn.generateStars = function() {
			return this.each(function(i, e) {
				$(e).html($('<span/>').width($(e).text() * 16));
			});
		};

		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();
	})
</script>
</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">

		
		<input type="hidden" name="keyword" value="${param.keyword}">
		<h5><b>'${param.keyword}'</b>에 대한 검색결과 <b>${gcount}</b>건</h5>
			<br><br>
			
				<div id="table" class="row text-center"
				style="margin-top: 20px; margin-left: 5px;">

				<c:forEach items="${moregoods}" var="mg">
					<div class="product-item col-sm-3">
						<div class="pi-pic">
							<a href="/admin/goods_detail/${mg.board_id}"><img
								src="/resources/img/admin/goods/${mg.goodsVO.thumbnail}" alt=""></a>
						</div>

						<div class="pi-text">
							<a href="/admin/goods_detail/${mg.board_id}">
								<h5>${mg.goodsVO.goodsname}</h5>
							</a>
							<div class="product-price">${mg.goodsVO.price}원</div>
							<c:forEach items="${rate}" var="rate">
								<c:if test="${rate.goodsVO.goods_id eq mg.goodsVO.goods_id}">
									<span class="star-prototype"> ${rate.avgscore}</span>
									<span> &nbsp;리뷰 ${rate.count}</span>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
	
	
 <c:if test="${fn:length(gocount) > 8}">
                <input type="hidden" class="count" value="${fn:length(gocount)}" />
	            <div class="col-lg-12 text-center">
	            	<button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
		        </div>
		      </c:if>
	        
	        
</div>
	
	<script>
	  var pageNum = 1;
      var check = $('.count').val() / 8;
     
      function btnClick(){
    	  pageNum += 1;
    	  
    	  if (pageNum > check) {
              $(".btn").hide();
           }
    	  
    	  console.log(pageNum);
    	  console.log(check);
    	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/goodsmorelist",
    	        data : {
    	        	pageNum: pageNum,
    	        	keyword:"${param.keyword}"
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var rate= data.rate;
    	           var moregoods = data.moregoods;
    	           
					
    	          html = " "
    	           for(var i in moregoods){
    	        	  html  +="<div class='product-item col-sm-3'><div class='pi-pic'>"
    	        		 	  +"<a href='/admin/goods_detail/"+moregoods[i].board_id+"'>"
    	        			  +"<img src='/resources/img/admin/goods/"+moregoods[i].goodsVO.thumbnail+"' alt=''></a></div>"
    	        			  +"<div class='pi-text'>"
    	        			  +"<a href='/admin/goods_detail/"+moregoods[i].board_id+"'>"
    	        			  +"<h5>"+moregoods[i].goodsVO.goodsname+"</h5></a>"
    	        			  +"<div class='product-price'>"+moregoods[i].goodsVO.price+"원</div>";
    	        	  for(var j in rate){
  	       	          	if(rate[j].goodsVO.goods_id == moregoods[i].goodsVO.goods_id){
    	           html+="<span class='star-prototype'> <span class='star' style='width:"+(rate[j].avgscore*16)+"px'> </span>" + "</span>" 
    	                +" <span> &nbsp; 리뷰" + rate[j].count+"</span></div></div></div>";
  	       	          	
  	       	          	
  	       	          	}
    	        	  }//goods foreach end      	   
    	           } 
    	           
    	          
   	           if(rate.length == 8){
		        		html += "<div class='btn col-lg-12 text-center'>"  
		            		 + "<button type='button' class='btn btn-warning' onClick='btnClick()'>더보기</button> </div>";			      
		        	}
   	           
   	          		 $('.btn').remove();
    	            $("#table").append(html); 
    	          
    	        }, 	        
    	        //success end
    	         error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end 
    	    }); //ajax end	 
      };
   </script>

	<!-- Footer -->
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