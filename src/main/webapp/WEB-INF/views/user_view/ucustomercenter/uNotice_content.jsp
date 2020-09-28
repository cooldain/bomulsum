<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 공지사항</title>
<script src="https://kit.fontawesome.com/fea5b9b7d0.js" crossorigin="anonymous"></script>
<style type="text/css">

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}


.minwoo_notice_body{
	width:1054px;
	margin-left:auto;
	margin-right:auto;
	border:1px #D8D8D8 solid;
	margin-top: 1px;
}

.minwoo_notice_body_body{
	width:100%;
	border-top:1px #D8D8D8 solid;
	min-height: 500px;
}

.minwoo_notice_one_detail_header{
 	width:96%;
 	border-bottom:1px #D8D8D8 solid;
 	height:50px;
 	display: flex;
 	flex-direction: row;
 	justify-content: space-between;
 	align-items: center;
 	padding: 0 2%;
}

.minwoo_notice_one_detail_content{
	width:96%;
	padding: 0 2% 2% 2%;
}

.minwoo_notice_one_detail_content img{
	max-width: 100% !important;
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

.dndud_notice_coupon{
    width: 50%;
    display: flex;
    height: 300px;
    background-image: url("<c:url value='/resources/img/coupon_ui.png' /> ");
    background-size: 100%;
    background-repeat: no-repeat;
    margin-left: 25%;
    flex-direction: column;
    font-weight: bold;
}

.dndud_notice_coupon_main{
	display: flex;
    flex-direction: column;
    height: 100%;
    padding: 6% 6% 4% 26%;
}

.dndud_notice_coupon_main span:nth-child(1){
	font-size: 60px;
    margin-bottom: 15px;
    color: #1f76bb;
}

.dndud_notice_coupon_main span:nth-child(2){
    font-size: 25px;
    margin-bottom: 10px;
}

.dndud_notice_coupon_main span:nth-child(3){
	font-size: 18px;
    color: #666666;
}

.dndud_notice_coupon_button{
	display:flex;
	justify-content: center;
	align-items: center;
    margin: 0 2.5%;
    border: 1px solid #666;
    cursor:pointer;
}

.dndud_notice_coupon_button span{
	padding: 2% 0;
    color: #666;
}
</style>
</head>
<body>
<div>
	<%@ include file="../include/uHeader.jsp"  %>
	
	<!-- 게시판 영역 -->
	<div class="minwoo_notice_body">
		<!-- 헤더 시작-->
		<div style="width:100%;">
			<div style="width:100%; height: 55px;">
				<c:choose>
					<c:when test="${notice.noticeCategory eq '이벤트' }">
						<p style="font-weight:bold; font-size:22px; color:#848484; padding-left:20px;">이벤트</p>
					</c:when>
					<c:when test="${notice.noticeCategory eq '회원용-자주묻는질문' }">
						<p style="font-weight:bold; font-size:22px; color:#848484; padding-left:20px;">자주 묻는 질문</p>
					</c:when>
					<c:otherwise>
						<p style="font-weight:bold; font-size:22px; color:#848484; padding-left:20px;">공지사항</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- 헤더 종료 -->
		
		<!-- 글 들어올 바디 영역 시작 -->
		<div class="minwoo_notice_body_body">
			<!-- 글 제목 시작-->               
			<div class="minwoo_notice_one_detail_header">
				<div style="font-size: 18px; font-weight: bold; color: #1f76bb; letter-spacing: 0.5px;">
					<span>❑</span>
					<span><c:out value="${notice.noticeTitle}" /></span>
				</div>
				<span><c:out value="${notice.noticeDate}" /></span>
			</div>
			<!-- 글 제목 종료 -->
			<!-- 글 내용 시작 -->
			
			<div class="minwoo_notice_one_detail_content">
				<!-- 이 안에 글 내용 들어와야 합니다!!!!!! -->
				${notice.noticeContent}
			</div>
			<c:if test="${notice.noticeCategory eq '이벤트' }">
				<div style="padding: 3% 0; border-top:1px solid #d9d9d9">
					<div class="dndud_notice_coupon">
						<div class="dndud_notice_coupon_main">
							<span><fmt:formatNumber value="${coupon.couponPrice}" pattern="#,###"/></span>
							<span>${coupon.couponName}</span>
							<span>${coupon.couponContent}</span>
						</div>
						<div id="couponButton" class="dndud_notice_coupon_button">
							<span>쿠폰받기</span>
						</div>
					</div>
				</div>
			</c:if>
			<!-- 글 내용 종료 -->
		</div>
		<!-- 글 들어올 바디 영역 종료 -->
		
	</div>
	
	<%@ include file="../include/uFooter.jsp" %>
</div>
</body>

<script> this.contextPath = "<c:url value="/"/>"</script>
<script>
var isEmpty = function(value){ 
	if( value == "" || value == null || value == undefined || value == 'null' || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
		return true 
	}else{ 
		return false 
	} 
};

var t = `${coupon.couponPrice}`;
	$(function(){
		$("#couponButton").click(function(){
			var test = '${coupon.couponAll}';
			var session = `<%= session.getAttribute("user") %>`;
			var memberCode = '<%= session.getAttribute("member") %>';
			
			console.log(session);
			console.log(memberCode);
			if(isEmpty(session)){
				alert('로그인이 필요한 서비스입니다.');
				location.href= "<c:url value='/user/login.do'/>";
			}else{
				$.ajax({
					url : contextPath + '/user/board/coupon.do',
					type : 'get',
					data : {
						memberCodeSeq : memberCode,
						couponName : '${coupon.couponName}',
						couponContent : '${coupon.couponContent}',
						couponPrice : `${coupon.couponPrice}`
					},
					success : function(data){
						if(data != 1){
							console.log(data);
							alert('쿠폰 저장이 완료되었습니다.');
							location.href="<c:url value='/user/coupon/list.do'/>";
							return;
						}else{
							console.log(data);
							alert('이미 받으신 쿠폰입니다.');
							location.href="<c:url value='/user/coupon/list.do'/>";
							return;
						}
						
					},
					error : function(error){
						console.log(error);
						alert("실패 했습니다.");
					}
				});
			}
		});
	});
</script>
</html>