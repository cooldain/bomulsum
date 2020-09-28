<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현황</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
<style type="text/css">
#cst {
	font-size:14px;
	width:100%;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	align : center;
	min-height:500px;
	max-height:500px;
	overflow:auto;
}

#cst table{
	width:100%;
	text-align: center;
	align: center;
}


#cst table tr th{
	padding-top:1%;
	padding-bottom:1%;
	align:center;
	border-bottom: 1px solid gray;
	top:0;
}

#cst table tr td{
	border-bottom: 1px solid gray;
	background-color: white;
	padding-top:1.5%;
	padding-bottom:1.5%;
}

#cst table tr td input[type="text"]{
	width:80%;
}

#cst table tr td select{
	width:80%;
}

#cst table div table{
	width:83%;
	text-align: center;
}


</style>
</head>
<body id="page-top">
	<div id="wrapper">
		<!-- Header/Nav -->
		<%@ include file="../include/side.jsp" %>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../include/head.jsp" %>
				<!-- end Header/Nav -->
				<div style="margin-left: 2%; margin-right: 2%;">
					<h2 style="text-style: bold; margin-bottom: 0rem;">발송 정보 일괄 등록</h2>
					<hr
						style="margin-top: 0rem; border: 0; background: #ccc; height: 0.2rem;">

					<!-- 
					<div>
						<input id="beforeDate" type="date" value="2018-01-01"
							max="2025-01-01"> ~ <input id="afterDate" type="date"
							value="2018-01-01" max="2025-01-01">
						<button style="width:8%; height:30px; margin-left:2%;border:0; background-color:red; color:white">검색</button>
					</div>
					 -->
					
					<div style="margin-top:3%">
						<h4 style="text-style: bold;">미발송 주문내역 총 <a id="allNumber" style="color:red"></a>건</h4>
						<i class="fas fa-exclamation-circle" style="color:red"></i>
						<a style="font-size:14px">선택한 주문내역들만 일괄 등록을 원하시는 경우 하단의 표에서 원하시는 항목들을 체크하시고 타이틀 셀에 원하시는 정보를 입력하시면 선택한 주문내역들의 정보가 한번에 변경이 가능합니다.</a><br>
						<i class="fas fa-exclamation-circle" style="color:red"></i>
						<a style="font-size:14px">운송장까지 일괄 입력을 원하시는 경우 하단의 '엑셀 저장' 버튼을 눌러 엑셀을 다운받으세요. 해당 엑셀파일에서 정보를 입력 후 저장하시고, 하단의 '파일로 일괄등록' 버튼을 누른 후 뜨는 팝업창에 엑셀파일을 업로드해주시면 입력하신 정보가 업데이트됩니다.</a><br>
						<i class="fas fa-exclamation-circle" style="color:red"></i>
						<a style="color:red; font-size:14px">모든 정보 내역을 업데이트 하고난 후에는 꼭 '발송 완료' 버튼을 눌러주셔야 시스템에 해당 정보들이 업데이트됩니다.</a><br>
					</div>
					
					<div id="cst">
						<table id="excel">
							<tr style="position:relative;top:expression(this.offsetParent.scrollTop);">
								<th style="width:2%"><input type="checkbox" id="topSelectAll"/></th>
								<th style="border-left: 1px solid gray;">주문번호</th>
								<th style="border-left: 1px solid gray; width:6.45%">주문상태</th>
								<th style="border-left: 1px solid gray; width:12%; table-align:center">
									<div align="center">
										<table>
											<tr>
												<th style="border:1px solid gray;text-align:left">
													<a>배송일 선택</a>
												</th>
												<th style="border:1px solid gray">
													<i class="far fa-calendar"></i>
												</th> 
											</tr>
										</table>
									</div>
								</th>
								<th style="border-left: 1px solid gray;width:10%">
									<select style="width:80%;"><option>택배</option></select>
								</th>
								<th style="border-left: 1px solid gray;width:10%">
									<select style="width:80%;"><option>택배사선택</option></select>
								</th>
								<th style="border-left: 1px solid gray;width:18%">운송장</th>
								<th style="border-left: 1px solid gray;width:18%">작품명</th>
								<th style="border-left: 1px solid gray;width:8%">주문자</th>
							</tr>
							
							
							
							
						</table>
					</div>
					<div style="margin-top:2%">
						<button id="selectAll" style="border:0;"><input id="selectCheckBox" type="checkbox"/>전체선택</button>
						<button style="background-color:red; color:white; border:1px solid red;">엑셀저장</button>
						<div style="float:right;">
							<button data-toggle="modal" data-target="#staticBackdrop" style="background-color:white; color:red; border:1px solid red;">파일로 일괄 등록</button>
							<button style="background-color:red; color:white; border:1px solid red">발송 완료</button>
						</div>
					</div>
					
				</div>



				<!-- 파일 일괄 등록 모달 -->
				<div class="modal fade" id="staticBackdrop" data-backdrop="static"
					tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">파일로 일괄 등록</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="height: 250px">
								<div
									style="width: 100%; height: 30px; display: flex; flex-direction: row;">
									<div>
										<div>파일 업로드</div>
										<div style="display:flex; flex-direction: row">
											<div>
												<input type="file" id="excelFile" accept=".xlsx" style="width:200px" onchange="excelExport(event)"/>
											</div>
											<div>
												<button style="margin-left:1%;background-color:red; border:0; color:white; width:90px"
													 data-dismiss="modal" id="excelButton" >일괄등록</button>
											</div>
										</div>
										
									</div>
								</div>
								<div style="margin-top:7%">
									<h6 style="font-weight:bold">꼭 읽어보세요!</h6>
									<div style="font-size:12px">
										<a>- 미발송 주문내역을 엑셀로 다운받아 </a><a style="color:red">발송일, 발송방법, 택배사, 송장번호를 입력</a><a>하신 후 업로드하시면 일괄 등록됩니다.</a><br>
										<a>- 업로드는 </a><a style="color:red">동일한 확장자(.xsls)파일</a><a>이어야 하며, 파일명은 임의로 저장 후 업로드해주세요.</a><br>
										<a>- 택배 발송이 아닌 경우 발송방법에 </a><a style="color:red">'직접'</a><a>을 입력하시고</a><a style="color:red"> 택배사 영역에 사용하신 발송방법을 입력</a><a>해주세요(예:방문 수령, 직접 전달 등)</a><br>
										<a>- 발송일은 공백 없이 하이픈(-)을 넣고 입력해주셔야 합니다.</a><a style="color:red">(예:2018-03-21)</a><br>
										<a>- 아래의 택배사 코드를 확인하시고 발송하신 </a><a style="color:red">택배사 코드를 입력</a><a>해주시기 바랍니다.</a><br>
									</div>
								</div>
							</div>
								<!-- 글자수 채워지는거 기능 추가 해야 함 -->
								<div style="margin: 1%">
									<table style="width:100%; text-align:center; margin:0; font-size:0.8rem; padding:1%">
										<tr style="border-top:1px solid gray">
											<td style="width:20%; background-color:#dcdcdc">CJ대한통운</td>
											<td>D01</td>
											<td style="width:20%; background-color:#dcdcdc">우체국택배</td>
											<td>D02</td>
											<td style="width:20%; background-color:#dcdcdc">우체국 등기</td>
											<td>D03</td>
										</tr>
										<tr style="border-top:1px solid gray; border-bottom:1px solid gray">
											<td style="width:20%; background-color:#dcdcdc">한진택배</td>
											<td>D04</td>
											<td style="width:20%; background-color:#dcdcdc">롯데택배</td>
											<td>D05</td>
											<td style="width:20%; background-color:#dcdcdc">로젠택배</td>
											<td>D06</td>
										</tr>
									</table>
								</div>
						</div>
						<!-- end for modal content -->
					</div>
					<!-- end for modal dialog -->
				</div>

				<%@ include file="../include/footer.jsp" %>
				<!-- end footer -->
				<!-- Scroll to Top Button-->
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>

				<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
				<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
				<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>

				<!-- Core plugin JavaScript-->
				<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

				<!-- Custom scripts for all pages-->
				<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>

				<!-- Page level plugins -->
				<%-- <script src="<c:url value='/vendor/chart.js/Chart.min.js'/>"></script>

				<!-- Page level custom scripts -->
				<script src="<c:url value='/resources/js/demo/chart-area-demo.js'/>"></script>
				<script src="<c:url value='/resources/js/demo/chart-pie-demo.js'/>"></script> --%>
			</div>
		</div>
	</div>

	<script>
		let orderListNum = 0;	
		
		window.onload = function(){
			document.getElementById("allNumber").innerHTML = orderListNum;
		};
		
	/*
		날짜 관련 포맷형식
		document.getElementById("chooseDate").value = new Date().toISOString().substring(0, 10);
	
		var nowDate = new Date().toISOString().substring(0, 10);
		document.getElementById('afterDate').value = nowDate;

		var lastDate = new Date().toISOString().substring(0, 10);
		document.getElementById('beforeDate').value = lastDate.replace(lastDate
				.substring(5, 7), '0' + String(lastDate.substring(5, 7) - 1));
	*/
	
		$('#selectAll').click(function(e) {
			if (!$("input:checkbox[id='selectCheckBox']").is(":checked")) {
				$("#selectCheckBox").prop('checked', true);
				$("#topSelectAll").prop('checked', true);
				for(var i =0; i<=orderListNum; i++){
					$('#'+i).prop('checked', true);
				}
			} else {
				$("#selectCheckBox").prop('checked', false);
				$("#topSelectAll").prop('checked', false);
				for(var i =0; i<=orderListNum; i++){
					$('#'+i).prop('checked', false);
				}
			}
		});

		$('#topSelectAll').click(function(e) {
			if (!$("input:checkbox[id='selectCheckBox']").is(":checked")) {
				$("#selectCheckBox").prop('checked', true);
				$("#topSelectAll").prop('checked', true);
				for(var i =0; i<=orderListNum; i++){
					$('#'+i).prop('checked', true);
				}
			} else {
				$("#selectCheckBox").prop('checked', false);
				$("#topSelectAll").prop('checked', false);
				for(var i =0; i<=orderListNum; i++){
					$('#'+i).prop('checked', false);
				}
			}
		});
		
		
		// 엑셀 파일 관련 스크립트
		var excelFileUpload;
		var efile;
		
		$("#excelButton").click(function(e){
			excelExportCommon(excelFileUpload, handleExcelDataAll);
		});
		
		function excelExport(event){
			excelFileUpload = event;
		}
		
		function excelExportCommon(event, callback){
			if(event != null){
			    var input = event.target;
			    var reader = new FileReader();
			    reader.onload = function(){
			        var fileData = reader.result;
			        var wb = XLSX.read(fileData, {type : 'binary', cellDates:true});
			        
			        var sheetNameList = wb.SheetNames; // 시트 이름 목록 가져오기 
			        var firstSheetName = sheetNameList[0]; // 첫번째 시트명
			        var firstSheet = wb.Sheets[firstSheetName]; // 첫번째 시트 
			        callback(firstSheet);      
			    };
			    reader.readAsBinaryString(input.files[0]);
			}else{
				alert("선택된 파일이 없습니다.");
			}
		}
		function handleExcelDataAll(sheet){
			handleExcelDataHeader(sheet); // header 정보 
			handleExcelDataJson(sheet); // json 형태
			handleExcelDataCsv(sheet); // csv 형태
			handleExcelDataHtml(sheet); // html 형태
		}
		function handleExcelDataHeader(sheet){
		    var headers = get_header_row(sheet);
		    $("#displayHeaders").html(JSON.stringify(headers));
		}
		function handleExcelDataJson(sheet){
		    $("#displayExcelJson").html(JSON.stringify(XLSX.utils.sheet_to_json (sheet)));
		    var finalexcelFile = XLSX.utils.sheet_to_json (sheet);
		    console.log(finalexcelFile);
		    for(var i = 0; i < finalexcelFile.length; i++){
		    	efile = finalexcelFile[i];
		    	var tTable = document.getElementById("excel");
		    	var tTr = document.createElement("tr");
		    	
		    	
		    	var tTd = document.createElement("td");
		    	var checkbox = document.createElement("input");
		    	checkbox.type = 'checkbox';
		    	checkbox.id = orderListNum;
		    	orderListNum++;
		    	tTd.appendChild(checkbox);
		    	tTr.appendChild(tTd);
		    	
		    	var tTd = document.createElement("td");
		    	tTd.innerHTML = efile.주문번호;
		    	tTr.appendChild(tTd);
		    	
		    	var tTd = document.createElement("td");
		    	tTd.innerHTML = efile.주문상태;
		    	tTr.appendChild(tTd);
		    	
		    	var tTd = document.createElement("td");
		    	var dateSend = document.createElement("input");
		    	dateSend.type = 'date';
		    	dateSend.min = '2018-01-01';
		    	dateSend.max = '2020-12-31';
		    	dateSend.value = efile.발송일.toISOString().substring(0, 10);
		    	tTd.appendChild(dateSend);
		    	tTr.appendChild(tTd);
		    	
		    	var tTd = document.createElement("td");
		    	var select = document.createElement("select");
		    	var option = document.createElement("option");
		    	option.innerHTML = "택배";
		    	select.appendChild(option);
		    	tTd.appendChild(select);
		    	tTr.appendChild(tTd);
		    	
		    	var tTd = document.createElement("td");
		    	var select = document.createElement("select");
		    	
		    	var option = document.createElement("option");
		    	option.innerHTML = "CJ대한 통운";
		    	if(efile.택배사선택 === 'D01')
		    		option.selected = true;
		    	
		    	select.appendChild(option);
		    	var option = document.createElement("option");
		    	option.innerHTML = "우체국택배";
		    	if(efile.택배사선택 === 'D02')
		    		option.selected = true;
		    	select.appendChild(option);
		    	
		    	var option = document.createElement("option");
		    	option.innerHTML = "우체국 등기";
		    	if(efile.택배사선택 === 'D03')
		    		option.selected = true;
		    	select.appendChild(option);
		    	
		    	var option = document.createElement("option");
		    	option.innerHTML = "한진택배";
		    	if(efile.택배사선택 === 'D04')
		    		option.selected = true;
		    	select.appendChild(option);
		    	
		    	var option = document.createElement("option");
		    	option.innerHTML = "롯데택배";
		    	if(efile.택배사선택 === 'D05')
		    		option.selected = true;
		    	select.appendChild(option);
		    	
		    	var option = document.createElement("option");
		    	option.innerHTML = "로젠택배";
		    	if(efile.택배사선택 === 'D06')
		    		option.selected = true;
		    	select.appendChild(option);
		    	tTd.appendChild(select);
		    	tTr.appendChild(tTd);
		    	
		    	var tTd = document.createElement("td");
		    	var num = document.createElement("input");
		    	num.type = "text";
		    	num.value = efile.운송장;
		    	tTd.appendChild(num);
		    	tTr.appendChild(tTd);
		    	
		    	var tTd = document.createElement("td");
		    	//var product = document.createElement("a");
		    	//product.innerHTML = efile.작품명;
		    	//tTd.appendChild(product);
		    	tTd.innerHTML = efile.작품명;
		    	tTr.appendChild(tTd);
		    	
		    	var tTd = document.createElement("td");
		    	tTd.innerHTML = efile.주문자;
		    	tTr.appendChild(tTd);
		    	
		    	tTable.appendChild(tTr);
		    	document.getElementById("allNumber").innerHTML = orderListNum;
		    }
		}
		function handleExcelDataCsv(sheet){
		    $("#displayExcelCsv").html(XLSX.utils.sheet_to_csv (sheet));
		}
		function handleExcelDataHtml(sheet){
		    $("#displayExcelHtml").html(XLSX.utils.sheet_to_html (sheet));
		}
		
		function get_header_row(sheet) {
		    var headers = [];
		    var range = XLSX.utils.decode_range(sheet['!ref']);
		    var C, R = range.s.r; /* start in the first row */
		    /* walk every column in the range */
		    for(C = range.s.c; C <= range.e.c; ++C) {
		        var cell = sheet[XLSX.utils.encode_cell({c:C, r:R})] /* find the cell in the first row */
		
		        var hdr = "UNKNOWN " + C; // <-- replace with your desired default 
		        if(cell && cell.t) hdr = XLSX.utils.format_cell(cell);
		
		        headers.push(hdr);
		    }
		    return headers;
		}
	</script>
	
</body>
</html>