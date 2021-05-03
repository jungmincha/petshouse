<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>beststore</title>

<!-- bootstrap css cdn --<!-- > -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <script type="text/javascript">
    $(document).ready(function(){	
		$.fn.generateStars = function() {
    	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
    	};

    	// 숫자 평점을 별로 변환하도록 호출하는 함수
    	$('.star-prototype').generateStars();
    })
    
    function fire_ajax_submit(id) {
    	console.log(id);
    	var code = id;	
		var form = {
				code: code
		};   
    	var url = "/store/best/"+id;
    		
    $.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
  		url: url,
        data: JSON.stringify(form), 
        cache : false,  
        success: function (data) {         	
          console.log("SUCCESS : ", data); 
          $('#input').html(data);
        },    
        error: function (e) {
     	   console.log("ERROR : ", e);
        }
    });
} 
</script>
  
<style>
    .single-banner{
    	padding-bottom: 40px;
    }
    
    .product-item{
    	padding-top: 40px;
    }
    
    .section-title{
    	padding-top: 150px;
    }
    
    .product-item img{
    	width: 120px;
    	height: 280px;
    }
      
    span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    display: inline-block;
	}
 
	span.star-prototype > * {
	    background-position: 0 0;
	    max-width:80px; 
	}
	
	#navbars>li:nth-child(3) {
  		background-color: #e7ab3c;
	}
  </style>
</head>

<body>
 <!-- header -->
 <%@ include file="/WEB-INF/views/include/header.jsp" %>
 
    <!-- Best Products  -->
    <section class="latest-blog spad">
       <div class="container">
       <!--bestcate에서 호출되는 부분-->
		<div id = "input">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">	
                        <h2><a href="/store/best">Best Products</a></h2>
                    </div>
                </div> 
             </div>
          
         	<!-- category -->
             <div class="row">           
                <div class="col-sm-2">                                                                  
	               <a href="#" onclick ="fire_ajax_submit(1);"><img src="/resources/img/category/cat.jpg"></a>                                     
                </div>
                
                <div class="col-sm-2">
                    <a href="#" onclick ="fire_ajax_submit(2);"><img src="/resources/img/category/dog.jpg"></a>
                </div>
                
                <div class="col-sm-2">
                    <a href="#" onclick ="fire_ajax_submit(3);"><img src="/resources/img/category/reptile.jpg"></a>
                </div>
                
                <div class="col-sm-2">
                    <a href="#" onclick ="fire_ajax_submit(5);"><img src="/resources/img/category/bird.jpg"></a>
                </div>
                
                <div class="col-sm-2">
                    <a href="#" onclick ="fire_ajax_submit(4);"><img src="/resources/img/category/fish.jpg"></a>
                </div>
                
                <div class="col-sm-2">
                    <a href="#" onclick ="fire_ajax_submit(6);"><img src="/resources/img/category/other.jpg"></a>
                </div>
            </div>
  		  <!-- Category End -->   
  		  
            <!-- Goods -->
             <div class="cate row" style="padding-bottom: 30px;">
           		<c:forEach items="${rate}" var="rate">          		
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">			   
                        	<c:forEach items="${goods}" var="goods">
                            	<c:if test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                                	<a href="/admin/goods_detail/${goods.board_id}"><img src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}" alt=""></a>
		                            <div class="sale">Best ${rate.rnum}</div>                     
                            	</c:if>
                            </c:forEach>
                        </div>
                        
                        <div class="pi-text">
                            <div class="catagory-name"> </div>
                           		<c:forEach items="${goods}" var="goods">
                            		<c:if test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                                		<a href="/admin/goods_detail/${goods.board_id}">
                                		  <h5>${goods.goodsVO.goodsname}</h5></a>                       
		                            	<div class="product-price"> ${goods.goodsVO.price}원</div>                   
						  				<span class="star-prototype"> ${rate.avgscore}</span> <span> &nbsp; 리뷰 ${rate.count}</span>         
                        			</c:if>
                        		</c:forEach>
                        </div>                    
                    </div>     
                </div>
                </c:forEach>
            </div>
            
	          <c:if test="${fn:length(count) > 8}">
	            <div class="btn col-lg-12 text-center" style="padding-bottom: 80px;">  
	          	    <input type="hidden" class="count" value="${fn:length(count)}" />
		            	<button id="morebtn" type="button" class="btn btn-disabled" onClick="btnClick()">더보기 
		            	<i class="fa fa-caret-down"aria-hidden="true"></i></button>
		        </div>
		       </c:if>
	       </div>
	     </div>
	  </section>
     <!-- Goods End -->
 
     <!-- 더보기 페이징 처리 -->
     <script>
     var pageNum = 1;
     var check = $('.count').val() / 8;
    
	     function btnClick(){
	   	  pageNum += 1;
	   	  
	   	  if (pageNum >= check) {
	             $(".btn").hide();
	          }
	   	  
	   	  console.log(pageNum);
	   	  console.log(check);
    	   	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/store/morelist",
    	        data : {
    	        	pageNum: pageNum 
    	        },
    	        success :function(data){
    	           console.log(data);
    	           var rate = data.rate;
    	           var goods = data.goods;
					
    	          html = "";
    	           for(var i in rate){
    	        	  html += "<div class='col-lg-3 col-sm-6'> <div class='product-item'>  <div class='pi-pic'>";
    	        	for(var j in goods){
	       	          	if(goods[j].goodsVO.goods_id == rate[i].goodsVO.goods_id){
	       	          	html +="<a href='/admin/goods_detail/" + goods[j].board_id + "'><img src='/resources/img/admin/goods/"+goods[j].goodsVO.thumbnail + "'>"
	       	          	  	 + "<div class='sale'>Best" + rate[i].rnum + "</div>"       
		       	          	 + "</div> <div class='pi-text'> <div class='catagory-name'> </div>"
		       	         	 + "<a href='/admin/goods_detail/" + goods[j].board_id + "'> <h5>" + goods[j].goodsVO.goodsname + "</h5></a>"
		       	         	 + "<div class='product-price'>" + goods[j].goodsVO.price + "원</div>"
		       	        	 + "<span class='star-prototype'> <span class='star' style='width:"+(rate[i].avgscore*16)+"px'> </span>" + "</span>"       	         	
		       	         	 + "<span> &nbsp; 리뷰" + rate[i].count + "</span> </div> </div> </div> </div>";       	          	       	          	  	          		
	       	          	}//if end 
    	        	  }//goods foreach end   	  	
    	            } //bestrate foreach end
    	           
	   	        	if(rate.length == 8){
		        		html += "<div class='btn col-lg-12 text-center'>"  
		        			 + "<button id='morebtn' type='button' class='btn btn-disabled' onClick='btnClick()'>더보기<i class='fa fa-caret-down' aria-hidden='true'></i></button></div>";				      
		        	}
     
    	           	$('.btn').remove();
    	            $('.cate').append(html); 
    	          
    	        }, //success end       
    	        
    	         error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end
    	    }); //ajax end	 
    	}; //click end	
      </script>

   <!-- Footer -->
 	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
 
   <!-- Bootstrap core JavaScript -->
   <script src="/resources/js/bootstrap.min.js"></script>
   <script src="/resources/js/jquery.countdown.min.js"></script>
   <script src="/resources/js/jquery.nice-select.min.js"></script>
   <script src="/resources/js/jquery.zoom.min.js"></script>
   <script src="/resources/js/jquery.dd.min.js"></script>
   <script src="/resources/js/jquery.slicknav.js"></script>
   <script src="/resources/js/owl.carousel.min.js"></script>
   <script src="/resources/js/main.js"></script>
</body>
</html>