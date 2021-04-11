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
                 <h3>${location}</h3>
               <br>
           <h5>${member_id}</h5>
                    <h5>${nickname}</h5>
                <br/>
<form action="/map/modify" method="get">
<input id="location" type="hidden" name="location" value="${location}" /> 
	<input id="member_id" type="hidden" name="member_id" value="${member_id}" /> 
		<input id="nickname" type="hidden" name="nickname" value="${nickname}" />  
<table border=1 style="width:1140px;">
    

       
        
<tr>         
<td style="text-align:center">번호</td>
<td>${content_view.board_id}</td>
</tr>

<tr>
<td style="text-align:center" >조회수</td>
<td>${content_view.hit}</td>
</tr>

<tr>
<td style="text-align:center">아이디</td>
<td>
${content_view.memberVO.member_id}

</td>
</tr>

<tr>
<td style="text-align:center">제목</td>
<td>
<input type = "text" id = "title" name= "title" value="${content_view.title}" style="width:100%; height:100%; border:none;">
</td>
</tr>

<tr>
<td style="text-align:center">내용</td>
<td>
<textarea rows="10" id="content" name="content"  style="width:100%; height:100%; border:none;">
${content_view.content}
</textarea>
</td>
</tr>

<tr>
<td style="text-align:center">


<td><a href ="/map/board?location=${location}&nickname=${nickname}&member_id=${member_id}">목록으로</a>&nbsp;&nbsp;
 <a href = "/map/delete/${content_view.board_id}">삭제</a>&nbsp;&nbsp;<input type="submit" value="수정">  </td>



</tr>
      </table>
</form>      
     
      
      
      
        </div>           
               
            </div>
        </div>
    </section>
  
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>  

 <% response.setHeader("Cache-Control","no-store");
 response.setHeader("Pragma","no-cache"); 
 response.setDateHeader("Expires",0); 
 if (request.getProtocol().equals("HTTP/1.1")) response.setHeader("Cache-Control", "no-cache"); %>
 
    
    
    
</body>
</html>