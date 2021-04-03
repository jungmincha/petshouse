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
<!-- Bootstrap -->
<link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="/resources/sidemenu/css/styles.css" rel="stylesheet">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<!--CDN 링크 -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/sidemenu/https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/sidemenu/js/custom.js"></script>
  
<script type="text/javascript">
	//delete ajax
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
 	// 카테고리 ajax
	function fire_ajax_submit(id) {
    	console.log(id);
    	var category = {}
    	category["category"] = $("#category").val();
    	
    	var url = "/admin/goods/category/"+id;
    	
    	
    $.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
  		url: url,
        data: JSON.stringify(category), 
        cache : false,
        
        success: function (data) { 
        	
          console.log("SUCCESS : ", data);
       
          $('#input').html(data);
		  console.log(id);

        },
        error: function (e) {
      console.log("ERROR : ", e);
  
        }
    });

}
  	
  	
  	
 
  	

</script>

<style>
.table2 {
	display: table;
	margin:  auto;
	width: 800px;
	font-size: 25px;
	font-stretch: extra-condensed;
	 
}

h2 {
	text-align: center;
}
</style>
</head>


<body>


	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	  <!-- Page Content -->
   <!-- Product Shop Section Begin -->

     
<div class="container">
 
		
		
	<div id = "input">
		
	<div class="row">
		<div class="col-lg-3">
		
    <div class="sidebar" style="display: block;" >
                <ul class="nav">
                   <li class="submenu">
                 
   
                 	<h2>카테고리</h2>
                
                      <!-- 고양이 -->
                     <a href="#" style ="font-size: 25px;"> 
               		 <i class="fas fa-cat"></i>${category[0].categoryname}<span class="caret pull-right"></span>
                     </a>
                     
                     <!-- Sub menu -->
                     <ul>
                       <c:forEach items = "${sort}" var="vo" begin="0" end="6">
   
                      <li>
                      <a href="#"  style ="font-size: 18px;" onclick="fire_ajax_submit(${vo.category_id});">
                      ${vo.categoryname}
                      </a>
                      </li>                       
                          </c:forEach>
                      </ul>    
                      </li>
                      </ul>
                       
                       
                        
                  <!-- 강아지 -->
                   <ul class="nav">
                   <li class="submenu">
                     <a href="#" style ="font-size: 25px;"> 
                     <i class="fas fa-dog"></i>${category[1].categoryname}<span class="caret pull-right"></span>
                     </a>
                     
                        <!-- Sub menu -->
                      <ul>
                           <c:forEach items = "${sort}" var="vo2" begin="7" end="13">
    			      <li>
    			      <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit(${vo2.category_id});">
    			      ${vo2.categoryname}
    			      </a>
    			      </li>
                            </c:forEach>
                       </ul>
                       </li>
                       </ul>
                    
                    
                    
                  <!-- 조류 -->
                      <ul class="nav">
                   <li class="submenu">
                  <a href="#" style ="font-size: 25px;">
                     <i class="fas fa-frog"></i>${category[2].categoryname}<span class="caret pull-right"></span>
                  </a>
                  <!-- Sub menu -->
                         <ul>
                           <c:forEach items = "${sort}" var="vo3" begin="14" end="17">
            			 <li>
                          <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit(${vo3.category_id});">
                          ${vo3.categoryname}
                          </a>
                          </li>
                             </c:forEach>
                         </ul>
                         </li>
                        </ul>
                    
                    
                    
                        <!-- 어류 -->
                            <ul class="nav">
                   <li class="submenu">
                        <a href="#" style ="font-size: 25px;">
                            <i class="fas fa-fish"></i>${category[3].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                            <c:forEach items = "${sort}" var="vo4" begin="18" end="24">
						    <li>
						    <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit(${vo4.category_id});">
						    ${vo4.categoryname}
						    </a>
						    </li>
                        
                          
                          </c:forEach>
                          </ul>
                          </li>
                          </ul>
                    
                        <!-- 파충류 -->
                         <ul class="nav">
                 	     <li class="submenu">
                          <a href="#" style ="font-size: 25px;">
                            <i class="fas fa-crow"></i>${category[4].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                           <c:forEach items = "${sort}" var="vo5" begin="25" end="29">
             			   <li>
             			   <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit(${vo5.category_id});">
             			   ${vo5.categoryname}
             			   </a>
             			   </li>
                              </c:forEach>
                           </ul>
                           </li>
                           </ul>
                           
                           
                    
                       <!-- 기타 -->
                        <ul class="nav">
                        <li class="submenu">
                          <a href="#" style ="font-size: 25px;">
                            <i class="fas fa-paw"></i>${category[5].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                            <c:forEach items = "${sort}" var="vo6" begin="30" end="36">
						    <li>
						    <a href="#" style ="font-size: 18px;" onclick="fire_ajax_submit(${vo6.category_id});">
						    ${vo6.categoryname}
						    </a>
						    </li>
                           </c:forEach>
                       		</ul>
                       		</li>
                            </ul>
                      
                        </div>


                  		<!--  카테고리 부트스트랩 end -->

            
         </div>
  

 

			<!--  카테고리 부트스트랩 end -->	
				<div class="col-lg-20">
 	 
 
         
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
						<tr onClick="location.href='/admin/goods/${goods.goods_id}'"
							style="cursor: pointer;">
							<td>${goods.goods_id}</td>
							<td>${goods.goodsname}</td>
							<td><fmt:formatNumber value="${goods.price}"
									pattern="###,###,###" />원</td>
							<td>${goods.stockVO.stockname}</td>
							<td onclick="event.cancelBubble=true;"><a class="a-delete"
								data-bid='${goods.goods_id}'
								href="/admin/goods/${goods.goods_id}">삭제</a></td>
						</tr>
					</c:forEach>
					<tr>

						<td colspan="5" style="background-color: #e7ab3c"><input
							type="button" class="btn btn-block"
							style="background-color: #e7ab3c" value="상품등록"
							onClick="location.href='${pageContext.request.contextPath}/admin/goods/register_view'">
						</td>
					</tr>
				</table>
	</div>
				<%-- <c:if test="${pageMaker.prev}">
					<a href="goods${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
					<a href="goods${pageMaker.makeQuery(idx)}">${idx}</a>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<a href="goods${pageMaker.makeQuery(pageMaker.endPage +1) }"> »
					</a>
				</c:if> --%>
				<br>
</div></div> </div>

 <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>


</body>
</html>

