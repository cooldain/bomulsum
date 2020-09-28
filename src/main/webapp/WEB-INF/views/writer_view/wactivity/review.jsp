<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 후기</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"
	type="text/css">
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
	font-size:12px;
	height: 30px;
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

.minwoo_pagination{
	text-align: center;
	font-size: 18px;
    margin-left: auto;
    margin-right: auto;
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
	max-height: 40px;
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
	background-repeat: no-repeat;
}
.review_photo{
	width:40px;
	height:40px;
	object-fit:cover;
	max-height: 40px;
	max-width: 40px;
	margin-left: 5px;
}
.review_photo_td{
	display: inline-flex;
}

.openUpdateModal {
	cursor: pointer;
	max-height: 50px;
    overflow: hidden;
    text-overflow: ellipsis;
}

.btn2{
   background-color: white;
   margin-left : 10px;
   border: 1px solid #e7e7e7;
   height: 35px;
   outline: none;
   color: #666666;
   border-radius: 3px;
}
.reviewComment{
    width: 325px;
    margin-left: auto;
    margin-right: auto;
	margin-top: 15px;
    font-size: 13px;
    height: 100px;
    overflow: auto;
}

.reviewComment::-webkit-scrollbar {
    width: 10px;
  }
  
.reviewComment::-webkit-scrollbar-thumb {
    background-color: white;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
.reviewComment::-webkit-scrollbar-track {
    background-color: #d9d9d9;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
 }

.reviewCommentRe{
	width: 100%; resize: none; font-size: 12px;
	max-height:48px; min-height:48px;
	border:none;
	outline: none;
	-ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
/*스크롤바 안보이게 하기*/
.reviewCommentRe::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}



/*별점 표현하기*/
.minwoo_starRev{
/* 	width:100%;
	height:30px;
	margin-left: 5px;
    margin-right: 5px;
    margin-top:7px;
    margin-bottom: 7px; */
    display: inline-flex;
}

.minwoo_starR1{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat -38px 0;
    background-size: auto 100%;
    width: 11px;
    height: 22px;
    float:left;
    text-indent: -9999px;
}
.minwoo_starR2{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat right 0;
    background-size: auto 100%;
    width: 11px;
    height: 22px;
    float:left;
    text-indent: -9999px;
}
.minwoo_starR1.on{background-position:0 0;}
.minwoo_starR2.on{background-position:-11px 0;}

/*모달 별점 - 크기 좀더 크게*/
.minwoo_modalStarRev{
	width:100%;
	height:30px;
	margin-left: 80px;
    margin-right: 80px;
    margin-top:7px;
    margin-bottom: 7px;
}

.minwoo_modal_starR1{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.minwoo_modal_starR2{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.minwoo_modal_starR1.on{background-position:0 0;}
.minwoo_modal_starR2.on{background-position:-15px 0;}


</style>
</head>
<!-- body 시작 -->
<body>

	<c:if test="${param.check eq 3}">
		<script type="text/javascript">
			alert("구매후기에 댓글이 등록 되었습니다.");
			location.href = "/bomulsum/writer/activity/review.wdo";
		</script>
	</c:if>
		<c:if test="${param.check eq 4}">
		<script type="text/javascript">
			alert("구매후기에 댓글이 수정 되었습니다.");
			location.href = "/bomulsum/writer/activity/review.wdo";
		</script>
	</c:if>
	
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
					<h1 class="h3 mb-2 text-gray-800">구매후기</h1>
					<p class="mb-4">회원분들께서 남겨주신 구매후기 목록입니다.</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">구매후기 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="reviewTable">
									<thead class="minwoo_table_table_bordered_head">
										<tr>
											<th style="width: 10%;">작성일자</th>
											<th style="width: 20%;">작품명</th>
											<th style="width: 10%;">작성자</th>
											<th style="width: 10%;">별점</th>
											<th style="width: 15%;">사진</th>
											<th style="width: 35%;">내용</th>
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
								<div style="margin-right:5px; width:25%; max-height:35px; display:flex; justify-content: center;">
									<input type="text" placeholder="작품명을 입력하세요" 
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
		<!-- End of Main Content -->



	</div>
	<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->







<!-- ------------------------ -->

				<!-- 모달 내용 부분 -->
				<!-- 정적 모달 내용 -->
				<div class="modal fade" id="staticBackdrop2" data-backdrop="static"
					tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document" style="">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">후기 - 댓글 작성</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="height: 260px">
								<div style="margin-left: 15%; margin-right: 15%;">
									<div style="width: 100%; height: 50px; display: flex; flex-direction: row;">
										<div class="photo" id="modalMemberProfile"></div>
										<div style="margin-left:2%; display:flex; flex-direction: column; width:65%;">
											<div style="font-size: 13px; margin-bottom: 1%;" id="memberName1"></div>
											<div style="font-size: 13px;" id="reviewDate1"></div>
										</div>
										<!-- <button class="btn2" style="font-size:13px;">메시지</button> -->
									</div>
									<div style="width: 100%; height: 50px; display: flex; flex-direction: row; border: 1px solid;">
										<div style="align-self: center; margin-top: 2%; margin-bottom: 2%; width: 15%;">
											<img id="minwoo_modal_artImage"
												style="overflow: hidden; align-items: center; justify-content: center;
												margin-left:10px; width: 40px; height: 40px" />
										</div>
										<div style="dispaly: flex; flex-direction: column;">
											<div style="font-size: 15px; margin-left:10px;" id="artName"></div>
											<!-- <div style="font-size: 10px; margin-top: 3%;" id="">옵션 없음 0</div> -->
										</div>
									</div>
									<div class="minwoo_modalStarRev">
											<span class="minwoo_modal_starR1" id="modalStarId1">별1_왼쪽</span> <span class="minwoo_modal_starR2" id="modalStarId2">별1_오른쪽</span>
											<span class="minwoo_modal_starR1" id="modalStarId3">별2_왼쪽</span> <span class="minwoo_modal_starR2" id="modalStarId4">별2_오른쪽</span>
											<span class="minwoo_modal_starR1" id="modalStarId5">별3_왼쪽</span> <span class="minwoo_modal_starR2" id="modalStarId6">별3_오른쪽</span>
											<span class="minwoo_modal_starR1" id="modalStarId7">별4_왼쪽</span> <span class="minwoo_modal_starR2" id="modalStarId8">별4_오른쪽</span>
											<span class="minwoo_modal_starR1" id="modalStarId9">별5_왼쪽</span> <span class="minwoo_modal_starR2" id="modalStarId10">별5_오른쪽</span>
									</div>	
									<div class="reviewComment" id="reviewComment"></div>
								</div>
							</div>
							<div class="modal-footer"
								style="display: flex; flex-direction: column; margin-top: 20px;">
								<!-- 글자수 채워지는거 기능 추가 해야 함 -->
								<form action="<c:url value='updateReviewComment.wdo'/>" method="post" style="width:100%">
									<div style="width: 100%; text-align: -webkit-center;">
										<div style="display:flex; flex-direction:row; width: 80%; border: 1px solid; height:50px;">
											<textarea class="reviewCommentRe" id="reviewCommentRe"
												name="reviewCommentRe" maxlength="1000" placeholder="댓글을 남겨 주세요."></textarea>
											<span id="counter" style="font-size:12px; text-align-last: right;">###</span>
										</div>
											<input type="hidden" id="memberCodeSeq" name="memberCodeSeq">
											<input type="hidden" id="reviewCodeSeq" name="reviewCodeSeq">
											<input type="hidden" id="writerSeq" name="writerSeq">
											<input type="hidden" id="reviewCommentReStatus" name="reviewCommentReStatus">
											<input type="submit" id="reviewCommentSubmit"  class="btn btn-primary" style="height:33px; margin-top:5px;" value="등록">
									</div>
								</form>
								<div>
									<label style="font-size: 13px; margin-top: auto; margin-bottom: 3%; margin-left: auto; margin-right: auto;">
										댓글을 작성하면 작성자에게 푸시로 알려드립니다.
									</label>
								</div>
							</div>
						</div>
						<!-- end for modal content -->
					</div>
					<!-- end for modal dialog -->
				</div>
				<!-- end for modal fade-->


				<!-- end of Container -->
				<%@ include file="../include/footer.jsp"%>
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
				
				
				
	<script>
	//페이지 세팅을 위한 페이징 처리 함수 호출
	$(document).ready(function(){
		pagingFunc();
		$("#rowPerPage").change(function(){
			pagingFunc();
		});
		//목록에서 별점 뿌려주기
		var starRevPoint = $('.minwoo_starRev');
		starRevPoint.each(function(){
			var targetScore = $(this).attr('data-rate');
			console.log(targetScore);
			$(this).find('span:nth-child(-n+'+ targetScore +')').parent().children('span').removeClass('on');
			$(this).find('span:nth-child(-n+'+ targetScore +')').addClass('on').prevAll('span').addClass('on');
		});
	});
		
	var writerSeq =	"${writer_login.writerSeq}";
	
	console.log(writerSeq);

	
	//페이지 시작하면 처음 보여주면서 처리해야할 기능
    //페이징 처리를 위한 스크립트
	var reviewResult = new Array();
	var searchResult = new Array(); // 검색 결과물 담을 배열
	var searchCheck = false; // 검색어로 들어온 결과인지 아닌지
	var result = new Array();
	
    <c:forEach var="i" items='${reviewList}'>
       var json = new Object();//객체로 배열에 담기
       json.reviewCodeSeq = '${i.reviewCodeSeq}';
       json.buyArtCodeSeq = '${i.buyArtCodeSeq}';
       json.memberCodeSeq = '${i.memberCodeSeq}';
       json.artCodeSeq = '${i.artCodeSeq}';
       json.reviewDate = '${i.reviewDate}';
       json.reviewComment = `${i.reviewComment}`;
       json.reviewStar = '${i.reviewStar}';
       json.reviewPhoto = '${i.reviewPhoto}';
       json.reviewCommentRe = `${i.reviewCommentRe}`;
       json.reviewCommentReStatus = '${i.reviewCommentReStatus}';
       json.artName = '${i.artName}';
       json.memberName = '${i.memberName}';
       json.memberProfile = '${i.memberProfile}';
       json.artPhoto = '${i.artPhoto}';
       reviewResult.push(json);
    </c:forEach>
	//전체 데이터에서, 카테고리 설정 했을 때&검색했을때 데이터에 따라 페이징이 바뀌어야 하므로 이 배열을 가공한 다른 배열들이 필요하다.
	
	//검색 기능
	var search = function(){//눌렀다 때서 안되나보다
		searchResult = [];
	
    	var k = $("#search_box").val();
    	if(!k == ""){
    		for(var i=0; i < reviewResult.length; i++){
    			if(reviewResult[i].artName.includes(k)){
    				searchResult.push(reviewResult[i]);
    			}
    		}
    		searchCheck = true;
    	} else{
    		searchCheck = false;
    	}
		//검색 매소드가 실행 될 때 검색하는 데이터 영역이 pagingFunc()를 실행하고 난 다음 얻어진 데이터 영역이므로 카테고리를 지정하더라도 result에 값이 있으므로 false로 넘어간다.
		pagingFunc();
	};
	
	
	// 초기 테이블 보여줄 행 카운트값 설정
	var pageCount = 10;
	
	//페이징 처리 함수..
	var pagingFunc = function(){
		result = [];
			
		if(searchCheck) {
			result = searchResult;
		} else {
			result = reviewResult;
		}
		
		var pageCount = 10; // 한 페이지에 보여질 개수
		var blockCount = 5; // 페이지 몇개를 하나의 그룹(?)으로 묶은  정의하는 블럭 개수
		var totalPage = Math.ceil(result.length / pageCount); // 총 페이지가 몇개 나올지 - 총 입력된 데이터의 개수에서 한페이지에 보여줄 글 목록 개수로 나눴다.
		var totalBlock = Math.ceil(totalPage / blockCount); // 총 블럭 개수가 몇개 나올지
		var pagination = document.getElementById('pagination');//페이징 기능 들어갈 영역(테이블 영역 아래)
		var testTable = document.getElementById('reviewTable').querySelector("tbody");//페이징 처리를 하면 표시될 데이터가 들어갈 테이블영역
		
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
			for(var index = startNum; index < endNum; index++){
				/*후기 사진 주소 자르기*/
				var photo1 = result[index].reviewPhoto.split(',')[0];
				var photo2 = result[index].reviewPhoto.split(',')[1];
				var photo3 = result[index].reviewPhoto.split(',')[2];
				var photo4 = result[index].reviewPhoto.split(',')[3];
				var photo5 = result[index].reviewPhoto.split(',')[4];
				
				var artImage = result[index].artPhoto.split(',')[0];
				
				if(result[index].memberProfile == ""){
					memberProfilePhoto = 'test.png';
				} else {
					memberProfilePhoto = result[index].memberProfile;
				}
				
		  		html += '<tr><td>' + result[index].reviewDate
					+ '</td><td>' + result[index].artName
					+ '</td><td><div class=\"senderArea\"><img class=\"photo\" src="/bomulsum/upload/' + memberProfilePhoto + '\">'
					+ '&nbsp;&nbsp;' + result[index].memberName
					+ '</div></td>'
					+ '<td><div class=\"minwoo_starRev\" data-rate=\"' + result[index].reviewStar + '\">'
					+ '<span class=\"minwoo_starR1\">별1_왼쪽</span> <span class=\"minwoo_starR2\">별1_오른쪽</span>'
					+ '<span class=\"minwoo_starR1\">별2_왼쪽</span> <span class=\"minwoo_starR2\">별2_오른쪽</span>'
					+ '<span class=\"minwoo_starR1\">별3_왼쪽</span> <span class=\"minwoo_starR2\">별3_오른쪽</span>'
					+ '<span class=\"minwoo_starR1\">별4_왼쪽</span> <span class=\"minwoo_starR2\">별4_오른쪽</span>'
					+ '<span class=\"minwoo_starR1\">별5_왼쪽</span> <span class=\"minwoo_starR2\">별5_오른쪽</span>'
					+ '</div></td><td><div class="review_photo_td">'
					+ '<div class=\"review_photo\" style=\"background-image:url(\'/bomulsum/upload/' + photo1 + '\')\">'
					//+ '<img src="/bomulsum/upload/' + photo1 + '">'
					+ '</div>'
					+ '<div class=\"review_photo\" style=\"background-image:url(\'/bomulsum/upload/' + photo2 + '\')\"></div>'
					+ '<div class=\"review_photo\" style=\"background-image:url(\'/bomulsum/upload/' + photo3 + '\')\"></div>'
					+ '<div class=\"review_photo\" style=\"background-image:url(\'/bomulsum/upload/' + photo4 + '\')\"></div>'
					+ '<div class=\"review_photo\" style=\"background-image:url(\'/bomulsum/upload/' + photo5 + '\')\"></div>'
					+ '</div></td><td><div data-toggle=\"modal\" data-target=\"#staticBackdrop2\" class=\"openUpdateModal\">' + result[index].reviewComment
					+ '</div></td><td style=\"display:none;\">' + result[index].reviewCodeSeq
					+ '</td><td style=\"display:none;\">' + result[index].memberCodeSeq
					+ '</td><td style=\"display:none;\">' + result[index].artCodeSeq
					+ '</td><td style=\"display:none;\">' + result[index].reviewCommentRe
					+ '</td><td style=\"display:none;\">' + result[index].reviewCommentReStatus
					+ '</td><td style=\"display:none;\">' + result[index].reviewStar
					+ '</td><td style=\"display:none;\">' + result[index].memberProfile
					+ '</td><td style=\"display:none;\">' + artImage
					+ '</td></tr>';
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
				paginationHTML += (parseInt(page) === parseInt(index)) ? " <a style='color:#ff8400'>" + index + "</a> " :" <a style='cursor:pointer' class='go_page' data-value='" + index + "'>" + index + "</a> ";
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
			
		
		//모달
		//글 제목 눌럿을 때 모달 띄워주기 위해 값 넣기
		var modalMemberName;
		var modalMemberProfile;
		var modalReviewComment;
		var modalReviewDate;
		var modalReviewPhoto;
		var modalStarPoint;
		var modalreviewSeq;
		var modalMemberCodeSeq;
		var modalArtCodeSeq;
		var modalreviewCommentRe;
		var modalreviewCommentReStatus;
		var modalArtImage;
		var modalArtName;
		
		var modal = function(){
			//글자수 제한
			$('#reviewCommentRe').keyup(function(e) {
				var comment = $(this).val();
				$(this).height(((comment.split('\n').length + 1) * 1.5) + 'em');
				$('#counter').html(comment.length + '/1000');
			});
			$('#reviewCommentRe').keyup();
			
			//수정인지 아닌지에 따라 등록된 댓글 모달에 값 입력해주기
			modalReviewDate = $.trim($(this).closest('tr').children('td').eq(0).text());
			modalArtName = $.trim($(this).closest('tr').children('td').eq(1).text());
			modalMemberName = $.trim($(this).closest('tr').children('td').eq(2).children('div').text());
			modalReviewPhoto = $.trim($(this).closest('tr').children('td').eq(4).text()); //사진으로 바꿔줘야됨.
			modalReviewComment = $.trim($(this).closest('tr').children('td').eq(5).text());
			modalreviewSeq = $.trim($(this).closest('tr').children('td').eq(6).text());
			modalMemberCodeSeq = $.trim($(this).closest('tr').children('td').eq(7).text());
			modalArtCodeSeq = $.trim($(this).closest('tr').children('td').eq(8).text());
			modalreviewCommentRe = $.trim($(this).closest('tr').children('td').eq(9).text());
			modalreviewCommentReStatus = $.trim($(this).closest('tr').children('td').eq(10).text());
			modalStarPoint = $.trim($(this).closest('tr').children('td').eq(11).text());
			modalMemberProfile = $.trim($(this).closest('tr').children('td').eq(12).text());//사진 가져온느거 어떻게 가져오지?
			modalArtImage = $.trim($(this).closest('tr').children('td').eq(13).text());
					
			$('#counter').html(modalreviewCommentRe.length + '/1000');
			
			
			console.log('모달 맴버 이름 :' + modalMemberName);
			console.log('모달 맴버 사진 :' + modalMemberProfile);
			console.log('모달 리뷰 내용 :' + modalReviewComment);
			console.log('모달 날짜 :' + modalReviewDate);
			console.log('모달 사진 :' + modalReviewPhoto);
			console.log('모달 별점 :' + modalStarPoint);
			console.log('리뷰시퀀스 : ' + modalreviewSeq);
			console.log('리뷰맴버시퀀스 : ' + modalMemberCodeSeq);
			console.log('리뷰작품코드시퀀스 : '+ modalArtCodeSeq);
			console.log('모달리뷰코멘트스테투스 : ' + modalreviewCommentReStatus);
			console.log('모달아트이름 : ' + modalArtName);
			
			//모달에 띄워주는변수들
			$('#reviewComment').text(modalReviewComment);
			$('#reviewCommentRe').val(''); // 수정으로 들어갔을때 값이 남아있지 않게 초기화 시켜주고, 다시 불러오기
			$('#memberName1').text(modalMemberName);
			$('#reviewDate1').text(modalReviewDate);
			$('#artName').text(modalArtName);
			$('#modalMemberProfile').css({"background-image" : "url(/bomulsum/upload/" + modalMemberProfile +")"});
			$('#minwoo_modal_artImage').attr("src","/bomulsum/upload/" + modalArtImage);
			
			//모달에서 폼 으로 데이터 넘길 때 물고가야 할 것들
			$('#reviewCommentReStatus').val(modalreviewCommentReStatus);
			$('#memberCodeSeq').val(modalMemberCodeSeq);
			$('#reviewCodeSeq').val(modalreviewSeq);
			$('#writerSeq').val(writerSeq);
	
			
			switch(modalStarPoint){
				case "1" :
					$('#modalStarId1').parent().children('span').removeClass('on');
					$('#modalStarId1').addClass('on').prevAll('span').addClass('on');
					break;
				case "2" :
					$('#modalStarId2').parent().children('span').removeClass('on');
					$('#modalStarId2').addClass('on').prevAll('span').addClass('on');
					break;
				case "3" :
					$('#modalStarId3').parent().children('span').removeClass('on');
					$('#modalStarId3').addClass('on').prevAll('span').addClass('on');
					break;
				case "4" :
					$('#modalStarId4').parent().children('span').removeClass('on');
					$('#modalStarId4').addClass('on').prevAll('span').addClass('on');
					break;
				case "5" :
					$('#modalStarId5').parent().children('span').removeClass('on');
					$('#modalStarId5').addClass('on').prevAll('span').addClass('on');
					break;
				case "6" :
					$('#modalStarId6').parent().children('span').removeClass('on');
					$('#modalStarId6').addClass('on').prevAll('span').addClass('on');
					break;
				case "7" :
					$('#modalStarId7').parent().children('span').removeClass('on');
					$('#modalStarId7').addClass('on').prevAll('span').addClass('on');
					break;
				case "8" :
					$('#modalStarId8').parent().children('span').removeClass('on');
					$('#modalStarId8').addClass('on').prevAll('span').addClass('on');
					break;
				case "9" :
					$('#modalStarId9').parent().children('span').removeClass('on');
					$('#modalStarId9').addClass('on').prevAll('span').addClass('on');
					break;
				default :
					$('#modalStarId10').parent().children('span').removeClass('on');
					$('#modalStarId10').addClass('on').prevAll('span').addClass('on');
			}

			
			if(modalreviewCommentReStatus == "Y"){
				$('#reviewCommentRe').val(modalreviewCommentRe);
				$('#reviewCommentSubmit').val('수정');
				console.log("수정하러 왔습니다.")
			} else{
				$('#reviewCommentSubmit').val('등록');			
			}
	
		};
		//모달 부분 종료
		

		
	</script>
</body>
</html>