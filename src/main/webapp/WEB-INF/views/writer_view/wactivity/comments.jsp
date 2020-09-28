<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
  <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css' /> " rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<c:url value='/resources/css/sb-admin-2.min.css' /> " rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.css' /> " rel="stylesheet">

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
	max-height:40px;
	font-size: 18px;
	display:flex;
	position:relative;
	
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
	position: absolute; max-height: 40px;
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
<body>

	<c:if test="${param.check eq 3}">
		<script type="text/javascript">
			alert("댓글이 등록 되었습니다.");
			location.href = "/bomulsum/writer/activity/comments.wdo";
		</script>
	</c:if>
		<c:if test="${param.check eq 4}">
		<script type="text/javascript">
			alert("댓글이 수정 되었습니다.");
			location.href = "/bomulsum/writer/activity/comments.wdo";
		</script>
	</c:if>

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
					<h1 class="h3 mb-2 text-gray-800">댓글</h1>
					<p class="mb-4">회원분들께서 남겨주신 댓글 목록입니다.</p>

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
											<th style="width:7%">상태</th>
											<th style="width:10%">작성일자</th>
											<th style="width:10%">작성자</th>
											<th style="width:25%">위치</th>
											<th style="width:40%">내용</th>
											<th style="width:8%">답글</th>
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



	</div>
	<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->


				<!-- 모달 내용 부분 -->
				<!-- 정적 모달 내용 -->
				<div class="modal fade" id="staticBackdrop" data-backdrop="static"
					tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">댓글 작성</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<!-- 댓글 작성할 영역 -->
							<div class="modal-footer" style="display: flex; flex-direction: column;">
								<div style="display: flex; flex-direction: row; width: 100%;">
									<!-- 폼 액션 넣기 -->
									<form action="<c:url value='/writer/activity/addReComment.wdo'/> " method="post"
										style="display: flex; flex-direction: row; width: 100%;">
										<div class="textwrap" style="display: flex; width: 85%;">
											<textarea id="comment_recomment" name="comment_recomment" placeholder="댓글을 남겨 주세요."
												maxlength="1000" style="width: 100%; resize: none; font-size: 13px"></textarea>
											<span id="counter" style="display: flex; margin-left:5px; align-items:center;">###</span>
										</div>
										<div style="width: 10%; margin-left: 2%">
											<input type="hidden" id="writer_code_seq" name="writer_code_seq">
											<input type="hidden" id="comment_seq" name="comment_seq">
											<input type="hidden" id="comment_status" name="comment_status">
											<input type="hidden" id="member_code_seq" name="member_code_seq">											
											<input type="submit" id="comment_submit" name="comment_submit" class="btn btn-primary" value="등록">
										</div>
									</form>
								</div>
								<div>
									<label
										style="font-size: 13px; margin-top: auto; margin-bottom: 3%; margin-left: auto; margin-right: auto;">댓글을
										작성하면 작성자에게 푸시로 알려드립니다.</label>
								</div>
							</div>
						</div>
						<!-- end for modal content -->
					</div>
					<!-- end for modal dialog -->
				</div>
				<!-- end for modal fade-->
				<!-- end of Container -->
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


				<!-- Page level plugins -->
				<script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.min.js'/>"></script>
				<script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
				
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
				
				
				
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
		var commentsResult = new Array();
		var result = new Array();
		
	    <c:forEach var="i" items='${commentsList}'>
	       var json = new Object();//객체로 배열에 담기
	       json.comment_seq = '${i.comment_seq}';
	       json.member_name = '${i.member_name}';
	       json.art_name = '${i.art_name}';
	       json.comment_content = `${i.comment_content}`;
	       json.comment_status = '${i.comment_status}';
	       json.comment_date = '${i.comment_date}';
	       json.comment_recomment = '${i.comment_recomment}';
	       json.comment_recomment_date = '${i.comment_recomment_date}';
	       json.writer_code_seq = '${i.writer_code_seq}';
	       json.member_code_seq = '${i.member_code_seq}';
	       json.member_profile = '${i.member_profile}';
	       commentsResult.push(json);
	    </c:forEach>
		//전체 데이터에서, 카테고리 설정 했을 때&검색했을때 데이터에 따라 페이징이 바뀌어야 하므로 이 배열을 가공한 다른 배열들이 필요하다.
		
		var pageCount = 10; // 한 페이지에 보여질 개수
		
		var pagingFunc = function(){

			result = commentsResult;

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
				for(var index = startNum; index < endNum; index++){
					var reStatus1 = '미답변'
					var reSattus2 = '등록'
					if(result[index].comment_status == "Y"){
						reStatus1 = '답변 완료'
						reSattus2 = '수정'
						//${"recommentBtn"}.prop("disabled", true);
					}
					var reArtName = result[index].art_name;
					if(reArtName == ''){
						reArtName = '삭제된 작품입니다.'
					}
					if(result[index].memberProfile == ""){
						memberProfilePhoto = 'test.png';
					} else {
						memberProfilePhoto = result[index].memberProfile;
					}
			  		html += '<tr><td>' + reStatus1 + '</td>'
			  			+ '<td>' + result[index].comment_date + '</td>'
			  			+ '<td><div class=\"senderArea\"><img class=\"photo\" src="/bomulsum/upload/' + memberProfilePhoto + '\"'
			  			+ '\">&nbsp;&nbsp;' + result[index].member_name + '</div></td>'
			  			+ '<td>' + reArtName  + '</td>'
			  			+ '<td>' + result[index].comment_content + '</td>'
			  			+ '<td>'
						+ '<button name=\"recommentBtn\" data-toggle=\"modal\" data-target=\"#staticBackdrop\" class=\"btn btn-primary\">'
						+ reSattus2 + '</button></td>'
						+ '<td style="display:none;">' + result[index].comment_seq + '</td>'
						+ '<td style="display:none;">' + result[index].comment_recomment + '</td>'
						+ '<td style="display:none;">' + result[index].comment_status + '</td>'
						+ '<td style="display:none;">' + result[index].member_code_seq + '</td></tr>';
				}
				testTable.innerHTML = html;
				$("button[name=recommentBtn]").on('click',modal);
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
		
		
		//모달
		//글 제목 눌럿을 때 모달 띄워주기 위해 값 넣기
	var seq;
	var recomment;
	var status;
	
	var modal = function(){
		//글자수 제한
		$('#comment_recomment').keyup(function(e) {
			var comment = $(this).val();
			$(this).height(((comment.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html(comment.length + '/1000');
		});
		$('#comment_recomment').keyup();
		
		//수정인지 아닌지에 따라 등록된 댓글 모달에 값 입력해주기
		seq = $.trim($(this).closest('tr').children('td').eq(6).text());
		recomment = $.trim($(this).closest('tr').children('td').eq(7).text());
		status = $.trim($(this).closest('tr').children('td').eq(8).text());
		memberSeq = $.trim($(this).closest('tr').children('td').eq(9).text());
		$('#counter').html(recomment.length + '/1000')
		
		console.log(seq);
		console.log(recomment);
		console.log(writerSeq);
		console.log(memberSeq);
		
		$('#comment_recomment').val('');
		$('#comment_seq').val(seq);
		$('#comment_status').val(status);
		$('#writer_code_seq').val(writerSeq);
		$('#member_code_seq').val(memberSeq);
		
		if(status == "Y"){
			$('#comment_recomment').val(recomment);
			$('#comment_submit').val('수정');
			
			console.log("수정하러 왔습니다.")
		}

	};
	//모달 부분 종료

	</script>
		
</body>
</html>