<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>event</title>

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

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script> 
   $(document).ready(function(){ 
	    var list = new Array(
	    		{
	    		   name: '100p',
	    		   color: '#FFADC5'
	    	  	},
	    	  	{
	    	  		name: '500p',
	    	  		color: '#B8F3B8'
	    	  	},
	    	  	{
		    		name: '꽝',
		    		color: '#FFDDA6'
		    	},
	    		{
		    		name: '1000p',
		    		color: '#CCD1FF'
		    	},
		    	{
		    		name: '3000p',
		    		color: '#A8C8F9'
		    	},
		    	{
		    		name: '100p',
		    		color: '#FFADC5'
		    	},
	    		{
		    		name: '5000p',
		    		color: '#FFCCCC'
		    	},
	    		{
		    		name: '꽝',
		    		color: '#9197B5'
		    	}	    	
	   	);
	    	    
	   var canvas = document.getElementById('canvas');
	   var ctx = canvas.getContext('2d');
	   	
	   ctx.translate(500, 500);
	   	
		list.forEach(function(e, i){
	  		ctx.beginPath(); 		
	   	   	ctx.arc(0, 0, 370, 0, (360/list.length)*(Math.PI/180), false);
	   	   	ctx.lineTo(0,0);
	   	   	ctx.closePath();
	   	   	ctx.fillStyle=e.color;
	   	   	ctx.fill();
   	   	
	   	   	ctx.fillStyle='white';
	   	   	ctx.textAlign='left';
	   	   	ctx.font='30px sanserif';
	   	   	ctx.fillText(e.name, 210, 105);
	   	   	
	   	   	ctx.rotate((360/list.length) * (Math.PI/180));
		});

		//내부 원 설정
   	   	ctx.beginPath();
   	   	ctx.arc(0, 0, 0, 0, 0*Math.PI, false);
   	   	ctx.fillStyle = 'white';
   	   	ctx.fill();
   	   	
   	   	ctx.textAlign= 'center';
   	   	ctx.textBaseline = 'middle';
   	   	ctx.font = '50px sanserif';
   	   	
   	   	ctx.strokeStyle = '#9197B5';
   	   	ctx.strokeText('', 0,0);
   	 
   	var member_id = $("#member_id").val();
   	 
   	//로그인 여부 체크
   	function checkLogin() {
		 if(member_id == undefined){
			 alert("로그인 후 이벤트 참여 가능합니다.");
			 location.href = '/login/login';
		 }
	 }
    	
   	$('#canvas').click(function(){
   		checkLogin();
   		
   	  	var random = 0;
   	   	var clicked = 0;
   	   	var pscore = 0;
   	   	
    	if(clicked <= 0){
    		random += Math.random()*360 + 720;
    		$(this).css({'transition-timing-function': 'ease-in-out', 'transition': '5s', 'transform': 'rotate('+random+'deg)'});
 			console.log(random);
	    } 
    	//포인트 지정
    	if(random >= 720 && random <= 765){
    		pscore = 100;
	   	}else if(random >= 766 && random <= 810){
	   		pscore = 3000;
    	}else if(random >= 811 && random <= 855){
    		pscore = 1000;
    	}else if(random >= 856 && random <= 900){
    		pscore = 0;
	   	}else if(random >= 901 && random <= 945){
	   		pscore = 500;
	   	}else if(random >= 946 && random <= 990){
	   		pscore = 100;
	   	}else if(random >= 991 && random <= 1035){
	   		pscore = 0;
	    }else if(random >= 1036 && random <= 1080){
	    	pscore = 5000;
    	}
    	
    	console.log(member_id);
    	console.log(pscore);
    	
    	//참여 중복 확인 및 포인트 적립
    	$.ajax({
   	        type :"PUT",
   	        url :"/store/event",
   	        data : {
   	        	member_id: member_id,
   	        	pscore: pscore
   	        },
	   	    success: function (result) {
	   	    	if(result == "SUCCESS"){
		    		console.log(result); 
		    		setTimeout(function(){
		    			alert("포인트 " + pscore + " 적립 완료!");	    		
		    		},5000);
		        }else if(result == "FAIL"){
	   	    		console.log(result);
	   	    		alert("이벤트에 이미 참여하셨습니다.");
	   	    	}
		    },
		    error: function (e) {
		    	console.log(e);
		    }
    	});//ajax end
   	});//click end
   });
   </script>  
  
 <style>
	 #board{
 		width: 1200px; 
 		height: 1150px;
 		overflow: hidden;
 		position: relative;
 		top: 70px;
 	}

	#pin{
		width:0;
		height:0;
		top: 330px;
		left: calc(50% - 16px);
		position: absolute;
		border-radius: 32px 32px 0 0;
		border-top:70px solid crimson;
		border-left:16px solid transparent;
		border-right: 16px solid transparent;
		border-bottom:0;
		z-index:1;	
	}
	
	.roulette{
		padding-top: 70px;
	}
	
	.way{
		padding-top: 100px;
		padding-bottom: 50px;
	}
  </style>
  </head> 
  
<body>
   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
   <!-- content -->
    <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
			<input type="hidden" id="member_id" value="<sec:authentication property="principal.member_id"/>">
	</sec:authorize>
		
    <div class="container text-center">
         <div class="row">
            <div class="col-lg-12">
 				<div id="board">
 					<img class="roulette" src="/resources/img/commuhome/roulette.jpg">
	 				<div id="pin"></div>
	 				<canvas id="canvas" width="1000px" height="1000px"></canvas>			
 				</div>
 				</div>
 			 <div class="way col-lg-12">	
 				<img src="/resources/img/commuhome/roulette3.jpg">
 			</div>

 		</div>
 	</div>
 	
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>

   <!-- Bootstrap core JavaScript -->
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