<img src="https://user-images.githubusercontent.com/68797467/119070831-b0eee500-ba23-11eb-93fa-2a6f9088941d.png" width="200px" height="80px" align="left">고양이와 강아지에 한정된 스토어에서 벗어나<br> 다양한 반려동물들에 대한 지식을 공유하는 커뮤니티 및 쇼핑몰
<br clear="left">
<br>
## 목적
1~2인 가구 증가, 저출산 및 고령화로 인한 반려동물 양육 인구가 급증하면서 다양화 된 반려동물의 종류에 비해 관련 정보는 부족하고, 고양이와 강아지에 치우친 펫시장으로 인해 반려동물용품을 구입하기에 어려움이 있었습니다.<br>
그리하여 반려동물 시장 규모 확대에 따른 정보 및 의사소통이 원활한 커뮤니티와 다양한 반려동물의 용품을 판매할 수 있는 쇼핑몰을 제작하고자 프로젝트를 시작했습니다.
<br><br>
## 기간
2021.03.02 - 2021.05.07
<br><br>
## 나의 역할
+ 위치기반 API를 통해 "펫츠타운" 페이지를 기획 및 개발 하였습니다.
+ 펫츠타운 페이지의 CRUD를 구현했습니다.
+ 스토어 상품을 카테고리별로 분류했습니다.
+ 이미지 업로드 및 좋아요 기능을 구현했습니다.
+ 매출액 , 방문자수를 일별 월별 연도별로 조회하는 관리자-통계 페이지를 구현했습니다.




<br><br>
## 스토어-카테고리
<img src="https://user-images.githubusercontent.com/74960637/119977928-f39c5880-bff3-11eb-9ee7-020110de33f2.PNG" width="800px" height="500px">

+ 반려동물 상품을 카테고리(동물별)로 분류할 수 있으며 가격순, 리뷰순, 별점순으로도 정렬할 수 있습니다.
+ 해당 상품을 클릭하면 상품페이지 창으로 이동하며 결제 할 수 있습니다.  
+ 페이지 전환은 AJAX를 사용해 비동기 처리 하였습니다. 

<br><br>
## 커뮤니티-펫츠타운
<img src="https://user-images.githubusercontent.com/74960637/119982313-a1f6cc80-bff9-11eb-8461-97030086c506.PNG" width="800px" height="500px">

+ 펫츠타운은 현재 위치 혹은 원하는 위치의 펫츠하우스 회원들과 반려동물에 대한 다양한 정보를 주고 받는<br> 
  커뮤니티 페이지입니다.
+ Geolocation api와 Kakao api를 통해 사용자의 현재 위치가 데이터베이스에 저장됩니다.
+ 사용자의 필요에 따라 검색도 가능합니다. 

<br>
<img src="https://user-images.githubusercontent.com/74960637/119983084-a7084b80-bffa-11eb-89ab-7f7c3bcef868.PNG" width="800px" height="500px">

+ 인증받은 주소를 통해 '계속하기'를 누르면 해당 주소 기반의 게시판 페이지로 이동합니다.
+ 사용자는 CRUD를 할 수 있으며 게시글의 좋아요도 누를 수 있습니다.
+ 동물병원, 산책로등 카테고리별로 게시글 등록, 조회가 가능합니다.
+ 현재 위치가 페이지에 상단에 표시되며 위치를 다시 설정할 수 있습니다.
<br><br>
## 관리자-통계
<img src="https://user-images.githubusercontent.com/74960637/119985143-3d3d7100-bffd-11eb-8b92-90237b3f2609.PNG" width="800px" height="500px">

+ 관리자는 매출액과 방문자 수를 일별, 월별, 연도별로 조회 할 수 있습니다.
+ 부트스트랩을 이용해 막대, 선, 파이등 다양한 그래프를 구현했습니다.
+ 방문자 수는 HttpSessionListener를 상속받아 방문자의 세션id를 통해 구현했습니다.
+ 세션의 유효기간 주기를 30분으로 설정했습니다. 
<br><br>
## ERD
<img src="https://user-images.githubusercontent.com/74960637/119997177-6b757d80-c00a-11eb-9427-7464d1152208.png" width="800px" height="500px">
<br><br>

## 시퀀스다이어그램
<img src="https://user-images.githubusercontent.com/74960637/119998541-c22f8700-c00b-11eb-9bb1-441dc4aff515.png" width="800px" height="500px">
<br><br>

## 유스케이스다이어그램
<img src="https://user-images.githubusercontent.com/74960637/119998728-f30fbc00-c00b-11eb-9441-658e1bd0fa85.png" width="800px" height="500px">

<br><br>


## 조원
+ [김유진](https://github.com/chiroxxx)
+ [김은희](https://github.com/eeeuniee)
+ [김준성](https://github.com/eril1024)
+ [안연희](https://github.com/yeanhee-hub)
+ [차정민](https://github.com/jungmincha)

