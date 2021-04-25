
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>



<style>
.tab-item {
	width: 1000;
}

a {
	cursor: pointer;
}

select {
	width: 120px;
	height: 30px;
	font-size: 18px;
}

.hero-items {
	   padding-top: 150px;
	}
	
	.single-hero-items {
	   max-height: 580px;
	}
	
	.category, .hotitem {
	   padding-top: 40px;
	}
	
	.product-item {
	   padding-top: 20px;
	}
	
	.recommended {
	   padding-top: 60px;
	}
	
	.best {
	   padding: 80px;
	}
	
	.product-item img{
    	width: 200px;
    	height: 280px;
    }
    	
	span.star-prototype, span.star-prototype>* {
	   height: 16px;
	   background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	   display: inline-block;
	}
	
	span.star-prototype>* {
	   background-position: 0 0;
	   max-width: 80px;
	}
</style>

  
  
<script type="text/javascript">


  	function fire_ajax_submit(id, name) {
  		console.log(id);
		console.log(name);
			
		 var category = $("#category").val();
	
	var form={
			
			category:category,		
			name:name,


			
	};
    	
    	var url = "/category/smallcategory/"+id;
    	
    	
    $.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
  		url: url,
        data: JSON.stringify(form), 
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
  	
	
function chageLangSelect() {
		
		var target = document.getElementById("selectBox");

  		console.log('선택된 옵션 value 값=' + target.options[target.selectedIndex].value); 
 
		 var category = $("#category").val();
      	   
    	var form={
    			
    			category:category,
    			
 
    			
    	};
    	
    	var url = "/category/"+target.options[target.selectedIndex].value;
    	
    	
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
  	
  	
  	 $(document).ready(function() {
	      $.fn.generateStars = function() {
	         return this.each(function(i, e) {
	            $(e).html($('<span/>').width($(e).text() * 16));
	         });
	      };

	      // 숫자 평점을 별로 변환하도록 호출하는 함수
	      $('.star-prototype').generateStars();
	   });

</script>
</head>


<body style="padding-top:128px">




<c:forEach items="${sgname}" var="sgname" >
			<h3>${sgname}</h3>
			</c:forEach>

<br/>
            
                                      
 <!-- <select name="selectBox" id="selectBox" style="border:none; font-size:20px "onchange="chageLangSelect()">
    <option style="font-size:20px;" value="rowprice">가격 낮은순</option>
    <option style="font-size:20px;" value="highprice">가격 높은순</option>
    <option style="font-size:20px;" value="highstar">별점 높은순</option>
</select>
 -->
    
            
            
           
               



<c:forEach items="${rate}" var="rate">
                        <c:if test="${rate.rnum le 10}">
                           <div class="product-item">
                              <div class="pi-pic">
                                

                                 <div class="sale">BEST ${rate.rnum}</div>
                                 <ul>
                                    <li class="w-icon active"><a href="#"><i
                                          class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                    <li class="w-icon"><a href="#"><i
                                          class="fa fa-random"></i></a></li>
                                 </ul>
                              </div>
                              <div class="pi-text" style="padding:10px;">
                               
                                 <c:forEach items="${goods}" var="goods">
                                    <c:if
                                       test="${rate.goodsVO.goods_id eq goods.goodsVO.goods_id}">
                                         
                                       <a href="/admin/goods_detail/${goods.board_id}">
                                       <img src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}" style="width:200px;" alt="">
                                          <h5>${goods.goodsVO.goodsname}</h5>
                                       </a>
                                       <div class="product-price">${goods.goodsVO.price}원</div>
                                    </c:if>
                                 </c:forEach>
                                 별점 <span class="star-prototype"> ${rate.avgscore}</span>
                                
                              </div>
                           </div>
                        </c:if>
                     </c:forEach>



 <%-- <c:forEach items="${goods}" var="dto" varStatus="status">
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://image.kmib.co.kr/online_image/2020/0927/611718110015050456_2.jpg" alt="">
          <div class="card-body">

            <h4 class="card-title">${dto.goodsVO.goodsname}</h4>
            <p class="card-text">${dto.goodsVO.price}</p>
             
            <p class="card-text">${dto.pdate}</p>
          
     
          </div>
          
        </div>
      </div>
      </c:forEach> --%>
   
s
         


   
  
</body>
</html>