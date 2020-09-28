<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <title>보물섬(관리자) | 작품관리</title>

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
    #content{
		width:100%;
	}
    .dain-table-img{
        width: 50px;
        height: 50px;
    }
    #dainArtTable th{
		text-align:center;
		vertical-align: middle;
	} 
	#dainArtTable td{
		font-size:14px;
		text-align:center;
		vertical-align: middle;
	}
	.dain-td1{
		width:6%;
	}
	.dain-td2{
		width:10%;
	}
	.dain-td6{
		width:10%;
	}
	.dain-td7{
		width:10%;
	}
	.dain-td8{
		width:10%;
	}
	/*정아 추가*/
	.jeongaDelete{
		background-color: #4e73df;
		border-radius: 4px;
		color:white;
		font-size:16px;
		padding: 6px 12px;
		border:0px;
	}
	.jeonga_tableBottomLine{
		margin-top: 20px;
		text-align: center;
		margin-bottom: 20px;
		max-height:40px;
		font-size: 16px;
		display:flex;
		justify-content: space-between;
	}
	.table_category{
		height:30px;
		font-size:14px;
	}
	#searchBtn{
		background-color: #4e73df;
		border-radius: 4px;
		color:white;
		font-size:12px;
		padding: 4px 8px;
		border:0px;
	}     

    </style>
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
	<%@ include file="../include/mSide.jsp" %>
    <!-- Content Wrapper -->
      <!-- Main Content -->
      <div id="content">
		<%@ include file="../include/mheader.jsp" %>

       <!-- Begin Page Content -->
       <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">작품관리</h1>
        <p class="mb-4">작가가 등록한 작품을 관리할 수 있습니다. </p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">작품 관리</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dainArtTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th class="dain-th1">작품코드</th>
                    <th class="dain-th2">작품사진</th>
                    <th class="dain-th3">작품명 </th>
                    <th class="dain-th4">작가명 </th>
                    <th class="dain-th5">카테고리</th>
                    <th class="dain-th6">판매수량</th>
                    <th class="dain-th7">판매상태</th>
                    <th class="dain-th8">작품삭제</th>
                  </tr>
                </thead> 
                <tbody>
   <%--              <c:forEach items='${artList}' var="art">
                  <tr>
                  	<td class="dain-td1">${art.art_code_seq}</td>
                    <td class="dain-td2"><img class="dain-table-img" src="<c:url value='/upload/${art.art_photo}'/>"></td>
                    <td class="dain-td3">${art.art_name}</td>
                    <td class="dain-td4">${art.writer_brand_name}</td>
                    <td class="dain-td5">${art.art_category}</td>
                    <td class="dain-td6">${art.art_sale_count}</td>
                    <td class="dain-td7">${art.art_sale_state}</td>
                    <td class="dain-td8"><button class="jeongaDelete">삭제</button></td>
                  </tr>
                  </c:forEach> --%>
                </tbody>
              </table>
            </div>
            <!-- 정아추가 -->
            <div class="jeonga_tableBottomLine">
				<select name="table_category" id="table_category" class="table_category">
					<option value="0">---카테고리 전체---</option>
					<option value="식음료">식음료</option>
					<option value="문구팬시" >문구팬시</option>
					<option value="전자기기">전자기기</option>
					<option value="패션잡화">패션잡화</option>
					<option value="반려동물 용품">반려동물 용품</option>
					<option value="인테리어 소품">인테리어 소품</option>
					<option value="신발">신발</option>
					<option value="의류">의류</option>
					<option value="육아,아동">육아,아동</option>
					<option value="인형,장난감">인형,장난감</option>
					<option value="공예">공예</option>
					<option value="기타">기타</option>
				</select>
				<div id="pagination"></div>
				<div style="margin-right:5px; width:25%; max-height:35px; display:flex; justify-content: center;">
				<input type="text" placeholder="검색할 작품명을 입력하세요" name="search_box" id="search_box" style="border-color:#D8D8D8;
					color:#A4A4A4; border-radius:5px; margin-right:5px; width:80%; height:30px; font-size:14px;">
				<button id="searchBtn" onclick="search();" style="min-width: 60px;">검색</button>
				</div>
			</div>
            
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->
	<%@ include file="../include/mfooter.jsp" %>

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
	<!-- Page level custom scripts -->
	<script src="<c:url value='/resources/js/demo/chart-area-demo.js'/> "></script>
	<script src="<c:url value='/resources/js/demo/chart-pie-demo.js'/> "></script>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//처음 데이터 뿌려주기 위해 실행.
$(document).ready(function(){
	pagingFunc();
});

//페이지 시작하면 처음 보여주면서 처리해야할 기능
//페이징 처리를 위한 스크립트
var mArtResult = new Array();
var categoryResult = new Array(); // 카테고리선택 결과물 담을 배열
var searchResult = new Array(); // 검색 결과물 담을 배열
var categoryCheck = false; // 카테고리 선택 결과인지 아닌지
var searchCheck = false; // 검색어로 들어온 결과인지 아닌지
var result = new Array();// 전체 데이터에서 페이징 처리 될 때마다 새롭게 테이블을 짜야 하므로 조건에 따른 결과를 넣어줄 배열을 여기서 초기화 해준다.

<c:forEach var="i" items='${artList}'>
   var json = new Object();//객체로 배열에 담기
   json.art_code_seq = '${i.art_code_seq}';
   json.art_photo = '${i.art_photo}';
   json.art_name = '${i.art_name}';
   json.writer_brand_name = '${i.writer_brand_name}';
   json.art_category = '${i.art_category}';
   json.art_sale_count = '${i.art_sale_count}';
   json.art_sale_state = '${i.art_sale_state}';
   mArtResult.push(json);
</c:forEach>
//전체 데이터에서, 카테고리 설정 했을 때&검색했을때 데이터에 따라 페이징이 바뀌어야 하므로 이 배열을 가공한 다른 배열들이 필요하다.


//카테고리 설정
$("#table_category").click(function(){
	categoryResult = []; // 셀렉트 옵션 버튼을 다시 눌럿을 때 중복되지 않게 배열 초기화 해주기.
	switch($("#table_category").val()){ // 카테고리 셀렉박스에서 선택된 값에 해당되는 조건들로 데이터 결과 값을 다시 만들어주고 페이징 처리 하기.
		case "식음료" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "식음료"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "문구팬시" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "문구팬시"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "전자기기" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "전자기기"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "패션잡화" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "패션잡화"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "반려동물 용품" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "반려동물 용품"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "인테리어 소품" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "인테리어 소품"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "신발" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "신발"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "의류" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "의류"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "육아,아동" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "육아,아동"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "인형,장난감" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "인형,장난감"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			categoryCheck = true;
			pagingFunc();
		break;
		case "공예" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "공예"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			
			categoryCheck = true;
			pagingFunc();
		break;
		case "기타" : 
			for(var i=0; i < mArtResult.length; i++){
				if(mArtResult[i].art_category == "기타"){
					categoryResult.push(mArtResult[i]);	
				}
			}
			
			categoryCheck = true;
			pagingFunc();
		break;
		default :
			categoryCheck = false;
			pagingFunc();// 전체
	}
});

//검색 기능
var search = function(){//눌렀다 때서 안되나보다
	searchResult = [];
	var k = $("#search_box").val();

	if(categoryCheck){
		for(var i=0; i < categoryResult.length; i++){
			if(categoryResult[i].art_name.includes(k)){
			//검색할 객체 배열(카테고리가 선택되었으면에서 title 이 입력한 검색어가 포함되는 것만 다시 검색한다.
			//카테고리가 선택되었으면, 카테고리 배열에서, 선택되어있지 않다면 전체배열에서 얻어와야 된다.
				searchResult.push(result[i]);
			}
		}
	} else {
		for(var i=0; i < mArtResult.length; i++){
			if(mArtResult[i].art_name.includes(k)){
			//검색할 객체 배열(카테고리가 선택되었으면에서 title 이 입력한 검색어가 포함되는 것만 다시 검색한다.
			//카테고리가 선택되었으면, 카테고리 배열에서, 선택되어있지 않다면 전체배열에서 얻어와야 된다.
				searchResult.push(result[i]);
			}
		}
	}
	searchCheck = true;
	categoryCheck = false;
	//검색 매소드가 실행 될 때 검색하는 데이터 영역이 pagingFunc()를 실행하고 난 다음 얻어진 데이터 영역이므로 카테고리를 지정하더라도 result에 값이 있으므로 false로 넘어간다.
	pagingFunc();
};

var pagingFunc = function(){
	result = [];
	
	if(categoryCheck){ // 카테고리 체크가 트루면 카테고리가 선택된것이므로 데이터를 넣어서 가지고 온다.
		result = categoryResult;
	} else if(searchCheck) { // 아니라면 전체 리스트에서 가지고 온다.
		result = searchResult;
	} else {
		result = mArtResult;
	}
	
	var pageCount = 10; // 한 페이지에 보여질 개수
	var blockCount = 5; // 페이지 몇개를 하나의 그룹(?)으로 묶은  정의하는 블럭 개수
	var totalPage = Math.ceil(result.length / pageCount); // 총 페이지가 몇개 나올지 - 총 입력된 데이터의 개수에서 한페이지에 보여줄 글 목록 개수로 나눴다.
	var totalBlock = Math.ceil(totalPage / blockCount); // 총 블럭 개수가 몇개 나올지
	var pagination = document.getElementById('pagination');//페이징 기능 들어갈 영역(테이블 영역 아래)
	var testTable = document.getElementById('dainArtTable').querySelector("tbody");//페이징 처리를 하면 표시될 데이터가 들어갈 테이블영역
	
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
	  		html += '<tr><td class="dain-td1">'+result[index].art_code_seq+'</td>'
	  		+'<td class="dain-td2">'+'<img class="dain-table-img" src="${pageContext.request.contextPath}/upload/'+result[index].art_photo+ '" '+'</td>'
            +'<td class="dain-td3">'+result[index].art_name+'</td>'
            +'<td class="dain-td4">'+result[index].writer_brand_name+'</td>'
            +'<td class="dain-td5">'+result[index].art_category+'</td>'
            +'<td class="dain-td6">'+result[index].art_sale_count+'</td>'
            +'<td class="dain-td7">'+result[index].art_sale_state+'</td>'
            +'<td class="dain-td8"><button class="jeongaDelete">삭제</button></td></tr>'

		}
		testTable.innerHTML = html;
		$(".jeongaDelete").on('click',deleteArt);
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
			paginationHTML += (parseInt(page) === parseInt(index)) ? "| <a style='color:#ff8400'>" + index + "</a> |" :"| <a style='cursor:pointer' class='go_page' data-value='" + index + "'>" + index + "</a> |";
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



//작품 삭제 버튼
var deleteArt = function(){

    $button = $(this);
    $artCode = $button.parent().parent().children().first().text();
    var code = $artCode;
    console.log(code);

   	$.ajax({
        url:'/bomulsum/manager/manage/deleteArt.mdo',
        data:{
        	  'code': code
        },
        type:'POST',
        success : function(){
          alert('변경에 성공했습니다.');
          location.reload(true);
      },
      error : function(err){
          console.log(err);
      }
   	});
 };

</script>
</html>