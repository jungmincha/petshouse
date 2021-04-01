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
<title>storehome</title>

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

<script type="text/javascript">

	
</script>

<style>
	.cart-table {
		text-align: center;
	}

</style>
</head>


<body>


	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">                   
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="4"><h3>회원 상세 정보</h3></th>                                 
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                	<th colspan="2" align="center">이름</th>            
                                	<th colspan="2">${info.name}</th>                                          
                                </tr>
                                <tr>
                                	<th colspan="2" align="center">가입일자</th>            
                                	<th colspan="2">${info.pdate}</th>                                          
                                </tr>
                                <tr>
                                	<th colspan="2">이메일</th>            
                                	<th colspan="2">${info.member_id}</th>                                          
                                </tr>
                                <tr>
                                	<th colspan="2">닉네임</th>            
                                	<th colspan="2">${info.nickname}</th>                                          
                                </tr>
                                <tr>
                                	<th colspan="2">전화번호</th>            
                                	<th colspan="2">${info.tel}</th>                                          
                                </tr>
                                <tr>
                                	<th colspan="2">관심사</th>            
                                	<th colspan="2">${info.concern}</th>                                          
                                </tr>
                                <tr>
                                	<th colspan="2">주소</th>            
                                	<th colspan="2">${info.address}</th>                                          
                                </tr>
                            
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Member Detail End -->
	     
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

