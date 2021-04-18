<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script>


var bbsidx = ${bbsidx};
var useridx = ${useridx};
 
var btn_like = document.getElementById("btn_like");
 btn_like.onclick = function(){ changeHeart(); }
 
/* 좋아요 버튼 눌렀을떄 */
 function changeHeart(){ 
     $.ajax({
            type : "POST",  
            url : "/map/clickLike",       
            dataType : "json",   
            data : "bbsidx="+bbsidx+"&useridx="+useridx,
            error : function(){
                Rnd.alert("통신 에러","error","확인",function(){});
            },
            success : function(jdata) {
                if(jdata.resultCode == -1){
                    Rnd.alert("좋아요 오류","error","확인",function(){});
                }
                else{
                    if(jdata.likecheck == 1){
                        $("#btn_like").attr("src","/home/img/ico_like_after.png");
                        $("#likecnt").empty();
                        $("#likecnt").append(jdata.likecnt);
                    }
                    else if (jdata.likecheck == 0){
                        $("#btn_like").attr("src","/home/img/ico_like_before.png");
                        $("#likecnt").empty();
                        $("#likecnt").append(jdata.likecnt);
                        
                    }
                }
            }
        });
 }


</script>




</head>
<body style="padding-top: 128px">

	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Map Section Begin -->



	<!-- Map Section Begin -->

	<!-- Contact Section Begin -->
	<section class="contact-section spad">
	
	<c:choose>
    <c:when test="${likecheck eq '0' or empty likecheck}"> <!-- likecheck가0이면 빈하트-->
        <img src="/home/img/ico_like_before.png" 
             id="btn_like" align="left" style="cursor:pointer; width: 20px;">
    </c:when>
    <c:otherwise> <!-- likecheck가1이면 빨간 하트-->
        <img src="/home/img/ico_like_after.png" 
              id="btn_like" align="left" style="cursor:pointer; width: 20px;">
    </c:otherwise>
</c:choose>
<div id="likecnt" style="margin-left:5px;">${likecnt}</div>
	
	
	
	
	
		
	</section>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>





</body>
</html>