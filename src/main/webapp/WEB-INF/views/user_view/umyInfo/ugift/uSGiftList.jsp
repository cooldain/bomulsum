<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 보낸 선물함</title>
<style>
body a:link, a:visited, a:hover, a:active{
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
#jeonga_ugift_stitle_text{
	margin-top:0;
}
.jeonga_ugift_sendList{
	margin-top:2%;
}
.jeonga_ugift_shead {
	background-color:#f2f2f2;
	border: 1px solid #D8D8D8;
	display: flex;
	justify-content: space-between;
	font-size: 12px;
	height:46px;
}

.jeonga_ugift_shead_left {
	width:80%;
	display: flex;
}
.jeonga_ugift_shead_right{
	height:46px;
	width:20%;
	padding:1.5%;
}

.jeonga_ugift_shead_date{
	padding:2%;
	padding-right:0;

}
 .jeonga_ugift_shead_address{
 	padding:2%;
 	padding-left:0;
 }
.jeonga_ugift_shead_divide{
	padding:2%;

}
.jeonga_ugift_slink{
	text-decoration:none;
	color:black;
}
.jeonga_ugift_sbody {
	height:95px;
	border: 1px solid #D8D8D8;
	border-top:0px;
	display: flex;
	justify-content: space-between;
}
.jeong_ugift_sbody_image{
	width:8%;
	padding:1%;
}
.jeonga_ugift_sbody_order{
	width:62%;
	padding-top:2%;

}
.jeonga_ugift_sbody_title{
	font-weight: bold;
	font-size:14px;
}
.jeonga_ugift_sbody_option{
	padding-top:1%;
	font-size:13px;
}
.jeonga_ugift_sbody_sellerpart {
	width:15%;
	border-left: 1px solid #D8D8D8;
}
.jeonga_ugift_sbody_seller{
	text-align:center;
	margin-top:20px;
	font-size: 13px;
}
#jeonga_ugift_sbody_button{
	margin-top:3%;
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
  	width:92px;
  	color:black;
}

.jeonga_ugift_sbody_list{
	width:15%;
	border-left:1px solid #D8D8D8;
	padding:1%;
}
#jeonga_ugift_sbody_list_address{
	border-left:1px solid #D8D8D8;
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:120px;
	margin-top:4px;
}
#jeonga_ugift_sbody_list_cancel{
	border-left:1px solid #D8D8D8;
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:120px;
	margin-top:6px;

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
			<div class="jeonga_ugift_stitle">
				<h2 id="jeonga_ugift_stitle_text">보낸 선물함</h2>
			</div>
			<c:forEach var="sendList" items='${sendGiftList}'>
			<div class="jeonga_ugift_sendList">
				<div class="jeonga_ugift_shead">
					<div class="jeonga_ugift_shead_left">
						<div class="jeonga_ugift_shead_date">${sendList.order_date}</div>
						<div class="jeonga_ugift_shead_divide">|</div>
						<div class="jeonga_ugift_shead_address" style="color:#DF3A01">${sendList.order_address_input}</div>
					</div>
					<div class="jeonga_ugift_shead_right">
						<a href="/bomulsum/user/sendGift/${sendList.order_code_seq}.do" class="jeonga_ugift_slink"> ${sendList.gift_recipient_name}님에게 보낸 선물 > </a>
					</div>
				</div>
				<div class="jeonga_ugift_sbody">
					<div class="jeong_ugift_sbody_image">
						<img src="<c:url value='/upload/${sendList.art_photo}'/>" style="width:70px; height:70px;">
					</div>
					<div class="jeonga_ugift_sbody_order">
						<div class="jeonga_ugift_sbody_title">${sendList.b_art_name}</div>
						<div class="jeonga_ugift_sbody_option">${sendList.order_pay_price} / ${sendList.b_art_option_count}개</div>
					</div>
					<div class="jeonga_ugift_sbody_sellerpart">
						<div class="jeonga_ugift_sbody_seller">
						${sendList.writer_brand_name}<br>
						<a href="/bomulsum/user/message.do?writer=${sendList.b_writer_code_seq}" id="jeonga_ugift_sbody_button">메시지로 문의</a>
						</div>
					</div>
					<div class="jeonga_ugift_sbody_list">
						<button type="button" disabled id="jeonga_ugift_sbody_list_address">배송주소 직접 입력</button><br>
						<button type="button" onclick="#" id="jeonga_ugift_sbody_list_cancel">주문 취소</button>
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