<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha512-s+xg36jbIujB2S2VKfpGmlC3T5V2TF3lY48DX7u2r9XzGzgPsa6wTpOQA7J9iffvdeBN0q9tKzRxVxw1JviZPg==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js" integrity="sha512-G8JE1Xbr0egZE5gNGyUm1fF764iHVfRXshIoUWCTPAbKkkItp/6qal5YAHXrxEu4HNfPTQs6HOu3D5vCGS1j3w==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js" integrity="sha512-vBmx0N/uQOXznm/Nbkp7h0P1RfLSj0HQrFSzV8m7rOGyj30fYAOKHYvCNez+yM8IrfnW0TCodDEjRqf6fodf/Q==" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" integrity="sha512-SUJFImtiT87gVCOXl3aGC00zfDl6ggYAw5+oheJvRJ8KBXZrr/TMISSdVJ5bBarbQDRC2pR5Kto3xTR0kpZInA==" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js" integrity="sha512-QEiC894KVkN9Tsoi6+mKf8HaCLJvyA6QIRzY5KrfINXYuP9NxdIkRQhGq3BZi0J4I7V5SidGM3XUQ5wFiMDuWg==" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" integrity="sha512-/zs32ZEJh+/EO2N1b0PEdoA10JkdC3zJ8L5FTiQu82LR9S/rOQNfQN7U59U9BC12swNeRAz3HSzIL2vpp4fv3w==" crossorigin="anonymous" /> -->
<meta charset="UTF-8">
<title>매출</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"
	type="text/css">
<!-- <link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet"> -->
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
<!-- <script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Year', 'Expenses' ],
				[ '2014',100 ], [ '2015', 460 ],
				[ '2016', 500 ], [ '2017',500 ] ]);

		var options = {
			width : '100%'
		};

		var chart = new google.charts.Bar(document
				.getElementById('columnchart_material'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script> -->
</head>



</head>
<body id="page-top">
	<div id="wrapper">
		<!-- Header/Nav -->
		<%@ include file="../include/side.jsp" %>
		<div id="content-wrapper" class="d-flex flex-column">
			<%@ include file="../include/head.jsp" %>
			<!-- end Header/Nav -->
			<%-- <div id="content">


				<div style="width: 100%; height: 100%;">
					<header>
						<h3 style="padding: 1%;">매출</h3>
					</header>
					<!-- <hr>
					<div style="display: flex; flex-direction: row; margin: 1%;">
						<input type="button" value="주간"><input type="button"
							value="월간"> &nbsp;&nbsp;&nbsp; <input type="date">&nbsp;&nbsp;
						~ &nbsp;&nbsp; <input type="date"> &nbsp;&nbsp;&nbsp; <input
							type="submit" value="검색">
					</div>
					<p style="margin: 1%;">! 조회기간은 최대 15주(주간),12달(월간) 검색이 가능합니다.</p> -->

					<!-- <div style="width: 80%; height: 60%; border: 1px black solid; margin: 1%;">
						Area Chart
						<div class="col-xl-8 col-lg-7" style="padding: 1%;">
							<div class="card shadow mb-4">
								Card Header - Dropdown
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">주문 현황 그래프</h6>
								</div>
							</div>
						</div>
						

					</div> -->
					<div class="row">

						<div class="col-xl-8 col-lg-7" style="flex: 0 0 100%;max-width: 100%;">
					
							<!-- Bar Chart -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 id="title_dndud" class="m-0 font-weight-bold text-primary">월별 매출(만)</h6>
								</div>
								<div class="card-body">
									<div class="chart-bar">
										<canvas id="myBarChart"></canvas>
									</div>
								</div>
								
							</div>
						</div>
					
					</div>
					<div style="margin:1%; width:80%;">
						<table style="width: 100%" border="1">
							<tr style="background-color: #f2f2f2; color: black;">
								<td rowspan="2" style="width: 15%; text-align: center;">기간</td>
								<td rowspan="2" style="width: 15%; text-align: center;">판매수</td>								
								<td colspan="2" style="width: 30%; text-align: center;">정산</td>
								<td colspan="4" style="width: 30%; text-align: center;">매출</td>
							</tr>
							<tr style="font-size: 80%; width:25%; text-align: center; background-color: #f2f2f2;">
								<td>보물섬 수수료</td>
								<td>결제 수수료</td>
								<td>작품금액</td>
								<td>배송비</td>
								<td>후원금</td>
								<td>할인쿠폰(작품 + 배송비)</td>
							</tr>
							<tr>
								<td style="text-align: center;">데이터넣어</td>
								<td style="text-align: center;">데이터넣어</td>
								<td style="text-align: center;">데이터넣어</td>
								<td style="text-align: center;">데이터넣어</td>
								<td style="text-align: center;">데이터넣어</td>
								<td style="text-align: center;">데이터넣어</td>
								<td style="text-align: center;">데이터넣어</td>
								<td style="text-align: center;">데이터넣어</td>
							
							</tr>
						</table>
					</div> --%>

					<div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">매출 통계</h1>

          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">연 매출</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      	<fmt:formatNumber value="${yearTotal }" pattern="#,###"/> 원
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">팔린 작품 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      	<fmt:formatNumber value="${saleCount }" pattern="#,###"/> 개
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>



            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">작품 좋아요</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                     	 <fmt:formatNumber value="${likeArt }" pattern="#,###"/> 개
                      </div>
                    </div>
                    <div class="col-auto">
                      <!-- <i class="fas fa-comments fa-2x text-gray-300"></i> -->
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>


            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">작가 좋아요</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      	<fmt:formatNumber value="${likeWriter }" pattern="#,###"/> 개
                      </div>
                    </div>
                    <div class="col-auto">
                      <!-- <i class="fas fa-clipboard-list fa-2x text-gray-300"></i> -->
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <div class="col-xl-8 col-lg-7" style="flex: 0 0 100%;max-width: 100%;">

              <!-- Bar Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 id="title_dndud" class="m-0 font-weight-bold text-primary">월별 매출</h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myBarChart"></canvas>
                  </div>
                </div>

              </div>
            </div>

          </div>


          <div style="display:flex; flex-direction: row">
            <div>
              <button class="btn btn-secondary dropdown-toggle" type="button" id="dateButton"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	  월별
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="">
                <a class="dropdown-item filtDate" href="#">월별</a>
                <a class="dropdown-item filtDate" href="#">일별</a>
              </div>
            </div>

          </div>



        </div>




					<%@ include file="../include/footer.jsp" %>
					<!-- end footer -->
					<!-- Scroll to Top Button-->
					<a class="scroll-to-top rounded" href="#page-top"> <i
						class="fas fa-angle-up"></i>
					</a>

					<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
					<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

					<!-- Core plugin JavaScript-->
					<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

					<!-- Custom scripts for all pages-->
					<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>
					

				</div>
			</div>
<script src="<c:url value='/resources/vendor/chart.js/Chart.min.js'/> "></script>
<script src="<c:url value='/resources/js/demo/chart-bar-demo.js'/> "></script>
</body>
<script>
var ajaxFunc;
var headFunc;
var numFunc;
var filtDate = '월별';

$(function(){
	ajaxFunc();
	
	$('.filtDate').on('click',function(){
		var filter = $(this).text();
		$('#dateButton').text(filter);
		filtDate = filter;
		
		ajaxFunc();
	});

});

ajaxFunc = function(){
	$.ajax({
		url : '/bomulsum/writer/sales/filt.wdo',
		data : {
			filtDate : filtDate
		},
		success : function(e){
			var maxAmount = e[0];
			var dateArr = new Array();
			for(var i=0; i<e.length; i++){
				if(maxAmount <= e[i]){
					maxAmount = e[i];
				}
				if(filtDate == '월별'){
					dateArr.push(i+1+"월");
				}else{
					dateArr.push(i+1+"일");
				}
			}
			var last = 0;
			for(var i=e.length-1; i>=0; i--){
				if(e[i] == 0){
					last = i;
				}else{
					break;
				}
			}
			
			console.log(dateArr);
			console.log(e);
			
			myBarChart.data.labels = dateArr;
			myBarChart.data.datasets[0].data = e;
			if(filtDate == '월별'){
				myBarChart.options.scales.xAxes[0].time.unit = 'month';
			}else{
				myBarChart.options.scales.xAxes[0].time.unit = 'day';					
			}
			myBarChart.options.scales.xAxes[0].ticks.maxTicksLimit = last;
			myBarChart.options.scales.xAxes[0].maxBarThickness = last;
			myBarChart.options.scales.yAxes[0].ticks.max = numFunc(maxAmount);
			myBarChart.update();
		}
	});
	headFunc();
};

headFunc = function(){
	$('#title_dndud').html(filtDate + "매출 ");
};
numFunc = function(data){
	// 123400
	data = data.toString();
	var str_data = data.split('');
	// str_data.length = 6
	var test = (Number(str_data[0]) * 10) + (Number(str_data[1]) + 5);
	var temp = 1;
	for(var i = 0; i<str_data.length-2; i++){
		temp *= 10;
	}
	
	var result = test * temp;
	if(result == 0){
		return 100;
	}
	
	return result;
};
</script>
</html>