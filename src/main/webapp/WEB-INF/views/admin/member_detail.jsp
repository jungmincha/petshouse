<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>회원 상세 정보</title>

 
<style>
	.member{
		padding-top:200px;
		text-align: center;
	}
	
	.table {
		display: table;
		margin: 30px auto;
		width: 700px;
		font-size: 20px;
		font-stretch: extra-condensed;
		text-align: center;
	}
	
	a:link {
		text-decoration: none;
		color: #333333;
		float: right;
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
	
	#navbars>li:nth-child(5) {
  		background-color: #e7ab3c;
	}
</style>
</head>

<body style="padding-top: 40px;">
	<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>
	
	<!--Container Begin -->
	<div class="container" style="min-height: 800px;"> 
		<div class="row">
		    <div class="col-lg-12">
				<h2 class="member"">회원 상세 정보</h2>
					<table class="table">					
						<tbody>
							<tr>
								<td>이름</td>
								<td>${info.name}</td>
							</tr>
							<tr>
								<td>가입일자</td>
								<td><fmt:formatDate value="${info.pdate}" pattern="yyyy.MM.dd" /></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${info.member_id}</td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td>${info.nickname}</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${info.tel}</td>
							</tr>
							<tr>
								<td>관심사</td>
								<td>${info.concern}</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>${info.address}</td>
							</tr>
						</tbody>
					</table> 
			<div class="row">
				<div class="col-12">
			    	<a href="/admin/member_list">목록으로</a>    
			    </div>
			</div>		
             </div>
        </div>

    </div>
    <!-- Container End -->
	     
  
 
</body>
</html>

