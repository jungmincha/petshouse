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
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<!-- Google Font -->
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

    <!-- jQuery UI -->
    <link href="https://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" rel="stylesheet" media="screen">

    <!-- Bootstrap -->
    <link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="/resources/sidemenu/css/styles.css" rel="stylesheet">
     <link href="/resources/sidemenu/css/stats.css" rel="stylesheet">
<style>

.container{
	text-align: center;
	margin : auto;

}

</style>
</head>
<body style="padding-top:180px">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


   <div class ="container">
<div class="col-lg-12">
	 
		  	<div class="row">
  				<div class="col-lg-6">
  					<div class="content-box-large">
		  				<div class="panel-heading">
							<div class="panel-title">상품관리</div>
							
							<div class="panel-options">
								<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
								<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
							</div>
						</div>
		  				<div class="panel-body">
		  					<table class="table table-hover">
				              <thead>
				                <tr>
				                  <th>#</th>
				                  <th>First Name</th>
				                  <th>Last Name</th>
				                  <th>Username</th>
				                </tr>
				              </thead>
				              <tbody>
				                <tr>
				                  <td>1</td>
				                  <td>Mark</td>
				                  <td>Otto</td>
				                  <td>@mdo</td>
				                </tr>
				                <tr>
				                  <td>2</td>
				                  <td>Jacob</td>
				                  <td>Thornton</td>
				                  <td>@fat</td>
				                </tr>
				                <tr>
				                  <td>3</td>
				                  <td>Larry</td>
				                  <td>the Bird</td>
				                  <td>@twitter</td>
				                </tr>
				              </tbody>
				            </table>
		  				</div>
		  			</div>
  				</div>
  				<div class="col-lg-6">
  					<div class="content-box-large">
		  				<div class="panel-heading">
							<div class="panel-title">회원관리</div>
							
							<div class="panel-options">
								<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
								<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
							</div>
						</div>
		  				<div class="panel-body">
		  					<table class="table table-hover">
				              <thead>
				                <tr>
				                  <th>#</th>
				                  <th>First Name</th>
				                  <th>Last Name</th>
				                  <th>Username</th>
				                </tr>
				              </thead>
				              <tbody>
				                <tr>
				                  <td>1</td>
				                  <td>Mark</td>
				                  <td>Otto</td>
				                  <td>@mdo</td>
				                </tr>
				                <tr>
				                  <td>2</td>
				                  <td>Jacob</td>
				                  <td>Thornton</td>
				                  <td>@fat</td>
				                </tr>
				                <tr>
				                  <td>3</td>
				                  <td>Larry</td>
				                  <td>the Bird</td>
				                  <td>@twitter</td>
				                </tr>
				              </tbody>
				            </table>
		  				</div>
		  			</div>
  				</div>
  			</div>

  		 
  			</div>

  		 

  			<div class="content-box-large">
  				<div class="content-box-large">
  				<div class="panel-heading">
					<div class="panel-title">Morris.js Bar & Donut</div>
					
					<div class="panel-options">
						<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
						<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
					</div>
				</div>
  				<div class="panel-body">
  					<div class="row">
  						<div class="col-md-6">
  							<div id="hero-bar" style="height: 230px;"></div>
  						</div>
  						<div class="col-md-3">
  							<div id="hero-donut" style="height: 230px;"></div>
  						</div>
  						<div class="col-md-3">
  							<div id="hero-donut2" style="height: 230px;"></div>
  						</div>
  					</div>
  				</div>
  			</div>

		  </div>
		
 

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>




<!-- Js Plugins -->
<!-- <script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script> -->


  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>

    <script src="/resources/sidemenu/vendors/datatables/js/jquery.dataTables.min.js"></script>
  <link rel="stylesheet" href="/resources/sidemenu/vendors/morris/morris.css">
    <script src="/resources/sidemenu/vendors/datatables/dataTables.bootstrap.js"></script>
    <script src="/resources/sidemenu/vendors/morris/morris.min.js"></script>
     <script src="/resources/sidemenu/vendors/jquery.knob.js"></script>
    <script src="/resources/sidemenu/vendors/raphael-min.js"></script>
    <script src="/resources/sidemenu/vendors/morris/morris.min.js"></script>

    <script src="/resources/sidemenu/vendors/flot/jquery.flot.js"></script>
    <script src="/resources/sidemenu/vendors/flot/jquery.flot.categories.js"></script>
    <script src="/resources/sidemenu/vendors/flot/jquery.flot.pie.js"></script>

    <script src="/resources/sidemenu/vendors/flot/jquery.flot.stack.js"></script>
    <script src="/resources/sidemenu/vendors/flot/jquery.flot.resize.js"></script>

    <script src="/resources/sidemenu/js/custom.js"></script>
    <script src="/resources/sidemenu/js/tables.js"></script>
    <script src="/resources/sidemenu/js/stats.js"></script>
 </body>
</html>
 