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
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<!-- 날짜 선택 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker2").datepicker();
	});
	$(document).ready(
			function() {
				$.datepicker.setDefaults({
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});

			})
</script>
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
				<div class="col-md-8">

					<span> 날짜조회 : <input type="text" id="datepicker"
						style="width: 100px" value=""> ~ <input type="text"
						id="datepicker2" style="width: 100px" value="">
						<button class='btn btn-info' onclick="getPointList(1,10)">조회하기</button>
					</span>

				</div>
				<div class="col-md-4 text-right">
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
						<tbody id="pointList">

						</tbody>
					</table>
					<div class="container" id="page"></div>
				</div>
			</div>

		</div>
	</div>

</body>
<script type="text/javascript">
	function getPointList(pageNum, amount) {
		$("#pointList").empty();
		$("#page").empty();		
		var startDate = $("#datepicker").val();
		var endDate = $("#datepicker2").val();
		console.log(startDate);
		console.log(endDate);

		$.ajax({
			url : "/myPage/pointList/ajax",
			type : "get",
			data : {
				startDate : startDate,
				endDate : endDate,
				pageNum : pageNum,
				amount : amount
			},
			success : function(data) {
				console.log(data);
			
				html = "";
				for (var i = 0; i < data.pointList.length; i++) {
					html += "<tr>" + "<td>" + transferTime(data.pointList[i].pdate)
							+ "</td>" + "<td>"
							+ data.pointList[i].pointtypeVO.pointtypename + "</td>"
					if (data.pointList[i].pscore < 0) {
						html += "<td style='color: red;'>" + data.pointList[i].pscore
								+ "</td>"
					} else {
						html += "<td>" + data.pointList[i].pscore + "</td>"
					}
					html += "</tr>"
				}
				html2 = "<ul class='pagination'  style='justify-content: center;'><c:if test='"+data.pageMaker.prev+"'>"
				+"<li class='page-item'> <a class='page-link' onclick='getPointList("+(data.pageMaker.startPage-1)+","+data.pageMaker.amount+")"'>«</a></li> </c:if>"
				for(var i = data.pageMaker.startPage; i<=data.pageMaker.endPage;i++){
				html2 += "<li class='page-item'> <a class='page-link' onclick='getPointList("+i+","+data.pageMaker.cri.amount+")'>"+i+"</a></li> "	}
				html2 += "<c:if test='${"+data.pageMaker.next +"&&"+ data.pageMaker.endPage+"> 0}'> <li class='page-item'> <a class='page-link' onclick='getPointList("+(data.pageMaker.endPage+1)+","+data.pageMaker.amount+")"'> »</a></li> </c:if></ul>"
				$("#page").append(html2);
				$("#pointList").append(html);
			}, //ajax 성공 시 end

			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);

			} // ajax 에러 시 end

		});// 장바구니 목록 함수 end
	}
	
	$(document).ready(function() {
		
		let today = new Date();
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();
		today = year + '-' + month + '-' + date;
		var lastMonth = year + '-' + (month-1) + '-' + date;
		$("#datepicker").val(lastMonth);
		$("#datepicker2").val(today);
		getPointList(1,10);
		
	})
	function getFormatDate(date) {

		var date = date.substr(0, 19);
		var date = date.split("T");
		var date = date[0] + " " + date[1];
		return date;
	}

	function transferTime(times){
		 var now = new Date();
		 var setTime = new Date(times);
		 
	
		 var sc = 1000;

		 var today = new Date(setTime.getFullYear(),setTime.getMonth(),setTime.getDate(),setTime.getHours(),setTime.getMinutes(),setTime.getSeconds());
		 
		 //지나간 초
		 var pastSecond = parseInt((now-today)/sc,10);
	
		 var date;
		 var hour;
		 var min;
		 var str = "";

		 var restSecond = 0;
		 if(pastSecond > 86400){
		  date = parseInt(pastSecond / 86400,10);
		  restSecond = pastSecond % 86400;
		  str = date + "일 ";

		   hour = parseInt(restSecond / 3600,10);
		   restSecond = restSecond % 3600;
		   str = str + hour + "시간 전";
		
		 }else if(pastSecond > 3600){
		  hour = parseInt(pastSecond / 3600,10);
		  restSecond = pastSecond % 3600;
		  str = str + hour + "시간 전";
		
		 }else if(pastSecond > 60){
		  min = parseInt(pastSecond / 60,10);
		  restSecond = pastSecond % 60;
		  str = str + min + "분 전";
		 }else{
		  str = pastSecond + "초 전";
		 }

		 return str;
		}
	
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- Js Plugins -->

<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>

</html>