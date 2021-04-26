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
#navbars>li:nth-child(1) {
   background-color: #e7ab3c;
}
b{
color:#FFBF00
}
.count{
	position: absolute;
    bottom: 35px;
    right: 20px;
    font-size: 13px;
    color: #fff;
    text-shadow: 0 0 4px rgb(0 0 0 / 50%);
}
.count2{
	position: absolute;
    bottom: 55px;
    right: 30px;
    font-size: 13px;
    color: #fff;
    text-shadow: 0 0 4px rgb(0 0 0 / 50%);
}
#hashtag {
	font-size: 13px;
	padding: 0.01px;
}
#hashtag:hover{
background-color:#dddddd;
}
img{
border-radius:8px;
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
		
		<h5><b>'${param.keyword}'</b>에 대한 검색결과 <b>${tcount}</b>건</h5>
			<br><br>
			<div id="table" class="row"
							style="margin-top: 20px; margin-left: 5px;">

						<c:forEach items="${moretips}" var="mt">
				<div class="product-item col-sm-6 col-md-4 col-lg-3 ">
					<div class="pi-pic shot">
						<a href="/commu/tips/${mt.boardVO.board_id}"> <img
							src="/resources/img/tips/${mt.imgname}" alt=""
							style="height: 180px;"> <span
							class="count">조회수 ${mt.boardVO.hit}</span> 
							<span
							style="font-size: 15px; font-weight: bold;">${mt.boardVO.title}</span>
						</a>
					</div>
					<div style="font-size: 14px; text-align: left;">${mt.boardVO.memberVO.nickname}</div>
				</div>
			</c:forEach>
		</div>
		
					 
                <input type="hidden" class="count" value="${fn:length(tipscount)}" />
	            <div class="col-lg-12 text-center">
	            	<button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
		        </div>
		   
	        
	</div>
<script type="text/javascript">
var pageNum = 1;
var check = $('.count').val() / 12;

function btnClick(){
	  pageNum += 1;
	  
	  if (pageNum > check) {
        $(".btn").hide();
     }
	  
	  console.log(pageNum);
	  console.log(check);
	  		  
    	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/tipsmorelist",
    	        data : {
    	        	pageNum: pageNum,
    	        	keyword:"${param.keyword}"
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var tipslist = data.tipslist;
					
    	          html = " "
    	           for(var i in tipslist){
    	        	  html  +="<div class='product-item col-sm-6 col-md-4 col-lg-3 '>"
    	        	  +"<div class='pi-pic shot'>"
    	        	  +"<a href='/commu/tips/"+tipslist[i].boardVO.board_id+"'>"
    	        	  +"<img src='/resources/img/tips/"+tipslist[i].imgname+"' alt='' style='height: 180px;'> "
    	        	  +"<span class='count'>조회수 "+tipslist[i].boardVO.hit+"</span> "
    	        	  +"<span style='font-size: 15px; font-weight: bold;'> "+tipslist[i].boardVO.title+"</span></a></div>"
    	        	  +"<div style='font-size: 14px; text-align: left;'> "+tipslist[i].boardVO.memberVO.nickname+"</div></div></div>"
    	           }
    	           
    	          if(tipslist.length == 12){
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
   
   

	<!-- Blog Section End -->

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- Js Plugins -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.zoom.min.js"></script>
	<script src="/resources/js/jquery.dd.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>

</body>
</html>