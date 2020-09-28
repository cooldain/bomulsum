<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"
   type="text/css">
<meta charset="UTF-8">
<title>보물섬|메세지</title>
<!-- <script src="http://localhost:82/socket.io/socket.io.js"></script> -->
<!--
아마존  -->

<script src="http://ec2-15-165-203-41.ap-northeast-2.compute.amazonaws.com:82/socket.io/socket.io.js"></script> 

<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>

<style type="text/css">
#wonTotal {
	padding: 1px;
	height: 750px;
}

#wonHeader {
	margin-left: 25%;
	margin-right: 50%;
	height: 100%;
	width: 50%;
	display: flex;
	flex-direction: row;
	
}
.wonHeaderDiv1{
	display: flex;
	flex-direction: row;
	width: 100%;
	height: 10%;
	justify-content: space-between;
	
}

#wonHp {
	font-size: 130%;
	width: 35%;
	text-align: center;
	font-weight:bold;
}
#wonHa {
	padding: 2%;
	font-size: 150%;
	width: 30%;

	}
#wonImg{
	padding: 15%;
	width: 50%;
	height: 50%;
	align-content: center;
}
.wonHeaderDiv2{
	height: 88%;
	width: 100%;
}
#wonMenu{
	height: 100%;
	width: 30%;
    border-right: 1px solid #d8d8d8;
}
#wonContent{
	display:none;
	height:100%;
	width: 70%
}
#wonContentImg{
	height:50px;
	width: 50px;
	border-radius: 50%;
}

#divButton:hover{
	background-color: blue;
}
#divButton{
	cursor:pointer;
}
.messageUserList{
	border: none;
	cursor: pointer;
	padding:3%; 
	display: flex; 
	flex-direction: row; 
	align-items: center; 
	border-color: white;
	border-bottom: 1px #D8D8D8 solid;
}

.messageUserList--selected{
	border: none;
	cursor: pointer;
	padding:3%; 
	display: flex; 
	flex-direction: row;
	background-color: #d9d9d9;
	align-items: center; 
	border-color: white;
	border-bottom: 1px #D8D8D8 solid;
}

.wonMessagebutton1{
	display: flex;
	border:none;
	cursor:pointer;
    padding: 15px;
}

.wonMessagebutton1:hover{
	background-color: #81BEF7;
}
.wonMessagebutton2{
	display: flex;
	border:0;
	outline:0;
	cursor:pointer;
	justify-content: center;
}

.wonMessagebutton2:hover{
	background-color: #81BEF7;
}

.messageUserList:hover{
	background-color: #81BEF7;
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

.sendButton{
	width:15%; 
	height:100%;  
	margin:3%; 
	background-color: #FFFFFF;
	border: 1px solid #d9d9d9;
	cursor:pointer;
	padding:3%;
}

.sendButton:hover{
	background-color:#81BEF7;
}

.deleteButtonClicked a{
    font-size: 14px;
    border: 1px solid #d9d9d9;
    padding: 5px 10px;
    cursor:pointer;
}

.deleteButtonClicked a:hover{
    outline: none;
    background: #f5f5f5;
    border-color: #d9d9d9;
}

.deleteButtonClickedExit a{
	font-size: 14px;
    border: 1px solid #d9d9d9;
    padding: 5px 10px;
	margin-left:3px;
	color:white;
	background: #dd5850;
	cursor:pointer;
}

.deleteButtonClickedExit a:hover{
	background:#c74f48;
}

.dndud_content_change_head_div{
	display: none;
	flex-direction: row;
	width: 100%;
	height: 10%;
	justify-content: space-between;
	align-items: center; 
	border-bottom: 1px #D8D8D8 solid;
}

.dndud_content_change_head_div p{
	margin-left:15px;
	font-weight:bold;
	font-size:14px;
}

.dndud_content_change_main_div{
	display:none;
	flex-direction: column;
	padding:15px;
	height:86%;
	overflow-y: auto;
	background-color:#f5f5f5;
}

.dndud_content_change_main_div span{
	font-size:16px;
	font-weight:bold;
}

.dndud_content_change_main_div div{
	margin-bottom:15px;
	margin-top:15px;
}

.div_writer{
	display:flex;
	flex-direction:row;
	font-size:14px;
	align-items: center;
	cursor:pointer;
}

.div_writer img{
	width:50px;
	height:50px;
	border-radius:50%;
	margin-right:20px;
}

.dndud_content_first_main_div{
	display:flex;
	flex-direction:column;
	align-items:center;
	justify-content:center;
	height:100%;
	width: 70%;
	background-color:#f5f5f5;
	z-index: -100;
}

.dndud_content_first_main_div div{
	display:flex;
	flex-direction:column;
	align-items:center;
	justify-content:center;
}

.dndud_content_first_main_div div img{
	width:150px;
	height:120px;
	border-radius: 50%;
	margin-bottom:15px;
}

.dndud_content_first_main_div div span{
	font-size:15px;
	color: #666;
	font-weight:bold;
}

.enable{
	background-color:white;
}

.enable:hover{
	background-color: #81BEF7;
}

.able{
	background-color:#d9d9d9;
}

.dndud_chat_writer_name{
	text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    height: 22px;
    overflow-y: hidden;
    -webkit-box-orient: vertical;
}

.dndud_chat_nonRead{
	padding: 2px 5px;
    font-size: 10px;
    color: white;
    background-color: #1F76BB;
    border: #1F76bb;
    border-radius: 50%;
    display: flex;
    align-items: center;
}
</style>
</head>
<body>
<div>
	<c:if test="${empty member}">
		<script>
			alert('로그인이 필요한 서비스입니다.');
			location.href='<c:url value="/user/login.do"/>';
		</script>
	</c:if>
	<%@ include file="../../include/uHeader.jsp"  %>
	<div id="wonTotal">
		<div id="wonHeader" style="border-right: 1px #D8D8D8 solid; border-left: 1px #D8D8D8 solid;">
			<div id="wonMenu">
				<div class="wonHeaderDiv1" style="align-items: center; border-bottom: 1px #D8D8D8 solid;">
					<p id="wonHp" style="width:50%;text-align: left; padding-left:15px">메세지</p>
					<div style="display: flex; flex-direction: row; width: 70%; justify-content: center;">
						<div id="addWriter" class="wonMessagebutton1"><i class="fas fa-user-plus" style="margin: 3%;width: 30%; height: 50%;align-content: center;"></i></div>
						<div id="deleteChat" class="wonMessagebutton1"><i class="fas fa-cog" style="margin: 3%;width: 30%; height: 50%;align-content: center;"></i></div>
						<div id="rollback" class="deleteButtonClicked" style="display:none"><a>취소</a></div>
						<div id="decision" class="deleteButtonClickedExit" style="display:none"><a>나가기</a></div>
					</div>
				</div>
				<div id="dndud_chatroom_div_list" style="overflow-y: auto; height:90%">
					<c:forEach items="${chatRoom}" var="chat">
						<div>
							<div class="messageUserList enable">
								<c:choose>
									<c:when test="${not empty chat.writerImg}">
										<img id="wonContentImg" src="<c:url value='/upload/${chat.writerImg}'/>">
									</c:when>
									<c:otherwise>
										<img id="wonContentImg" src="<c:url value='/resources/img/Logo_blue.png'/>">
									</c:otherwise>
								</c:choose>
								<div style="margin: 2%; font-size: 100%; display:flex; justify-content: space-between; width:165px">
									<c:choose>
										<c:when test="${not empty chat.writerBrandName }">
											<span class="dndud_chat_writer_name">${chat.writerBrandName }											</span>
										</c:when>
										<c:otherwise>
											<span class="dndud_chat_writer_name">${chat.writerName}</span>
										</c:otherwise>
									</c:choose>
									<c:if test="${chat.nonReadMsgCount > 0}">
										<a class="dndud_chat_nonRead">${chat.nonReadMsgCount }</a>
									</c:if>
									<input type="hidden" class="writerCode" value="${chat.writerCode}">
									<input type="checkbox" class="deleteCheck" style="display:none">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>
			<!-- 선택된 채팅방 없을경우. -->
			<div class="dndud_content_first_main_div">
				<div>
					<img src="<c:url value='/resources/img/messageNone.PNG'/> "/>
					<span>메시지를 선택해주세요.</span>
				</div>
			</div>
			<div id="wonContent">
				<div class="wonHeaderDiv1 dndud_content_head_div" style="align-items: center; border-bottom: 1px #D8D8D8 solid;">
					<div style="width: 30%; display: flex; flex-direction: row;">
						<p id="headInfoImg" style="display: flex; flex-direction: row; margin-left:5px;"><img src="<c:url value='/resources/img/test.png'/>" style="width:65px; height:65px; border-radius: 50%;"></p>
						<a id="headInfoId" style="width: 50%; align-self: center; font-size:13px; font-weight:bold">아이디</a>
						<input type="hidden" id="headInfoCode">
					</div>
					<div style="display: flex; flex-direction: row; width:60%; justify-content: flex-end;margin-right: 3%;">
						<button id="writer_wish" class="wonMessagebutton2" style="font-size: 12px;align-items: center;margin: 1%;padding: 3%;border: 1px solid #d9d9d9;color: red;background: white;">
							<i class="fas fa-heart" style="font-size:12px"></i>작가로 추가
						</button>
						<button id="exitButton" class="wonMessagebutton2" style="font-size:12px; align-items: center;margin: 1%;padding: 3%;border: 1px solid #d9d9d9;background: white;">나가기</button>
					</div>
				</div>
				<div class="dndud_content_change_head_div">
					<p>대화 상대를 선택해 주세요.</p>
				</div>
				<div class="wonHeaderDiv2 dndud_content_main_div" style="margin-right: 1%;">
						<div style="background-color:#c8bddd; height:80%; margin: 2%; overflow-y:scroll; display: flex; flex-direction: column; justify-content: flex-end;"id="wonMessageScroll">
						<!-- <div id="listP"> -->
	                       <!-- 메세지 영역 -->
	                       <div id="wonMessageList" style="width:100%; height:100%; flex-direction:column; justify-content:flex-end"></div>
						<!-- </div> -->
						
					</div>
					<div style="display: flex; flex-direction: row;">
						<div style="margin: 3%; width:15%; display:flex; justify-content:center"><i class="fas fa-keyboard fa-2x" style="margin-left: 5%;"></i></div>
						<textarea id="wonMessageContent" style="width:60%; height: 103px; resize: none; border-color: white;"></textarea>
						<button class="sendButton" id="wonMessageButton">전송</button>
					</div>
				</div>
				<div class="dndud_content_change_main_div">
					<div class="recently_buy">
						<span>최근 구매한 작품의 작가</span>
						<div class="div_writer">
							<img src="<c:url value='/resources/img/KMWnoReviewMe.png'/>">
							<a>애잔</a>
						</div>
					</div>
					<div class="likeWriter">
						<span>좋아하는 작가</span>
						<div class="div_writer">
							<img src="<c:url value='/resources/img/KMWnoReviewMe.png'/>">
							<a>321팩토리321factory</a>
						</div>
					</div>
					<div class="testWriter">
						<span>테스트용 작가들</span>
						<c:forEach items="${testWriter}" var="test">
							<div class="div_writer">
								<input type="hidden" class="writerCode" value="${test.writerCode}">
								<c:choose>
									<c:when test="${not empty test.writerImg}">
										<img src="<c:url value='/upload/${test.writerImg}'/>">
									</c:when>
									<c:otherwise>
										<img src="<c:url value='/resources/img/Logo_blue.png'/>">
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${not empty test.writerBrandName }">
										<a>${test.writerBrandName }</a>
									</c:when>
									<c:otherwise>
										<a>${test.writerName}</a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
								
			</div>
		
		
	</div>	
</div>	

	
	<%@ include file="../../include/uFooter.jsp" %>
</div>
<script>
function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
</script>
<script>
var socket = io("http://ec2-15-165-203-41.ap-northeast-2.compute.amazonaws.com:82");
//var socket = io("http://localhost:82");
var dd = document.getElementById('wonMessageContent');
var isScrollUp = false;
var lastScrollTop;
var unreadCnt = 0;
var receiveCode;
$(function(){
	$(document).ready(function(){
		
		
		var code = '<%= (String)session.getAttribute("member") %>';
		var member = '<%= (String)session.getAttribute("userName") %>';
		
		
		
		socket.on(code, function(msg){
			var check = msg.split('*|*');
			if(check[0] == 'reload'){
				console.log(check[1]);
				$.ajax({
					url:'/bomulsum/user/message/reload.do',
					data:{
						code:code,
						writerCode:check[1]
					},
					success: function(suc){
						console.log(suc);
						var htmlTag='';
						for(var i=0; i<suc.length; i++){
							var imgTag;
							var nameTag;
							if(suc[i].writerImg == null){
								imgTag = `/bomulsum/resources/img/Logo_blue.png`;
							}else{
								imgTag = '/bomulsum/upload/'+suc[i].writerImg;
							}
							if(suc[i].writerBrandName == null){
								nameTag = suc[i].writerName;
							}else{
								nameTag = suc[i].writerBrandName;
							}
							
							htmlTag += '<div><div class="messageUserList enable"><img id="wonContentImg" src="'+imgTag+'" />'
				                + '<div style="margin: 2%; font-size: 100%; display:flex; justify-content: space-between; width:165px">'
				                + '<span class="dndud_chat_writer_name">'+nameTag+'</span>';
				            if(suc[i].nonReadMsgCount > 0){
				            	htmlTag += '<a class="dndud_chat_nonRead">'+suc[i].nonReadMsgCount+'</a>';
				            }
				            htmlTag += '<input type="hidden" class="writerCode" value='+suc[i].writerCode
				                + '><input type="checkbox" class="deleteCheck" style="display:none">'
								+ '</div></div></div>';
							
						}
						$("#dndud_chatroom_div_list").empty();
						$("#dndud_chatroom_div_list").html(htmlTag);
						
					},
					error:function(err){
						console.log(err);
					}
				});
				return;
			}
			
			var msgArray = msg.split('*|*');
			
			if(receiveCode != msgArray[2]) return;
			
			
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
				'justify-content: flex-start;align-items: center;margin: 15px;');
			
			dayTag.setAttribute('style','font-size: 60%; padding: 1%; align-self: flex-end;');
			Tag.appendChild(tag);
			dTag.appendChild(Tag);
			dTag.appendChild(dayTag);
			document.getElementById('wonMessageList').appendChild(dTag);
			
			
			$.ajax({
				url:'/bomulsum/writer/message/updateChatStatus.wdo',
				data:{
					senderCode:msgArray[2],
					receiverCode:code
				}
			});
			
			
			$("#wonMessageScroll").scrollTop($("#wonMessageScroll")[0].scrollHeight);

		});
	   
		$('#wonMessageButton').click(function() {
			let today = new Date();
			
			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1; // 월
			let date = today.getDate(); // 날짜
			let hours = today.getHours(); // 시
			let minutes = today.getMinutes(); // 분
			var message = document.getElementById('wonMessageContent').value;
			
			let day = month + '월' + date + "일  " + hours + ":" + minutes;
			
			var dTag = document.createElement("div");
			var Tag = document.createElement("div");
			var tag = document.createElement('span');
			let dayTag = document.createElement('span');
			
			
			
			
			if ($('#wonMessageContent').val() == '') {
				alert('메세지를 입력해주세요');
			} else {
				dayTag.innerHTML = day;
				tag.innerHTML = message.replace(/\n/gi, '<br>');
				Tag.setAttribute('style','padding: 10px 15px; background-color: #f5eacc;' +
					'border-radius: 15px 0 15px 15px; font-size: 14px;max-width: 50%;');
				dTag.setAttribute('style', 'padding: 1%; display:flex;flex-direction:row;' +
					'justify-content: flex-end;align-items: center;margin: 15px;');
				
				dayTag.setAttribute('style','font-size: 60%; padding: 1%; align-self: flex-end;');
				Tag.appendChild(tag);
				dTag.appendChild(dayTag);
				dTag.appendChild(Tag);
	
				document.getElementById('wonMessageList').appendChild(dTag);
				
				// 보낼 사람 아이디, 코드
				var sendToId = $("#headInfoId").text();
				var sendToCode = $("#headInfoCode").val();
				console.log("id : " + sendToId);
				console.log("code : " + sendToCode);
				
				$.ajax({
					url:"/bomulsum/writer/message/sendMessage.wdo",
					async: false,
					data:{
						messageOwner : code,
						messageSenderCode : code,
						messageReceiverCode : sendToCode,
						messageContent : message + "*|*" + day
					},
					success : function(){
						console.log('메세지 디비 저장 성공');
					},
					fail : function(err){
						console.log(err);
					}
				});
				socket.emit("send_to_writer", sendToCode + "*|*" + sendToId + "*|*" + code + "*|*" + member + "*|*" + message + "*|*" + day);
				socket.emit('chatroomLogic', code + '*|*' + sendToCode);
				
				$('#wonMessageContent').val("");
			}
			$("#wonMessageScroll").scrollTop($("#wonMessageScroll")[0].scrollHeight);
		});
		
		$('#wonMessageContent').keydown(function(key) {
			if (key.which == 13) {
				if (!event.shiftKey) {
					$('#wonMessageButton').click();
					return false;
				}
			}
			/* $('#wonMessageScroll').scrollTop(1E10); */
		});

	});
	
	var preClickedList;
	function f_initListClickEvent(){
		
		$(document).on('click', ".messageUserList", function(){ // 왼쪽 리스트 클릭 했을 경우.
			if($(this).attr('class') == 'messageUserList able'){
				console.log('걸려줘라 제발');
				return;
			}
			$(this).find('.dndud_chat_nonRead').remove();
			
			$(".dndud_content_first_main_div").css("display","none");
			$(".dndud_content_head_div").css("display", "flex");
			$(".dndud_content_main_div").css("display", "block");
			$(".dndud_content_change_head_div").css("display","none");
			$(".dndud_content_change_main_div").css("display","none");
			$("#wonContent").css("display","block");
			var imgSrc = $(this).children('img').attr('src');
			var writerName = $(this).children('div').children('span').text();
			var code = $(this).children('div').children('input[type=hidden]').val();
			console.log(imgSrc);
			console.log(writerName);
			console.log(code);
			$("#headInfoImg").children('img').attr('src',imgSrc);
			$("#headInfoCode").val(code);
			$("#headInfoId").text(writerName);
			receiveCode = $("#headInfoCode").val();
			console.log(receiveCode);
			/* $(".messageUserList").css("background-color", "white");
			$(this).css("background-color", "#d9d9d9");  */
			
			$('.messageUserList').removeClass('able');
			$('.messageUserList').addClass('enable');
			$(this).removeClass('enable');
			$(this).addClass('able');
			
			var sendercode = '<%= (String)session.getAttribute("member") %>';
			
			
			
			$("#wonMessageList").empty();
			$.ajax({
				url:"/bomulsum/writer/message/getChatList.wdo",
				data:{
					senderCode : sendercode,
					receiverCode : receiveCode
				},
				success : function(data){
					console.log(data);
					
					if(data.length == 0){
						return;
					}
					for(var i=0; i<data.length; i++){
						if(data[i].messageSenderCode == sendercode){
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
								'justify-content: flex-end;align-items: center;margin: 15px;');
							dayTag.setAttribute('style','font-size: 60%; padding: 1%; align-self: flex-end;');
							
							Tag.appendChild(tag);
							dTag.appendChild(dayTag);
							dTag.appendChild(Tag);
							document.getElementById('wonMessageList').appendChild(dTag);
							
						}else if(data[i].messageReceiverCode == sendercode){
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
								'justify-content: flex-start;align-items: center;margin: 15px;');
							
							dayTag.setAttribute('style','font-size: 60%; padding: 1%; align-self: flex-end;');
							Tag.appendChild(tag);
							dTag.appendChild(Tag);
							dTag.appendChild(dayTag);
							document.getElementById('wonMessageList').appendChild(dTag);
						}
					}
					$("#wonMessageScroll").scrollTop($("#wonMessageScroll")[0].scrollHeight);
				},
				fail : function(err){
					console.log(err);
				}
			});
			
			$.ajax({
				url:'/bomulsum/user/message/memberWishInfo.do',
				data:{
					'memberCode':sendercode,
					'writerCode':receiveCode
				},
				success:function(data){
					if(data == 'Y'){
						$('#writer_wish').css('background', 'red');
						$('#writer_wish').css('color', 'white');
						$('#writer_wish').html('<i class="fas fa-heart" style="font-size:12px"></i>하는 작가');
					}else{
						$('#writer_wish').css('background', 'white');
						$('#writer_wish').css('color', 'red');
						$('#writer_wish').html('<i class="fas fa-heart" style="font-size:12px"></i>작가로 추가');
					}
				},
				fail: function(e){
					
				}
			});
			
			preClickedList = $(this);
		});
	}
	
	function f_offListClickEvent(){
		$(document).off("click", ".messageUserList");
	}
	
	f_initListClickEvent();
	
	
	// 채팅방 나갈때 모달창, 띄워주는 함수 필요.
	
	
	$("#addWriter").on('click', function(){ // 작가 추가 버튼 클릭
		$(".dndud_content_first_main_div").css("display","none");
		$("#wonContent").css("display","block");
		$(".dndud_content_head_div").css("display", "none");
		$(".dndud_content_main_div").css("display", "none");
		$(".dndud_content_change_head_div").css("display","flex");
		$(".dndud_content_change_main_div").css("display","flex");
		$("#wonMessageList").empty();
	});
	
	$(".div_writer").on('click', function(){
		var writerCode = $(this).children('input').val();
		
		if(writerCode == null && getParameter('writer') != null){
			writerCode = getParameter('writer');
		}
		var memberCode = '<%= (String)session.getAttribute("member") %>';
		
		$.ajax({
			url:"/bomulsum/user/message/insertChat.do",
			data:{
				memberCode : memberCode,
				writerCode : writerCode
			},
			success : function(data){
				if(data == 'success'){
					console.log('저장 성공');					
				}else{
					alert('존재하는 채팅방 입니다.');
				}
				location.href='/bomulsum/user/message.do';
			},
			fail : function(err){
				console.log(err);
			}
		});
		
	});
	
	$("#deleteChat").on('click', function(){ // 톱니바퀴 클릭시
		$(".wonMessagebutton1").css("display", "none");
		$(".deleteButtonClicked").css("display","flex");
		$(".deleteButtonClickedExit").css("display","flex");
		$(".deleteCheck").css("display", "block");
		f_offListClickEvent();
	});
	
	$("#rollback").on('click', function(){ // 취소 버튼 <톱니바퀴>
		$(".wonMessagebutton1").css("display", "flex");
		$(".deleteButtonClicked").css("display","none");
		$(".deleteButtonClickedExit").css("display","none");
		$(".deleteCheck").css("display", "none");
		$(".deleteCheck").prop("checked", false);
		f_initListClickEvent();
	});
	
	function exitChat(data){
		
		$.ajax({
			url:"/bomulsum/user/message/extiChat.do",
			data:data,
			success : function(){
				console.log('나가기 성공');
				location.href='/bomulsum/user/message.do';
			},
			fail : function(err){
				console.log(err);
			}
		});
	}
	
	$("#decision").on('click', function(){ // 나가기 버튼 <톱니바퀴>
		var arr = [];
		var memberCode = '<%= (String)session.getAttribute("member") %>';
		
		$(".deleteCheck:checkbox:checked").each(function(){
			arr.push($(this).prev().val());
		});
		console.log(arr);
		var data = {
				"memberCode" : memberCode,
				"writerCode" : arr,
		}
		console.log(data);
		if(arr.length > 0){
			var result = confirm('정말 나가시겠습니까?\n(대화 내용은 유지됩니다.)');
			if(result){
				exitChat(data);
			}
		}else{
			alert('선택된 채팅방이 없습니다.');
		}
	});
	
	$("#exitButton").on('click', function(){
		var memberCode = '<%= (String)session.getAttribute("member") %>';
		var arr = [];
		arr.push($("#headInfoCode").val());
		console.log(arr);
		var data = {
				"memberCode" : memberCode,
				"writerCode" : arr,
		}
		console.log(data);
		
		var result = confirm('정말 나가시겠습니까?\n(대화 내용은 유지됩니다.)');
		if(result){
			exitChat(data);
		}
	});
	
	
	$("#writer_wish").on('click', function(){
		var memberCode = '<%=(String)session.getAttribute("member") %>';
		var writerCode = $("#headInfoCode").val();
		$.ajax({
			url:"/bomulsum/user/message/wishlist.do",
			data:{
				"memberCode":memberCode,
				"writerCode":writerCode
			},
			success : function(data){
				if(data == 'insert'){
					alert('좋아하는 작가에 추가 되었습니다.');
					
					$('#writer_wish').css('background', 'red');
					$('#writer_wish').css('color', 'white');
					$('#writer_wish').html('<i class="fas fa-heart" style="font-size:12px"></i>하는 작가');
				}else{
					alert("좋아하는 작가에 해제되었습니다.");

					$('#writer_wish').css('background', 'white');
					$('#writer_wish').css('color', 'red');
					$('#writer_wish').html('<i class="fas fa-heart" style="font-size:12px"></i>작가로 추가');
				}
			},
			fail : function(err){
				console.log(err);
			}
		});
	});
	
	
	
});
</script>

<script>
var chatroomCode = getParameter('writer');
if(chatroomCode != null && chatroomCode != 'null' && chatroomCode != ''){
	$(document).ready(function(){
		var memberCode = '<%= (String)session.getAttribute("member") %>';
		var lengthCheck = false;
		if($('.messsageUserList').length == 0){
			lengthCheck = true;
		}
		
		$('.messageUserList').each(function(){
			if($(this).find('.writerCode').val() == chatroomCode){
				$(this).trigger('click');
				lengthCheck = false;
				return false;
			}else{
				lengthCheck = true;
			}
		});
		
		if(lengthCheck){
			console.log('멤버 코드 : ' + memberCode);
			console.log('작가 코드 : '+chatroomCode);
			$.ajax({
				url:"/bomulsum/user/message/insertChat.do",
				data:{
					memberCode : memberCode,
					writerCode : chatroomCode
				},
				success : function(data){
					if(data == 'success'){
						console.log('저장 성공');					
					}else{
						alert('존재하는 채팅방 입니다.');
					}
					location.reload();
				},
				fail : function(err){
					console.log(err);
				}
			});
		}
	});
}
</script>
</body>
</html>