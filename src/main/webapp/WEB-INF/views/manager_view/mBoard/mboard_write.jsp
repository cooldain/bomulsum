<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="">

<title>보물섬(관리자) | 게시판 글 등록</title>

		<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
		<link href="<c:url value='/resources/css/summernote/summernote-lite.css'/>" rel="stylesheet" type="text/css">  

<!-- Custom fonts for this template-->
<link
	href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.css'/>"
	rel="stylesheet">


<style>
#content{
	width:100%;
}
.minwoo_mboard_btn {
	height: 40px;
	width: 50px;
	background-color: #5179f9;
	color: white;
	border: 1px solid #5179f9;
	font-size: 15px;
	font-weight: bold;
	border-radius: 5px;
}
</style>


</head>

<body id="page-top">

	
	<c:if test="${param.check eq 1}">
		<script type="text/javascript">
			alert("글이 등록 되었습니다.");
			location.href = "/bomulsum/manager/mboard/write.mdo";
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
					<h1 class="h3 mb-2 text-gray-800">게시판 글 등록</h1>
					<p class="mb-4">회원 / 작가들을 위한 안내를 등록하는 페이지 입니다.</p>

					<!-- 글 작성 페이지 -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">글 등록</h6>
						</div>
						<div class="card-body">
							<!--날짜값도 히든으로 같이 넣어줘야 합니당-->
							<form id="mboardWrite" action="<c:url value='/manager/mboard/register.mdo'/> " method="post">
								<div>
									<!--
									<br>
									 -->
									<div>
										<span style="display:inline-block; width:100px;">글 카테고리</span>
										<span>:&nbsp;&nbsp;</span>
										<span style="display:inline-block; width:250px;">
										<!-- man_type에 하위 메뉴 하단 스크립트 '셀렉트박스 옵션' 참조 -->
										<select name="adminNoticeCategory" id="admin_notice_category">
											<option value="0">---------------------------</option>
											<option value="이벤트">이벤트</option>
											<option value="회원용-공지사항">회원용-공지사항</option>
											<option value="회원용-자주묻는질문">회원용-자주묻는질문</option>
											<option value="작가용-공지사항">작가용-공지사항</option>
											<option value="작가용-자주묻는질문">작가용-자주묻는질문</option>
											<option value="작가용-정책등록가이드">작가용-정책등록가이드</option>	
										</select>
										</span>
									</div>
									<br>
									
									<!-- |회원-이벤트| 카테고리 선택 되었을 때 쿠폰 입력창 나타나게 -->
									<div id="board_type_div" style="display:none;">
										<div>
											<span style="display:inline-block; width:100px;">쿠폰 등록</span> 
											
										</div>
										<div style="margin-bottom:10px;">
											<span style="display:inline-block; width:100px;">쿠폰 이름</span>
											<span>:&nbsp;&nbsp;</span>
											<span><input type="text" style="width: 300px;" name="adminNoticeCoupon"></span>
											<br>
										</div>
										<div style="margin-bottom:10px;">
											<span style="display:inline-block; width:100px;">쿠폰 내용</span>
											<span>:&nbsp;&nbsp;</span>
											<span><input type="text" style="width: 300px;" name="adminNoticeCoupon"></span>
											<br>
										</div>
										<div>
											<span style="display:inline-block; width:100px;">쿠폰 가격</span>
											<span>:&nbsp;&nbsp;</span>
											<span><input type="text" style="width: 300px;" name="adminNoticeCoupon" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" /></span>
										</div>
									<br>
									</div>
									
				
									<div>
										<span style="display:inline-block; width:100px;" >글 제목</span>
										<span>:&nbsp;&nbsp;</span>
										<span><input type="text" style="width:90%;" name="adminNoticeTitle" id="admin_notice_title"></span>
									</div>
									<br>
									<div>
										<span style="display:inline-block; width:100px;">글 내용</span>
										<br>
										<textarea id="summernote" name="adminNoticeContent"></textarea>
									</div>
									<br>
									<div style="width:100%; display:flex; justify-content: center;">
										<input type="submit" value="글 등록" class="btn btn-primary" id="submit" style="margin:10px;">
									</div>
								</div>
								
							</form>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
				<!--민우 내용 추가한 부분 종료-->

			</div>
			<!-- main content -->
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		
		<%@ include file="../include/mfooter.jsp" %>
		
		

		<!-- Bootstrap core JavaScript-->
		<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
		<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

		<!-- Core plugin JavaScript-->
		<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

		<!-- Custom scripts for all pages-->
		<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>

		<!-- Page level plugins -->
		<script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.min.js'/>"></script>
		<script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>

		<!-- Page level custom scripts -->
		<script src="<c:url value='/resources/js/demo/datatables-demo.js'/>"></script>


	
		<script src="<c:url value='/resources/js/summernote/lang/summernote-ko-KR.js'/>"></script>
		<script src="<c:url value='/resources/js/summernote/summernote-lite.js'/>"></script>
		
		
		
		<script>
		
		/*셀렉트 박스 영역*/
		
		/* 이벤트 버튼 눌럿을 때 버튼 생성하기*/
		$('#submit').click(function(){
				if($('#admin_notice_category').val() == 0){
					alert("카테고리를 선택해주세요");
					$('#admin_notice_category').focus();
					return false;
				} else if($('#admin_notice_title').val() == ""){
					alert("제목을 입력해주세요");
					$('#admin_notice_title').focus();
					return false;
				} else if($('#summernote').val() == ""){
					alert("내용을 입력해주세요");
					$('#summernote').focus();
					return false;
				}
					$('#mboardWrite').submit();
			});
		
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 350, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR",
				placeholder : ""//placeholder 설정
			});
	      
			$("#admin_notice_category").click(function(){
				if($("#admin_notice_category").val() == ("이벤트")){
					$("#board_type_div").css("display", "inline-block");
				} else {
					$("#board_type_div").css("display", "none");
				}
			});
	   });
		
		</script>
		
		
		
</body>

</html>