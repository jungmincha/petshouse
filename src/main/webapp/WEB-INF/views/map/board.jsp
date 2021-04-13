<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script>

$(function() {

    $("#sel").change(function() {
    	
    	location.href="/map/home"
    	
    });

});

</script>

<style>
.jumbotron {
	text-align: center;
	height: 300px;
}

.qcontent {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 1000px;
	height: 20px;
}

a:link {
	text-decoration: none;
	color: #333333;
}

a:visited {
	text-decoration: none;
	color: #333333;
}

a:active {
	text-decoration: none;
	color: #333333;
}

a:hover {
	text-decoration: none;
}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}
#hashtag:hover{
background-color:#dddddd;
}

.top {
   background-color: #e7ab3c;
   border-radius: 10px;
   cursor: pointer; 
   position: fixed; 
   right: 5px; 
   font-size: 15px; 
   bottom: 500px;
   padding:10px;
}

body::-webkit-scrollbar {
    width: 10px;
  }
body::-webkit-scrollbar-thumb {
    background-color: #666666;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
body::-webkit-scrollbar-track {
    background-color: #CCCCCC;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
 
</style>



</head>
<body  style="padding-top:128px">

  <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
   

    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                
                
                <select  id="sel" style="border:none; font-size:22px;">
 		<option value='${location}' selected>${location}</option>
   		 <option value="relocaion" >위치 다시 설정하기</option>
    
			</select>
                
               <br>
                 <br>
               
       
        <h4>${nickname}</h4> 
            <br>
     
	
	 <form  action="/map/write_view" method="get">  
          <input id="location" type="hidden" name="location" value="${location}" /> 
	<input id="member_id" type="hidden" name="member_id" value="${member_id}" />     
	<input id="nickname" type="hidden" name="nickname" value="${nickname}" />    
	
	
                 
                 <div class=" row" style="padding-bottom: 30px;">

			<select  name="hashtag" id="hashtag" class="form-control col-sm-1"
				
				style="margin-left: 15px; text-align-last: center; font-size:18px;">

				<option value="우리동네질문">우리동네질문</option>
				<option value="분실/실종센터">분실/실종센터</option>
				<option value="일상">일상</option>
				<option value="맛집">맛집</option>
				<option value="취미생활">취미생활</option>
				<option value="여행">여행</option>
				<option value="기타">기타</option>
			</select> <span class="col-sm-9"></span>
			
			<button class="btn btn-outline-secondary col-sm-1" id="qw"
				style="margin-left: 65px;" type="submit">글 작성</button>
		</div>
                       
                 
                 
                 
      
                
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
									<c:set var="hashtag" value="${list.hashtag}" />
									<c:set var="tag" value="${fn:split(hashtag, ' ')}" />
									<c:forEach var="t" items="${tag}">
										<span><button id="hashtag" name="keyword"
												class="btn btn-disabled" style=""
												value="${t}"
												onclick="location.href='${pageContext.request.contextPath}/map/qnatag'">${t}</button></span>
									</c:forEach>


								</ul>
							
					</a></td>
				</tbody>
			</c:forEach>
		</table>
                
                  
   
      </form>
           <!-- 페이징 -->
		<div class="ul">
			<ul class="pagination justify-content-center"
				style="padding-bottom: 50px; padding-top: 50px;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="board${pageMaker.makeQuery(pageMaker.startPage - 1) }">
							Previous</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
					<li class="page-item"><a class="page-link"
						href="board${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="board${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
				</c:if>
			</ul>
		</div>
      
      
        </div>           
               
            </div>
        </div>
    </section>
    
    <script type="text/javascript">
		// 해당 동물의 글을 끌고올거야
		$('#hashtag')
				.change(
						function() {
							var hashtag = $(this).val();
							var location = $('#location').val();
							console.log("너의 해시태그는 뭐니?"+hashtag);
							console.log("너의 장소는 뭐니?"+location);
							
							
							$
									.ajax({
										url : "/map/location/tag",
										type : "get",
										data : {
											hashtag : hashtag,
											location : location,
										},
										success : function(data) {

											console.log(data);
											$(".table").empty();
											var html = "<table class='table'>";
											for (var i = 1; i <= data.length; i++) {

												html += "<tbody id='qnaList'><td>"
														+ "<a href='${pageContext.request.contextPath}/commu/qna_view?board_id="
														+ data[i - 1].board_id
														+ "'>"
														
														+ "<div style='font-weight: bold; font-size: 18px;'>"
														+ data[i - 1].title
														+ "</div>"
														+ "<div>"
														+ data[i - 1].content
														+ "</div> <span>"
														+ data[i - 1].memberVO.nickname
														+ "</span>"
														+ "<span style='font-size: 13px; color: gray;'>"
														+ data[i - 1].pdate
														+ "</span> "
														+ "<span style='font-size: 13px; color: gray;'> 조회수 "
														+ data[i - 1].hit
														+ "</span>"
														+ "</a>"
														+ "</td></tbody>"

											}
											html += "</table>"
											$(".ul").prepend(html);

										}, //ajax 성공 시 end

										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);

										} // ajax 에러 시 end

									})
						})
	</script>
    
    
  
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>  

 <% response.setHeader("Cache-Control","no-store");
 response.setHeader("Pragma","no-cache"); 
 response.setDateHeader("Expires",0); 
 if (request.getProtocol().equals("HTTP/1.1")) response.setHeader("Cache-Control", "no-cache"); %>
 

    
    
    
</body>
</html>