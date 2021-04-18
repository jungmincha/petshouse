<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<!-- Google Font -->
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
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<!-- 날짜 선택 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.38.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.38.0/css/tempusdominus-bootstrap-4.min.css" />
<style>
table {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table td {
	width: 300px;
}

table th {
	font-size: 20px;
}
</style>
</head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<body style="padding-top: 180px">

	<div class="container">
		<div class="blog-details-inner">
			<h2>포인트 사용내역</h2>
			<div class="row">

				<div class="col-md-6">
					기간별 조회
					<button>1주일</button>
					<button>1개월</button>
					<div class="form-group">
						<div class="input-group date" id="datetimepicker1"
							data-target-input="nearest">
							<input type="text" class="form-control datetimepicker-input"
								data-target="#datetimepicker1" value="01/11/2020">
							<div class="input-group-append" data-target="#datetimepicker1"
								data-toggle="datetimepicker">
								<div class="input-group-text">
									<i class="fa fa-calendar"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group date" id="datetimepicker2"
							data-target-input="nearest">
							<input type="text" class="form-control datetimepicker-input"
								data-target="#datetimepicker2" value="01/15/2020">
							<div class="input-group-append" data-target="#datetimepicker2"
								data-toggle="datetimepicker">
								<div class="input-group-text">
									<i class="fa fa-calendar"></i>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-md-6 text-right">
					<h4>사용가능 포인트 : ${pointSum.sum} P</h4>
				</div>
			</div>

			<div class="posted-by">

				<div class="pb-text">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>적립 일자</th>
								<th>적립 내용</th>
								<th>포인트</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pointList}" var="pointVO">
								<tr>
									<td><fmt:formatDate value="${pointVO.pdate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${pointVO.pointtypeVO.pointtypename }</td>

									<c:choose>
										<c:when test="${pointVO.pscore < 0 }">
											<td style="color: red;">${pointVO.pscore}</td>
										</c:when>
										<c:otherwise>
											<td>${pointVO.pscore}</td>
										</c:otherwise>
									</c:choose>


								</tr>

							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>

<script>
	$(function() {
		$('#datetimepicker1').datetimepicker({
			format : 'L'
		});
		$('#datetimepicker2').datetimepicker({
			format : 'L',
			useCurrent : false
		});
		$("#datetimepicker1").on("change.datetimepicker", function(e) {
			$('#datetimepicker2').datetimepicker('minDate', e.date);
		});
		$("#datetimepicker2").on("change.datetimepicker", function(e) {
			$('#datetimepicker1').datetimepicker('maxDate', e.date);
		});
	});
</script>
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

</html>