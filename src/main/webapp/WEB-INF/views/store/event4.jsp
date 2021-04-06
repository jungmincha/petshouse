<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>event</title>

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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
   	   	ctx.strokeText('즉석 룰렛 뽑기!', 0,0);
   	
   	 var random = 0;
   	 var clicked = 0;
    	$('#canvas').on({'click':function(){
    		if(clicked <= 0){
    			random += Math.random()*360 + 720;
    			$(this).css({'transition-timing-function': 'ease-in-out', 'transition': '5s', 'transform': 'rotate('+random+'deg)'});
 				console.log(random);
	    	}else if(clicked >= 1){
	    		event.preventDefault();
	    		alert("이벤트 참여하셨습니다.")
	    	}  		
    		clicked++;
    	}

    	});
   });

   </script>
   
   
   
 <style>
	 #board{
 		width: 1000px; 
 		height: 1000px;
 		overflow: hidden;
 		position: relative;
 		top: 100px;
 	}

	#pin{
		width:0;
		height:0;
		top: 170px;
		left: calc(50% - 16px);
		position: absolute;
		border-radius: 32px 32px 0 0;
		border-top:70px solid crimson;
		border-left:16px solid transparent;
		border-right: 16px solid transparent;
		border-bottom:0;
		z-index:1;	
	}
	
	.container-fluid {
   		 background: #000000;
	}
	

  
  </style>

  </head> 
<body>
   <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
      <div class="container-fluid">
         <div class="row">
            <div class="col-lg-12">
 				<div id="board">
 				<div id="pin"></div>
 				<canvas id="canvas" width="1000px" height="1000px"></canvas></div>
 			</div>
 		</div>
 	</div>
 	
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>

   <!-- Bootstrap core JavaScript -->
   <script src="/resources/store/vendor/jquery/jquery.min.js"></script>
   <script
      src="/resources/store/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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



