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

  <title>보물섬(관리자)| sideBar</title>

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
</head>

<body id="page-top">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href='<c:url value="/home.mdo	" />'>
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">관리자</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Divider -->
      <hr class="sidebar-divider">


      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>게시판</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<c:url value='/manager/mboard/list.mdo'/>">게시판 목록</a>
            <a class="collapse-item" href="<c:url value='/manager/mboard/write.mdo'/>">게시판 등록</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#salseNcoupone" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>매출</span>
        </a>
        <div id="salseNcoupone" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href='<c:url value="/manager/statistics.mdo"/>'>매출통계</a>
          </div>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#memberList" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>회원관리</span>
        </a>
        <div id="memberList" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<c:url value='/manager/list/writer.mdo'/>">작가목록</a>
            <a class="collapse-item" href="<c:url value='/manager/list/user.mdo'/>">회원목록</a>
            <a id="send_writer_indo" class="collapse-item" href="#">신규 작가 문자 발송</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#productManage" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>상품관리</span>
        </a>
        <div id="productManage" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="<c:url value='/manager/manage/art.mdo'/>">작품</a>
            <a class="collapse-item" href="<c:url value='/manager/manage/class.mdo'/>">금손클래스</a>
          </div>
        </div>
      </li>
      <li class="nav-item">
        <a target="_blank" class="nav-link" href="https://docs.google.com/spreadsheets/d/1I7RKP6I-U5gq5FKpozz443OiiR6VWn2A6vLBWDUCUHk/edit#gid=1048892739">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>작가 입점 문의 확인하기</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>

    <!-- End of Sidebar -->

</body>
<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#send_writer_indo').on('click', function(){
			var phone = prompt('전송할 번호를 입력하세요.', '');
			var regNumber=/^[0-9]*$/;
			if(regNumber.test(phone) && phone.length<=11 && phone.length>=10){
				
				var writerurl = 'http://ec2-15-165-203-41.ap-northeast-2.compute.amazonaws.com/bomulsum/writer/home.wdo';
				var sendMsg = "[보물섬] 작가 입점 테스트에 성공적으로 통과되었습니다. \n작가 홈페이지 경로 : " + writerurl
					+ "\n입점 문의하실떄 사용한 정보로 회원가입을 새로 해주시기 바랍니다.";
				
				$.ajax({
					url : "/bomulsum/user/smsCheck.do",
					data:{
						msg : sendMsg,
						receiver : phone
					},
					success:function(e){
						alert('성공적으로 전송되었습니다.');
					}
				});
			}else{
				alert('번호를 확인해주세요');
				return;
			}
		});
		
	});
</script>
</html>