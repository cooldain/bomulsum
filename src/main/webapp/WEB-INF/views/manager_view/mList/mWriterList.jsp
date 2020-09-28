<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>보물섬(관리자) | 작가목록</title>

  <!-- Custom fonts for this template-->
  <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

   <!-- Custom fonts for this template -->
   <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
   <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
 
   <!-- Custom styles for this template -->
   <link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
 
   <!-- Custom styles for this page -->
   <link href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">


<style>
#jeongaClassTable th{
   text-align:center;
   vertical-align: middle;
} 
#jeongaClassTable td{
   font-size:14px;
   text-align:center;
   vertical-align: middle;
}
#content {
	width: 100%;
}

.dain-td1 {
	width: 10%;
	text-align: center;
	vertical-align: middle !important;
}

.dain-td2 {
	vertical-align: middle !important;
}

.dain-td3 {
	vertical-align: middle !important;
}

.dain-td4 {
	vertical-align: middle !important;
}

.dain-td5 {
	text-align: center;
	vertical-align: middle !important;
}

#pagination{
	display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 2%;
    padding-bottom: 2%;
    font-size: 18px;
}

</style>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
<%@ include file="../include/mSide.jsp" %>
      <!-- Main Content -->
      <div id="content">
		<%@ include file="../include/mheader.jsp" %>
 
     <!--여기에 내용 넣기-->
    <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">작가목록</h1>
          <p class="mb-4">현재 가입 되어있는 작가 목록입니다.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">작가 목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive" id="jeongaClassTable">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>작가코드</th>
                      <th>작가명</th>
                      <th>브랜드명</th>
                      <th>이메일 </th>
                      <th>전화번호 </th>
                      <th>작가홈</th>
                    </tr>
                  </thead>
                  <tbody id="dndud_table">
                  <%-- <c:forEach items='${writerList}' var="writer">
                    <tr>
                      <td>${writer.writer_code_seq}</td>
                      <td>${writer.writer_name}</td>
                      <td>${writer.writer_brand_name}</td>
                      <td>${writer.writer_email}</td>
                      <td>${writer.writer_phone}</td>
                      <td>${writer.writer_url}</td>
                    </tr>
                    </c:forEach> --%>
                  </tbody>
                </table>
              </div>
            </div>
            <div id="pagination"></div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->


    </div>
    <%@ include file="../include/mfooter.jsp" %>
    <!-- End of Content Wrapper -->

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

</body>
<script>
var result = new Array();

<c:forEach var="i" items='${writerList}'>
	var json = new Object();//객체로 배열에 담기
	json.writer_code_seq = '${i.writer_code_seq}';
	json.writer_name = '${i.writer_name}';
	json.writer_brand_name = '${i.writer_brand_name}';
	json.writer_email = '${i.writer_email}';
	json.writer_phone = '${i.writer_phone}';
	json.writer_url = '${i.writer_url}';
	result.push(json);
</c:forEach>

$(document).ready(function(){
	pagingFunc();
});

var pagingFunc = function(){
	
	
	
	var pageCount = 10; // 한 페이지에 보여질 개수
	var blockCount = 5; // 페이지 몇개를 하나의 그룹(?)으로 묶은  정의하는 블럭 개수
	var totalPage = Math.ceil(result.length / pageCount); // 총 페이지가 몇개 나올지 - 총 입력된 데이터의 개수에서 한페이지에 보여줄 글 목록 개수로 나눴다.
	var totalBlock = Math.ceil(totalPage / blockCount); // 총 블럭 개수가 몇개 나올지
	var pagination = document.getElementById('pagination');//페이징 기능 들어갈 영역(테이블 영역 아래)
	var testTable = document.getElementById('dndud_table');//페이징 처리를 하면 표시될 데이터가 들어갈 테이블영역
	
	var renderTableAndPagination = function(page = 1){
	   renderTable(page);//테이블 그리는 함수
	   renderPagination(page);//페이징 처리 함수
	};
	
	//테이블 그리는 함수
	var renderTable = function(page){
		var html = '';

		var startNum = (pageCount * (page - 1)); 
		var endNum = ((pageCount * page) >= result.length) ? result.length : (pageCount * page);
		
		//여기서 만들어진 html 을 테이블 tbody 영역에 innerhtml 해줄거임.
		for(var index = startNum; index < endNum; index++){
	  		html += '<tr><td>'+result[index].writer_code_seq+'</td>'
	  			+ '<td>'+ result[index].writer_name +'</td>'
	  			+ '<td>'+ result[index].writer_brand_name +'</td>'
	  			+ '<td>'+ result[index].writer_email +'</td>'
	  			+ '<td>'+ result[index].writer_phone +'</td>'
	  			+ '<td><a style="color:black" target="_blank" href="/bomulsum/writerhome/'+result[index].writer_url+'.do">/bomulsum/writerhome/'+ result[index].writer_url +'.do</a></td></tr>';
	  			

		}
		testTable.innerHTML = html;
	};

	//pagination 그리는 함수
	 var renderPagination = function(page){
		var block = Math.floor((page-1)/blockCount)+1;
		var startPage = ((block-1)*blockCount)+1;
		var endPage = ((startPage + blockCount - 1) > totalPage) ? totalPage : (startPage + blockCount - 1);
		            
		var paginationHTML = '';
		            
		if(page !== 1) paginationHTML += "<a style='cursor:pointer' class='first_page'>처음&nbsp;&nbsp;</a>";
		if(block !== 1) paginationHTML += "<a style='cursor:pointer' class='back_page'>이전...&nbsp;&nbsp;</a>";
		            
		for(var index = startPage; index <= endPage; index++){
			paginationHTML += (parseInt(page) === parseInt(index)) ? " <a style='color:#ff8400;margin-right: 5px;margin-left: 5px;'>" + index + "</a> " :" <a style='cursor:pointer;margin-right: 5px;margin-left: 5px;' class='go_page' data-value='" + index + "'>" + index + "</a> ";
		}
		            
		if(block < totalBlock) paginationHTML += "<a style='cursor:pointer' class='next_page'>&nbsp;&nbsp;...다음</a>";
		if(page < totalPage) paginationHTML += "<a style='cursor:pointer' class='last_page'>&nbsp;&nbsp;끝</a>";
		       
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
</html>