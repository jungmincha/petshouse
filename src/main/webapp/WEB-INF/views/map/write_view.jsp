<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.0.js"></script>




</head>
<body style="padding-top:128px">

  <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
    <!-- Map Section Begin -->

  
           
    <!-- Map Section Begin -->

    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                <h3>종로구</h3>
                
                <br/>
<form action="/map/write" method="post">
<table border=1 style="width:1140px;">
      

       <%--   <input type="hidden" id="bId" value="${reply_view.bId}">
         <input type="hidden" id="bGroup" value="${reply_view.bGroup}">
         <input type="hidden" id="bStep" value="${reply_view.bStep}">
         <input type="hidden" id="bIndent" value="${reply_view.bIndent}"> --%>
        
<tr>         
<td style="text-align:center">번호</td>
<td></td>
</tr>

<tr>
<td style="text-align:center" >조회수</td>
<td></td>
</tr>

<tr>
<td style="text-align:center">아이디</td>
<td>


</td>
</tr>

<tr>
<td style="text-align:center">제목</td>
<td>
<input type = "text" id = "title" name= "title"  style="width:100%; height:100%; border:none;">
</td>
</tr>

<tr>
<td style="text-align:center">내용</td>
<td>
<textarea rows="10" id="content" name="content" style="width:100%; height:100%; border:none;">
</textarea>
</td>
</tr>

<tr>
<td style="text-align:center">
<input type = "submit" value = "작성 완료" >

<td><a href = "/map/petstown">목록으로</a>&nbsp;&nbsp;



</tr>
      </table>
</form>      
     
      
      
      
        </div>           
               
            </div>
        </div>
    </section>
  
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>  

 
    
    
    
</body>
</html>