<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>회원 상세 정보</title>

<!-- bootstrap css cdn --<!-- > -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
	.member{
		padding-top:200px;
		text-align: center;
	}
	
	.table {
		display: table;
		margin: 30px auto;
		width: 700px;
		font-size: 20px;
		font-stretch: extra-condensed;
		text-align: center;
	}
	
	#navbars>li:nth-child(5) {
  		background-color: #e7ab3c;
	}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!--Container Begin -->
	<div class="container"> 
		<div class="row">
		    <div class="col-lg-12">
				<h2 class="member">회원 상세 정보</h2>
					<table class="table">						
						<tbody>
							<tr>
								<td>이름</td>
								<td>${info.name}</td>
							</tr>
							<tr>
								<td>가입일자</td>
								<td><fmt:formatDate value="${info.pdate}" pattern="yyyy.MM.dd" /></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${info.member_id}</td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td>${info.nickname}</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${info.tel}</td>
							</tr>
							<tr>
								<td>관심사</td>
								<td>${info.concern}</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>${info.address}</td>
							</tr>
						</tbody>
					</table>      
             </div>
        </div>
    </div>
    <!-- Container End -->
	     
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>

   <!-- Bootstrap core JavaScript -->
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

