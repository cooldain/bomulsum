<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/fea5b9b7d0.js" crossorigin="anonymous"></script>
<title>보물섬 | 쿠폰함</title>
<style>
.content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px;
	padding-bottom: 64px;
	display:flex;
}

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}

.dndud_coupon{
	width:80%;
	margin-left: 2%;
}

.dndud_txt_f1{
	font-size: 24px;
	font-weight: bold;
	color: #333;
}

.dndud_txt_f2{
	font-size: 16px;
	font-weight: bold;
	color: #333;
}

.dndud_coupon_top{
	width:100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-bottom:4%;
}

.dndud_coupon_top_title{
	display: flex;
	justify-content:left;
}

.dndud_coupon_list{
	width:100%;
	border-top: 1px solid #E6E6E6;
	margin-bottom: 2%;
	display: flex;
	flex-direction: wrap;
	flex-wrap: wrap;
}


.dndud_coupon_detail{
	width:470px;
	height:200px;
	padding:31px;
	background-image: URL("<c:url value='/resources/img/coupon_ui.png'/>");
}

.dndud_coupon_detail_box{
    margin-left: 80px;
    height: 200px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}


.dndud_coupon_detail_box span:nth-child(1){
	font-size: 20px;
    font-weight: bold;
}

.dndud_coupon_detail_box span:nth-child(2){
	font-size: 35px;
    font-weight: bold;
    color: #d64640;
    margin: 1%;
}

.dndud_coupon_detail_box span:nth-child(3){
	font-size: 14px;
    margin-bottom: 1%;
}

.dndud_coupon_detail_box div{
	margin-top:5%;
	padding:1.5% 10%;
	border:1px solid gray;
	cursor: pointer;
	border-radius:5px;
	color:#2dabb3;
	font-size: 15px;
}


.dndud_coupon_none{
	width:100%;
	display:flex;
	justify-content:center;
	align-items: center;
    margin-top: 100px;
    margin-bottom: 150px;
}

.dndud_coupon_none span{
	font-size:15px;
	font-weight:bold;
}

.dndud_content_paging{
	width:100%;
	display:flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border-bottom: 1px solid #E6E6E6;
	padding-bottom:3%;
	margin-bottom:3%;
}

.dndud_content_paging_num{
	width:50%;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.dndud_content_paging_num a{
	color:red;
	padding:0.5% 1% 0.5% 1%;
	border: 1px solid #d9d9d9;
}


.dndud_coupon_announcement{
	width:100%;
	display:flex;
	flex-direction: column;
	padding-bottom:3%;
	margin-bottom:3%;
}

.dndud_coupon_announcement div:nth-child(1){
	font-size:18px;
	font-weight:bold;
}

.dndud_coupon_announcement div:nth-child(2){
	display:flex;
	flex-direction:column;
	border: 1px solid #E6E6E6;
	background-color: #f5f5f5;
	padding:2%;
	margin-top:2%;
}

.dndud_coupon_announcement div:nth-child(2) span:nth-child(1){
	margin-bottom:0.5%;
}

.dndud_coupon_announcement a{
	color: #d64640;
}

</style>
</head>
<body>
<script>
function dateDiff(_date1, _date2){
	var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
	var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
	
	diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth() + 1, diffDate_1.getDate());
	diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth() + 1, diffDate_2.getDate());
	
	var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
	diff = Math.ceil(diff / (1000 * 3600 * 24));
	
	return diff;
}
</script>
<div>
	<c:if test="${empty member}">
		<script>
			alert('로그인이 필요한 서비스입니다.');
			location.href='<c:url value="/user/login.do"/>';
		</script>
	</c:if>
	<!-- 헤더 -->
	<%@ include file="../../include/uHeader.jsp"  %>
	
	
	
	<div class="content">
	<!-- 사이드메뉴 -->
	<%@ include file="../../include/uside.jsp" %>
	<!-- 내용 여기다 넣으시오 -->
		<div class="dndud_coupon">
		
			<div class="dndud_coupon_top">
				<div class="dndud_coupon_top_title">
					<a class="dndud_txt_f1">쿠폰함</a>
				</div>
			</div>
			
			<c:if test="${empty couponList}">
				<div class="dndud_coupon_none">
					<span>사용가능한 쿠폰이 없습니다.</span>
				</div>
			</c:if>
			
			
			
			<div class="dndud_coupon_list">
				<c:forEach var="coupons" items="${couponList}">
					<div class="dndud_coupon_detail">
						<div class="dndud_coupon_detail_box">
							<span><span>${coupons.couponName}</span> 쿠폰</span>
							<span><a><fmt:formatNumber value="${coupons.couponPrice}" pattern="#,###"/></a>원</span>
							<script>
								var date = '${coupons.couponDate}';
								var time = dateDiff(date, new Date());
							</script>
               				<span>사용기한 : 발급일로부터 30일 (잔여 : <a><script>document.write(time - 1)</script></a> 일)</span>
               				<div class="goHome">작품 보러가기</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			
			<div class="dndud_coupon_announcement">
				<div>
					<span>안내사항</span>
				</div>
				<div>
					<span><i class="fas fa-caret-right"></i> 쿠폰 사용시 <a>1가지의 쿠폰만 적용 가능</a>합니다.</span>
					<span><i class="fas fa-caret-right"></i> 쿠폰은 배송비 제외 <a>10,000원 이상 구매시</a> 사용 가능합니다.</span>
				</div>
			</div>
			
			
	
	
		
		</div>
	
	
	
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
	$(".goHome").on("click", function(){
		location.href = '/bomulsum/category/recommended.do';
	});
});
</script>
</html>