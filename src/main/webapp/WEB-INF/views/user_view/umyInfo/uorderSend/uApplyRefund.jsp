<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 환불 신청</title>
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


.dndud_content{
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

.dndud_content_top{
	width:100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-bottom:4%;
}

.dndud_content_top_title{
	display: flex;
	justify-content:left;
}

.dndud_content_main{
	width:100%;
	display:flex;
	border:1px solid #E6E6E6;
	flex-direction: column;
	margin-bottom:3%;
}

.dndud_content_title{
	display:flex;
	border-bottom:1px solid #E6E6E6;
	background-color:#f5f5f5;
	justify-content: space-between;
	flex-direction: row;
	font-size:13px;
}

.dndud_content_title span{
	margin:2% 1% 2% 1%;
}

.dndud_content_title div{
	width:auto;
	display:flex;
	align-items:center;
}

.dndud_content_title div:nth-child(1){
	width:80%;
	display:flex;
	flex-direction: row;
    margin-left: 1.5%;
}

.dndud_content_title div:nth-child(2){
	width:20%;
	display:flex;
	flex-direction: row;
	justify-content: flex-end;
	margin-right:1%;
}

.dndud_content_main_article{
	display:flex;
	flex-direction: row;
}

.dndud_content_main_imsiDiv{
	display: flex;
    flex-direction: column;
    width: 70%;
}

.dndud_content_main_imsiDiv .dndud_content_main_left:nth-last-child(1){
	border-bottom:0;
}

.dndud_content_main_left{
	display:flex;
	flex-direction: column;
	width:100%;
	border-right: 1px solid #E6E6E6;
	border-bottom: 1px solid #E6E6E6;
}

.dndud_content_main_left_first{
	display:flex;
	flex-direction: row;
	padding:3%;
}

.dndud_content_main_left_first div:nth-child(2){
	display:flex;
	flex-direction: column;
	margin-left:2%;
}

.dndud_content_main_left_first div:nth-child(2) span:nth-child(1){
	font-weight:bold;
	font-size:15px;
	margin-bottom:1%;
}

.dndud_content_main_left_first div:nth-child(2) span:nth-child(2){
	font-weight:bold;
	color:gray;
	font-size:13px;
}

.dndud_content_main_left_second{
	display:flex;
	flex-direction: column;
	justify-content: space-between;
    padding-right: 3%;
}

.dndud_content_main_left_second ul{
	margin:0;
	font-size:13px;
	color: gray;
}

.dndud_content_main_left_third{
	width:94%;
	display:flex;
	flex-direction: row;
	padding:3%;
	font-size:13px;
}

.dndud_content_main_left_third div{
	height:80px;
	width:100%;
}

.dndud_content_main_left_third div span{
	font-size:14px;
	font-weight: bold;
	color:gray;
}

.dndud_content_main_left_third div div{
	display:flex;
	align-items: center;
	background-color: #f5f5f5;
	border: 1px solid #E6E6E6;
	height: 50px;
	margin-top:2%;
}

.dndud_content_main_left_third div div span{
	margin:3%;
	color:black;
	font-weight: normal;
}


.dndud_content_main_right{
	display:flex;
	flex-direction: column;
	justify-content:center;
	align-items:center;
	width:30%;
	font-size:15px;
}

.dndud_content_main_right button{
	margin-top: 2%;
    padding: 3%;
    background-color: white;
    border: 1px solid gray;
    cursor: pointer;
    font-size: 12px;
    border-radius: 5px;
}

.dndud_content_main_right button:focus{
	outline:none;
}

.refundToolTip{
	width:94%;
	padding:2%;
	border-bottom: 1px solid #E6E6E6;
}

.refundTooTip_box{
	background-color: #f5f5f5;
	border: 1px solid #E6E6E6;
	font-size:13px;
	padding:2%;
	display:flex;
	flex-direction:column;
	margin-bottom:2%;
}

.refundTooTip_box span{
	margin-bottom:0.5%;
}

.write_refund_reason{
	width:100%;
	display:flex;
	flex-direction: row;
}

.write_refund_reason select{
	width:30%;
	height:41px;
}

.write_refund_reason input[type="text"]{
	margin-left:1%;
	width:69%;
	height:35px;
}

.cancel_or_apply{
	display:flex;
	width:100%;
	flex-direction:row;
	align-items: center;
	justify-content: center;
}

.cancel_or_apply input[type="button"]{
	font-size:16px;
	margin: 0.2%;
    width: 100px;
    height: 40px;
    cursor:pointer;
    border-radius:5px;
}

.cancel_or_apply input[type="button"]:focus{
	outline:none;
}

.cancel_or_apply input[type="button"]:nth-child(1){
	background-color:white;
	border:	1px solid gray;
}

.cancel_or_apply input[type="button"]:nth-child(2){
	background-color:#1f76bb;
	border: 0;
	color:white;
}

.option_info_div{
	font-size: 14px;
    color: gray;
    font-weight: bold;
}

.dndud_option_imsi{
	display: flex;
    flex-direction: row;
    justify-content: space-between;
	margin-bottom: 1%;
}

</style>
</head>
<body>
<div>
	<!-- 헤더 -->
	<%@ include file="../../include/uHeader.jsp"  %>
	
	
	
	<div class="content">
	<!-- 사이드메뉴 -->
	<%@ include file="../../include/uside.jsp" %>
	<!-- 내용 여기다 넣으시오 -->
		<div class="dndud_content">
		
			<div class="dndud_content_top">
				<div class="dndud_content_top_title">
					<a class="dndud_txt_f1">환불신청</a>
				</div>
			</div>
			<c:set var="order" value="${data.orderTable }"/>
			<c:set var="writerList" value="${data.buyWriter }" />
			<c:set var="artList" value="${data.buyArt }" />
			<c:set var="optionList" value="${data.buyOption }" />
			<div class="dndud_content_main">
				<div class="dndud_content_title">
					<div>
						<span>${order.orderDate }</span>|<span>배송주소 입력완료</span>
					</div>
					<div>
						<span></span>
					</div>
				</div>
				<div class="dndud_content_main_article">
					<div class="dndud_content_main_imsiDiv">
						<c:forEach items="writerList" var="writer">
								<c:forEach items="${artList }" var="art">
									<c:if test="${writerCode eq art.buyWriterCodeSeq }">
										<div class="dndud_content_main_left">
											<div class="dndud_content_main_left_first">
												<div>
													<img src="<c:url value='/upload/${art.artPhoto }'/>" style="width:75px; height:75px;">
												</div>
												<div>
													<span>${art.artName }</span>
												</div>
											</div>
											<div class="dndud_content_main_left_second">
												<c:forEach items="${optionList }" var="option">
													<c:if test="${option.buyArtCodeSeq eq art.buyArtCodeSeq }">
														<c:set var="op_name" value="${fn:split(option.artOptionName, '/')}"/>
														<div class="dndud_option_imsi">
														<ul>
															<c:forEach items="${op_name }" var="op" varStatus="g" end="2">
																<li>옵션${g.index+1 } : ${op }</li>
															</c:forEach>
														</ul>
														<div class="option_info_div">
															<span><fmt:formatNumber value="${option.artPrice }" pattern="#,###"/>원</span> /
															<span>${option.artOptionAmount }개</span>
														</div>
														</div>
													</c:if>
												</c:forEach>
											</div>
											<div class="dndud_content_main_left_third">
												<div>
													<span>요청사항</span>
													<div>
														<span>${art.buyArtRequest }</span>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							
						</c:forEach>
						
					</div>
					<div class="dndud_content_main_right">
						<c:if test="${empty writerList[0].writerBrandName }">
							<span>${writerList[0].writerName }</span>
						</c:if>
						<c:if test="${not empty writerList[0].writerBrandName }">
							<span>${writerList[0].writerBrandName }</span>
						</c:if>
						<button id="goToMessage">메시지로 문의</button>
					</div>
				</div>
			</div>
			
			<div class="dndud_content_top">
				<div class="dndud_content_top_title">
					<a class="dndud_txt_f2">환불 신청전 판매 작가님과 협의해 주세요.</a>
				</div>
				
				<div class="refundToolTip">
					<div class="refundTooTip_box">
						<span>- 협의 없이 신청시 거부 될 수 있습니다.</span>
						<span>- 선택하신 사유에 의해 책임 여부가 결정되며, 이에 따른 추가 배송비가 발생 될 수 있습니다.</span>
					</div>
					
					<div class="write_refund_reason">
						<select id="reason_title">
							<option>다른 작품으로 재주문</option>
							<option>배송지연</option>
							<option>상품 불량</option>
							<option>단순변심</option>
							<option>기타</option>
						</select>
						<input id="reason_detail" type="text" placeholder="상세 사유를 입력해 주세요." >
					</div>
				</div>
			</div>
			
			<div class="cancel_or_apply">
				<input type="button" value="취소" onclick="location.href='/bomulsum/user/myInfo/orderList.do'">
				<input id="request_refund_button" type="button" value="신청">
			</div>
	
		</div>
	
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

$(function(){
	$('#request_refund_button').on('click', function(){
		var reason = $('#reason_title').val() + '_' + $('#reason_detail').val();
		$.ajax({
			type:'post',
			data:{
				code:getParameter('buyWriterCode'),
				reason:reason
			},
			url:'/bomulsum/user/myInfo/refund/request/check.do',
			success:function(e){
				location.href="/bomulsum/user/myInfo/refundList.do";
			}
		});
	});
});
</script>
</html>