<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/fea5b9b7d0.js" crossorigin="anonymous"></script>
<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';
$(window).bind('beforeunload', function() {
	if ((event.clientY < 0) ||(event.altKey) ||(event.ctrlKey)||((event.clientY < 129) && (event.clientY>107))) { 
		$.ajax({
			url : "/bomulsum/user/logout.do"
		}); 
	}
}); 

$(function() {
	//Top버튼 기능
    $(window).scroll(function() {
        if ($(this).scrollTop() > 200) {
            $('.dainToTop').fadeIn();
        } else {
            $('.dainToTop').fadeOut();
        }
    });
	
	$('.dainToTop').click(function(){
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
	
	$("#toMyInfo").click(function(){
		if(memberCode == null || memberCode == 'null'){
			alert('로그인이 필요한 서비스입니다.');
			location.href='/bomulsum/user/login.do';
			return;
		}
		location.href="<c:url value='/user/myInfo/home.do'/>";
	});
	
	$("#toAlarm").click(function(){
		location.href="#";
	});
	
	$("#toMessage").click(function(){
		location.href="<c:url value='/user/message.do'/>";
	});
	
});
</script>
<style>
*{font-family: 'Noto Sans KR', sans-serif;}
body {
	margin: 0px;
}

.dainheader {
	height: 160px;
	background-color: #ffffff;
	border: 1px solid #d9d9d9;
}

.dainheader-top-a:link, .dainheader-top-a:visited, 
.dainheader-top-a:hover, .dainheader-top-a:active {
	text-decoration: none;
	color: #666666;
	border: none;
}
.dain-header-topA:link, .dain-header-topA:visited, .dain-header-topA:hover, .dain-header-topA:active {
	text-decoration: none;
	color: #666666;
	border: none;
}

.dainheader-top {
	display: flex;
	flex-direction: row-reverse;
	align-items: center;
	background-color: #f5f5f5;
	height: 23%;
	border-bottom: 1px solid #d9d9d9;
	font-size: 11px;
}

.dain-header-topA {
	margin-left: 12px;
	margin-right: 12px;
	height: 100%;
    display: flex;
    align-items: center;
}

.dainheader-top-a {
	margin-left: 12px;
	margin-right: 12px;
	height: 100%;
    display: flex;
    align-items: center;
}

.dainheader-middle {
	display: flex;
	margin-left: auto;
	margin-right: auto;
	height: 52%;
	width: 70%;
}

.dainheader-middle-inner {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.dainheader-middle-menu {
	font-size: 18px;
}

.dainheader-middle-menuA:link, .dainheader-middle-menuA:visited, 
.dainheader-middle-menuA:hover, .dainheader-middle-menuA:active {
	text-decoration: none;
	color: #666666; /*grey*/
	border: none;
}

.dainheader-middle-search {
	height: 53%;
	width: 333px;
	background-color: #fff;
}

.middle-search-form {
	width: 333px;
	border: 2px solid #1f76bb; /*blue:#1f76bb, red: #d8524a */
	padding-top: 5px;
	padding-bottom: 6px;
	border-radius: 5px;
}

.middle-search-form input[type=text] {
	width: 280px;
	font-size: 16px;
	padding: 7px 16px;
	margin: 8px 0;
	display: inline-block;
	border: 0px solid #fff;
	border-radius: 4px;
	box-sizing: border-box;
	color: #acacac;
	margin: 1px 1px 0px 1px;
	color: black;
}

.middle-search-form input:focus {
	outline: none;
}

.dainheader-bottom {
	height: 25%;
	background-color: #fff;
	border-top: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
}

.dainsearchbtn {
	background-color: #fff;
	border: none;
	color: #1f76bb; /*blue*/
	padding: 8px 13px;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 3px;
	margin-right: 3px;
	float: right;
}

.dainiconbtn {
	background-color: #fff;
	border: 0;
	outline: 0;
	color: #666666;
	cursor: pointer;
}

.dainmyinfo {
	font-size: 10px;
	color: #666666;
	display: flex;
	margin-right: 0px;
}

.dainheader-top-inner {
	display: flex;
	margin-left: auto;
	margin-right: auto;
	height: 100%;
	width: 70%;
	flex-direction: row-reverse;
}

.dainheader-bottom {
	display: flex;
	justify-content: center;
}

.dainheader-bottom-inner {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	font-size: 13px;
	color: #666666;
}

/*메뉴 간격조정*/
.dainheader-bottom-inner > div {
	margin-right: 20px;
}

.shadow {
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.2);
}

/*메뉴에 언더라인 주는거*/
.dainheader-bi-a {
	padding-top: 10px;
	padding-bottom: 10px;
	padding-right: 5px;
	padding-left: 5px;
	color: #666666;
}

.dainheader-bi-a:link, .dainheader-bi-a:visited {
	text-decoration: none;
	color: #666666; /*grey*/
}

.dainheader-bi-a:hover, .dainheader-bi-a:active {
	text-decoration: none;
	color: #1f76bb;
	border-bottom: 1px solid #1f76bb;
}

.cathover {
	position: relative;
	display: inline-block;
	padding: 10px 5px;
}

.cartcountshape {
	width: 18px;
	height: 18px;
	background-color: #1f76bb;
	border-radius: 50%;
	z-index: 99;
	position: absolute;
	margin-left: 22px;
}

.dainrounded {
	background: #f5f5f5;
	color: #999;
	-webkit-border-radius: 13px;
	-moz-border-radius: 13px;
	border-radius: 13px;
	padding: 2px 10px;
	margin-right: 5px;
	font-size: 10px;
	font-weight: bold;
	position: relative;
}

.dropdown-content {
	display: none;
	position: absolute;
	min-width: 160px;
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.2);
	border: 1px solid #d9d9d9; /*연한 회색 테두리*/
	z-index: 1;
}

.menu {
	display: flex;
	color: black;
}

.dainCatA {
	padding: 2px;
	margin: 10px;
	text-decoration: none;
	display: block;
	color: black;
}

.dainCatLi {
	background: #fff;
	margin: 3px;
}

.dainCatUl {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	width: 200px;
}


.dainCatA:hover {
	background-color: #cce5ff;
	color: black;
	border: none;
	text-decoration: none;
}


.cartcountshape {
	width: 18px;
	height: 18px;
	background-color: #1f76bb;
	border-radius: 50%;
	z-index: 99;
	position: absolute;
	margin-left: 22px;
}

.dainToTop{
	display: inline-block;
    position: fixed;
    bottom: 243px;
    z-index: 150;
    display: none;
    width: 40px;
    height: 40px;
    right: 0;
    text-align: center;
    color: white;
    font-size: 25px;
    line-height: 1.3;
    transition: all 0.5s ease;
    background-color: #1f76bb;
    font-size: 12px;
}

.dainheader-top-link{
	z-index:  990;
    display: flex;
    flex-direction: row;
    align-items: center;
}

.headerUlList{
	display: flex;
    flex-direction: row;
    align-items: center;
    margin: 0;
    list-style: none;
    height: 100%;
}

.dropBox{
	height:100%;
    display: flex;
    align-items: center;
}

.headerUlList ul li{
    margin-bottom: 8px;
}

.headerUlList ul li:last-child{
	margin-bottom:0;
}

.headerUlList li ul{
	display:none;
	list-style: none;
    padding: 10px;
    margin-top: 120px;
    background: white;
    position: absolute;
    border-radius: 4px;
    box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.2);
}

.headerUlList li:hover ul{
	display:block;
}

.headerUlList li:hover .alarmDropBox{
	display:block;
}

.headerUlList li:hover .messageDropBox{
	display:block;
}

.headerUlList li ul a{
	text-decoration: none;
	color: #666;
}

.alarmDropBox{
	position:absolute;
	display:none;
	flex-direction:column;
	align-items: center;
	justify-content: center;
	border-radius:4px;
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.2);
	margin-top:440px;
	width:400px;
	height:400px;
	z-index: 990;
	right: 200px;
	background-color: white;
}

.dndud_alarmDrop_top{
    height: 39px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 10pt;
    border-bottom: 1px solid #d9d9d9;
}


.dndud_alarmDrop_All{
	cursor:pointer;
	height: 39px;
    width: 100%;
    color:#22a7af;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 10pt;
    border-top: 1px solid #d9d9d9;
}

.dndud_alarmDrop_main{
	width:100%;
	height:320px; 
	overflow-y: auto;
	overflow-x: hidden;
	display:flex;
	flex-direction:column;
}
.dndud_alarmDrop_main::-webkit-scrollbar {
  width: 10px;
}
.dndud_alarmDrop_main::-webkit-scrollbar-thumb {
  background-color: #2f3542;
  border-radius: 10px;
  background-clip: padding-box;
  border: 2px solid transparent;
}
.dndud_alarmDrop_main::-webkit-scrollbar-track {
  background-color: grey;
  border-radius: 10px;
  box-shadow: inset 0px 0px 5px white;
}

.dndud_alarm_content{
	width:100%;
	height:89px;
	display:flex;
	flex-direction:row;
	border-bottom: 1px solid #d9d9d9;
}

.dndud_alarm_content_img{
	padding:15px;
}

.dndud_alarm_content_img img{
	height:60px;
	width:60px;
	border-radius:50%;
}

.dndud_alarm_content_main{
	display:flex;
	width:295px;
	height:60px;
	flex-direction:column;
	padding: 15px 15px 15px 0;
}

.dndud_alarm_content_title{
	display:flex;
	flex-direction: row;
	justify-content:space-between;
	font-size:13px;
	font-weight:bold;
	width:100%;
	height:20px;
	align-items: center;
}

.dndud_alarm_content_bottom{
	width:90%;
	height:40px;
	font-size:12px;
}

#dndud_alarm_about{
	padding:2.5px;
	font-size:7px;
	border:1px solid red;
	color:red;
	font-weight:normal;
	border-radius: 8px;
}

#dndud_alarm_date{
	color:#d9d9d9;
}

#dndud_alarm_content{
	margin-top: 5px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
}


/* <!--       dddddddddddddddddddddddddd                                --> */


.messageDropBox{
	position:absolute;
	display:none;
	flex-direction:column;
	align-items: center;
	justify-content: center;
	border-radius:4px;
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.2);
	margin-top:440px;
	width:400px;
	height:400px;
	z-index: 990;
	right: 130px;
	background-color: white;
}

.dndud_messageDrop_top{
    height: 39px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 10pt;
    border-bottom: 1px solid #d9d9d9;
}


.dndud_messageDrop_All{
	cursor:pointer;
	height: 39px;
    width: 100%;
    color:#22a7af;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 10pt;
    border-top: 1px solid #d9d9d9;
}

.dndud_messageDrop_main{
	width:100%;
	height:320px; 
	overflow-y: auto;
	overflow-x: hidden;
	display:flex;
	flex-direction:column;
}
.dndud_messageDrop_main::-webkit-scrollbar {
  width: 10px;
}
.dndud_messageDrop_main::-webkit-scrollbar-thumb {
  background-color: #2f3542;
  border-radius: 10px;
  background-clip: padding-box;
  border: 2px solid transparent;
}
.dndud_messageDrop_main::-webkit-scrollbar-track {
  background-color: grey;
  border-radius: 10px;
  box-shadow: inset 0px 0px 5px white;
}

.dndud_message_content{
	width:100%;
	height:89px;
	display:flex;
	flex-direction:row;
	border-bottom: 1px solid #d9d9d9;
	cursor: pointer;
}

.dndud_message_content:hover{
	background-color: #81BEF7
}

.dndud_message_content_img{
	padding:15px;
}

.dndud_message_content_img img{
	height:60px;
	width:60px;
	border-radius:50%;
}

.dndud_message_content_main{
	display:flex;
	width:295px;
	height:60px;
	flex-direction:column;
	padding: 15px 15px 15px 0;
}

.dndud_message_content_title{
	display:flex;
	flex-direction: row;
	justify-content:space-between;
	font-size:13px;
	font-weight:bold;
	width:100%;
	height:20px;
	align-items: center;
}

.dndud_message_content_bottom{
    width: 100%;
    display: flex;
    height: 40px;
    font-size: 12px;
    flex-direction: row;
    align-items: center;
}

.dndud_message_date{
	color:#d9d9d9;
}

.dndud_message_content_text{
	margin-top: 5px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    width: 90%;
    overflow: hidden;
    text-overflow: ellipsis;
}

.dndud_message_nonReadCount{
	background-color: #1F76BB;
    color: white;
    padding: 3px 5px;
    border-radius: 50%;
}

.dndud_header_num{
	display:none;
    position: absolute;
    margin-left: 55px;
    margin-bottom: 10px;
    background-color: #1F76BB;
    color: white;
    padding: 2.5px 4.5px 4px 5px;
    border-radius: 50%;
    font-size: 1px;
}

/*인기검색어*/
.dainpopsearch {
	position: relative;
	width: 220px;
	height: 21px;
	margin-left: 30px;
	font-size: 14px;
}
/*인기검색어 드롭다운*/
.dainDropDownSearch{
	width: 160px;
	height: 260px;
	border:1px solid black;
	display: none;
 	position: absolute;
 	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  	z-index: 999;
  	background-color: white;
  	padding: 10px 20px 10px 20px;
  	color: #282828;
}

.dainpopsearch:hover .dainDropDownSearch {
  display: block;
}

.dainol{
	padding: 0px 15px;
	font-size: 12px;
	font-weight: bold;
}

.dainol li p {
    font-weight: normal;
    margin: 6px 0px;
}

.dainol li:hover{
	cursor: pointer;
	color: #1f76bb;
	text-decoration: underline;
}

#rank-list a {
    color: #666666;
    text-decoration: none;
    font-size: 16px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

#rank-list a:hover {
    text-decoration: underline;
}

#rank-list {
    overflow: hidden;
    width: 160px;
    height: 20px;
    margin: 0;
}

#rank-list dt {
    display: none;
}

#rank-list dd {
    position: relative;
    margin: 0;
}

#rank-list ol {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;
}

#rank-list li {
    height: 20px;
    line-height: 20px;
}

</style>
</head>
<body>
<!-- Header -->
<header class="dainheader shadow" id="dainHeader">
<div class="dainheader-top">
	<div class="dainheader-top-inner">
		<c:if test="${empty member}">
			<div class="dainheader-top-link">
				<ul class="headerUlList">
					<li><a class="dain-header-topA" href="<c:url value='/user/login.do'/>" >로그인</a></li>
					<li><a class="dain-header-topA" href="<c:url value='/user/newAccount.do'/>" >회원가입</a></li>
					<li class="dropBox">
						<a class="dain-header-topA" href="#">고객센터</a>
						<ul>
							<li><a href="<c:url value='/user/board/notice.do'/> ">공지사항</a></li>
							<li><a href="<c:url value='/user/board/question.do'/> ">자주 묻는 질문</a></li>
							<li><a href="#">메일로 문의</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</c:if>
		<c:if test="${not empty member}">
			<div class="dainheader-top-link">
				<ul class="headerUlList">
					<li class="dropBox">
						<a class="dain-header-topA" href="#" style="color: #666666;">${userName}님</a>
						<ul style="margin-top: 190px;">
							<li><a href="#">주문배송</a></li>
							<li><a href="#">관심리스트</a></li>
							<li><a href="#">받은 선물함</a></li>
							<li><a href="<c:url value='/user/coupon/list.do'/> ">쿠폰함</a></li>
							<li style="margin-bottom:5px"><a href="#">회원 정보관리</a></li>
							<li style="padding-top:4px; border-top: 1px solid #d9d9d9;"><a href="<c:url value='/user/logout.do'/>">로그아웃</a></li>
						</ul>
					</li>
					<li class="dropBox">
						<a class="dain-header-topA" href="#" style="color: #666666;"><i class="fas fa-bell" style="font-size:13px"></i> 알림</a>
						<div class="alarmDropBox">
							<div class="dndud_alarmDrop_top">
								<span>알림</span>
							</div>
							<div class="dndud_alarmDrop_main">
								<!-- for -->
								<div class="dndud_alarm_content">
									<div class="dndud_alarm_content_img">
										<img src="<c:url value='/upload/1597020793753dog.jpg'/>"/>
									</div>
									<div class="dndud_alarm_content_main">
										<div class="dndud_alarm_content_title">
											<span>
												<span id="dndud_alarm_about">이벤트/공지</span>
												<span id="dndud_alarm_from_who">보물섬</span>
											</span>
											<span id="dndud_alarm_date">08월 24일</span>
										</div>
										<div class="dndud_alarm_content_bottom">
											<span id="dndud_alarm_content">
												어떠한 내용이 들어가게 됩니다. 자동 줄바꿈도 되어야하고 양이 넘치면 ...으로 표기를 해야합니다.dddddddddddddddddddddddddddddddddddddddddddd
											</span>
										</div>
									</div>
								</div>
								
								<div class="dndud_alarm_content">
									<div class="dndud_alarm_content_img"></div>
									<div class="dndud_alarm_content_main">
										<div class="dndud_alarm_content_title"></div>
										<div class="dndud_alarm_content_bottom"></div>
									</div>
								</div>
								<div class="dndud_alarm_content">
									<div class="dndud_alarm_content_img"></div>
									<div class="dndud_alarm_content_main">
										<div class="dndud_alarm_content_title"></div>
										<div class="dndud_alarm_content_bottom"></div>
									</div>
								</div>
								<div class="dndud_alarm_content">
									<div class="dndud_alarm_content_img"></div>
									<div class="dndud_alarm_content_main">
										<div class="dndud_alarm_content_title"></div>
										<div class="dndud_alarm_content_bottom"></div>
									</div>
								</div>
								<!-- for end -->
							</div>
							<div id="toAlarm" class="dndud_alarmDrop_All">
								<span>모두 보기</span>
							</div>
						</div>
					</li>
					<!-- 메세지 -->
					<li id="dndud_head_message" class="dropBox">
						<a class="dain-header-topA" href="#" style="color: #666666;">
							<i class="fas fa-comment" style="font-size:13px"></i>메시지
						</a>
						<span class="dndud_header_num"></span>
						<div class="messageDropBox">
							<div class="dndud_messageDrop_top">
								<span>메시지</span>
							</div>
							<div class="dndud_messageDrop_main">
								<!-- for -->
								
								
								<!-- for end -->
							</div>
							<div id="toMessage" class="dndud_messageDrop_All">
								<span>모두 보기</span>
							</div>
						</div>
					</li>
					<!-- 고객센터 -->
					<li class="dropBox">
						<a class="dain-header-topA" href="#">고객센터</a>
						<ul>
							<li><a href="<c:url value='/user/board/notice.do'/> ">공지사항</a></li>
							<li><a href="<c:url value='/user/board/question.do'/> ">자주 묻는 질문</a></li>
							<li><a href="#">메일로 문의</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</c:if>
	</div>
</div>
<!-- Header 중앙영역 -->
<div class="dainheader-middle">
	<div class="dainheader-middle-inner">
		
		
		<div style="height: 100%; width: 105px; margin-right: 10px">
			<a href="<c:url value='/home.do'/>"><img alt="logo" src="<c:url value='/resources/img/Logo_blue.png'/>" height="100%" style="margin-right: 50px"></a>
		</div>
		<div class="dainheader-middle-menu">
			<a class="dainheader-middle-menuA" href="<c:url value='/home.do'/>" style="margin-right: 30px;" >작품</a>
			<a class="dainheader-middle-menuA"  href="<c:url value='/midas/class.do'/>" style="margin-right: 30px; color: #1f76bb;">금손 클래스</a>
		</div>
		<!-- 검색창 영역 -->
		<div class="dainheader-middle-search">
			<div class="middle-search-form">
				<form id="search_form" action="/bomulsum/search/result.do">
					<input autocomplete="off" type="text" id="headerSearch" name="headerSearch" placeholder="작품, 작가 검색" >
					<button class="dainsearchbtn"><i class="fa fa-search fa-lg" aria-hidden="true" ></i></button>
				</form>
			</div>
		</div>
		<!-- 인기검색어 영역 -->
		
		<div class="dainpopsearch">
			<div class="dainDropDownSearch"> <!-- 인기검색어 드롭다운영역 -->
				<div style="padding-bottom:10px; border-bottom: 1px solid black;">
					<span style="font-size: 11px; font-weight: bold;">실시간 인기검색어</span>
				</div>
				<ol class="dainol">
				  
				</ol> 
			</div>
			<dl id="rank-list">
	            <dt>실시간 급상승 검색어</dt>
	            <dd>
	                <ol class="dndudol">
	                    
	                </ol>
	            </dd>
	        </dl>
			<!-- <div id="favoriteKeyword">
		 		<span style="color: red">1. </span> <span style="color:#666666 ">폰케이스</span>
		 	</div> -->
		</div>
		
		
		<!-- 우측 아이콘 영역 -->
		<div class="dainmyinfo">
					<div id="toMyInfo" style="height: 50px; width: 40px; margin-right: 20px;">
						<button class="dainiconbtn" style="padding:0px;"><i class="fa fa-user fa-2x" aria-hidden="true" style="padding: 7px 3px 3px;"></i>
						<p style="margin: 0px; font-size: 10px; width: 40px">MY정보</p></button>
					</div>
					<div style="height: 42px; width: 40px;">
						<button class="dainiconbtn" style="padding:0px;">
							<div class="cartcountshape"><span style="color: #fff; font-size:10px ;">0</span></div>
							<i class="fa fa-shopping-cart fa-2x" aria-hidden="true" style="padding: 7px 3px 3px;"></i>
							<p style="margin: 0px; font-size: 10px; width: 40px">장바구니</p>
						</button>
					</div>
		</div>
	</div>
</div>
<!-- Header 하단 메뉴영역 -->
<div class="dainheader-bottom">
	<div style="width:70%; display:flex; justify-content: space-between;">
		<div></div>
		<div class="dainheader-bottom-inner">
			<div class="dainrounded" style="margin-right: 5px;">온라인</div>
			<div><a class="dainheader-bi-a" href="<c:url value='/midas/info/detail.do'/>">홈</a></div>
			<div style="color: #d9d9d9">|</div>
			<div class="dainrounded" style="margin-right: 5px;">오프라인</div>
			<div><a class="dainheader-bi-a" href="<c:url value='/midas/class.do'/>">홈</a></div>
			<div><a class="dainheader-bi-a" href="<c:url value='/midas/detail.do?category=공예'/>">카테고리</a></div>
			<div><a class="dainheader-bi-a" href="<c:url value='/midas/popular.do'/>">인기 클래스</a></div>
			<div><a class="dainheader-bi-a" href="<c:url value='/midas/location.do?location=서울'/>">지역별</a></div>
			<div><a class="dainheader-bi-a" href="<c:url value='/midas/new.do'/>">신규</a></div>
		</div>
		<div></div>
		<div></div>
		<div></div>
	</div>
</div>
</header>
<!-- Header 끝 -->
</body>
<script>
$(function(){
	$('#search_form').submit(function(){
		if($("#headerSearch").val().length == 0){
			return false;
		}
	});
});

var keywordClick = function(event){
	location.href='/bomulsum/search/result.do?headerSearch='+event;
};

var getRealTime = function(){
	$.ajax({
		type:'POST',
		url:"/bomulsum/search/realTime.do",
		success: function(data){
/* 				dndud = > <li><a><span style="color:red">1.</span> 폰케이스</a></li>
            dain = > <li><p>폰케이스<p></li> */
			console.log(data);
            var dndud='';
            var dain='';
            for(var i=0; i<data.length; i++){
            	dndud += '<li><a><span style="color:red">'+(i+1)+'.</span> '+data[i]+'</a></li>';
            	dain += '<li><p class="dndud_class">'+data[i]+'</p></li>';
            }
			$('.dndudol').html(dndud);
			$('.dainol').html(dain);
			
			var count = $('#rank-list li').length;
		    var height = $('#rank-list li').height();
		    
		    $('.dndud_class').on('click', function(){
		    	keywordClick($(this).text());
		    });
		
		    function step(index){
		        $('#rank-list ol').delay(2000).animate({
		            top: -height * index,
		        }, 500, function() {
		            step((index + 1) % count);
		        });
		    }
		    step(1);
		},
		error: function(e){
			console.log(e);
		}
	});
	
};
$(document).ready(function(){
    getRealTime();
});
</script>
<script>
$(function(){
	var code = '<%= (String)session.getAttribute("member") %>';
	var reload = function(){
		console.log('실행');
		$.ajax({
			url:"/bomulsum/user/message/head/reload.do",
			data:{
				memberCode : code
			},
			success: function(data){
				var countNum=0;
				var htmlTag='';
				for(var i=0; i<data.length; i++){
					var imgTag='';
					var nameTag='';
					if(data[i].writerImg == null){
						imgTag = `/bomulsum/resources/img/Logo_blue.png`;
					}else{
						imgTag = '/bomulsum/upload/'+data[i].writerImg;
					}
					
					if(data[i].writerBrandName == null){
						nameTag = data[i].writerName;
					}else{
						nameTag = data[i].writerBrandName;
					}
					
					var msg = '';
					var date = '';
					if(data[i].lastMessage != null){
						var msgArray = data[i].lastMessage.split('*|*');
						msg = msgArray[0];
						date = msgArray[1].split(' ')[0];
					}
					
					htmlTag += '<div class="dndud_message_content"><input type="hidden" value="'+ data[i].writerCode +'">'
						+ '<div class="dndud_message_content_img"><img src="'+ imgTag +'"/></div>'
						+ '<div class="dndud_message_content_main"><div class="dndud_message_content_title"><span>'
						+ '<span class="dndud_message_from_who">'+ nameTag +'</span></span>'
						+ '<span class="dndud_message_date">'+ date +'</span></div>'
						+ '<div class="dndud_message_content_bottom"><span class="dndud_message_content_text">' + msg + '</span>';
					if(data[i].nonReadMsgCount > 0){
						htmlTag += '<span class="dndud_message_nonReadCount">'+ data[i].nonReadMsgCount + '</span>';
					}
					htmlTag += '</div></div></div>';
					countNum += data[i].nonReadMsgCount;
				}
				
				
				if(countNum > 0){
					$('.dndud_header_num').css('display', 'block');
					$('.dndud_header_num').text(countNum);
				}else if(countNum <= 0){
					$('.dndud_header_num').css('display', 'none');
				}
				
				$(".dndud_messageDrop_main").empty();
				$(".dndud_messageDrop_main").html(htmlTag);
				
			},
			error: function(err){
				
			} 
		});
	};
	
	var timeCon = setInterval(reload, 1000);
	
	$(document).on('click', '.dndud_message_content', function(){
		var code = $(this).children('input').val();
		location.href= '/bomulsum/user/message.do?writer='+code;
	});
});
</script>
</html>