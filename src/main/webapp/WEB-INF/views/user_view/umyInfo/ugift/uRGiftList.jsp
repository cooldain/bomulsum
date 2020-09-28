<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 받은 선물함</title>
<style>
body  a:link, a:visited, a:hover, a:active{
   text-decoration: none;
   border: none;
}
.content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px;
	padding-bottom: 64px;
	display:flex;
}
.ugift{
	width:80%;
	margin-left:2%;
}
#jeonga_ugift_rtitle_text{
	margin-top:0;
}
.jeonga_ugift_rhead {
	background-color:#f2f2f2;
	border: 1px solid #D8D8D8;
	display: flex;
	justify-content: space-between;
	font-size: 12px;
	height:46px;
}

.jeonga_ugift_rhead_left {
	width:80%;
	display: flex;
}
.jeonga_ugift_rhead_right{
	width:20%;
	padding:1.5%;
}

.jeonga_ugift_rhead_date{
	padding:2%;
	padding-right:0;

}
 .jeonga_ugift_rhead_address{
 	padding:2%;
 	padding-left:0;
 }

.jeonga_ugift_rhead_divide{
	padding:2%;

}
.jeonga_ugift_rlink{
	text-decoration:none;
	color:black;
}
.jeonga_ugift_rbody {
	height:95px;
	border: 1px solid #D8D8D8;
	border-top:0px;
	display: flex;
	justify-content: space-between;
}
.jeong_ugift_rbody_image{
	width:8%;
	padding:1%;
}
.jeonga_ugift_rbody_title{
	width:62%;
	padding-top:2%;
	font-weight: bold;
	font-size:14px;
}
.jeonga_ugift_rbody_sellerpart {
	width:30%;
	border-left: 1px solid #D8D8D8;
}
.jeonga_ugift_rbody_seller{
	text-align:center;
	padding-top:6%;
	padding-bottom:0;
	font-size: 13px;
}
#jeonga_ugift_rseller_message{
	margin-top:3%;
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 11px;
  	color:black;
}
</style>
</head>
<body>
	<div>
	<!-- 헤더 -->
	<%@ include file="../../include/uHeader.jsp"%>

	<div class="content">
		<!-- 사이드메뉴 -->
		<%@ include file="../../include/uside.jsp"%>
		<!-- 내용 여기다 넣으시오 -->
		<div class="ugift">
			<div class="jeonga_ugift_rtitle">
				<h2 id="jeonga_ugift_rtitle_text">받은 선물함</h2>
			</div>
			<c:forEach var="receiveList" items='${receiveGiftCheckList}'>
			<div class="jeonga_ugift_receiveList">
				<div class="jeonga_ugift_rhead">
					<div class="jeonga_ugift_rhead_left">
						<div class="jeonga_ugift_rhead_date">${receiveList.order_date}</div>
						<div class="jeonga_ugift_rhead_divide">|</div>
						<div class="jeonga_ugift_rhead_address"><a href="/bomulsum/user/receiveGift/${receiveList.order_code_seq}.do"class="jeonga_ugift_rlink" style="color:#DF3A01">${receiveList.order_address_input}</a></div>
					</div>
					<div class="jeonga_ugift_rhead_right">
						<a href="/bomulsum/user/receiveGift/${receiveList.order_code_seq}.do" class="jeonga_ugift_rlink"> ${receiveList.member_name}(${receiveList.member_phone})님의 선물 > </a>
					</div>
				</div>
				<div class="jeonga_ugift_rbody">
					<div class="jeong_ugift_rbody_image">
						<img src="<c:url value='/upload/${receiveList.art_photo}'/>" style="width:70px; height:70px;">
					</div>
					<div class="jeonga_ugift_rbody_title">${receiveList.b_art_name}</div>
					<div class="jeonga_ugift_rbody_sellerpart">
						<div class="jeonga_ugift_rbody_seller">
						${receiveList.writer_brand_name}<br>
						<a href="/bomulsum/user/message.do?writer=${receiveList.b_writer_code_seq}" id="jeonga_ugift_rseller_message">메시지로 문의</a>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp"%>
	</div>
</body>
</html>