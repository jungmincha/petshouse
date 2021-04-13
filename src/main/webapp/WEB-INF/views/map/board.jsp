<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>


</head>
<body  style="padding-top:128px">

  <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
   

    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                
                <h3>${location}</h3>
              
                
                <a href="/map/home">위치 다시 설정하기</a>
                
               <br>
           <h5>${member_id}</h5>
            <h5>${nickname}</h5>
             <form  action="/map/search" method="get">  
          <input id="location" type="hidden" name="location" value="${location}" /> 
	<input id="member_id" type="hidden" name="member_id" value="${member_id}" />     
	<input id="nickname" type="hidden" name="nickname" value="${nickname}" /> 
	<button type="submit">검색</button>
	</form>
                 
                       
                 
                 
                 
          <form  action="/map/write_view" method="get">  
          <input id="location" type="hidden" name="location" value="${location}" /> 
	<input id="member_id" type="hidden" name="member_id" value="${member_id}" />     
	<input id="nickname" type="hidden" name="nickname" value="${nickname}" />    
                
                <br/>
                
                <table class="table">
			<c:forEach items="${list}" var="list">
				<tbody id="mapList">
					<td><a href="/map/board/${list.board_id}?location=${location}&nickname=${nickname}&member_id=${member_id}">
							
								<div style="font-weight: bold; font-size: 18px;">${list.title}</div>
								<ul class="pd-tags">
									<div>${list.content}</div>
									<span>${nickname}</span>
									<span style="font-size: 13px; color: gray;">${list.pdate}</span>
									<span style="font-size: 13px; color: gray;"> 조회수 ${list.hit}</span>
									

								</ul>
							
					</a></td>
				</tbody>
			</c:forEach>
		</table>
                
                  
                
          <table border=1 style="width:1140px;">
      <tr>
      	<td>글번호</td>
      	<td>아이디</td>
         <td>제목</td>
         <td>내용</td>
         <td>작성일자</td>
         <td>좋아요</td>
         <td>조회수</td>
     
      </tr>
      <c:forEach items="${list}" var="list">
         <tr>
         	<td>${list.board_id}</td>
         	<td>${list.memberVO.member_id}</td>
 			  <td><c:forEach begin="1" end="${list.pindent}">[re]</c:forEach>
 			  
             <a href="/map/board/${list.board_id}?location=${location}&nickname=${nickname}&member_id=${member_id}">${list.title}</a></td>        
            <td>${list.content}</td>
          
            <td>${list.pdate}</td>
            <td>${list.plike}</td>
            <td>${list.hit}</td>
        
         </tr>
      </c:forEach>
      
      
      </table>
      
        
	
	  <input type="submit" value="글작성">

      
    <!--    <a href="write_view">글작성</a> -->
      </form>
            <div style="text-align:center">
   <c:if test="${pageMaker.prev}">
         <a href="board${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
      </c:if>

      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
         <c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
         <a href="board${pageMaker.makeQuery(idx)}">${idx}</a>
      </c:forEach>
      
      <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
         <a href="board${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
      </c:if> 
	<br/>
   
   
   



     
      </div>
      
      
      
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