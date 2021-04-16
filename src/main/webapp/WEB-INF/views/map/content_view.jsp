<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>

<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<style>
a:link {text-decoration: none; color: #333333;}
a:visited {text-decoration: none; color: #333333;}
a:active {text-decoration: none; color: #333333;}
a:hover {text-decoration:none;}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}
#hashtag:hover{
background-color:#dddddd;
}


</style>




 <script type="text/javascript">
		// 댓글 작성 및 ajax로 댓글 불러오기
		function getComment() {
			
			var member_id = $("#member_id").val();
			console.log(member_id);
			var pgroup = $("#pgroup").val();
			console.log(pgroup);
			var content = $("#content").val();
			
			$.ajax({
				url : "/map/map_view/insert",
				type : "post",
				data : {
					member_id : member_id,
					pgroup : pgroup,
					content : content
				},
				success : function(data) {

					html = 
						
						
						"<div id='comment'>"
						+
						"<a class='a-del' style='float:right;' href='/map/map_view/delete?board_id="+data.board_id+"'><b>삭제</b></a>"
						+
						
						" <div>" + data.memberVO.nickname + "</div>"
							+ 
							
							"<div>" + data.content + "</div>" 
							+ 
							"<div>" + data.pdate + "</div>"
							+
							
							"<hr>"
							+
							"</div>"

					
					 $("#comment").prepend(html); 
					document.getElementById("content").value='';
							
				}, 
			})

		}
		
		
		function button_event() {
			
			
			if (confirm("정말 삭제하시겠습니까?") == true) { //확인
				location.href = '/map/delete?board_id=${content_view.board_id}&location=${location}&nickname=${nickname}&member_id=${member_id}'
			} else { //취소
				return;
			}
		}

		function modify_event() {
			if (confirm("수정하시겠습니까?") == true) { //확인
				location.href = '/map/modify_view/${content_view.board_id}?location=${location}&nickname=${nickname}&member_id=${member_id}'
			} else { //취소
				return;
			}
		}
		
		
	</script>



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
                    <h4>${nickname}</h4>
                   <h4> ${hashtag}</h4>
    
    
            
          
<form action="/map/modify" method="get">

<input id="location" type="hidden" name="location" value="${location}" /> 
<input type="hidden" name="member_id" value="<sec:authentication property="principal.member_id"/>">
<input type="hidden" id="nickname" name="nickname" value="<sec:authentication property="principal.nickname"/>"> 

    
<div class="container" style="margin-bottom: 40px">
		<div class="head">
			<div style="margin-top: 45px; margin-bottom: 10px;">
				<a class="qna-subtitle" href="qna">펫츠타운</a>
			</div>
			<h3 class="qnatitle" style="font-weight: bold; margin-bottom: 10px;">${content_view.title}</h3>
		</div>

		<div style="float: right">
		<sec:authentication property="principal" var="buttonhidden" />
			  <sec:authorize access="isAuthenticated()">	
	
				<!-- 현재 접속된 닉네임과 댓글보드에 저장된 닉네임을 비교해서 일치 하면 보이게 함 -->
		<c:if test="${buttonhidden.nickname eq content_view.memberVO.nickname}">
		
			<button id="modify_button" type="button" class="btn btn-warning"
				onclick="modify_event();">수정</button>

			<button id="delete_button" type="button" class="btn btn-warning"
				onclick="button_event();">삭제</button>
				</c:if>
			</sec:authorize>
				
				
				<a href ="/map/board?location=${location}&nickname=${nickname}&member_id=${member_id}">목록으로</a>
				
		</div>

		<table>
			<td>
				<div style="font-size: 20px;">${content_view.memberVO.nickname}</div>
				<hr>
				<section style="margin-top: 60px; margin-bottom: 20px;">${content_view.content}</section>
				
				 <span style="color: gray;">${content_view.pdate}</span> <span
				style="color: gray">조회수 ${content_view.hit}</span>
			</td>
		</table>
		
			

	</div>
       
        
<%-- 
 <a href = "/map/delete/${content_view.board_id}">삭제</a>&nbsp;&nbsp;<input type="submit" value="수정">  </td>
 --%>
  
</form>      
     
      
      <div class="container">
		
		<input type="hidden" id="pgroup" value="${content_view.board_id}">
		<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
			<input type="hidden" id="member_id"
				value="<sec:authentication property="principal.member_id"/>">
		</sec:authorize>
		<div>
			<div>
				<span><strong>댓글 </strong></span>
			</div>
			<div>
				<table class="table" style="margin-bottom: 50px;">

					<td class="row"><textarea style="resize: none;"
							class="form-control col-11" id="content" placeholder="댓글을 입력하세요"></textarea>
						<button id="cw" class="col-1 btn btn-outline-secondary" onClick="getComment()">등록</button>
					</td>

				</table>
			</div>
		</div>


		<div class="container" style="margin-bottom: 10px; " >
		<c:forEach items="${comment}" var="dto">
			<div id="comment">
			<!-- 여기서부터 시큐리티 권한을준다 -->
			<sec:authentication property="principal" var="pinfo" />
			  <sec:authorize access="isAuthenticated()">	
	
				<!-- 현재 접속된 닉네임과 댓글보드에 저장된 닉네임을 비교해서 일치 하면 보이게 함 -->
		<c:if test="${pinfo.nickname eq dto.memberVO.nickname}">
			
			<a class="a-del" style="float: right;" href="/map/map_view/delete?board_id=${dto.board_id}" ><b>삭제</b></a>
			</c:if>
			</sec:authorize>
		
				<div>${dto.memberVO.nickname}</div>
				<div>${dto.content}</div>
				<div>${dto.pdate}</div>
				<hr>

			</div>
		</c:forEach>
	
			<div class="container">
				<form id="commentListForm" name="commentListForm" method="post">
					<div id="commentList"></div>
				</form>
			</div>
		</div>
		
		
	</div>
	
      
        </div>           
               
            </div>
            
            
            
            
        </div>
    </section>
  
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>  
   
   
   <script type="text/javascript">
// 댓글 삭제
	$(".a-del").click(function(event) { //id는 한번만 calss는 여러번 선택 가능.
	
	   //하나의 id는 한 문서에서 한 번만 사용이 가능(가장 마지막 혹은 처음게 선택). 하나의 class는 
	
	   event.preventDefault(); 
	  
	
	   
	   var tr = $(this).parent();//자바스크립트 클로저

	   $.ajax({
	      type : 'delete', //method
	      url : $(this).attr("href"), //주소를 받아오는 것이 두 번째 포인트.
	      cache : false,
	      success : function(result) {
	         console.log("result: " + result);
	         if (result == "SUCCESS") {
	            $(tr).remove();
	            alert("삭제되었습니다.");
	         }
	      },
	      errer : function(e) {
	         console.log(e);
	      }
	   }); //end of ajax
	 }); // 삭제 종료
	
   
   </script>
   
   
  
   
   
<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.zoom.min.js"></script>
	<script src="/resources/js/jquery.dd.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>

    
    
    
</body>
</html>