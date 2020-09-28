<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>보물섬(관리자) | 게시판 목록</title>

<link
	href="<c:url value='/resources/css/summernote/summernote-lite.css'/>"
	rel="stylesheet" type="text/css">
<!-- Custom fonts for this template-->
<link
	href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/sb-admin-2.min.css' />"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.css' />"
	rel="stylesheet">

<!--minwoo style-->
<style>
#content{
	width:100%;
}
.minwoo_table_table_bordered_head tr th {
	text-align: center;
	vertical-align: middle;
}

.minwoo_table_table_bordered_body tr td {
	text-align: center;
	vertical-align: middle;
}

.minwoo_table_table_bordered_body tr td:nth-child(1) {
	width: 20%;
}

.minwoo_table_table_bordered_body tr td:nth-child(3) {
	width: 15%;
}

.openUpdateModal {
	cursor: pointer;
}

.paging{
	text-align: center;
	font-size: 18px;
}

.minwoo_tableBottomLine{
	margin-top: 20px;
	text-align: center;
	margin-bottom: 20px;
	max-height:40px;
	font-size: 18px;
	display:flex;
	justify-content: space-between;
}

.table_category{
	margin-left:5px; text-align:center;
	width:20%; border-color:#D8D8D8; color:#A4A4A4;
	border-radius:5px;
}
</style>




</head>

<body id="page-top">

	<c:if test="${param.check eq 1}">
		<script type="text/javascript">
			alert("글이 수정 되었습니다.");
			location.href = "/bomulsum/manager/mboard/list.mdo";
		</script>
	</c:if>

	<!-- Page Wrapper -->
	<div id="wrapper">

	<%@ include file="../include/mSide.jsp" %>
    <!-- Content Wrapper -->
      <!-- Main Content -->
      <div id="content">
		<%@ include file="../include/mheader.jsp" %>

				<!-- 내용추가하기 -->

				<!--민우 내용 추가한 부분 시작-->
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">게시판</h1>
					<p class="mb-4">회원 / 작가들을 위한 안내 게시판 입니다.</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">글 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="mboardTable">
									<thead class="minwoo_table_table_bordered_head">
										<tr>
											<th>게시판 이름</th>
											<th>글 제목</th>
											<th>등록 날짜</th>
										</tr>
									</thead>
									<tbody class="minwoo_table_table_bordered_body">
										<!-- 데이터 들어올 영역 -->
									</tbody>
								</table>
							</div>
							<div class="minwoo_tableBottomLine">
								<select name="table_category" id="table_category" class="table_category">
									<option value="0">---게시판 카테고리(전체)---</option>
									<option value="이벤트">이벤트</option>
									<option value="회원용-공지사항" >회원용-공지사항</option>
									<option value="회원용-자주묻는질문">회원용-자주묻는질문</option>
									<option value="작가용-공지사항">작가용-공지사항</option>
									<option value="작가용-자주묻는질문">작가용-자주묻는질문</option>
									<option value="작가용-정책등록가이드">작가용-정책등록가이드</option>
								</select>
								<div id="pagination"></div>
								<div style="margin-right:5px; width:25%; max-height:35px; display:flex; justify-content: center;">
									<input type="text" placeholder="검색할 글 제목을 입력하세요" 
										name="search_box" id="search_box" style="border-color:#D8D8D8;
										color:#A4A4A4; border-radius:5px; margin-right:5px; width:80%;">
									<button class="btn btn-primary" onclick="search();" style="min-width: 60px;">검색</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
				<!--민우 내용 추가한 부분 종료-->

			</div>
			<!-- end main content -->
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<%@ include file="../include/mfooter.jsp" %>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- detail content modal -->
	<div class="modal fade" id="staticBackdrop2" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document"
			style="max-width: 1000px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal-category"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div
					style="display: flex; border-bottom: 1px solid #d9d9d9; height: 50px; margin: 12px 30px 6px 30px; align-items: center;">
					<div id="staticBackdropTitle"
						style="font-weight: bold; font-size: 18px; color: #4273df; width:100%;">
						제목 : <input type="text" id="modal-title" style="color: #858796; width:85%;"
							readonly="readonly">
					</div>
				</div>

				<!-- body -->
				<div id="staticBackdropContent"
					style="height: 400px; margin: 20px 30px 12px 30px;">
					<div
						style="height: 350px; border: 1px solid #d9d9d9; overflow: scroll; overflow-x: hidden; padding: 1%;">
						<div id="modal-content"></div>
					</div>
				</div>
				<div style="display: none;" id="modal-date"></div>
				<div style="display: none;" id="modal-coupon"></div>
				<div class="modal-footer"
					style="display: flex; justify-content: center;">
					<!-- 여기서 글 수정 버튼 누르면 rewrite.jsp로 해당 시퀀스 값 갖고 넘어갈거임-->
					<form action="<c:url value='/manager/mboard/rewrite.mdo'/>" method="post">
						<input type="hidden" id="adminNoticeSeq" name="adminNoticeSeq" />
						<input type="submit" style="margin: 10px; font-size:13px;"
							class="btn btn-primary" value="수정">
						<button style="margin: 10px; font-size:13px;"
							class="btn btn-primary" data-dismiss="modal" aria-label="Close">닫기</button>
						<button type="button"
							style="font-size:13px; margin: 10px; background-color: #dd3333; color: #ffffff;"
							class="btn btn-primary" id="delete_btn">삭제</button>
					</form>
				</div>
			</div>


		</div>
	</div>
	<!-- detail content  modal end -->


	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' /> "></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/resources/js/sb-admin-2.min.js' /> "></script>

	<!-- Page level plugins -->
	<script
		src="<c:url value='/resources/vendor/datatables/jquery.dataTables.min.js' /> "></script>
	<script
		src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.js' /> "></script>

	<!-- Page level custom scripts -->
	<script src="<c:url value='/resources/js/demo/datatables-demo.js' /> "></script>

	<!-- 썸머노트 -->
	<script
		src="<c:url value='/resources/js/summernote/lang/summernote-ko-KR.js'/>"></script>
	<script
		src="<c:url value='/resources/js/summernote/summernote-lite.js'/>"></script>


	<script>
	//페이지 시작하면 처음 보여주면서 처리해야할 기능
    //페이징 처리를 위한 스크립트
	var mboardResult = new Array();
	var categoryResult = new Array(); // 카테고리선택 결과물 담을 배열
	var searchResult = new Array(); // 검색 결과물 담을 배열
	var categoryCheck = false; // 카테고리 선택 결과인지 아닌지
	var searchCheck = false; // 검색어로 들어온 결과인지 아닌지
	var result = new Array();// 전체 데이터에서 페이징 처리 될 때마다 새롭게 테이블을 짜야 하므로 조건에 따른 결과를 넣어줄 배열을 여기서 초기화 해준다.
	
	// 얘네들은 모달에서 쓸 것들
	var category; 
	var title;
	var date;
	var seq;
	var content;
	var coupon;

	
    <c:forEach var="i" items='${mboardList}'>
       var json = new Object();//객체로 배열에 담기
       json.admin_notice_seq = '${i.admin_notice_seq}';
       json.admin_notice_date = '${i.admin_notice_date}';
       json.admin_notice_category = '${i.admin_notice_category}';
       json.admin_notice_title = '${i.admin_notice_title}';
       json.admin_notice_content = `${i.admin_notice_content}`;
       json.admin_notice_coupon = '${i.admin_notice_coupon}';
       mboardResult.push(json);
    </c:forEach>
	//전체 데이터에서, 카테고리 설정 했을 때&검색했을때 데이터에 따라 페이징이 바뀌어야 하므로 이 배열을 가공한 다른 배열들이 필요하다.

	
	//카테고리 설정
	$("#table_category").click(function(){
		categoryResult = []; // 셀렉트 옵션 버튼을 다시 눌럿을 때 중복되지 않게 배열 초기화 해주기.
		switch($("#table_category").val()){ // 카테고리 셀렉박스에서 선택된 값에 해당되는 조건들로 데이터 결과 값을 다시 만들어주고 페이징 처리 하기.
			case "이벤트" : //이벤트
				for(var i=0; i < mboardResult.length; i++){
					if(mboardResult[i].admin_notice_category == "이벤트"){
						categoryResult.push(mboardResult[i]);	
					}
				}
				categoryCheck = true;
				pagingFunc();
			break;
			case "회원용-공지사항" : //회원용-공지사항
				for(var i=0; i < mboardResult.length; i++){
					if(mboardResult[i].admin_notice_category == "회원용-공지사항"){
						categoryResult.push(mboardResult[i]);	
					}
				}
				categoryCheck = true;
				pagingFunc();
			break;
			case "회원용-자주묻는질문" : //회원용-자주묻는질문
				for(var i=0; i < mboardResult.length; i++){
					if(mboardResult[i].admin_notice_category == "회원용-자주묻는질문"){
						categoryResult.push(mboardResult[i]);	
					}
				}
				categoryCheck = true;
				pagingFunc();
			break;
			case "작가용-공지사항" : //작가용-공지사항
				for(var i=0; i < mboardResult.length; i++){
					if(mboardResult[i].admin_notice_category == "작가용-공지사항"){
						categoryResult.push(mboardResult[i]);	
					}
				}
				categoryCheck = true;
				pagingFunc();
			break;
			case "작가용-자주묻는질문" : //작가용-자주묻는질문
				for(var i=0; i < mboardResult.length; i++){
					if(mboardResult[i].admin_notice_category == "작가용-자주묻는질문"){
						categoryResult.push(mboardResult[i]);	
					}
				}
				categoryCheck = true;
				pagingFunc();
			break;
			case "작가용-정책등록가이드" : //작가용-정책등록가이드
				for(var i=0; i < mboardResult.length; i++){
					if(mboardResult[i].admin_notice_category == "작가용-정책등록가이드"){
						categoryResult.push(mboardResult[i]);	
					}
				}
				categoryCheck = true;
				pagingFunc();
			break;
			default :
				categoryCheck = false;
			    searchCheck = false;
				pagingFunc();// 전체
		}
	});
    
	//검색 기능
	var search = function(){//눌렀다 때서 안되나보다
		searchResult = [];
    	var k = $("#search_box").val();
		if(categoryCheck){
			for(var i=0; i < categoryResult.length; i++){
				if(categoryResult[i].admin_notice_title.includes(k)){
				//검색할 객체 배열(카테고리가 선택되었으면에서 title 이 입력한 검색어가 포함되는 것만 다시 검색한다.
				//카테고리가 선택되었으면, 카테고리 배열에서, 선택되어있지 않다면 전체배열에서 얻어와야 된다.
					searchResult.push(result[i]);
				}
			}
		} else {
			for(var i=0; i < mboardResult.length; i++){
				if(mboardResult[i].admin_notice_title.includes(k)){
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
			result = mboardResult;
		}
		
		var pageCount = 10; // 한 페이지에 보여질 개수
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

			var startNum = (pageCount * (page - 1)); 
			var endNum = ((pageCount * page) >= result.length) ? result.length : (pageCount * page);
			
			//여기서 만들어진 html 을 테이블 tbody 영역에 innerhtml 해줄거임.
			for(var index = startNum; index < endNum; index++){
		  		html += '<tr><td>' + result[index].admin_notice_category 
					+ '</td><td data-toggle=\"modal\" data-target=\"#staticBackdrop2\" class=\"openUpdateModal\">'
					+ result[index].admin_notice_title + '</td><td>'
					+ result[index].admin_notice_date + '</td><td style="\display:none;\">'
					+ result[index].admin_notice_seq + '</td><td style=\"display:none;\">'
					+ result[index].admin_notice_content + '</td><td style=\"display:none;\">'
					+ result[index].admin_notice_coupon + '</td>'
			}
			testTable.innerHTML = html;
			$(".openUpdateModal").on('click',modal);
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
    
	
    //페이지 로딩 후 이벤트 발생할 때 실행되는 기능들
	
    //모달
	//글 제목 눌럿을 때 모달 띄워주기 위해 값 넣기
	var modal = function(){
		console.log($(this).closest('tr').children('td').eq(3).text());
        category = $.trim($(this).closest('tr').children('td').eq(0).text());
        title = $.trim($(this).closest('tr').children('td').eq(1).text());
        date = $.trim($(this).closest('tr').children('td').eq(2).text());
        seq = $.trim($(this).closest('tr').children('td').eq(3).text());
        content = $.trim($(this).closest('tr').children('td').eq(4).html());// 썸머노트 로 이미지도 전달하기 때문에 html로 넣어줘야 됨.
        coupon = $.trim($(this).closest('tr').children('td').eq(5).text());
        console.log(coupon);
        console.log(seq);
        
        /*모달에 있는 삭제 버튼 누를 경우 시퀀스 값 가지고 delete.mdo?seq=~ url로 넘어간다. 컨트롤러에서 처리해주기.*/
        $("#delete_btn").click(function(){
           var chk = confirm("정말 삭제하시겠습니까?");
           if(chk){
              location.href='delete.mdo?adminNoticeSeq='+seq;
           }
        });
        
        if(coupon == '--'){ // 쿠폰 없을경우
           $('#modal-category').text(category);
           $('#modal-title').val(title);
           $('#modal-content').html(content);//썸머노트로 이미지도 전달학 때문에 html로 넣어줘야 됨.
           $('#modal-date').val(date);
           
           //여기서부턴 수정을 위한 인풋 히든 값 세팅
           $('#adminNoticeSeq').val(seq);
           $('#adminNoticeCoupon').val(coupon);
           $('#modal-coupon').css('display', 'none');
           
        }else{ // 쿠폰 잇을경우
           $('#modal-category').text(category);
           $('#modal-title').val(title);
           $('#modal-content').html(content);
           $('#modal-date').val(date);
           
           //여기서부턴 수정을 위한 인풋 히든 값 세팅
           $('#adminNoticeSeq').val(seq);
           $('#adminNoticeCoupon').val(coupon);
           
           //쿠폰 보기좋게 이름, 내용, 가격 으로 나눠주기
           var couponList = coupon.split('-');
           var couponName = couponList[0];
           var couponContent = couponList[1];
           var couponPrice = couponList[2];
           
           //모달에 display:none; 해놨던 쿠폰 영역 다시 오픈
           $('#modal-coupon').css('display', 'block');
           var html = "<span style='font-size:20px; font-weight:bold;'>&nbsp;쿠폰&nbsp;&nbsp;</span><br><span>&nbsp;쿠폰이름 :&nbsp;&nbsp;"+ couponName
                    + "&nbsp;&nbsp;</span><br>" + "<span>&nbsp;쿠폰내용 :&nbsp;&nbsp;"+couponContent + "&nbsp;&nbsp;</span>"
                    + "<br><span>&nbsp;쿠폰가격 :&nbsp;&nbsp;"+ couponPrice +"</span>";
           $('#modal-coupon').html(html);
  
        }   
    };
    //모달 부분 종료
    
    //처음 데이터 뿌려주기 위해 실행.
	$(document).ready(function(){
		pagingFunc();
	});
    
	</script>


</body>

</html>