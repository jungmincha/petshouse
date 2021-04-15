<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>register</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<Style>
.user-profile__container {
	border-radius: 4px;
	border: 1px solid #dadce0;
	text-align: center;
	min-height: 400px;
	margin: 10px auto;
}

.box {
	width: 130px;
	height: 130px;
	border-radius: 70%;
	overflow: hidden;
	margin: 10px auto;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</Style>

</head>
<body style="padding-top: 200px;">



	<!-- header -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>



	<!-- Page Content -->
	<div class="container" style="min-height: 900px;">
		<div class="col-lg-12  col-lg-3 wrap--profile">
			<form id="myPage" name="myPage"
				action="${pageContext.request.contextPath}/commu/thumbnail"
				method="post">
			<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
			<input type="hidden" id="member_id"
				value="<sec:authentication property="principal.member_id"/>">
		</sec:authorize>
				

				<div class="col-lg-3">
					<div class="user-profile__container">
						<div class="user-profile__profile-image box"
							style="background: #BDBDBD;">
							<img src="/resources/img/member/profile/<sec:authentication  property="principal.thumbnail"/>" 
								 class="profile" />
						</div>

						<div class="profile-info">
							<div class="profile-info__name">
								<h3><sec:authentication property="principal.nickname"/></h3>
							</div>
							<div class="profile-info__follow-state row"
								style="text-align: center;">
								<div class="profile-info__follow-state__text">
									<a href="#">팔로워</a> <span class="highlight">0</span>
								</div>
								<div class="profile-info__follow-state__vertical-bar"></div>
								<div class="profile-info__follow-state__text">
									<a href="#">팔로잉 </a><span class="highlight">0</span>
								</div>
							</div>
							<div class="profile-info__actions">
								<a class="btn btn-warning" href="/users/735918/edit">설정</a>
							</div>
						</div>
					</div>
				</div>
			 
			</form>
		</div>
	</div>



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>


<!-- Js Plugins -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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

</html>