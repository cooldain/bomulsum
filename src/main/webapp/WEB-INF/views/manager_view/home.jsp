<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>보물섬(관리자)| HOME</title>
<style>
#dain_background {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	width:100%;
    padding-top: 4%;
	
}
</style>
<!-- Custom fonts for this template-->
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/> " rel="stylesheet"
	type="text/css">


<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/> " rel="stylesheet">
</head>
<script>
window.onload = function(){
	$("#dainDiv1").fadeIn(2000);
    $("#dainDiv2").fadeIn(3000);
    $("#dainDiv3").fadeIn(4000)
}
</script>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="include/mSide.jsp" %>
		

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content" style="background:white">
				
				<%@ include file="include/mheader.jsp" %>


					<div id="dain_background">
						<div id="dainDiv1" style=" display: none; color: gray; text-shadow: 2px 2px 5px #d9d9d9;">
							<span style="color:#1fb6cc;">관리자</span>님 환영합니다!!
						</div>
						<img id="dainDiv3" src="<c:url value='/resources/img/backChange.png'/>" width="500px" 
	        	  			style="margin: 3% 0 1% 0; display: none; opacity: 0.8;">    
	        	  	</div>


			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/> "></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script>

	<!-- Core plugin JavaScript-->
	<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/> "></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/resources/js/sb-admin-2.min.js'/> "></script>

	<!-- Page level plugins -->
	<script src="<c:url value='/resources/vendor/chart.js/Chart.min.js'/> "></script>

	<!-- Page level custom scripts -->
	<script src="<c:url value='/resources/js/demo/chart-area-demo.js'/> "></script>
	<script src="<c:url value='/resources/js/demo/chart-pie-demo.js'/> "></script>

</body>

</html>
