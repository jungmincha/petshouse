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
		<tr>
			<td>value 1</td>
			<td><input type="text" name="" class="value" value="12"></td>
		</tr>
		<tr>
			<td>value 2</td>
			<td><input type="text" name="" class="value" value="12"></td>
		</tr>
		<tr>
			<td>value 3</td>
			<td><input type="text" name="" class="value" value="12"></td>
		</tr>
		<tr>
			<td>value 4</td>
			<td><input type="text" name="" class="value" value="32"></td>
		</tr>
		<tr>
			<td><button type="button" class="button_sum">summary</button></td>
			<td><span class="summary"></span></td>
		</tr>
	</table>

</body>




<!-- Footer -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
<script type="text/javascript">
	$(document).ready(function() {

		var sum = 0;
		$(".value").each(function() {
			sum += Number($(this).val());
		});

		$(".summary").html(sum);
	});
	$(".value").on("propertychange change keyup paste input", function() {
		console.log("실행")
		var sum = 0;
		$(".value").each(function() {
			sum += Number($(this).val());
		});

		$(".summary").html(sum);
	});
</script>
</html>
