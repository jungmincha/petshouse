<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Bootstrap Admin Theme v3</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jQuery UI -->
<link
	href="/resources/sidemenu/https://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css"
	rel="stylesheet" media="screen">

<!-- Bootstrap -->
<link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="/resources/sidemenu/css/styles.css" rel="stylesheet">

<link href="/resources/sidemenu/css/stats.css" rel="stylesheet">
<!-- ChartJS -->
<script src="/resources/AdminLTE-master/plugins/chart.js/Chart.min.js"></script>
<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.container {
	text-align: center;
	margin: auto;
}
</style>
</head>
<body style="padding-top: 180px">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


<h4>월을 선택하세요</h4>
						          <select class="form-control" id="choice-month" style="width:200px">
						          	<c:forEach var="i" begin="1" end="12">
							        	<option value="${i}" <c:if test="${i eq month}">selected</c:if>>
							        		${i}
							        	</option>
							        </c:forEach>
							      </select>

								<!-- BAR CHART -->
							    <div class="card card-success">
									<div class="card-header">
										<h3 class="card-title">일별</h3>
										<div class="card-tools">
											<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
							                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
							            </div>
							       	</div>
							       	
							        <div class="card-body">
							           <div class="chart">
							              <canvas id="barChart" style="min-height: 400px; height: 400px; max-height: 400px; max-width: 100%;"></canvas>
							           </div>
							        </div>
							       <!-- /.card-body -->
							       
							   </div>
							   <!-- /.card -->
							   
							   <!-- BAR CHART -->
							    <div class="card card-success">
									<div class="card-header">
										<h3 class="card-title">월별</h3>
										<div class="card-tools">
											<button type="button" class="btn btn-tool" data-card-widget="collapse" ><i class="fas fa-minus"></i></button>
							                <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
							            </div>
							       	</div>
							       	
							        <div class="card-body">
							           <div class="chart">
							              <canvas id="barMonthChart" style="min-height: 400px; height: 400px; max-height: 400px; max-width: 100%;"></canvas>
							           </div>
							        </div>
							       <!-- /.card-body -->
							       
							   </div>
							   <!-- /.card -->
							   
							    <!-- BAR CHART -->
							    <div class="card card-success">
									<div class="card-header">
										<h3 class="card-title">년별</h3>
										<div class="card-tools">
											<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
							                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
							            </div>
							       	</div>
							       	
							        <div class="card-body">
							           <div class="chart">
							              <canvas id="barYearChart" style="min-height: 400px; height: 400px; max-height: 400px; max-width: 100%;"></canvas>
							           </div>
							        </div>
							       <!-- /.card-body -->
							       
							   </div>
							   <!-- /.card -->
							   
							</div>
						</div>
					</div>
					<!-- chart End -->





	   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>  

</body>




</html>
