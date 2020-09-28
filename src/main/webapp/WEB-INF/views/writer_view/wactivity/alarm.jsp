<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
<!-- CSS 영역 -->
<style>
.minwoo_table_table_bordered_head tr th {
	text-align: center;
	vertical-align: middle;
}

.minwoo_table_table_bordered_body tr td {
	text-align: center;
	vertical-align: middle;
	resize: none;
	font-size:14px;
}

.minwoo_tableBottomLine{
	margin-top: 20px;
	text-align: center;
	margin-bottom: 20px;
	font-size: 18px;
	display:flex;
	position:relative;
	max-height:40px;
}

.minwoo_pagination{
	text-align: center;
	font-size: 18px;
    margin-left: auto;
    margin-right: auto;
    width: 100%;
}
.minwoo_pagination a {
	display: inline-block;
	margin: 0 3px;
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #ccc;
	color: #999999;
	background-color: #fff;
}

.arrow prev {
	border: 0px;
}

.arrow next {
	border: 0px;
}
.minwoo_rowPerPage{
	margin-left:5px; text-align:center; width:20%;
	border-color:#D8D8D8; color:#A4A4A4; border-radius:5px;
	position: absolute;
}

.savebtn{
   background-color: white;
   margin-left : 10px;
   border: 1px solid #e7e7e7;
   height: 35px;
   outline: none;
   color: #666666;
   border-radius: 3px;
   margin-left:auto;
   margin-right:auto;
}
.senderArea{
	display: flex;
	align-items: center;
    justify-content: center;
}
.photo{
	width:40px;
	height:40px;
	object-fit:cover;
	border-radius: 50%;
	max-height: 40px;
	max-width: 40px;
}


</style>
</head>
<!-- body 시작 -->
<body>

<!-- body 시작 -->
<div id="wrapper">
	<!-- Header/Nav -->
	<jsp:include page="../include/side.jsp" />
	<div id="content-wrapper" class="d-flex flex-column">

		<div class="content">
			<jsp:include page="../include/head.jsp" />
			<!-- end Header/Nav -->

				<!--민우 내용 추가한 부분 시작-->
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div style="display: flex; float: right;">
						<button class="btn btn-primary" style="margin-left:5px;
						margin-right:5px;" onClick="window.location.reload()">
							<i class="fas fa-sync"></i>&nbsp;&nbsp;새로고침
						</button>
					</div>
					<h1 class="h3 mb-2 text-gray-800">알림</h1>
					<p class="mb-4">활동 알림 목록입니다.</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">알림 목록</h6>
							
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="mboardTable">
									<thead class="minwoo_table_table_bordered_head">
										<tr>
											<th style="width:12%">발신자</th>
											<th style="width:13%">일자</th>
											<th style="width:15%">카테고리</th>
											<th style="width:60%">내용</th>
										</tr>
									</thead>
									<tbody class="minwoo_table_table_bordered_body">
										<!-- 데이터 들어올 영역 -->
									</tbody>
								</table>
							</div>
							<div class="minwoo_tableBottomLine">
								<select name="rowPerPage" id="rowPerPage" class="minwoo_rowPerPage">
									<option value="10">10개씩 보기</option>
									<option value="30">30개씩 보기</option>
									<option value="50" >50개씩 보기</option>
								</select>
								<div id="pagination" class="minwoo_pagination"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
				<!--민우 내용 추가한 부분 종료-->
		</div>
		<!-- End of Main Content -->




				<!-- end of Container -->
				<%@ include file="../include/footer.jsp" %>
				<!-- end footer -->

				<!-- Scroll to Top Button-->
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>


	</div>
</div>
	
				<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
				<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

				<!-- Core plugin JavaScript-->
				<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

				<!-- Custom scripts for all pages-->
				<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>
	

	<script>
	$(document).ready(function(){
		pagingFunc();
		$("#rowPerPage").change(function(){
			pagingFunc();
		});
	});
	
	var writerSeq =	"${writer_login.writerSeq}";
		
	console.log(writerSeq);

	
	//페이지 시작하면 처음 보여주면서 처리해야할 기능
    //페이징 처리를 위한 스크립트
	var alarmResult = new Array();
	var result = new Array();
	
    <c:forEach var="i" items='${alarmList}'>
       var json = new Object();//객체로 배열에 담기
       json.alarmSeq = '${i.alarmSeq}';
       json.senderCode = '${i.senderCode}';
       json.recipientCode = '${i.recipientCode}';
       json.alarmTitle = `${i.alarmTitle}`;
       json.alarmDate = '${i.alarmDate}';
       json.alarmContent = `${i.alarmContent}`;
       json.alarmRead = '${i.alarmRead}';
       if(`${i.memberName}` == ''){
    	   json.memberName = '보물섬';
       } else{
    	   json.memberName = `${i.memberName}`;
       }
       json.memberProfile = '${i.memberProfile}';
       alarmResult.push(json);
    </c:forEach>
	//전체 데이터에서, 카테고리 설정 했을 때&검색했을때 데이터에 따라 페이징이 바뀌어야 하므로 이 배열을 가공한 다른 배열들이 필요하다.
	
	var pageCount = 10; // 한 페이지에 보여질 개수
	
	var pagingFunc = function(){

		result = alarmResult;

		pageCount = $("#rowPerPage").val();// 셀렉박스에 몇개씩 볼지 선택된 값에 따라 페이징 다르게 해주기
		var blockCount = 5; // 페이지 몇개를 하나의 그룹(?)으로 묶은  정의하는 블럭 개수
		var totalPage = Math.ceil(result.length / pageCount); // 총 페이지가 몇개 나올지 - 총 입력된 데이터의 개수에서 한페이지에 보여줄 글 목록 개수로 나눴다.
		var totalBlock = Math.ceil(totalPage / blockCount); // 총 블럭 개수가 몇개 나올지
		var pagination = document.getElementById('pagination');//페이징 기능 들어갈 영역(테이블 영역 아래)
		var testTable = document.getElementById('mboardTable').querySelector("tbody");//페이징 처리를 하면 표시될 데이터가 들어갈 테이블영역
		
		var renderTableAndPagination = function(page = 1){
		   renderTable(page);//테이블 그리는 함수
		   renderPagination(page);//페이징 처리 함수
		};
		
		//테이블 그리는 함수
		var renderTable = function(page){
			var html = '';
			var memberProfilePhoto = '';
			
			var startNum = (pageCount * (page - 1)); 
			var endNum = ((pageCount * page) >= result.length) ? result.length : (pageCount * page);
			
			//여기서 만들어진 html 을 테이블 tbody 영역에 innerhtml 해줄거임.
			for(var index = startNum; index < endNum; index++){//아랫줄 background-image로 교체하기
				
				if(result[index].memberProfile == ""){
					memberProfilePhoto = 'test.png';
				} else {
					memberProfilePhoto = result[index].memberProfile;
				}
				
		  		html += '<tr><td><div class=\"senderArea\"><img class=\"photo\" src="/bomulsum/upload/' + memberProfilePhoto + '\"'
		  			+ 'alt=\"\">&nbsp;&nbsp;' + result[index].memberName + '</div></td>'
		  			+ '<td>' + result[index].alarmDate + '</td>'
		  			+ '<td>' + result[index].alarmTitle + '</td>'
		  			+ '<td>' + result[index].alarmContent + '</td>';
		  			+ '<td style="display:none;">' + result[index].alarmRead + '</td>';
		  			+ '<td style="display:none;">' + result[index].alarmSeq + '</td></tr>';
			}
			testTable.innerHTML = html;
		};
	
		//pagination 그리는 함수
		 var renderPagination = function(page){
			var block = Math.floor((page-1)/blockCount)+1;
			var startPage = ((block-1)*blockCount)+1;
			var endPage = ((startPage + blockCount - 1) > totalPage) ? totalPage : (startPage + blockCount - 1);
			            
			var paginationHTML = '';
			            
			if(page !== 1) paginationHTML += "<a style='cursor:pointer' class='first_page'>&nbsp;처음&nbsp;</a>";
			if(block !== 1) paginationHTML += "<a style='cursor:pointer' class='back_page'>&nbsp;이전...&nbsp;&nbsp;</a>";
			            
			for(var index = startPage; index <= endPage; index++){
				paginationHTML += (parseInt(page) === parseInt(index)) ? " <a style='color:#ff8400'>" + index + "</a> " :" <a style='cursor:pointer' class='go_page' data-value='" + index + "'>" + index + "</a> ";
			}
			            
			if(block < totalBlock) paginationHTML += "<a style='cursor:pointer' class='next_page'>&nbsp;&nbsp;...다음</a>";
			if(page < totalPage) paginationHTML += "<a style='cursor:pointer' class='last_page'>&nbsp;끝&nbsp;</a>";
			       
			pagination.innerHTML = paginationHTML;
			addEventPagination(startPage, endPage);
		}; 
	          
		//클릭이벤트, 클릭할 때마다 테이블을 새로 그려주는 거임
		var addEventPagination = function(startPage, endPage){
			if(!!document.querySelector(".first_page")){
			   document.querySelector(".first_page").addEventListener('click', ()=>{
			      renderTableAndPagination(1);
			   });
			}
			if(!!document.querySelector(".back_page")){
			   document.querySelector(".back_page").addEventListener('click', ()=>{
			      renderTableAndPagination(startPage-1);
			   });
			}
			document.querySelectorAll(".go_page").forEach(goPage => {
			   goPage.addEventListener('click', e => {
			      renderTableAndPagination(parseInt(e.target.getAttribute('data-value')));
			   });
			});
			if(!!document.querySelector(".next_page")){
			   document.querySelector(".next_page").addEventListener('click', ()=>{
			      renderTableAndPagination(endPage+1);
			   });
			}
			if(!!document.querySelector(".last_page")){
			   document.querySelector(".last_page").addEventListener('click', ()=>{
			      renderTableAndPagination(totalPage);
			   });
			}
		};  
		renderTableAndPagination();
		//페이징 처리 끝
	};
	
	</script>

</body>
</html>