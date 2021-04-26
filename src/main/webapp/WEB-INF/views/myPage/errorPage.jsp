<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>프로필</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<style>
	img{
		width:320px;
		height:380px;
	}
	
	.aligner {
		display: flex;
		align-items: center;
		justify-content: center;
		height:1200px;
	}
	
	.aligner-item {
	 	max-width: 50%;
	}
	
	
</style>

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="aligner container">
    	<div class="row">
    		<div class="aligner-item col-12 text-center"> 	 
				<img src="/resources/img/admin/board/error.JPG" alt="">
				<div style="padding-bottom:10px;"><span style="font-size:35px;">&nbsp;요청하신 페이지를 찾을 수 없습니다.</span></div>
				<a href="/store/home"><span style="color:#e7ab3c; font-size:25px;">&nbsp;&nbsp;<u>홈으로</u></span></a> 
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

<!-- Js Plugins -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
														