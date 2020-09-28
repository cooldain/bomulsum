<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js" integrity="sha512-G8JE1Xbr0egZE5gNGyUm1fF764iHVfRXshIoUWCTPAbKkkItp/6qal5YAHXrxEu4HNfPTQs6HOu3D5vCGS1j3w==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js" integrity="sha512-vBmx0N/uQOXznm/Nbkp7h0P1RfLSj0HQrFSzV8m7rOGyj30fYAOKHYvCNez+yM8IrfnW0TCodDEjRqf6fodf/Q==" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" integrity="sha512-SUJFImtiT87gVCOXl3aGC00zfDl6ggYAw5+oheJvRJ8KBXZrr/TMISSdVJ5bBarbQDRC2pR5Kto3xTR0kpZInA==" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js" integrity="sha512-QEiC894KVkN9Tsoi6+mKf8HaCLJvyA6QIRzY5KrfINXYuP9NxdIkRQhGq3BZi0J4I7V5SidGM3XUQ5wFiMDuWg==" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" integrity="sha512-/zs32ZEJh+/EO2N1b0PEdoA10JkdC3zJ8L5FTiQu82LR9S/rOQNfQN7U59U9BC12swNeRAz3HSzIL2vpp4fv3w==" crossorigin="anonymous" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


window.onload = function(){
	$("#dainDiv1").fadeIn(2000);
    $("#dainDiv2").fadeIn(3000);
    $("#dainDiv3").fadeIn(4000)
}



</script>
<style type="text/css">
td {
	padding: 1%;
	margin: 1%;
}

th {
	padding: 1%;
	margin: 1%;
}

#dain_background {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	width:800px;
	/* background-color: #81bfe9;  */
/* 	background-image: url("<c:url value='/resources/img/island.png' />"); */
	
}
</style>
<meta charset="UTF-8">
<title>요약</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css' /> " rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/> " rel="stylesheet">
</head>
<body id="page-top">
<%-- <c:if test="${empty writer_login}"> --%>
<!-- 	<script> -->
<!-- // 		alert("로그인이 필요한 서비스입니다."); -->
<%-- // 		location.href="<c:url value='/writer/login.wdo'/> "; --%>
<!-- 	</script> -->
<%-- </c:if> --%>
	<div id="wrapper">
		<!-- Header/Nav -->
		<%@ include file="include/side.jsp" %>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="include/head.jsp" %>
				<!-- end Header/Nav -->
				<div style="margin-left: 2%; margin-right: 2%; background-color: white;  margin-bottom: 24px;
				display: flex; justify-content: center; padding:8%;  height: 700px;">
					<div>
					
					<%--<h2 style="text-style: bold; margin-bottom: 0rem;">요약</h2>
					<hr
						style="margin-top: 0rem; border: 0; background: #ccc; height: 0.2rem;">


					<div style="">
						<div style="display: flex; flex-flow: row;">
							 <!-- 전일 매출!!!!!!!!!!!!!! -->
							<table style="width: 25%; margin:10px; border: 1px #ABABAB solid; padding:1%;">
								<tr style="border-bottom: 1px #ABABAB solid; padding:1%;">
									<th style="padding:1%; margin: 1%;">전일 매출</th>
									<td style="padding:1%; margin:1%; float: right;"><a href="">더보기 </a></td>
								</tr>
								<tr>
									<td>작품금액</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>배송비</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>후원금</td>
									<td style="float: right;">0원</td>
								</tr> 
								<tr>
									<td>할인쿠폰</td>
									<td style="float: right;">0원</td>
								</tr>

							</table>
							<!-- end 전일매출!!!!!!!!!!!!!!!!!!! -->
							<!-- 전일 작품활동!!!!!!!!!!!!!! -->
							<table style="border: 1px #ABABAB solid; padding:1%; width: 25%;margin:10px;">
								<tr style="border-bottom: 1px #ABABAB solid; padding:1%;">
									<th colspan="1">전일 작품 활동 현황</th>
									<td style="float: right;"><a>더보기</a></td>
								</tr>
								<tr>
									<td>작품금액</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>배송비</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>후원금</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>할인쿠폰</td>
									<td style="float: right;">0원</td>
								</tr>

							</table>
							<!-- end 전일 매출!!!!!!!!!!!!!! -->
							<!-- 주문!!!!!!!!!!!!!! -->
							<table style="width: 25%;margin:10px; border: 1px #ABABAB solid; padding:1%;">
								<tr style="border-bottom: 1px #ABABAB solid; padding:1%;">
									<th colspan="1">주문</th>
									<td style="float: right;"><a>더보기</a></td>
								</tr>
								<tr>
									<td>작품금액</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>배송비</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>후원금</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>할인쿠폰</td>
									<td style="float: right;">0원</td>
								</tr>

							</table>
							<!-- end 주문!!!!!!!!!!!!!! -->
							<!-- 환불!!!!!!!!!!!!!! -->
							<table style="width: 25%; margin:10px; border: 1px #ABABAB solid; padding:1%;">
								<tr style="border-bottom: 1px #ABABAB solid; padding:1%;">
									<th colspan="1">전일 작품 활동 현황</th>
									<td style="float: right;">더보기</td>
								</tr>
								<tr>
									<td>작품금액</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>배송비</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>후원금</td>
									<td style="float: right;">0원</td>
								</tr>
								<tr>
									<td>할인쿠폰</td>
									<td style="float: right;">0원</td>
								</tr>

							</table>
							<!-- end 환불!!!!!!!!!!!!!! -->
						</div>
						<div style="display: flex; flex-direction: row;">
							<div style="width:50%; border: 1px #ABABAB solid; padding:1%; margin: 1%;">
								<div style="border-bottom:1px #ABABAB solid; padding:1%;">
									<span>
										매출 통계
									</span>
									<span>
										더보기
									</span>							
								</div>
								<div>
										<canvas id="chart" width="400" height="200"></canvas>
										<script>
											var ctx = document.getElementById('chart');
											var myChart = new Chart(ctx, {
												    type: 'bar',
													    data: {
														labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
														datasets: [{
														label: '매출',
														data: [12, 19, 3, 5, 2, 3],
														backgroundColor: [
															'rgba(255, 99, 132, 0.2)',
															'rgba(54, 162, 235, 0.2)',
															'rgba(255, 206, 86, 0.2)',
															'rgba(75, 192, 192, 0.2)',
															'rgba(153, 102, 255, 0.2)',
															'rgba(255, 159, 64, 0.2)'
														],
														borderColor: [
															'rgba(255, 99, 132, 1)',
															'rgba(54, 162, 235, 1)',
															'rgba(255, 206, 86, 1)',
															'rgba(75, 192, 192, 1)',
															'rgba(153, 102, 255, 1)',
															'rgba(255, 159, 64, 1)'
															],
															borderWidth: 1
															}]
														},
														options: {
															scales: {
																yAxes: [{
																	ticks: {
																		beginAtZero: true
																		}
																}]
															}
														}
													});
											</script>
								</div>
							</div>
							<div style="width: 50%; border: 1px #ABABAB solid; padding:1%; margin: 1%;">
								<div style="display: flex; flex-direction: row; justify-content: space-between; border-bottom:1px #ABABAB solid;">
									<span><strong>메세지</strong></span>
									<span style="float: right;">더보기</span>
								</div>
								<div>
									<span>아아</span>
									<span>아아</span>
								</div>
							</div>
						</div>
						<div style="display: flex; flex-direction: row;">
						<table style="width:50%; margin: 10px; border: 1px #ABABAB solid;">
								<tr style="border-bottom: 1px #ABABAB solid;">
									<th>작품</th>
									<td style="float: right;">바로가기</td>
								</tr>
								<tr>
									<td>판매 중 작품</td>
									<td style="float: right;">1건</td>
								</tr>
								<tr>
									<td>일시 중지 작품 </td>
									<td style="float: right;">5건</td>
								</tr>
						</table>
						<table style="width:50%; margin: 10px; border: 1px #ABABAB solid;">
								<tr style="border-bottom: 1px #ABABAB solid;">
									<th style="text-align: center;">공지사항</th>
								</tr>
								<tr>
									<td style="text-align: center;">내용</td>
								</tr>
						</table> 
						
						
						
						
					</div>--%>
						
					<%-- <div id="dainDiv1" style="color: #57d0da; display: none;">${proVO.writerBrandName} 작가님 환영합니다!</div>  --%>
					<div id="dain_background">
					<div id="dainDiv1" style=" display: none; color: gray; text-shadow: 2px 2px 5px #d9d9d9;">
					<span style="color:#1fb6cc;"> ${proVO.writerBrandName}</span> 작가님 환영합니다!!</div>
					<img id="dainDiv3" src="<c:url value='/resources/img/backChange.png'/>" width="500px" 
	        	  	style="margin: 3% 0 1% 0; display: none; opacity: 0.8;">    
	        	  	</div> 
				</div>
				</div>

				<%@ include file="include/footer.jsp" %>
				<!-- end footer -->
				<!-- Scroll to Top Button-->
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>

				<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/> "></script>
				<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js' /> "></script>
				<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>

				<!-- Core plugin JavaScript-->
				<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' /> "></script>

				<!-- Custom scripts for all pages-->
				<script src="<c:url value='/resources/js/sb-admin-2.min.js' /> "></script>

				
			</div>
		</div>
	</div>
</div>
</body>
</html>