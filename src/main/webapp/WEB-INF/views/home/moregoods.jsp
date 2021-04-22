<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/select-style.css"
	type="text/css">
<link rel="stylesheet" href="/resources/js/select-index.js"
	type="text/css">

<style>
#hashtag {
	font-size: 13px;
	padding: 0.01px;
}
#hashtag:hover{
background-color:#dddddd;
}

a:link {
	text-decoration: none;
	color: #333333;
}

a:visited {
	text-decoration: none;
	color: #333333;
}

a:active {
	text-decoration: none;
	color: #333333;
}

a:hover {
	text-decoration: none;
}
</style>
<script>

</script>
</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">

		
		<input type="hidden" name="keyword" value="${param.keyword}">
		<h5><b>'${param.keyword}'</b>에 대한 검색결과 <b>${gcount}건</b></h5>
			<br><br>
						<div id="table" class="row text-center"
					style="margin-top: 20px; margin-left: 5px;">
					<c:forEach items="${moregoods}" var="mg">
						<div class="product-item col-sm-3">
							<div class="pi-pic">
							<a href="/admin/goods_detail/${mg.board_id}">
								<img src="/resources/img/admin/goods/${mg.goodsVO.thumbnail}" alt=""
									style="width: 160px; height: 230px; border-radius: 6px;"></a>
							</div>
							<div class="pi-text">
								<h6>${mg.goodsVO.goodsname}</h6>
								<div class="product-price">${mg.goodsVO.price}원</div>
							</div>
						</div>
					</c:forEach>
	</div>
	
	
	 <div class="later col-lg-12 text-center">
            <button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
	 </div>
	        
	        
</div>
	
	<script type="text/javascript">
      var pageNum = 1;
     
      function btnClick(){

    	  pageNum += 1;
    	  console.log(pageNum);
    	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/goodsmorelist",
    	        data : {
    	        	pageNum: pageNum,
    	        	keyword:"${param.keyword}"
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var goodslist = data.goodslist;
					
    	          html = " "
    	           for(var i in goodslist){
    	        	  html  +="<div class='product-item col-sm-3'>"
							+"<div class='pi-pic'>"
							+"<a href='/admin/goods_detail/"+goodslist[i].board_id+"'>"
							+"<img src='/resources/img/admin/goods/"+goodslist[i].goodsVO.thumbnail+"' alt=''"
							+"style='width: 160px; height: 230px; border-radius: 6px;'></a>"
							+"</div>"
							+"<div class='pi-text'>"
							+"<h6>"+goodslist[i].goodsVO.goodsname+"</h6>"
							+"<div class='product-price'>"+goodslist[i].goodsVO.price+"원</div>"
							+"</div>"
							+"</div>"
    	           }
    	           
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