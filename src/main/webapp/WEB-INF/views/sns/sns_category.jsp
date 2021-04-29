<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SNS</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   type="text/css" />

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

<!-- jquery cdn -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="/resources/css/select-style.css"
   type="text/css">
<link rel="stylesheet" href="/resources/js/select-index.js"
   type="text/css">

<style>
.profile_box {
   width: 40px;
   height: 40px;
   border-radius: 70%;
   overflow: hidden;
   margin: 5px;
}

.profile {
   width: 40px;
   height: 40px;
   object-fit: cover;
}

.i {
   
   border-radius: 10px;
}

.count {
   position: absolute;
   bottom: 80px;
   right: 30px;
   font-size: 13px;
   color: #fff;
   text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}

.count2 {
   position: absolute;
   bottom: 10px;
   right: 10px;
   font-size: 13px;
   color: #fff;
   text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}
</style>
<script>
   //로그인 체크
   $(document).ready(function() {
      var member_id = $("#member_id").val();

      function checkLogin() {
         if (member_id == undefined) {
            alert("로그인 후 글을 작성해주세요.");
            location.href = '/login/login';
         }
      }
      $('#login').click(function() {
         checkLogin();
      });

   });
</script>

 
</head>
<body style="padding-top: 170px; min-height: 1500px;">
<a class="btn btn-outline-secondary col-sm-1 float-right"  id = "login"  style="position: fixed; top: 170px; right: 200px;" onclick="location.href='${pageContext.request.contextPath}sns/write_view'">게시글등록</a>
   
   <div class="container" style="min-height: 1500px;">

      <div class="section-title">
      				 
					<h2 style="margin-bottom:10px; font-size:30px; ">SNS</h2>
					 
				 </div>  
       

      <div class="row ">
         <div class="col-sm-2">
            <a href="#" onclick="fire_ajax_submit(1);"> <img
               src="/resources/img/category/cat.jpg"></a>
         </div>

         <div class="col-sm-2">
            <a href="#" onclick="fire_ajax_submit(2);"> <img
               src="/resources/img/category/dog.jpg"></a>
         </div>

         <div class="col-sm-2">
            <a href="#" onclick="fire_ajax_submit(3);"> <img
               src="/resources/img/category/reptile.jpg"></a>
         </div>

         <div class="col-sm-2">
            <a href="#" onclick="fire_ajax_submit(4);"> <img
               src="/resources/img/category/bird.jpg"></a>
         </div>

         <div class="col-sm-2">
            <a href="#" onclick="fire_ajax_submit(5);"> <img
               src="/resources/img/category/fish.jpg"></a>
         </div>

         <div class="col-sm-2">
            <a href="#" onclick="fire_ajax_submit(6);"> <img
               src="/resources/img/category/other.jpg"></a>
         </div>
      </div>

      <!-- Category Section End -->

      <div id="snslist" class="row text-center">
      <c:if test="${empty list}">
                     
                     <div class="col-12" style="min-height:200px; margin:100px auto;">
                        <div>등록된 게시글이 없습니다.</div>
                     </div>
         </c:if>
         <c:if test="${not empty list}">
         <c:forEach items="${list}" var="sns">
         <input type="hidden" class="category_id" value="${sns.boardVO.categoryVO.category_id}">
            <div class=" col-12 col-md-4 col-lg-3">

               <div class="user-Info row" style="margin: 20px auto 0px 5px">
                  <div class="profile_box ">

                     <img
                        src="/resources/img/member/profile/${sns.boardVO.memberVO.thumbnail}"
                        name="profile" alt="" class="profile" />
                  </div>
                  <div style="padding-top: 13px; padding-left :7px;">${sns.boardVO.memberVO.nickname} </div>
                   
                  <a href="/myPage/${sns.boardVO.memberVO.nickname}"
                     style="padding: 13px; color:#e7ab3c;"> · <b>팔로우</b></a>


               </div>

               <div class="shot">
                  <c:forEach items="${imgCount}" var = "imgCount">
                      <c:if test="${imgCount.boardVO.board_id eq sns.boardVO.board_id and imgCount.count > 1}"> 
                       <i class="far fa-clone clone"></i>
                         </c:if> 
                         </c:forEach> 
                  <a href="/commu/sns/${sns.boardVO.board_id}"> <img
                     src="/resources/img/member/sns/${sns.imgname }" alt=""
                     style="height: 300px;" class="card-img-top i" /><span
                     class="count">조회수 ${sns.boardVO.hit}</span></a>
               </div>
               <div class="card-body" style="font-size : 20px; ">
                     
                     <a href="/commu/sns/${sns.boardVO.board_id}"> <i class="far fa-heart"></i>&nbsp&nbsp${sns.boardVO.plike}</a> &nbsp&nbsp&nbsp&nbsp
                     <i class="far fa-comment"></i>
                     <c:forEach items="${count}" var="count">  
                     
                     
                     <c:if test="${count.pgroup eq sns.boardVO.board_id}"><a href="/commu/sns/${sns.boardVO.board_id}">
                     
                      ${count.count}</a></c:if></c:forEach>
                      
                      </div>

            </div>
         </c:forEach></c:if>
      </div>


          <c:if test="${fn:length(snsTotal) > 12}">
                <div class="col-lg-12 text-center">
                    <input type="hidden" class="snsTotal" value="${fn:length(snsTotal)}" />
                     <button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
               </div>   
           </c:if> 
   </div>
   
      
   <!--  더보기 페이징 처리 -->
   <script type="text/javascript">

      var pageNum = 1;
      var check =$('.snsTotal').val() / 12;

      function btnClick() {

         pageNum += 1;
         console.log(pageNum);
         console.log(check);

         if (pageNum >= check){
            $(".btn").hide();
         }
         
         var category_id = $('.category_id').val();   
         console.log(category_id);
        var url = "/commu/sns/morelist/"+ category_id;    
        
         $
               .ajax({
                  type : "POST",
                  url : url,
                  data : {
                     pageNum : pageNum,
                     category_id: category_id                  
                  },
                  success : function(data) {
                     console.log(data);
                     console.log("here");
                     var sns = data.sns;
                     var count = data.count;
                     var imgCount = data.imgCount;

                     html = "";
                     
                     for (var i in sns) {
                           html += "<div class='col-12 col-md-4 col-lg-3'>"
                                 + "<div class='user-Info row' style='margin:20px auto 0px 5px;'>"
                                 + "<div class='profile_box'>"
                                 + "<img src='/resources/img/member/profile/" + sns[i].boardVO.memberVO.thumbnail + "' name='profile' class='profile' /></div>"
                                 + "<div style='padding-top:13px; padding-left:7px;'>" + sns[i].boardVO.memberVO.nickname + "</div>"
                                 + "<a href='/myPage/" + sns[i].boardVO.memberVO.nickname + "' style='padding-top: 13px; padding-left: 5px; color:#e7ab3c;'> · 팔로우</a></div>"
                                 + "<div class='shot'>";
                                 for(var j in imgCount){
                                    if(imgCount[j].boardVO.board_id == sns[i].boardVO.board_id && imgCount[j].count > 1){
                                       html += "<i class = 'far fa-clone clone'></i>";
                                       
                                    }
                                    
                                 }
                                 
                             html += "<a href='/commu/sns/" + sns[i].boardVO.board_id + "'>"
                                 + "<img src='/resources/img/member/sns/"+ sns[i].imgname + "' style='height: 300px;' class='card-img-top i' />"
                                 + "<span class='count'>조회수" + sns[i].boardVO.hit + "</span></a></div>"                             
                                 + "<div class='card-body' style='font-size:20px;'>"
                                 + "<a href='/commu/sns/" + sns[i].boardVO.board_id + "'>" 
                                 + "<i class='far fa-heart'></i>&nbsp;&nbsp;" + sns[i].boardVO.plike + "</a>&nbsp;&nbsp;&nbsp;&nbsp;"
                                 + "<i class='far fa-comment'></i>&nbsp;&nbsp;";
                            
                            for(var z in count){
                                if(count[z].pgroup == sns[i].boardVO.board_id){
                                     html += "<a href='/commu/sns/" + sns[i].boardVO.board_id + "'>"
                                          + count[z].count + "</a>";          
                                }
                            }//count foreach end 
                            
                            html += "</div></div>";
                            
                      }                                     
                        
                      $("#snslist").append(html);
                          
                  },//success end
                  
                            error : function(request, status, error) {
                           alert("code:" + request.status + "\n" + "message:"
                                 + request.responseText + "\n" + "error:" + error);
                        } // ajax 에러 시 end 
                       }); //ajax end    
                  };
      
   </script>
   

</body>
</html>