<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>노하우</title>

<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

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


<script>
	//로그인 체크
	$(document).ready(function() {
		var member_id = $("#member_id").val();

		function checkLogin() {
			if (member_id == undefined) {
				alert("로그인 후 글을 작성해주세요.");
				location.href = '/login/login';
			}
		}
		$('#tw').click(function() {
			checkLogin();
		});
		
	});
</script>
<script type="text/javascript">
	function fire_ajax_submit(id) {
		console.log(id);
		var category_id = id;
		var form = {
			category_id : category_id
		};
		var url = "/commu/tips/category/" + category_id;

		$.ajax({
			type : "POST",
			contentType : 'application/json; charset=utf-8',
			url : url,
			data : JSON.stringify(form),
			cache : false,
			success : function(data) {
				console.log("SUCCESS : ", data);
				$('#input').html(data);
			},
			error : function(e) {
				console.log("ERROR : ", e);
			}
		});
	}
</script>
<style>
#navbars>li:nth-child(2) {
	background-color: #e7ab3c;
}

.count {
	position: absolute;
	bottom: 37px;
	right: 20px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}

.count2 {
	position: absolute;
	bottom: 62px;
	right: 20px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}
img{
border-radius:8px;
}

.row button{
background-color: #E6E6E6;
}
</style>
</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
		<input type="hidden" id="member_id"
			value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>


	<div id="input" class="container">

		<!--인기노하우 슬라이드-->
		<div class="filter-control">
			 <div class="section-title">
                  <h2 class="category">인기 노하우</h2>
               </div>
		</div>

		<div class="product-slider owl-carousel" id="box">
			<c:forEach items="${rate}" var="rate">
				<c:if test="${rate.boardVO.rnum le 10}">
					<div class="product-item">
						<div class="pi-pic shot">
							<a href="/commu/tips/${rate.boardVO.board_id}"> <img
								style="height: 200px;"
								src="/resources/img/tips/${rate.imgname}" alt=""> <span
								class="count2">조회수 ${rate.boardVO.hit}</span> <span
								style="font-size: 18px; font-weight: bold;">${rate.boardVO.title}</span>
							</a>
							<div style="font-size: 16px;">${rate.boardVO.memberVO.nickname}</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<!--인기 노하우 슬라이드 end -->

			<!-- Category Section End -->
		<!-- 동물 카테고리, 글쓰기 버튼 -->
	<div style="padding-top:80px; margin-bottom:50px; ">
		
		<div style="float: right;">
			<button class="btn btn-outline-secondary" id="tw"
				onclick="location.href='${pageContext.request.contextPath}tips/write'">노하우
				작성</button>
		</div>

		<div class="row ">
	
					<button class="btn btn-disabled" href="#" onclick="fire_ajax_submit(1);">고양이</button>&nbsp&nbsp
		
					<button class="btn btn-disabled" href="#" onclick="fire_ajax_submit(2);">강아지</button>&nbsp&nbsp
			
					<button class="btn btn-disabled" href="#" onclick="fire_ajax_submit(3);">파충류</button>&nbsp&nbsp
	
					<button class="btn btn-disabled" href="#" onclick="fire_ajax_submit(4);">조류</button>&nbsp&nbsp
	
					<button class="btn btn-disabled"  href="#" onclick="fire_ajax_submit(5);">어류</button>&nbsp&nbsp
		
					<button class="btn btn-disabled" href="#" onclick="fire_ajax_submit(6);">기타</button>
				
			</div>
		</div>
		<!-- 동물 카테고리, 글쓰기 버튼 end -->


		<!-- 노하우 리스트 -->
		<div id="table" class="row">

			<c:forEach items="${tips}" var="tp">
				<div class="product-item col-sm-6 col-md-4 col-lg-3 ">
					<div class="pi-pic shot">
						<a href="/commu/tips/${tp.boardVO.board_id}"> <img
							src="/resources/img/tips/${tp.imgname}" alt=""
							style="height: 180px;"> <span
							class="count">조회수 ${tp.boardVO.hit}</span> 
							<span
							style="font-size: 15px; font-weight: bold;">${tp.boardVO.title}</span>
						</a>
					</div>
					<div style="font-size: 14px; text-align: left;">${tp.boardVO.memberVO.nickname}</div>
				</div>
			</c:forEach>
		</div>
		<!-- 노하우 리스트 end -->

		<!-- 더보기 버튼 -->
	   <c:if test="${fn:length(tipslistcount) > 12}">
                <input type="hidden" class="count" value="${fn:length(tipslistcount)}" />
	            <div class="later col-lg-12 text-center">
	            	<button type="button" id="morebtn" class="btn btn-disabled" onClick="btnClick()">더보기 <i class="fa fa-caret-down" aria-hidden="true"></i></button>
		        </div>
		      </c:if>
	    

	</div>

	<!-- 페이징 -->
	<script>
      var pageNum = 1;
      var check = $('.count').val() / 12;
     
      function btnClick(){
    	  event.preventDefault();
    	  pageNum += 1;
    		  
    	  if (pageNum > check) {
              $("#morebtn").hide();
           }
    	  
    	  console.log(pageNum);
    	  console.log(check);
    	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/commu/morelist",
    	        data : {
    	        	pageNum: pageNum 
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var tips= data.tips;
    	     
					
    	         html = " "
    	           for(var i in tips){
    	        	   html +="<div class='product-item col-sm-6 col-md-4 col-lg-3 '>"
    	  					+"<div class='pi-pic shot'>"
    	  					+"<a href='/commu/tips/"+tips[i].boardVO.board_id+"'> "
    	  					+"<img src='/resources/img/tips/"+tips[i].imgname+"' alt='' style='height: 180px;'> "
    	  					+"<span class='count'>조회수 "+tips[i].boardVO.hit+"</span> "
    	  					+"<span style='font-size: 15px; font-weight: bold;'>"+tips[i].boardVO.title+"</span></div>"
    	  					+"<div style='font-size: 14px; text-align: left;'>"+tips[i].boardVO.memberVO.nickname+"</div>"
    	  					+"</div>"

    	           

    	        	}//tips foreach end      	   

    	   
    	       
    	           $("#table").append(html); 
    	          
    	        }, 	        
    	        //success end
    	        error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end
    	    }); //ajax end	 
    	}; //click end	
   
		// 카테고리에 해당하는 동물의 글
	/* 	$('#selectPet')
				.change(
						function() {
							var category_id = $(this).val();
							console.log(category_id);

							$
									.ajax({
										url : "/commu/tips/pet",
										type : "get",
										data : {
											category_id : category_id,
										},
										success : function(data) {

											console.log(data);
											$("#table").remove();
											var html = "<div id='table' class='row' style='margin-top: 1rem;text-align: left; margin-bottom:1rem;'>"
											for (var i = 1; i <= data.length; i++) {

												html +="<div class='product-item col-sm-6 col-md-4 col-lg-3'>"
													+"<div class='pi-pic shot'>"
													 +"<a href='/commu/tips/"+data[i - 1].boardVO.board_id+"'>"
													+"<img src='/resources/img/tips/"+data[i - 1].imgname+"' alt=''style='height: 180px;'>"
													+"<span class='count'>조회수"+data[i - 1].boardVO.hit+"</span>"
												
													+"<span style='font-size: 15px; font-weight: bold;'>"+data[i - 1].boardVO.title+"</span></a></div>"
													+"<div style='font-size: 14px;text-align: left;'>"+data[i - 1].boardVO.memberVO.nickname+"</div>"
													+"</div>"
				     					
									     					
											}
											html += "</div>"
											$(".later").prepend(html);

										}, //ajax 성공 시 end

										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);

										} // ajax 에러 시 end 

									})
						}) */
	</script>

	<!-- Footer -->
	<div style="margin-top: 100px">
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

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