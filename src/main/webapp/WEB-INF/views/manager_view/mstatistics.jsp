<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>매출 통계 페이지</title>

  <!-- Custom fonts for this template-->
  <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css' /> " rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css' /> " rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<c:url value='/resources/css/sb-admin-2.min.css'/> " rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.css'/> " rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

	<%@ include file="include/mSide.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <%@ include file="include/mheader.jsp" %>

        <!-- 내용추가하기 -->
        <!-- Begin Page Content -->
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
                      	<fmt:formatNumber value="${yearTotal}" pattern="#,###"/> 원
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
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">사용된 쿠폰 금액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      	<fmt:formatNumber value="${coupon}" pattern="#,###"/> 원
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
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">사용한 적립금 금액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                     	 <fmt:formatNumber value="${point}" pattern="#,###"/> 원
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
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">젬포인트</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                      	<fmt:formatNumber value="${gemTotal}" pattern="#,###"/> 원
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

            <div style="margin-right:1%">
              <button class="btn btn-secondary dropdown-toggle" type="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	  작품
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="">
                <a class="dropdown-item" href="#">작품</a>
                <a class="dropdown-item" href="#">클래스(준비중)</a>
                
              </div>
            </div>

            <div style="margin-right:1%">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="categoryButton"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               	 모든 상품
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="">
                <a class="dropdown-item category" href="#">모든 상품</a>
                <a class="dropdown-item category" href="#">식음료</a>
                <a class="dropdown-item category" href="#">문구팬시</a>
                <a class="dropdown-item category" href="#">전자기기</a>
                <a class="dropdown-item category" href="#">패션잡화</a>
                <a class="dropdown-item category" href="#">반려동물 용품</a>
                <a class="dropdown-item category" href="#">인테리어 소품</a>
                <a class="dropdown-item category" href="#">신발</a>
                <a class="dropdown-item category" href="#">의류</a>
                <a class="dropdown-item category" href="#">육아,아동</a>
                <a class="dropdown-item category" href="#">인형,장난감</a>
                <a class="dropdown-item category" href="#">공예</a>
                <a class="dropdown-item category" href="#">기타</a>
              </div>
            </div>

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
        <!-- /.container-fluid -->

      </div>

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; bomulsum 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->


    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/> "></script>
  <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/> "></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value='/resources/js/sb-admin-2.min.js'/> "></script>

  <!-- Page level plugins -->
  <script src="<c:url value='/resources/vendor/chart.js/Chart.min.js'/> "></script>

  <script src="<c:url value='/resources/js/demo/chart-bar-demo.js'/> "></script>
  <script src="<c:url value='/resources/js/demo/chart-pie-demo.js'/> "></script>
</body>
<script>
var filtCategory='모든 상품';
var filtDate='월별';

var headFunc;
var numFunc;

var month = '${month}';
month = month.substring(1, month.length-1);
month = month.split(',');
var monthCount = '${monthCount}';
monthCount = monthCount.substring(1, monthCount.length-1);
monthCount = monthCount.split(',');
var maxMonthCount = Number(monthCount[0]);
for(var i=0; i<monthCount.length; i++){
	if(Number(monthCount[i]) >= maxMonthCount){
		maxMonthCount = Number(monthCount[i]);
	}
}

var lastMonth = '${lastMonth}';
var ajaxFunction;
$(function(){
	
	myBarChart.data.labels = month;
	myBarChart.data.datasets[0].data = monthCount;
	myBarChart.options.scales.xAxes[0].time.unit = 'month';
	myBarChart.options.scales.xAxes[0].ticks.maxTicksLimit = lastMonth;
	myBarChart.options.scales.xAxes[0].maxBarThickness = lastMonth;
	myBarChart.options.scales.yAxes[0].ticks.max = numFunc(maxMonthCount);
	myBarChart.update();
	
	$('.category').on('click', function(){
		var category = $(this).text();
		$('#categoryButton').text(category);
		filtCategory = category;
		
		var dateArr = new Array();
		var dateVal = new Array();
		for(var i=0; i<new Date().getDate(); i++){
			dateArr[i] = i+'일';
			dateVal[i] = 50*i;
		}
		
		
		ajaxFunction();
	});
	
	$('.filtDate').on('click', function(){
		var filter = $(this).text();
		$('#dateButton').text(filter);
		filtDate = filter;
		
		ajaxFunction();
	});
	
	ajaxFunction = function(){
		$.ajax({
			url : '/bomulsum/manager/statistics/filt.mdo',
			data : {
				filtDate : filtDate,
				filtCategory : filtCategory
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
		$('#title_dndud').html(filtDate + "매출 [ "+ filtCategory +" ]");
	};
	
});
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
	
	
	return test * temp;
};
</script>
</html>