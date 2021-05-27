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

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Custom fonts for this template-->
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<style>
	.table {
		display: table;
		margin: auto;
		width: 1000px;
		font-size: 17px;
		font-stretch: extra-condensed;
		text-align: center;
	}
	
	h2 {
		text-align: center;
		padding-bottom: 20px;
	}
	
	.member{
		padding-top:80px;
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

<body id="page-top">

	<!-- Page Wrapper -->


			<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>
		<!-- End of Sidebar -->

		 

	<!-- Container Begin -->
	<div class="container"> 
		<div class="row" style="margin-bottom:150px;">
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
    
  <script src="/resources/AdminLTE-master/dist/js/demo.js"></script>
			<!-- Bootstrap core JavaScript-->
			<script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
			<script
				src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script
				src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="/resources/admin/js/sb-admin-2.min.js"></script>
 
			<!-- Page level custom scripts -->
			<script src="/resources/admin/js/demo/chart-area-demo.js"></script>
			<script src="/resources/admin/js/demo/chart-pie-demo.js"></script>
</body>
</html>

