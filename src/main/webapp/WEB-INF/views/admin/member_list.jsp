<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>회원 목록</title>

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
	.table {
		display: table;
		margin: 40px auto;
		width: 700px;
		font-size: 20px;
		font-stretch: extra-condensed;
		text-align: center;
	}
	
	h2 {
		text-align: center;
	}
	
	.member{
		padding-top:200px;
	}
	
	#navbars>li:nth-child(5) {
  		background-color: #e7ab3c;
	}
</style>

<script type="text/javascript">

	$(document).ready(function() {
		$('.a-delete').click(function(event) {	
			if (confirm("정말 삭제하시겠습니까?") == true) { //확인
				event.preventDefault();
			
				var trObj = $(this).parent().parent();
	
				$.ajax({
					type : "DELETE",
					url : $(this).attr("href"),
					cache : false,
					success : function(result) {
						console.log(result);
						if (result == "SUCCESS") {
							$(trObj).remove();
						}
					},
					error : function(e) {
						console.log(e);
					}
				})
			}else { //취소
				return;
			}
		});
	});
</script>

</head>

<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- Container Begin -->
	<div class="container"> 
		<div class="row">
		    <div class="col-lg-12">
				<h2 class="member">회원 관리</h2>
				
					<table class="table">	
						<thead>
							<tr>
								<td>번호</td>
								<td>이름</td>
								<td>이메일</td>
								<td>닉네임</td>
								<td>삭제</td>
							<tr>
						</thead>
					
						<tbody>
							<c:forEach items="${list}" var="member">
							<tr>
								<td>${member.rnum}</td>
								<td>${member.name}</td>
								<td><a href="/admin/member_detail/${member.nickname}">${member.member_id}</a></td>
								<td>${member.nickname}</td>
								<td><a class="a-delete" data-bid='${member.member_id}'                      
									href="/admin/member_list/${member.member_id}">삭제</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
			
				<!-- 페이징 처리-->
				<ul class="pagination justify-content-center" style="padding-bottom: 50px; padding-top: 20px;">
					<c:if test="${pageMaker.prev}">
						<li class="page-item"><a class="page-link" href="member_list${pageMaker.makeQuery(pageMaker.startPage - 1) }"> Previous</a></li>
					</c:if>
			
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
						<li class="page-item"><a class="page-link" href="member_list${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
			
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item"><a class="page-link" href="member_list${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
    <!-- Container End  -->  
    
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

