<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setStatus(200);
%>
<!DOCTYPE html>
<html>
<head>
<link
	href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/> "
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/> "
	rel="stylesheet">
<meta charset="UTF-8">
<title>경로 오류</title>
</head>
<body id="page-top">
	<div class="container-fluid" style="margin-top: 15%;">

		<!-- 404 Error Text -->
		<div class="text-center">
			<div class="error mx-auto" data-text="404">404</div>
			<p class="lead text-gray-800 mb-5">Page Not Found</p>
			<p class="text-gray-500 mb-0" style="font-size: 50px; font-weight:bold">원희형 작품 상세보기 빨리 완성해요</p>
		</div>

	</div>
</body>
<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/> "></script>
<script
	src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script>

<!-- Core plugin JavaScript-->
<script
	src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/> "></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value='/resources/js/sb-admin-2.min.js'/> "></script>

</html>