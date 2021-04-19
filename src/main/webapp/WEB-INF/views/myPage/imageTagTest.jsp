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
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
img {
	width: 1000px;
	height: 1000px;
}
</style>
</head>

<body>

	<c:forEach var="dto" items="${test}">
		<span class="tests"> ${dto.pdate } </span>
		<br>
	</c:forEach>
</body>
<script>
	$(".tests").each(function() {
		console.log($(this).text());
		var times = transferTime($(this).text());
		console.log(times);
		$(this).text(times);
	});

	function transferTime(times) {

		var now = new Date();
		var setTime = new Date(times);

		var sc = 1000;

		var today = new Date(setTime.getFullYear(), setTime.getMonth(), setTime
				.getDate(), setTime.getHours(), setTime.getMinutes(), setTime
				.getSeconds());

		//지나간 초
		var pastSecond = parseInt((now - today) / sc, 10);

		var date;
		var hour;
		var min;
		var str = "";

		var restSecond = 0;
		if (pastSecond > 86400) {
			date = parseInt(pastSecond / 86400, 10);
			restSecond = pastSecond % 86400;
			str = date + "일 ";

			hour = parseInt(restSecond / 3600, 10);
			restSecond = restSecond % 3600;
			str = str + hour + "시간 전";

		} else if (pastSecond > 3600) {
			hour = parseInt(pastSecond / 3600, 10);
			restSecond = pastSecond % 3600;
			str = str + hour + "시간 전";

		} else if (pastSecond > 60) {
			min = parseInt(pastSecond / 60, 10);
			restSecond = pastSecond % 60;
			str = str + min + "분 전";
		} else {
			str = pastSecond + "초 전";
		}

		return str;
	}
</script>
</html>