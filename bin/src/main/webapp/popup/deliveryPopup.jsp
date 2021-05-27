<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</head>
<body>
	<form action="http://info.sweettracker.co.kr/tracking/5" method="post"
		name="deliverySelect" id="deliverySelect">
		<input type="hidden" class="form-control" id="t_key" name="t_key"
			value="b6qZIhyVpYgicymScLeVNQ"> <input type="text"
			class="form-control" name="t_code" id="t_code" placeholder="택배사 코드">
		<input type="text" class="form-control" name="t_invoice"
			id="t_invoice" placeholder="운송장 번호">
	</form>
</body>
<script>
	// 부모의 운송장 번호와 택배값 넣고 제출
	$(document).ready(function() {
		$("#t_code").val(opener.$("#t_code").val());
		$("#t_invoice").val(opener.$("#t_invoice").val());
		document.deliverySelect.submit();

	});
</script>
</html>