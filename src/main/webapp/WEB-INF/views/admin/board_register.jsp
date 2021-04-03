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

<style>
.table_center {
	display: table;
	margin: 50px auto;
	width: 1000px;
	font-size: 15px;
	font-stretch: extra-condensed;
}

h2 {
	text-align: center;
}

select {
	width: 100px; /* 원하는 너비설정 */
	padding: .4em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url('이미지 경로') no-repeat 95% 50%;
	/* 네이티브 화살표를 커스텀 화살표로 대체 */
	border-radius: 5px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.box {
	margin: 50px auto;
	width: 500px;
}
</style>

</head>
<body style="padding-top: 160px">



	<!-- header -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<!-- Page Content -->

	<div class="col-lg-30">
		<form id="board"
			action="${pageContext.request.contextPath}/admin/board/register"
			method="Post">
			<input type="hidden" name="boardtype_id" value="3">
			<fieldset>
				<table class="table_center" cellpadding="20">
					 
						<h2>상품 게시글 등록</h2>
					 
					 
						<%-- <td><img style="width: 400px;" id="preview-image"
							src="https://dummyimage.com/600x500/ffffff&text=+privew"></td>
						<%=request.getRealPath("/")%> 저장경로
						<td> --%>
						
						<td>
							<div class="form-group">
								<label for="exampleSelect2">상품게시글이 등록안된 상품리스트</label> <select
									  class="form-control" id="exampleSelect2">
									<c:forEach items="${goods}" var="goods">
									<option value="${goods.goods_id}">
										${goods.goods_id}/${goods.goodsname}/${goods.price}/${goods.pcolor}/${goods.psize}/${goods.categoryVO.categoryname}/${goods.categoryVO.sortname}
										/${goods.stockVO.stockname}
										</option>
								</c:forEach>
								</select>
							</div> 
								<div class="form-group">
								<label for="exampleSelect2">상품게시글이 등록안된 상품리스트</label> <select
									multiple="" class="form-control" id="exampleSelect2">
									<c:forEach items="${goods}" var="goods">
									<option value="${goods.goods_id}">
										${goods.goods_id}/${goods.goodsname}/${goods.price}/${goods.pcolor}/${goods.psize}/${goods.categoryVO.categoryname}/${goods.categoryVO.sortname}
										/${goods.stockVO.stockname}
										</option>
								</c:forEach>
								</select>
							</div> 
							<select name="goods"
							style="vertical-align: middle; text-align-last: center">
								<c:forEach items="${goods}" var="goods">
									<option value="${goods.goods_id}">
										${goods.goods_id}/${goods.goodsname}</option>
								</c:forEach>
						</select>

								<div class="form-group row">
								<label class="col-sm-3" for="thumbnail">상품사진</label>
								<div class="input-group col-sm-9">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="thumbnail"
											name="thumbnail" style="display: block;"> <label
											class="custom-file-label" for="inputGroupFile02">Choose
											file</label>
									</div>
									<div class="input-group-append">
										<span class="input-group-text">Upload</span>
									</div>
								</div>
							</div>
							 

							<div class="form-group row center">
								<div class="col-sm-offset-2 col-sm-12">
									<input type="submit" class="btn btn-block"
										style="background-color: #e7ab3c"
										onclick="location.href='${pageContext.request.contextPath}/admin/goods' "
										value="상품게시글등록">
								</div>
							</div>
					 </td>
				 

				</table>
			</fieldset>
		</form>
	</div>


	<script>
		
	</script>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
