
			<div class="col-lg-9">
				
	
				
				
					<form action="modify" method="post">
						<!-- input ajax 시작하는 곳! -->
						<div id = "input" class="row">
							<div class="col-lg-6">
								<div class="product-pic-zoom">
									<img class="product-big-img" height="550"
										src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}" alt="">
									<div class="zoom-icon">
										<i class="fa fa-search-plus"></i>
									</div>
								</div>
								<div class="product-thumbs">
									<div class="product-thumbs-track ps-slider owl-carousel">
										<div class="pt active"
											data-imgbigurl="/resources/img/admin/goods/${goods.goodsVO.thumbnail}">
											<img
												src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}"
												width="1270" alt="">
										</div>
									 	<c:forEach var="goods" items="${img}">
											<div class="pt" data-imgbigurl="/resources/img/admin/board/${goods.imgname}">
											<img src="/resources/img/admin/board/${goods.imgname}" alt="">
										</div>
										</c:forEach>  
										
										
										
									</div>
								</div>
							</div>