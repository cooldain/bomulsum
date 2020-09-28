<%@page
	import="com.web.bomulsum.writer.login.repository.WriterRegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
<!-- <script src="http://localhost:82/socket.io/socket.io.js"></script> -->
<!--
아마존 
 -->
<script src="http://ec2-15-165-203-41.ap-northeast-2.compute.amazonaws.com:82/socket.io/socket.io.js"></script> 

<style>
.dndud_writer_message_who_text {
	max-width: 250px;
	min-width: 250px;
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
	text-overflow: ellipsis;
}

::-webkit-scrollbar {
	width: 6px;
}

::-webkit-scrollbar-track {
	background-color: transparent;
}

::-webkit-scrollbar-thumb {
	border-radius: 3px;
	background-color: gray;
}

::-webkit-scrollbar-button {
	width: 0;
	height: 0;
}

.dndud_user_list{
	margin-bottom:5px; 
	color:#4e73df; 
	font-weight:bold; 
	border-bottom:1px solid #d9d9d9;
}

.dndud_user_div{
	height:60px;
	padding:5px 0;
	width:100%;
	display:flex;
	flex-direction:row;
	align-items: center;
	cursor:pointer;
}	

.dndud_user_div:hover{
	background-color: #cce5ff;
}

.dndud_user_img img{
	width:50px;
	height:50px;
	border-radius: 50%;
}

.dndud_user_name{
	height:50px;
	margin-left:15px;
    display: flex;
    align-items: center;
}

.dndud_user_big_div{
	width:95%; 
	height:200px; 
	overflow-y: auto;
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
	background-color: #f7f7f7;
}

.dndud_user_big_div::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}

.dndud_chatroom_div{
	display: flex; 
	flex-direction: row; 
	height: 100px;
}

#nowChatDiv{
	height:5%;
	display:none;
    background-color: white;
    color: #4e73df;
    font-weight: bold;
}

#nowChatMember{
	color:#333;
}

.delete_check_div{
	display:flex; 
	align-items: center; 
	justify-content: center; 
	width:100px;
	cursor:pointer;
}

.messageList{
	cursor:pointer;
}

.dndud_chat_nonRead{
	padding: 2px 5px;
    font-size: 10px;
    color: white !important;
    background-color: #1F76BB;
    border: #1F76bb;
    border-radius: 50%;
    position: absolute;
    transform: translateX(1550%);
}

</style>




<meta charset="UTF-8">
<title>메세지리스트</title>
<link
	href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>"
	rel="stylesheet">
</head>
<body id="page-top">
	<div id="wrapper">
		<!-- Header/Nav -->
		<%@ include file="../include/side.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<%@ include file="../include/head.jsp"%>
			<!-- end Header/Nav -->
			<div id="content">






				<div style="display: flex; flex-direction: row; height: 750px;">
					<div
						style="width: 30%; border-right: 1px black solid; padding: 1%;">
						<div
							style="display: flex; flex-direction: row; width: 100%; align-items: center;">
							<!-- 메세지 / 설정 -->
							<p style="margin: 0">메세지</p>
							<input data-toggle="modal" data-target="#staticBackdrop"
								style="margin-left: 45%; width: 18%; font-size: 100%;"
								type="submit" value="추가"> <input id="delete_chat_button"
								style="margin-left: 4%; width: 18%; font-size: 100%;"
								type="submit" value="나가기">
						</div>
						<hr>
						<!-- ======================== -->
						<div id="dndud_chatroom_div_list" style="overflow-y: auto; height: 640px;">
							<!-- 한 명 시작 -->
							<c:forEach var ="chat" items="${chatRoom}">
								<div class="dndud_chatroom_div">
									<!--for문자리-->
									<!-- 메세지 리스트 -->
									<div style="width: 30%; display: flex;" class="messageList">
										<!-- 이미지 -->
										<a>
											<c:choose>
												<c:when test="${not empty chat.memberImg}">
													<img style="width: 90px; height: 90px;" name="uProfile"src="<c:url value='/upload/${chat.memberImg }'/>">												
												</c:when>
												<c:otherwise>													
													<img style="width: 90px; height: 90px;" name="uProfile"src="<c:url value='/resources/img/Logo_blue.png'/>">												
												</c:otherwise>
											</c:choose>
										</a>
									</div>
									<div>
										<c:if test="${chat.nonReadMsgCount > 0}">
											<a class="dndud_chat_nonRead">${chat.nonReadMsgCount }</a>
										</c:if>
										<div class="dndud_writer_message_who_text">
											<a>${chat.memberName }</a>
										</div>
										<hr>
										<div class="dndud_writer_message_who_text">
											<c:if test="${empty chat.lastMessage }">
												<a class="dndud_last_msg"></a>
											</c:if>
											<c:if test="${not empty chat.lastMessage }">
												<a class="dndud_last_msg">${fn:split(chat.lastMessage,'*|*')[0]}&nbsp;&nbsp;${fn:split(chat.lastMessage,'*|*')[1]}</a>
											</c:if>
										</div>
										<!--  사용자 정보 끝 -->
									</div>
									<div class="delete_check_div">
										<input type="checkbox" class="chatRoomCheckBox"> 
										<input type="hidden" class="chatRoomMemberName" value="${chat.memberName }">
										<input type="hidden" class="chatRoomMemberCode" value="${chat.memberCode }">
									</div>
								</div>
								<hr>
							</c:forEach>
							<!--for문끝-->
						</div>
						<!-- overflow 끝 -->
						<!-- 한명 끝 -->


					</div>
					<hr>



					<div
						style="width: 70%; padding: 1%; display: flex; flex-direction: column;">

						<div
							style="width: 100%; height: 620px; background-color: white; border: 1px black solid;"
							id="scroll">
							<span id="nowChatDiv">채팅중 : [ <span id="nowChatMember"></span> ]</span>
							<div id="listP"
								style="height: 95%; overflow-y: auto; display: flex; flex-direction: column;">
								<!-- 메세지 영역 -->
							</div>
						</div>
						<hr>
						<div
							style="display: flex; flex-direction: row; justify-content: space-between;">
							<textarea rows="3%" cols="120%" id="messageContent"
								style="resize: none"></textarea>
							<input style="width: 10%;" type="submit" value="입력" id="input">
						</div>
					</div>

				</div>

				<!-- 모달 내용 부분 -->
				<!-- 정적 모달 내용 -->
				<div class="modal fade" id="staticBackdrop" data-backdrop="static"
					tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">채팅 추가</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<!-- 댓글 작성할 영역 -->
							<div class="modal-footer"
								style="display: flex; flex-direction: column;">
								<div style="display: flex; flex-direction: row; width: 100%;">
									<!-- 폼 액션 넣기 -->
									<div style="padding:1%; width:98%; height:500px;">
										<p class="dndud_user_list">작품 구매한 사용자 목록</p>
										<div style="width:100%; height:465px; margin-top:5px; overflow-y:auto">
										
										<!-- 테스트용 회원 전부 -->
											<p style="margin:10px 0; font-size:15px; color:#333; font-weight:bold">테스트용</p>
											<div class="dndud_user_big_div">
												<c:forEach items="${testMember}" var="test">
													<div class="dndud_user_div">
														<input type="hidden" class="dndud_user_code" value="${test.memberCode}">
														<span class="dndud_user_img">
															<c:choose>
																<c:when test="${not empty test.memberImg}">
																	<img src="<c:url value='/upload/${test.memberImg }'/>">												
																</c:when>
																<c:otherwise>													
																	<img src="<c:url value='/resources/img/Logo_blue.png'/>">												
																</c:otherwise>
															</c:choose>
														</span>
														<span class="dndud_user_name">${test.memberName }</span>
													</div>
												</c:forEach>
											</div>
										
										<!-- 작품당 -->
											<c:forEach var="i" begin="1" end="4">
											
												<p style="margin:10px 0; font-size:15px; color:#333; font-weight:bold">작품 이름${i}</p>
												<div class="dndud_user_big_div">
												
												<!-- 사용자 -->
													<c:forEach begin="1" end="10">
														<div class="dndud_user_div">
															<span class="dndud_user_img"><img src="<c:url value='/upload/1596968210815dog.jpg'/> "/></span>
															<span class="dndud_user_name">사용자</span>
														</div>
													</c:forEach>
												<!-- 사용자 -->
												</div>
											
											</c:forEach>
										<!-- 작품당 끝 -->
										
										
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end for modal content -->
					</div>
					<!-- end for modal dialog -->
				</div>
				<!-- end for modal fade-->





				<%@ include file="../include/footer.jsp"%>
				<!-- end footer -->
				<!-- Scroll to Top Button-->
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>

				<script
					src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
				<script
					src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

				<!-- Core plugin JavaScript-->
				<script
					src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var isScrollUp = false;
	var lastScrollTop;
	var unreadCnt = 0;
	var code;
	var writer;
	var memberCode;
	var memberName;
	var socket = io("http://ec2-15-165-203-41.ap-northeast-2.compute.amazonaws.com:82");
	//var socket = io("http://localhost:82");
	
	$(document).ready(function(){
		
		var reloadFunc = function(send, receive){
			$.ajax({
				url:'/bomulsum/writer/message/reload.wdo',
				data:{
					code:send,
					memberCode:receive
				},
				success:function(suc){
					console.log('통신 성공');
					console.log(suc);
					var htmlTag='';
					for(var i=0; i<suc.length; i++){
						var imgTag;
						var lastmsg;
						console.log('membercode : ' + suc[i].memberCode);
						console.log('membername : ' + suc[i].memberName);
						if(suc[i].memberImg == null){
							imgTag = '/bomulsum/resources/img/Logo_blue.png';
						}else{
							imgTag = '/bomulsum/upload/'+suc[i].memberImg;
						}
						if(suc[i].lastMessage == null || suc[i].lastMessage == 'null'){
							lastmsg='';
						}else{
							var lastmsgArray = suc[i].lastMessage.split('*|*');
							lastmsg = lastmsgArray[0] + '&nbsp;&nbsp;' + lastmsgArray[1];
						}
						
						htmlTag += '<div class="dndud_chatroom_div"><div style="width: 30%; display: flex;" class="messageList"><img style="width: 90px; height: 90px;" name="uProfile"src="'+imgTag+'"/>'
							+ '</div><div>';
						if(suc[i].nonReadMsgCount > 0){
							htmlTag += '<a class="dndud_chat_nonRead">'+ suc[i].nonReadMsgCount +'</a>';
						}
						htmlTag += '<div class="dndud_writer_message_who_text"><a>'+suc[i].memberName+'</a></div><hr><div class="dndud_writer_message_who_text">'
							+ '<a class="dndud_last_msg">'+lastmsg+'</a></div></div><div class="delete_check_div"><input type="checkbox" class="chatRoomCheckBox">'
							+ '<input type="hidden" class="chatRoomMemberName" value='+suc[i].memberName+'><input type="hidden" class="chatRoomMemberCode" value='+suc[i].memberCode+'></div></div><hr>'
					    
					}
					
					$("#dndud_chatroom_div_list").empty();
					$("#dndud_chatroom_div_list").html(htmlTag);
					console.log(htmlTag);
				},
				error:function(err){
					console.log(err);
				}
			});
		}
		
		<%
			WriterRegisterVO vo = (WriterRegisterVO)session.getAttribute("writer_login");
		%>
		code = '<%= vo.getWriterSeq() %>';
		writer = '<%= vo.getWriterName() %>';
		console.log(code);
		
		
		socket.on(code, function(msg){
			var check = msg.split('*|*');
			if(check[0] == 'reload'){
				console.log(check[1]);
				reloadFunc(code, check[1]);
				return;
			}
			
			var msgArray = msg.split('*|*');
			
			if(memberCode != msgArray[2]) return;
			
			let day = msgArray[1];
			
			var dTag = document.createElement("div");
			var Tag = document.createElement("div");
			var tag = document.createElement('span');
			let dayTag = document.createElement('span');
			
			dayTag.innerHTML = day;
			tag.innerHTML = msgArray[0].replace(/\n/gi, '<br>');
			Tag.setAttribute('style','padding: 10px 15px; background-color: #d6e5c8;'+
				'border-radius: 0 15px 15px 15px; font-size: 14px;max-width: 50%;');
			dTag.setAttribute('style', 'padding: 1%; display:flex;flex-direction:row;'+
				'justify-content: flex-start;align-items: center;');
			
			dayTag.setAttribute('style','font-size: 60%; padding: 1%; align-self: flex-end;');
			Tag.appendChild(tag);
			dTag.appendChild(Tag);
			dTag.appendChild(dayTag);
			document.getElementById('listP').appendChild(dTag);
			
			// 소켓 연결 되어있구 메시지 올라올때 니까 디비 들어가서 상태값 바꿔주기. 
			console.log('senderCode : ' + msgArray[2]);
			console.log('receiverCode : ' + code);
			$.ajax({
				url:'/bomulsum/writer/message/updateChatStatus.wdo',
				data:{
					senderCode:msgArray[2],
					receiverCode:code
				}, 
				success: function(suc){
					console.log('소켓 연결 되어잇을때 ajax 실행 성공');
				},
				error: function(err){
					console.log('소켓 연결 되어잇을때 ajax 실행 실패');
				}
			});
			
			var objDiv = document.getElementById("listP");
			objDiv.scrollTop = objDiv.scrollHeight;
		});
	
		
		// 메시지 전송 함수.
		$('#input').click(function() {
			
			let today = new Date();
			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1; // 월
			let date = today.getDate(); // 날짜
			let hours = today.getHours(); // 시
			let minutes = today.getMinutes(); // 분
			
			var message = document
					.getElementById('messageContent').value;
			let day = month + '월' + date + "일 " + hours + ":" + minutes;
			
			var dTag = document.createElement("div");
			var Tag = document.createElement("div");
			var tag = document.createElement('span');
			let dayTag = document.createElement('span');
			
			
			if ($('#messageContent').val() == '') {
				alert('메세지를 입력해주세요');
			} else {
				dayTag.innerHTML = day;
				tag.innerHTML = message.replace(/\n/gi, '<br>');
				Tag.setAttribute('style','padding: 10px 15px; background-color: #f5eacc;' +
					'border-radius: 15px 0 15px 15px; font-size: 14px;max-width: 50%;');
				dTag.setAttribute('style', 'padding: 1%; display:flex;flex-direction:row;' +
					'justify-content: flex-end;align-items: center;');
			
				dayTag.setAttribute('style','font-size: 60%; padding: 1%; align-self: flex-end;');
				Tag.appendChild(tag);
				dTag.appendChild(dayTag);
				dTag.appendChild(Tag);
				
				$.ajax({
					url:"/bomulsum/writer/message/sendMessage.wdo",
					data:{
						messageOwner : code,
						messageSenderCode : code,
						messageReceiverCode : memberCode,
						messageContent : message + "*|*" + day
					},
					async: false,
					success : function(){
						console.log('메세지 디비 저장 성공');
					},
					fail : function(err){
						console.log(err);
					}
				});
				var count=0;
				$(".dndud_chatroom_div").each(function(){
					if($(this).find('.chatRoomMemberCode').val() == memberCode){
						$(this).find('.dndud_last_msg').html(message + '&nbsp;&nbsp;' + day);
						count++;
						return;
					}
					if(count == 1) return;
				});
				
				
				socket.emit('send_to_writer', memberCode + "*|*" + memberName + "*|*" + code + "*|*" + writer + "*|*" + message + "*|*" + day);
				socket.emit('chatroomLogic', code + '*|*' + memberCode);
				
				document.getElementById('listP').appendChild(dTag);
				$('#messageContent').val("");
			}
			
			
			var objDiv = document.getElementById("listP");
			objDiv.scrollTop = objDiv.scrollHeight;
		});
		
		$('#messageContent').keydown(function(key) {
			if (key.which == 13) {
				if (!event.shiftKey) {

					$('#input').click();
					return false;
				}
			}
			var objDiv = document.getElementById("listP");
			objDiv.scrollTop = objDiv.scrollHeight;
		});

		// 왼쪽 리스트중 하나 클릭했을경우.
		var prevMessageDiv;
		$(document).on('click', ".messageList", function(){
			if(prevMessageDiv == $(this).next().next().find('.chatRoomMemberCode').val()){
				return;
			}
			$("#listP").empty();
			$(this).next().find('.dndud_chat_nonRead').remove();
			memberCode = $(this).next().next().find('.chatRoomMemberCode').val();
			memberName = $(this).next().next().find('.chatRoomMemberName').val();
			$("#nowChatMember").html(memberName);
			$("#nowChatDiv").css('display', 'block');
			
			$.ajax({
				url:"/bomulsum/writer/message/getChatList.wdo",
				data:{
					senderCode : code,
					receiverCode : memberCode
				},
				success : function(data){
					console.log(data);
					for(var i=0; i<data.length; i++){
						if(data[i].messageSenderCode == code){
							var test = data[i].messageContent.split('*|*');
							var day = test[1];
							var message = test[0];
							var dTag = document.createElement("div");
							var Tag = document.createElement("div");
							var tag = document.createElement('span');
							let dayTag = document.createElement('span');
							dayTag.innerHTML = day;
							tag.innerHTML = message.replace(/\n/gi, '<br>');
							Tag.setAttribute('style','padding: 10px 15px; background-color: #f5eacc;' +
								'border-radius: 15px 0 15px 15px; font-size: 14px;max-width: 50%;');
							dTag.setAttribute('style', 'padding: 1%; display:flex;flex-direction:row;' +
								'justify-content: flex-end;align-items: center;');
						
							dayTag.setAttribute('style','font-size: 60%; padding: 1%; align-self: flex-end;');
							Tag.appendChild(tag);
							dTag.appendChild(dayTag);
							dTag.appendChild(Tag);
							document.getElementById('listP').appendChild(dTag);
						}else if(data[i].messageReceiverCode == code){
							var msgArray = data[i].messageContent.split('*|*');
							let day = msgArray[1];
							var dTag = document.createElement("div");
							var Tag = document.createElement("div");
							var tag = document.createElement('span');
							let dayTag = document.createElement('span');
							
							dayTag.innerHTML = day;
							tag.innerHTML = msgArray[0].replace(/\n/gi, '<br>');
							Tag.setAttribute('style','padding: 10px 15px; background-color: #d6e5c8;'+
								'border-radius: 0 15px 15px 15px; font-size: 14px;max-width: 50%;');
							dTag.setAttribute('style', 'padding: 1%; display:flex;flex-direction:row;'+
								'justify-content: flex-start;align-items: center;');
							
							dayTag.setAttribute('style','font-size: 60%; padding: 1%; align-self: flex-end;');
							Tag.appendChild(tag);
							dTag.appendChild(Tag);
							dTag.appendChild(dayTag);
							document.getElementById('listP').appendChild(dTag);
						}
					}
					var objDiv = document.getElementById("listP");
					objDiv.scrollTop = objDiv.scrollHeight;
				},
				fail : function(err){
					console.log(err);
				}
			});
			
			
			prevMessageDiv = memberCode;
		});
		
		$(".dndud_user_div").on('click', function(){
			var member = $(this).find('.dndud_user_code').val();
			
			$.ajax({
				url:"/bomulsum/writer/message/insertChat.wdo",
				data:{
					memberCode : member
				},
				success : function(data){
					if(data == 'success'){
						console.log('저장 성공');
					}else{
						alert('존재하는 채팅방 입니다.');
					}
					history.go(0);
				},
				fail : function(err){
					console.log(err);
				}
			});
		});
		
		$(".delete_check_div").on('click', function(){
			$(this).find('.chatRoomCheckBox').prop('checked', !$(this).find('.chatRoomCheckBox').is(':checked'));
		});
		
		$('#delete_chat_button').on('click', function(){
			var result = confirm('정말 나가시겠습니까?\n(대화 내용은 유지됩니다.)');
			if(result){
				var arr = [];
				$('.chatRoomCheckBox:checked').each(function(){
					arr.push($(this).next().next().val());
				});
				
				$.ajax({
					url:"/bomulsum/writer/message/extiChat.wdo",
					data:{
						"memberCode" : arr,
						"writerCode" : code
					},
					success : function(){
						console.log('나가기 성공');
						history.go(0);
					},
					fail : function(err){
						console.log(err);
					}
				});
			}
		});
		
	
		
	});
</script>
<script>
function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
</script>
<script>
var chatroomMemberCode = getParameter('member');
$(document).ready(function(){
	$('.chatRoomMemberCode').each(function(){
		if($(this).val() == chatroomMemberCode){
			$(this).parent().prev().prev().trigger('click');
		}
	});
});
</script>
</html>