<%@page import="com.web.bomulsum.writer.login.repository.WriterRegisterVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
   <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>
<style>
* {
font-family: 'Noto Sans KR', sans-serif;
}

.dndud_name_count {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.dndud_count_num {
	padding: 0 5px;
	background-color: #E74A3B;
	color: white;
	border-radius: 50%;
}

#message_count_all {
	display: none;
}
</style>
<body>
	

		<!-- Main Content -->
			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				<div style="float:left">
					작가
				</div>
				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Topbar Search -->
				<form
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<!-- <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2"> -->
						<div class="input-group-append">
							<!-- 
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
               -->
						</div>
					</div>
				</form>

				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - Search Dropdown (Visible Only XS) -->
					<li class="nav-item dropdown no-arrow d-sm-none"><a
						class="nav-link dropdown-toggle" href="#" id="searchDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
					</a> <!-- Dropdown - Messages -->
						<div
							class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
							aria-labelledby="searchDropdown">
							<form class="form-inline mr-auto w-100 navbar-search">
								<div class="input-group">
									<input type="text" class="form-control bg-light border-0 small"
										placeholder="Search for..." aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div></li>

					<!-- 계정 정보 -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span style="font-size: 13px">${sessionScope.writer_login.writerName } 님</span>
					</a> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="<c:url value='/view/waccount/myInformation.jsp'/>"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내정보
							</a> <a class="dropdown-item" href="<c:url value='/view/waccount/salsePolicy.jsp'/>"> <i
								class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 판매정책
							</a> <a class="dropdown-item" href="<c:url value='/view/waccount/writerProfile.jsp'/>"> <i
								class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 작가 프로필
							</a>
							<!--<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">-->
							
							<a class="dropdown-item" href="<c:url value='/view/waccount/gemPoint.jsp'/>"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								젬 포인트
							</a> 
							<a class="dropdown-item" data-toggle="modal"
								data-target="#logoutModal"> <!--  <a class="dropdown-item" href="#"> -->
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								Logout
							</a>
						</div></li>

					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- 상점 아이콘 -->
					<li class="nav-item dropdown no-arrow mx-1"><a
						class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
						> <i class="fas fa-store"></i> 
						<!-- 판매자 페이지 작가 홈으로 -->
						</a> 
					</li>

					<!-- 알림 아이콘 -->
					<li class="nav-item dropdown no-arrow mx-1"><a
						class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
							<span class="badge badge-danger badge-counter">3+</span>
					</a> <!-- 알림 아이콘 메뉴창 -->
						<div
							class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="alertsDropdown">
							<h6 class="dropdown-header">알림 머리글</h6>
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-primary">
										<i class="fas fa-file-alt text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">1</div>
									<span class="font-weight-bold">첫번쨰</span>
								</div>
							</a> <a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-success">
										<i class="fas fa-donate text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">2</div>
									두번쨰
								</div>
							</a> <a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-warning">
										<i class="fas fa-exclamation-triangle text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">3</div>
									세번째
								</div>
							</a> <a class="dropdown-item text-center small text-gray-500"
								href="<c:url value='/view/wactivity/alarm.jsp'/>">전체 알림 보기</a>
						</div></li>

					<!-- 메세지 아이콘 -->
					<li class="nav-item dropdown no-arrow mx-1">
						<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
							<i class="fas fa-envelope fa-fw"></i> <!-- Counter - Messages -->
							<span id="message_count_all" class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
						<div id="message_drop_down_div" class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="messagesDropdown">
							<!-- 메시지 내부 내용. -->
						</div>
					</li>

					<!-- 물음표 아이콘 -->
					<li class="nav-item dropdown no-arrow mx-1"><a
						class="nav-link dropdown-toggle" href="<c:url value='/view/wother/tables.jsp'/>" id="alertsDropdown"
						role="button"> <i class="fas fa-question-circle"></i>
					</a></li>

					<div class="topbar-divider d-none d-sm-block"></div>

				</ul>



			</nav>

			<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">현재 세션을 종료 하시려면 Logout을 선택하세요</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">Cancel</button>
							<a class="btn btn-primary" href="<c:url value='/writer/logout.wdo'/>">Logout</a>
						</div>
					</div>
				</div>
			</div>

	<!-- Logout Modal-->


</body>

<script>
	<% WriterRegisterVO headvo = (WriterRegisterVO)session.getAttribute("writer_login"); %>
	code = '<%= headvo.getWriterSeq() %>';
	var timeCon = null;
	$(function(){
		var reload = function(){
			$.ajax({
				url:"/bomulsum/writer/message/head/reload.wdo",
				data:{
					code:code
				},
				success : function(data){
					var countNum=0;
					var htmlTag = '<h6 class="dropdown-header">메시지</h6>';
					for(var i=0; i<data.length; i++){
						var imgTag='';
						if(data[i].writerImg == null){
							imgTag = `/bomulsum/resources/img/Logo_blue.png`;
						}else{
							imgTag = '/bomulsum/upload/'+data[i].writerImg;
						}
						
						var msg = '';
						var date = '';
						if(data[i].lastMessage != null){
							var msgArray = data[i].lastMessage.split('*|*');
							msg = msgArray[0];
							date = msgArray[1].split(' ')[0];
						}
						
						htmlTag += '<a class="dropdown-item d-flex align-items-center" href="/bomulsum/writer/message.wdo?member='+ data[i].memberCode +'">'
							+ '<div class="dropdown-list-image mr-3"><img class="rounded-circle"'
							+ ' src="'+ imgTag +'" alt=""><div class="status-indicator bg-success"></div>'
							+ '</div><div style="width:100%;"><div class="text-truncate">'+ msg +'</div>'
							+ '<div class="small text-gray-500 dndud_name_count">' + data[i].memberName +'|'+ date;
						
						if(data[i].nonReadMsgCount > 0){
							htmlTag += '<span class="dndud_count_num">'+ data[i].nonReadMsgCount +'</span>';
						}
						htmlTag += '</div></div></a>';
						
						countNum += data[i].nonReadMsgCount;
					}
					
					htmlTag += '<a class="dropdown-item text-center small text-gray-500"'
						+ ' href="/bomulsum/writer/message.wdo">전체 메세지 보기</a>';
						
					$('#message_drop_down_div').html(htmlTag);
					
					if(countNum > 0){						
						$("#message_count_all").css('display','block');
						$("#message_count_all").text(countNum);
					}else{
						$("#message_count_all").css('display','none');
					}
					
				},
				error: function(err){
				}
			});
			
		};
		timeCon = setInterval(reload, 1000);
	});
</script>
</html>