
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

/* $(document).ready(function() {
    console.log("${category_id}")

    var category = $("#category").val();

    var form = {

       category : category,

       name : "${categoryName}",

    };

    var url = "/category/smallcategory/" + "${category_id}";

    $.ajax({
       type : "POST",
       contentType : 'application/json; charset=utf-8',
       url : url,
       data : JSON.stringify(form),
       cache : false,

       success : function(data) {

          console.log("SUCCESS : ", data);

          $('#input').html(data);
          console.log(id);
          console.log(name);
          console.log(animal);

       },
       error : function(e) {
          console.log("ERROR : ", e);

       }
    });

 })
 */



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
        data:  JSON.stringify(form), 
        cache : false,
      
        success: function (data) { 
        	
          console.log("SUCCESS : ", data);
       
   $('#input').html(data);
		  console.log(id);
		  console.log(name);
		  console.log(animal);
		
        },
        error: function (e) {
      console.log("ERROR : ", e);
  
        }
    });

}
  	
  	
  	
	function select_submit(arr) {
    	console.log(arr);
    	
   	 var category = $("#category").val();
 	     
 	var form={
 			
 			category:category,
 			
 	
 			
 	};
    	
    	var url = "/category/"+arr;
    	
    	
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






<br/>
	
	<div class="dropdown">
     <button type="button" style="font-size:20px; color:black;background-color:white; border:none; " class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
     전체
    </button>
    <div class="dropdown-menu">
    <a class="dropdown-item" style="font-size:20px;" href="/category/home">최신순</a>

  <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('rowprice')">가격 낮은순</a>
  <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highprice')">가격 높은순</a>
   <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highstar')">별점 높은순</a>
     <!--   <a class="dropdown-item" style="font-size:20px;" href="/category/highprice">가격 높은순</a> -->
<!--      <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highprice')">가격 높은순</a>  -->
   <!--    <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('rowprice')">가격 낮은순</a> -->
   
<!--       <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highstar')">별점 높은순</a> -->
      
    
    </div>
  </div>
    
                 
<div class="row text-center">


<c:forEach items="${goods}" var="goods" varStatus="status">
                       
                           <div class="product-item">
                              
                                <div class="pi-text" style="padding:10px;">
                             
                                     
                                       <a href="/admin/goods_detail/${goods.board_id}">
                                       <img src="/resources/img/admin/goods/${goods.goodsVO.thumbnail}" style="width:200px;" alt="">
                                          <h5>${goods.goodsVO.goodsname}</h5>
                                       </a>
                                       <div class="product-price">${goods.goodsVO.price}원</div>
         						   별점 <span class="star-prototype">${rate[status.index].avgscore}</span>
                                  
                              </div>
                           </div>
                              </c:forEach> 
                   
     
      </div>

         

  


</body>
</html>