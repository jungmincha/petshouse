<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>register</title>

</head>
<body>

	<!-- header -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Page Content -->
<body>

	<table>
		<tr id="goods1">
			<td><input type="text" class="price" size="10" value="">
				//첫번째 수</td>
			<td><input type="number" id="count" size="10" value=""
				> =</td>
			<td><input type="text" class="sum" size="10" value=""
				readonly="readonly"></td>

			<td><input type="button" value="send"></td>
		</tr>
	</table>

</body>




<!-- Footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
<script type="text/javascript">
	//JavaScript 부분을 HTML의 <head>사이에 삽입한다.
	
	$('#count').on('change keyup paste',function total(i) //total()함수 부분

	{
		console.log("함수실행")
		var num1 = document.getElementById('goods1').firstChild
		console.log(num1)
		var num1s = num1.value; // num1에서 가져온 값을 num1s에 저장해주고,
		console.log(num1s)
		var num1b = parseInt(num1s); // 계산을 하기위해 그 값을 int형으로 바꿔준다.

		var num2 = document.getElementById("goods1").getElementsByClassName(
				"count") //위 방법과 같음..

		var num2s = num2.value;

		var num2b = parseInt(num2s);

		var num3t;

		var ops = 'mul'; //값으로 저장

		switch (ops) //ops의 연산기호에 따라 case를 나눈다.

		{

		case "plus":
			num3t = num1b + num2b;
			document.getElementById("goods1").getElementsByClassName("sum").value = num3t;
			break;

		case "mul":
			num3t = num1b * num2b;
			document.getElementById("goods1").getElementsByClassName("sum").value = num3t;
			break;

		} //계산한 값을 num3t에 저장한 후, 값을 num3로 가져간다.

	});
</script>
</html>
