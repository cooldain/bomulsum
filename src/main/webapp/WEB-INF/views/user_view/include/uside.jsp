<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>side</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
	
<style>
.myInfo {
	width: 18%;
}

.jeonga-ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 100%;
	background-color: #f1f1f1;
}

.jeonga-navItem a {
	display: block;
	color: #000;
	text-decoration: none;
}

.jeonga-navItem a:hover{
	color: #1f76bb;
}

.jeonga-navItem1 a {
	display: block;
	color: #000;
	text-decoration: none;
}

.jeonga-navItem1 a:hover{
	color: #1f76bb;
}

.jeonga-navItem {
	padding: 7%;
	border-bottom: 1px solid #adb5bd;
}

.jeonga-navItem1 {
	padding: 7%;
}

#jeonga-menuTitle {
	padding: 7%;
	background-color: #1f76bb;
	font-size: 15px;
	border: 1px solid #1f76bb;
}

.jeonga-imagesession {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
	position: relative;
	margin-top: 13.3875px;
}

.jeonga-profile {
	width: 99%;
	border: 1px solid #1f76bb;
	padding-top: 2%;
	padding-bottom: 1%;
	padding-right: 0px;
	padding-left: 0px;
}

#jeonga-profileImage {
	width: 80px;
	height: 80px;
	/* width:100%;
	height:100%; 
	background-color:black; */
}

.jeonga-b {
	font-size: 14px;
}

.jeonga-collapse-item {
	margin-top: 4%;
	margin-bottom: 4%;
	font-size: 13px;
	text-decoration: none;
	color: black;
}

.userName {
	margin-bottom: 13.1875px;
}

#dain-profileEditMsg {
	background-color: black;
	z-index: 999;
	width: 80px;
	height: 80px;
	border-radius: 100%;
	position: relative;
	cursor: pointer;
	color: white;
	font-size: 12px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	opacity: 0;
}

#dain-profileEditMsg:hover{
	opacity: 0.8;
}
</style>

<script>

	//사이드 프로필 이미지 클릭시 프로필 사진 변경 _ 다인추가
	function fileUpload(fis) {
		var str = fis.value;
		console.log("파일네임: " + fis.value.substring(str.lastIndexOf("\\") + 1));
		var fileName = fis.value.substring(str.lastIndexOf("\\") + 1);

		// Get form
		var form = $('#frm_profile_img')[0];
		
		// Create an FormData object 
		var data = new FormData(form);
		
		
		/* 
		- contentType : false 로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
		- processData : false로 선언 시 formData를 string으로 변환하지 않음 
		*/
		$.ajax({
			type : "POST",
			enctype : 'multipart/form-data',
			url : "/bomulsum/user/updateUserProfile.do",
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			success : function(data) {
				alert("등록 되었습니다.");
				location.reload();
			},
			error : function(e) {
				console.log("ERROR : ", e);
				alert("등록 실패");
			}
		});
	}
</script>

</head>
<body>
	<!-- sidebar 시작 -->
	<div class="myInfo">
	<!-- 프로필 영역 -->
	   <div class="jeonga-profile" align="center">
        	<div class="jeonga-imagesession">
        		<%-- <img id="jeonga-profileImage" src="<c:url value='/resources/img/test.png'/>"/>  --%>
        		<form method="POST" enctype="multipart/form-data" id="frm_profile_img" >
        		<label for="dainImageInput"> 
        			<div id="dain-profileEditMsg">수정</div>
        			<c:if test="${sessionScope.user.memberImg ne null}">
					<img id="jeonga-profileImage" src="<c:url value='/upload/${sessionScope.user.memberImg}'/>" 
					style="cursor: pointer; position: absolute; top:0px; left:0px;"/>
					</c:if>
        			<c:if test="${sessionScope.user.memberImg eq null}">
					<img id="jeonga-profileImage" src="<c:url value='/resources/img/test.png'/>" 
					style="cursor: pointer; position: absolute; top:0px; left:0px;"/>
					</c:if>
        			<input type="file" name="fileProfile" id="dainImageInput" onchange="fileUpload(this)" style="display: none;" />
				</label>
				</form>
			</div>
        	<div id="test"></div>
        	<div class="membership" style="margin-top:7%; margin-bottom:3%;">
        		<c:if test="${sessionScope.user.memberGrade ne null}">
        		<i class="fas fa-gem" style="color:gold"><a class="jeonga-collapse-item" href="#">&nbsp;${sessionScope.user.memberGrade} ></a></i>
        		</c:if>
         		<c:if test="${sessionScope.user.memberGrade eq null}">
        		<i class="fas fa-gem" style="color:gold"><a class="jeonga-collapse-item" href="#">&nbsp;브론즈 ></a></i>
        		</c:if>       		
        	</div>
        	<div class="userName">
        		<b>${sessionScope.userName}</b>
        	</div>
	</div>

		<!-- 메뉴 영역 -->
		<ul class="jeonga-ul">
			<li id="jeonga-menuTitle">
				<b class="jeonga-b" style="color:white">My MENU</b>
			</li>
			<!-- 주문 영역 -->
			<li class="jeonga-navItem">
				<b class="jeonga-b">주문배송</b> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/myInfo/orderList.do'/> ">주문 내역</a> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/myInfo/refundList.do'/> ">환불 내역</a> 
			</li>
			<!-- 선물함 -->
			<li class="jeonga-navItem">
				<b class="jeonga-b">선물함</b> 
				<a class="jeonga-collapse-item" href="#">받은 선물함</a> 
				<a class="jeonga-collapse-item" href="#">보낸 선물함</a> 
			</li>
			<!-- 알림 및 메시지 -->
			<li class="jeonga-navItem">
				<b class="jeonga-b">알림 및 메시지</b> 
				<a class="jeonga-collapse-item" href="#">알림</a> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/message.do'/> ">메시지</a> 
			</li>
			<!-- 나의 구매후기 -->
			<li class="jeonga-navItem">
				<b class="jeonga-b">나의 구매 후기</b> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/myInfo/review.do'/>">구매후기 쓰기</a>
				<a class="jeonga-collapse-item" href="<c:url value='/user/myInfo/reviewedList.do'/>">내가 쓴 구매후기</a>
			</li>
			<!-- 관심리스트 -->
			<li class="jeonga-navItem">
				<b class="jeonga-b">관심리스트</b> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/wishlist/bookmarkWork.do'/>">즐겨찾기(★)</a> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/wishlist/likeWriter.do'/> ">좋아하는(♥)작가</a>
				<a class="jeonga-collapse-item" href="<c:url value='/user/wishlist/recently.do'/> ">최근 본 작품</a>
			</li>
			<!-- 할인혜택 -->
			<li class="jeonga-navItem">
				<b class="jeonga-b">할인혜택</b> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/reserves.do'/>">적립금</a> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/coupon/list.do'/> ">쿠폰함</a>
			</li>
			<!-- 내정보 -->
			<li class="jeonga-navItem1">
				<b class="jeonga-b">내정보</b> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/membergrade.do'/>">회원 등급</a> 
				<a class="jeonga-collapse-item" href="<c:url value='/user/infomanage.do'/>">회원 정보 관리</a>
				<a class="jeonga-collapse-item" href="<c:url value='/user/registeraddress.do'/>">주소(배송지)관리</a>
			</li>
		</ul>
	</div>
</body>
</html>