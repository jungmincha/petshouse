<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<style>
img {
	border: 3pxsolidgold;
	border-radius: 7px;
	-moz-border-radius: 7px;
	-khtml-border-radius: 7px;
	-webkit-border-radius: 7px;
}
</style>
</head>
<body style="padding-top: 128px">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>

<script type="text/javascript">
	// 시간 포맷 함수

	function transferTime(time) {
		var now = new Date();
		var sYear = time.substring(0, 4);
		var sMonth = time.substring(5, 7) - 1;
		var sDate = time.substring(8, 10);
		var sHour = time.substring(11, 13);
		var sMin = time.substring(14, 16);
		var sSecond = time.substring(17, 19);
		var sc = 1000;

		var today = new Date(sYear, sMonth, sDate, sHour, sMin, sSecond);
		console.log(today);

		//지나간 초
		var pastSecond = parseInt((now - today) / sc, 10);
		console.log(pastSecond)
		var date;
		var hour;
		var min;
		var str = "";

		var restSecond = 0;
		if (pastSecond > 86400) {
			date = parseInt(pastSecond / 86400, 10);
			restSecond = pastSecond % 86400;
			str = date + "일 ";
			if (restSecond > 3600) {
				hour = parseInt(restSecond / 3600, 10);
				restSecond = restSecond % 3600;
				str = str + hour + "시간 ";
				if (restSecond > 60) {
					min = parseInt(restSecond / 60, 10);
					restSecond = restSecond % 60;
					str = str + min + "분 " + restSecond + "초 전";
				} else {
					str = str + restSecond + "초 전";
				}
			} else if (restSecond > 60) {
				min = parseInt(restSecond / 60, 10);
				restSecond = restSecond % 60;
				str = str + min + "분 " + restSecond + "초 전";
			} else {
				str = str + restSecond + "초 전";
			}
		} else if (pastSecond > 3600) {
			hour = parseInt(pastSecond / 3600, 10);
			restSecond = pastSecond % 3600;
			str = str + hour + "시간 ";
			// if(restSecond > 60){
			min = parseInt(restSecond / 60, 10);
			// restSecond = restSecond % 60;
			str = str + min + "분 전";
			//  }else{
			// str = str + restSecond + "초 전";
			//}
		} else if (pastSecond > 60) {
			min = parseInt(pastSecond / 60, 10);
			restSecond = pastSecond % 60;
			str = str + min + "분 " + restSecond + "초 전";
		} else {
			str = pastSecond + "초 전";
		}

		return str;
	}
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