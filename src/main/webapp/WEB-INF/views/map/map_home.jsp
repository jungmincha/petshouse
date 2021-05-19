<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠타운</title>


<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>


<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b62a0e8c19705dc2950e1a83c5590311&libraries=services"></script>

<script>
	window.onload = function() {
		
		
		$("#latitude").hide();//화면에 표시된 위도 경도 숨김처리
		$("#longitude").hide();
		
		// Geolocation API에 액세스할 수 있는지를 확인
		// Geolocation 현재 위치 좌표와 위도로 변환해주는 API이다
		if (navigator.geolocation) {
			//위치 정보를 얻기
			navigator.geolocation
			
					.getCurrentPosition(function(pos) {
						
						$('#latitude').html(pos.coords.latitude); // 위도
						$('#longitude').html(pos.coords.longitude); // 경도
						$('#centerAddr').html(pos.coords.centerAddr); //주소

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng($('#latitude').html(), $('#longitude').html()), // 지도의 중심좌표
							level : 4
						// 지도의 확대 레벨을 설정해준다. 
						};

						// 지도를 표시할 div와  지도 옵션으로  지도를 생성한다
						var map = new kakao.maps.Map(mapContainer, mapOption);
						
						
						
						// 주소-좌표 변환 객체를 생성
						var geocoder = new kakao.maps.services.Geocoder();

						var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
						infowindow = new kakao.maps.InfoWindow({
							zindex : 1
						}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

						// 마커가 표시될 위치입니다 
						var markerPosition = new kakao.maps.LatLng($('#latitude').html(), $('#longitude').html());

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							position : markerPosition
						});

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						// 마커 생성 끝~

						// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
						searchAddrFromCoords(map.getCenter(), displayCenterInfo);

						// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
						kakao.maps.event
								.addListener(
										map,
										'click',
										function(mouseEvent) {
											searchDetailAddrFromCoords(
													mouseEvent.latLng,
													function(result, status) {
														if (status === kakao.maps.services.Status.OK) {
															var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
																	+ result[0].road_address.address_name
																	+ '</div>'
																	: '';
															detailAddr += '<div>지번 주소 : '
																	+ result[0].address.address_name
																	+ '</div>';

															var content = '<div class="bAddr">'
																	+ '<span class="title">법정동 주소정보</span>'
																	+ detailAddr
																	+ '</div>';

															// 마커를 클릭한 위치에 표시합니다 
															marker.setPosition(mouseEvent.latLng);
															marker.setMap(map);

															// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
															infowindow.setContent(content);
															infowindow.open(map,marker);
															
														}
													});
										});
						
						
						

						// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
						kakao.maps.event.addListener(map, 'idle', function() {
							searchAddrFromCoords(map.getCenter(),
									displayCenterInfo);
						});

						function searchAddrFromCoords(coords, callback) {
							// 좌표로 행정동 주소 정보를 요청합니다
							geocoder.coord2RegionCode(coords.getLng(), coords
									.getLat(), callback);
						}

						function searchDetailAddrFromCoords(coords, callback) {
							// 좌표로 법정동 상세 주소 정보를 요청합니다
							geocoder.coord2Address(coords.getLng(), coords
									.getLat(), callback);
						}

						// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
						function displayCenterInfo(result, status) {
							if (status === kakao.maps.services.Status.OK) {

								var infoDiv = document.getElementById('centerAddr');
								
								

								for (var i = 0; i < result.length; i++) {
									// 행정동의 region_type 값은 'H' 이므로
									if (result[i].region_type === 'H') {
										infoDiv.innerHTML = result[i].address_name;

										$('#address').html(infoDiv.innerHTML); //body에 위치기반 주소 삽입

										//body에 있는 주소를 가져와 String으로 변환해준 다음 다시 input에 value값으로 넣어주는 로직이다.
										var location = $('#address').text();

										$('input[name=location]').attr('value', location);

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
<body style="padding-top: 128px">

	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- Map Section Begin -->



	<!-- Map Section Begin -->

	<!-- Contact Section Begin -->
	<section class="contact-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="map_wrap">
						<div id="map" style="width: 1100px; height: 800px;"></div>
						<div class="hAddr">

							<span id="centerAddr"></span>
						</div>


							<!-- 위도 경도 -->
							<span id="latitude"></span>
							<span id="longitude"></span>

						
					</div>
				</div>
					
					</div>
			
					<div class="row" style="padding-top:500px;">
					<div class="col-lg-12">
					<div class="contact-form">
						<div class="leave-comment">
							<h4>펫츠타운 위치기반 이용 약관</h4>
							<p>제 1 조 (목적) 이 약관은 캣버그 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는
								위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을
								목적으로 합니다.</p>
							<p>제 2 조 (약관 외 준칙) 이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률,
								정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및
								개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.</p>

						

							<%-- 	<a onclick = "location_auth('<sec:authentication property="principal.location" />')"href="#"> --%>
						

							<p>
							회원님의 위치가 
							<span id="address" style="font-weight: bold; font-size: 20px;"></span>
							이 맞으면 '인증 하기' 를 눌러 위치를 입력해주세요.
							</p>
							<p>그리고 '계속 하기' 를 눌러서 펫츠타운에 접속해주세요.</p>
							</div>
							</div>
							</div>
							</div>
							
							<input type="hidden" name="location" class = "location" value="">  
						
							<form action="/map/board" method="post">
									<div class="row">
									<div class="col-lg-12">
									
									 
									<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
									<%-- <input type="hidden" name="location" value="<sec:authentication property="principal.location"/>"> --%>
									<input type="hidden" name="member_id" class = "member_id" value="<sec:authentication property="principal.member_id"/>">
								 	<%-- <input type="hidden" name="nickname" value="<sec:authentication property="principal.nickname"/>">  --%>
									<%-- 	<input type="hidden" name="location" class = "location" value="<sec:authentication property='principal.location'/>"> --%>
								 	
											</sec:authorize>
											
										<button type="button" onclick="auth_location()" class="btn" style="font-size: 20px; background-color: #FFC81E;  color:black;" >인증 하기</button>
												
										<button type="submit" class="btn" style="font-size: 20px; background-color: #FFC81E;  color:black; float:right;">계속 하기</button>
										
										
										
									</div>
								</div>
							</form>
				
		</div>
	
	</section>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>


function auth_location(){
	

	var location = $('.location').val();
	console.log(location);
	alert(location + "이 입력되었습니다");
	var member_id = $('.member_id').val();
	console.log(member_id);
	url ="/map/insert_location"
	
	//현재 위치 ajax로 컨트롤러로 값 넘겨준다.
	$.ajax({
		type : 'post', //method
		url : url, 
		cache : false,
		data : {
			location : location,
			member_id : member_id,
		},

		success : function(result) {
			console.log("result: " + result);
		
      },
      errer : function(e) {
         console.log(e);
      }
   }); 
	
	
}



</script>

</body>
</html>