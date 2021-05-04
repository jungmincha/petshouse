<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠타운</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

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

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<!-- font-awesome -->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"data-search-pseudo-elements></script>

<!-- 위치 다시 선정하기 -->
<script>
	$(function() {

		$("#sel").change(function() {

			location.href = "/map/home"

		});

	});
</script>


<style>
.jumbotron {
	text-align: center;
	height: 300px;
}

.qcontent {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 1000px;
	height: 20px;
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

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #dddddd;
}



body::-webkit-scrollbar {
	width: 10px;
}

body::-webkit-scrollbar-thumb {
	background-color: #666666;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

body::-webkit-scrollbar-track {
	background-color: #CCCCCC;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}


.profile_box {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile {
	width: 40px;
	height: 40px;
	object-fit: cover;
}

</style>

</head>
<body style="padding-top: 128px ;">

	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Login Check -->




	<!-- Contact Section Begin -->
	<section class="contact-section spad">
		<div class="container">
		
		
			<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>펫츠타운</h2>
				</div>
			</div>
		</div>
		
		
			<div class="row" style="padding-top:30px;">
				<div class="col-lg-12" style="margin-left:160px;">

					<!-- 위치 다시 선정하기 -->
					<i class="fas fa-paw"></i><span style= "font-size: 18px;"> ${location}</span>
					<br> <br>
					<i class="fas fa-paw"></i><a href="/map/home"><span style= "font-size: 15px;"> 위치 다시 설정하기</span></a>
					<br> <br>
					
					<div class="col-lg-12"><!--이게 먼저 오게! -->
						<div class="row">
						
						<button class="form-control col-sm-1" href="#" onclick="cate_ajax_submit('전체');">전체</button>&nbsp&nbsp
						<button class="form-control col-sm-1"  href="#" onclick="cate_ajax_submit('우리동네');">우리동네</button>&nbsp&nbsp
						<button class="form-control col-sm-1"  href="#" onclick="cate_ajax_submit('분실/실종');">분실/실종</button>&nbsp&nbsp
						<button class="form-control col-sm-1"  href="#" onclick="cate_ajax_submit('동물병원');">동물병원</button>&nbsp&nbsp
						<button class="form-control col-sm-1"  href="#" onclick="cate_ajax_submit('산책로');">산책로</button>&nbsp&nbsp
						<button class="form-control col-sm-1"  href="#" onclick="cate_ajax_submit('나눔마켓');">나눔마켓</button>&nbsp&nbsp
						<button class="form-control col-sm-1" href="#" onclick="cate_ajax_submit('애완용품샵');">애완용품샵</button>&nbsp&nbsp
						<button class="form-control col-sm-1"  href="#" onclick="cate_ajax_submit('기타');">기타</button>
						</div>
						</div>

		

					<!-- 글작성 폼 -->
					<form action="/map/write_view" method="get">
						<!-- 전달할 값들 -->
						<input id="location" type="hidden" name="location" value="${location}" /> 
				
					
						
						<!-- 커뮤니티 카테고리별 분류 셀렉트 BOX -->
					<!-- 	<div class=" row" style="padding-bottom: 30px;">
							<select name="hashtag" id="hashtag" class="form-control col-sm-1"
								style="margin-left: 15px; text-align-last: center; font-size: 18px;">
								<option value="전체">전체</option>
								<option value="우리동네질문">우리동네질문</option>
								<option value="분실/실종센터">분실/실종센터</option>
								<option value="일상">일상</option>
								<option value="맛집">맛집</option>
								<option value="취미생활">취미생활</option>
								<option value="여행">여행</option>
								<option value="기타">기타</option>

							</select> <span class="col-sm-5"></span>style="background-color: #FFC81E;  color:black;"
						</div> -->
					
							<button class="form-control col-sm-1" id="qw" style="position: fixed; background-color: #FFC81E;  color:black; top: 170px; right: 100px;" type="submit">글 작성</button>
					
							</form>
	
				
				
    
  
			<!-- 무한 페이징 시작 -->	
				<!-- 	<article> -->

						<!-- board 테이블 -->
						<div id="table" >
						<c:forEach items="${list}" var="list">
										
										<hr style="width: 820px;">
					
											<!-- 회원 썸네일 -->
										<div class="user-Info row" style="margin: 20px auto 0px 5px">
									    <div class="profile_box ">
										<img src="/resources/img/member/profile/${list.boardVO.memberVO.thumbnail}" name="profile" alt="" class="profile" />
										</div>
										<div style="padding:7px"> ${list.boardVO.memberVO.nickname} 
										<a href="/myPage/${list.boardVO.memberVO.nickname}" style="padding-top: 13px; padding-left: 5px; color:#e7ab3c;">팔로우</a>
										</div>	
									
										</div><br>
											<!-- 게시글 정보 -->
											<div class="row col-lg-12">
											<p class="pdate" style="font-size: 15px; color: gray;">${list.boardVO.pdate}</p>
											<p style="font-size: 15px; color: gray;">&nbsp&nbsp좋아요${list.boardVO.plike}</p>
											<p style="font-size: 15px; color: gray;">&nbsp&nbsp${list.boardVO.hashtag}</p>
											<p style="font-size: 15px; color: gray;">&nbsp&nbsp조회수${list.boardVO.hit}</p>
											</div>
											<br>	
																
											<!-- 게시글 이미지 썸네일 -->			
										
											<a href="/map/board/${list.boardVO.board_id}?location=${location}">
											<img src="/resources/img/location/${list.imgname}" style="width: 820px; height: 450px; object-fit: cover; border-radius: 10px;">
											</a>
											<br>	
											<br>
											<div style="font-size:20px ;width:820px; ">${list.boardVO.content}</div>
								
									</c:forEach>

									</div> 
					
					  		<c:if test="${listTotal > 5}">
	            			<div class="btn col-lg-12 text-center">  
	          	    		<input type="hidden" class="listTotal" value="${listTotal}" />
	            				<button type="button" class="btn btn-warning" onClick="btnClick()" style="margin-right: 350px; background-color: #FFC81E;  color:black;">더보기</button>
		        				</div>
		       					</c:if>
		     
		       
		    
		       
		       
		       
		         <!-- 더보기 페이징 처리 -->
     <script>
     
     
    
    
     var pageNum = 1;
       
     var check = $('.listTotal').val() / 5;


	     function btnClick(){
	   	  pageNum += 1;
	   	  
	   	  if (pageNum >= check) {
	        
	             $(".btn").hide();
	          }
	   	  
	   	  console.log(pageNum);
	   	  console.log(check);
	   	 console.log("${location}");	  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/map/morelist",
    	        data : {
    	        	pageNum: pageNum,
    	        	location : "${location}"
    	     
    	        	
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var list = data.list;
    	         
					
    	          html = ""    	          
    	        	    for(var i in list){	   
    	        			 html += "<div id='table'>"
    	        			+
    	        			"<hr style='width: 820px;'>"
				        	+
							"<div class='user-Info row' style='margin: 20px auto 0px 5px'>"
							+
							"<div class='profile_box'>"
							+
							"<img src='/resources/img/member/profile/" + list[i].boardVO.memberVO.thumbnail+ "' name='profile' alt='' class='profile'/>"
							+
							"</div>"
							+
							"<div style='padding:7px'>" + list[i].boardVO.memberVO.nickname 
							+
							"<a href='/myPage/" + list[i].boardVO.memberVO.nickname + "'style='padding-top: 13px; padding-left: 5px; color:#e7ab3c;'>팔로우</a>"
							+
							"</div>"	
							+
							"</div><br>"											
							+
							"<span style='font-size: 15px; color: gray;'>" + transferTime(list[i].boardVO.pdate) + "</span>"
							+			
							"<span style='font-size: 15px; color: gray;'>&nbsp&nbsp조회수" +  list[i].boardVO.hit + "</span>"
							+
							"<span style='font-size: 15px; color: gray;'>&nbsp&nbsp좋아요" +  list[i].boardVO.plike +  "</span>"
							+
							"<span style='font-size: 15px; color: gray;'>&nbsp&nbsp" +  list[i].boardVO.hashtag +  "</span>"
							+
							"<br>"	
							+
							"<br>"			
							+ 
							"<a href='/map/board/"+ list[i].boardVO.board_id+ "?location=${location}&member_id=${member_id}'>"
							+

							"<div>"
							+
							"<img src='/resources/img/location/" +  list[i].imgname + "'style='width: 820px; height: 450px; object-fit: cover; border-radius: 10px;'>"
							+
							"</a>"
							+
							"<br>"	
							+
							"<br>"		
							+
							"<div style='font-size:20px; width:820px;'>"  + list[i].boardVO.content 
							+
							"</div>"
						
							+
							"</div>" 
							
    	            } //bestrate foreach end			
    	           
	   	        	if(list.length == 5){
		        		html += "<div class='btn col-lg-12 text-center'>"  
		            		 + "<button type='button' class='btn btn-warning' style='margin-right: 350px; background-color: #FFC81E; color:black;'  onClick='btnClick()'>더보기</button> </div>";			      
		        	}
     
    	           	$('.btn').remove();
    	            $('#table').append(html); 
    	          
    	        }, //success end       
    	        
    	         error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end
    	    }); //ajax end	 
    	
     }; //click end	
      </script>
      
     
		       	    

				</div>

			</div>
		</div>
	</section>
	
<!-- 	
	
	


//스크롤 바닥 감지
window.onscroll = function(e) {
	
	 
    //추가되는 임시 콘텐츠
    //window height + window scrollY 값이 document height보다 클 경우,
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
 	//실행할 로직 (콘텐츠 추가)
    //   count++;
 	
 	
 	  for(var i = 0 ; i < list_length  ; i++){
 	
        var addContent =
        
        	 "<table class='table'>"
        	+
   			"<tbody id='mapList'>"
			+
			"<td>"
			+
			"<a href='/map/board/"+ json[i].boardVO.board_id + "?location=${location}&member_id=${member_id}'>"
			+			
			"<div class='user-Info row' style='margin: 20px auto 0px 5px'>"
			+
			"<div class='profile_box'>"
			+
			"<img src='/resources/img/member/profile/" + json[i].boardVO.memberVO.thumbnail+ "' name='profile' alt='' class='profile'/>"
			+
			"</div>"
			+
			"<div style='padding:7px'>" + json[i].boardVO.memberVO.nickname 
			+
			"</div>"	
			+
			"</div>"
			+
			
			"<span style='font-size: 13px; color: gray;'>" + json[i].boardVO.pdate + "</span>"
			+			
			"<span style='font-size: 13px; color: gray;'>조회수" + json[i].boardVO.hit + "</span>"
			+
			"<span style='font-size: 13px; color: gray;'>좋아요" + json[i].boardVO.plike +  "</span>"
			+
			"<span style='font-size: 13px; color: gray;'>" +  json[i].boardVO.hashtag +  "</span>"
			+
			"<br>"	
			+
			"<br>"			
			+ 
				
			"<div>"
			+
			"<img src='/resources/img/location/" +  json[i].imgname + "'style='width: 780px; height: 450px; object-fit: cover; border-radius: 10px;'>"
			+
			"<br>"	
			+
			"<br>"		
			+
			"<div style='font-size:20px;'>"  + json[i].boardVO.content 
			+
			"</div>"
			+
			"</a>"
			+	
			"</td>"
			+
			"</tbody>"
			+
		    "</table>" ;

		
		      $('article').append(addContent); 
         
       
 	    }
 	
}
    
    
}
	
</script>  -->
	
	

	<script type="text/javascript">
	

	
	/* 	$('#hashtag')
				.change( */
						function cate_ajax_submit(hashtag) {
							
							//카테고리를 선택하면 카테고리 더보기를 할 수있는 창이 다시 보인다.
					
					
							var location = $('#location').val();
							var member_id = $('#member_id').val();
							
							console.log("너의 해시태그는 뭐니?" + hashtag);
							console.log("너의 장소는 뭐니?" + location);
							console.log("너의 아이디는 뭐니?" + member_id);
						
							
						//	var target = document.getElementById("hashtag");

						//	console.log('선택된 옵션 value 값='+ target.options[target.selectedIndex].value);
							
							if(hashtag=="전체"){
							console.log("success");

							window.location = "/map/board?location="+location+"&member_id=" + member_id;
							
							}else{
							
								var url = "/map/location/tag";
								
							
						//	var url = "/map/location/tag";
						
						
						
							$.ajax({
										url : url,
										type : "get",
										data : {
											hashtag : hashtag,
											location : location
										
										},
										success : function(data) {
											
									     	$('.btn').remove();
											console.log(data);
											$("#table").empty();
											//var html = "<table class='table'>";
											
										for (var i = 0; i <= data.length; i++) {
												
												
												
											
												var html =  "<div id='table'>"
													+
													"<hr style='width: 820px;'>"
										        	+
													"<div class='user-Info row' style='margin: 20px auto 0px 5px'>"
													+
													"<div class='profile_box'>"
													+
													"<img src='/resources/img/member/profile/" + data[i].boardVO.memberVO.thumbnail+ "' name='profile' alt='' class='profile'/>"
													+
													"</div>"
													+
													"<div style='padding:7px'>" + data[i].boardVO.memberVO.nickname 
													+
													"<a href='/myPage/" + data[i].boardVO.memberVO.nickname + "'style='padding-top: 13px; padding-left: 5px; color:#e7ab3c;'>팔로우</a>"
													+
													"</div>"	
													+
													"</div><br>"											
													+
													"<span style='font-size: 15px; color: gray;'>" + transferTime(data[i].boardVO.pdate) + "</span>"
													+			
													"<span style='font-size: 15px; color: gray;'>&nbsp&nbsp조회수" + data[i].boardVO.hit + "</span>"
													+
													"<span style='font-size: 15px; color: gray;'>&nbsp&nbsp좋아요" + data[i].boardVO.plike +  "</span>"
													+
													"<span style='font-size: 15px; color: gray;'>&nbsp&nbsp" + data[i].boardVO.hashtag +  "</span>"
													+
													"<br>"
													+
													"<input id='hashtag' type='hidden' name='hashtag' value='"+data[i].boardVO.hashtag+"'/>"
													+
													"<br>"			
													+ 
													"<a href='/map/board/"+ data[i].boardVO.board_id+ "?location=${location}&member_id=${member_id}'>"
													+
	
													"<div>"
													+
													"<img src='/resources/img/location/" +  data[i].imgname + "'style='width: 820px; height: 450px; object-fit: cover; border-radius: 10px;'>"
													+
													"</a>"
													+
													"<br>"	
													+
													"<br>"		
													+
													"<div style='font-size:20px; width:820px;'>"  + data[i].boardVO.content 
													+
													"</div>"
													
													+
													"</div>" ;
													
												$('#table').append(html); 
											
											}				
											
										}, //ajax 성공 시 end

										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);

										} // ajax 에러 시 end

									
							})
							}
				}
							
	</script>
	
	
	
	
	
	<script>
	$(".pdate").each(function() {
		var times = transferTime($(this).text());
		$(this).text(times);
	});
		function transferTime(times) {
			var now = new Date();

			var sc = 1000;
			var today = new Date(times);
			//지나간 초
			var pastSecond = parseInt((now - today) / sc, 10);

			var date;
			var hour;
			var min;
			var str = "";

			var restSecond = 0;
			if (pastSecond > 86400) {
				date = parseInt(pastSecond / 86400, 10);
				restSecond = pastSecond % 86400;
				str = date + "일 ";

			} else if (pastSecond > 3600) {
				hour = parseInt(pastSecond / 3600, 10);
				restSecond = pastSecond % 3600;
				str = str + hour + "시간 전";

			} else if (pastSecond > 60) {
				min = parseInt(pastSecond / 60, 10);
				restSecond = pastSecond % 60;
				str = str + min + "분 전";
			} else {
				str = pastSecond + "초 전";
			}

			return str;
		}
		
		</script>



	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>




</body>
</html>