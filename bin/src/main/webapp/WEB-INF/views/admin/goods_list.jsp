<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		$('.a-delete').click(function(event) {
			
			event.preventDefault();
		
			var trObj = $(this).parent().parent();

			$.ajax({
				type : "DELETE",
				url : $(this).attr("href"),
				cache : false,
				success : function(result) {
					console.log(result);
					if (result == "SUCCESS") {
						//getList();
						$(trObj).remove();

					}
				},
				error : function(e) {
					console.log(e);
				}
			})

		});
	});
</script>

<style>

.table2 {
	display: table;
	margin: 50px auto;
	width: 700px;
	font-size: 20px;
	font-stretch: extra-condensed;
	text-align: center;
}

h2 {
	text-align: center;
}
</style>
</head>


<body>


	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<table class="table2 table-hover" border="1">
		<h2>상품 관리</h2>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>재고상태</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${list}" var="goods">
			<tr>
				<td>${goods.goods_id}</td>
				<td> <a href="/admin/goods/${goods.goods_id}">${goods.goodsname}</a></td>
				<td><fmt:formatNumber value="${goods.price}" pattern="###,###,###"/>원</td>
				<td>${goods.stockVO.stockname}</td>
				<td><a class="a-delete" data-bid='${goods.goods_id}'                      
					href="/admin/goods/${goods.goods_id}">삭제</a></td>
			</tr>
		</c:forEach>
		<tr>
		
			<td colspan="5" style="background-color: #e7ab3c">
			<input type="button" class="btn btn-block" style="background-color: #e7ab3c" value="상품등록" 
					onClick="location.href='${pageContext.request.contextPath}/admin/goods/register'"> 
			</td>
		</tr>
	</table>
	
	 <c:if test="${pageMaker.prev}">
         <a href="goods${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
      </c:if>

      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
         <c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
         <a href="goods${pageMaker.makeQuery(idx)}">${idx}</a>
      </c:forEach>
      
      <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
         <a href="goods${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
      </c:if> <br>
      
      
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>