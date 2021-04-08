<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b62a0e8c19705dc2950e1a83c5590311&libraries=services"></script>
<script>





		window.onload = function(){      
    	
   	
    	
        // Geolocation API에 액세스할 수 있는지를 확인
        if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition (function(pos) {
                $('#latitude').html(pos.coords.latitude);     // 위도
                $('#longitude').html(pos.coords.longitude); // 경도
                $('#centerAddr').html(pos.coords.centerAddr); //주소
               
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = { 
                    center: new kakao.maps.LatLng($('#latitude').html(),$('#longitude').html()), // 지도의 중심좌표
                    level: 4 // 지도의 확대 레벨을 설정해준다. 
                };

            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption); 
         // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
                infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
                
                
                
                
             // 마커가 표시될 위치입니다 
                var markerPosition  = new kakao.maps.LatLng($('#latitude').html(),$('#longitude').html()); 

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    position: markerPosition
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);
				// 마커 생성 끝~
                   
                

            // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
            searchAddrFromCoords(map.getCenter(), displayCenterInfo);

            // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                        
                        var content = '<div class="bAddr">' +
                                        '<span class="title">법정동 주소정보</span>' + 
                                        detailAddr + 
                                    '</div>';

                        // 마커를 클릭한 위치에 표시합니다 
                        marker.setPosition(mouseEvent.latLng);
                        marker.setMap(map);

                        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                        infowindow.setContent(content);
                        infowindow.open(map, marker);
                    }   
                });
            });

            // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'idle', function() {
                searchAddrFromCoords(map.getCenter(), displayCenterInfo);
            });

            function searchAddrFromCoords(coords, callback) {
                // 좌표로 행정동 주소 정보를 요청합니다
                geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
            }

            function searchDetailAddrFromCoords(coords, callback) {
                // 좌표로 법정동 상세 주소 정보를 요청합니다
                geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
            }

            // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
            function displayCenterInfo(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                	
                	
                    var infoDiv = document.getElementById('centerAddr');
                   
                  
              	
                    
                    for(var i = 0; i < result.length; i++) {
                        // 행정동의 region_type 값은 'H' 이므로
                        if (result[i].region_type === 'H') {
                            infoDiv.innerHTML = result[i].address_name;
                            
                            $('#address').html(infoDiv.innerHTML); //body에 위치기반 주소 삽입
                            
                		 //body에 있는 주소를 가져와 String으로 변환해준 다음 다시 input에 value값으로 넣어주는 로직이다.
                            var location = $('#address').text();
                            
                           	$('input[name=test]').attr('value', location); 
                              
                            break;
                        }
                    } 
                }    
            }
                
                        
                
            });
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
        }
        
      
        
    };
    

    
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
                
                <br/>
          <table border=1 style="width:1140px;">
      <tr>
      	<td>글번호</td>
         <td>제목</td>
         <td>내용</td>
         <td>작성일자</td>
         <td>좋아요</td>
         <td>조회수</td>
     
      </tr>
      <c:forEach items="${list}" var="list">
         <tr>
         	<td>${list.board_id}</td>
 			  <td><c:forEach begin="1" end="${list.pindent}">[re]</c:forEach>
 			  
             <a href="/map/board/${list.board_id}">${list.title}</a></td>        
            <td>${list.content}</td>
          
            <td>${list.pdate}</td>
            <td>${list.plike}</td>
            <td>${list.hit}</td>
        
         </tr>
      </c:forEach>
      
      
      </table>
      
       <a href="write_view">글작성</a>
      
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

 
    
    
    
</body>
</html>