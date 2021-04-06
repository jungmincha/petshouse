<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap -->
<link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="/resources/sidemenu/css/styles.css" rel="stylesheet">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/sidemenu/js/custom.js"></script>
  

  
  <script type="text/javascript">
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



 
</head>
 <body>
 
		
    <div class="sidebar" style="display: block;" >
                <ul class="nav">
                   <li class="submenu">
                 
    				<br><br>
                      <!-- 고양이 -->
                     <a href="#" style ="font-size: 20px;"> 
               		 <i class="fas fa-cat"></i>${category[0].categoryname}<span class="caret pull-right"></span>
                     </a>
                     
                     <!-- Sub menu -->
                     <ul>
                       <c:forEach items = "${sort}" var="vo" begin="0" end="6">
   
                      <li>
                      <a href="#"  style ="font-size: 15px;" onclick="fire_ajax_submit(${vo.category_id});">
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
                     <a href="#" style ="font-size: 20px;"> 
                     <i class="fas fa-dog"></i>${category[1].categoryname}<span class="caret pull-right"></span>
                     </a>
                     
                        <!-- Sub menu -->
                      <ul>
                           <c:forEach items = "${sort}" var="vo2" begin="7" end="13">
    			      <li>
    			      <a href="#" style ="font-size: 15px;" onclick="fire_ajax_submit(${vo2.category_id});">
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
                  <a href="#" style ="font-size: 20px;">
                     <i class="fas fa-frog"></i>${category[2].categoryname}<span class="caret pull-right"></span>
                  </a>
                  <!-- Sub menu -->
                         <ul>
                           <c:forEach items = "${sort}" var="vo3" begin="14" end="17">
            			 <li>
                          <a href="#" style ="font-size: 15px;" onclick="fire_ajax_submit(${vo3.category_id});">
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
                        <a href="#" style ="font-size: 20px;">
                            <i class="fas fa-fish"></i>${category[3].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                            <c:forEach items = "${sort}" var="vo4" begin="18" end="24">
						    <li>
						    <a href="#" style ="font-size: 15px;" onclick="fire_ajax_submit(${vo4.category_id});">
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
                          <a href="#" style ="font-size: 20px;">
                            <i class="fas fa-crow"></i>${category[4].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                           <c:forEach items = "${sort}" var="vo5" begin="25" end="29">
             			   <li>
             			   <a href="#" style ="font-size: 15px;" onclick="fire_ajax_submit(${vo5.category_id});">
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
                          <a href="#" style ="font-size: 20px;">
                            <i class="fas fa-paw"></i>${category[5].categoryname}<span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                            <c:forEach items = "${sort}" var="vo6" begin="30" end="36">
						    <li>
						    <a href="#" style ="font-size: 15px;" onclick="fire_ajax_submit(${vo6.category_id});">
						    ${vo6.categoryname}
						    </a>
						    </li>
                           </c:forEach>
                       		</ul>
                       		</li>
                            </ul>
                      
                        </div>


                  		<!--  카테고리 부트스트랩 end -->

	 
</body>
 

</html>