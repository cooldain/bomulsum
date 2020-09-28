<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 최근 본 작품</title>
<style>
.content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px;
	padding-bottom: 64px;
	display: flex;
}

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}

#wonBookButton {
	cursor: pointer;
	text-decoration: none;
}

.wonBookContent {
	cursor: pointer;
}

.wonBookContent:hover {
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.2);
	transition: .5s;
}
.minwoo_starRev{
	margin-top: 10px;
	display: flex;
    align-items: center;
}

.minwoo_starR1{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat -28px 0;
    background-size: auto 100%;
    width: 8px;
    height: 16px;
    float:left;
    text-indent: -9999px;
}
.minwoo_starR2{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat right 0;
    background-size: auto 100%;
    width: 8px;
    height: 16px;
    float:left;
    text-indent: -9999px;
}
.minwoo_starR1.on{background-position:0 0;}
.minwoo_starR2.on{background-position:-8px 0;}

.content_img{
	margin: 1%;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-size: 100% auto;
	display:flex;
	flex-direction: column;
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

			<div style="margin-left: 2%; width: 82%;">
				<div>
					<h2 style="margin: 1%;">최근 본 작품</h2>
				</div>
				<div>
					<div style="display: flex; flex-direction: row; flex-wrap: wrap;">
						<c:forEach items="${data }" var="data">
						
							<div id="${data.artCode }" onclick="artCode(this)" class="wonBookContent" style="width: 23%; text-decoration: none; margin: 1%;">
								<!-- 내용물 -->
								<%-- <div class="content_img" style="background-image : url('/bomulsum/upload/${data.artImg}')"></div> --%>
								<img style="width: 100%; max-height:330px;min-height: 196px;" src="<c:url value='/upload/${data.artImg }'/>"> 
								<div style="display:flex; flex-direction: column">
									<span style="color: #ABABAB; font-size: 80%;">${data.writerName }</span>
									<span style="display: block; text-overflow:ellipsis;overflow: hidden;white-space: nowrap;">${data.artName }</span>
									<c:choose>
										<c:when test="${data.artPercent == 0 }">
											<span><fmt:formatNumber value="${data.artDiscount }" pattern="#,###" />원</span>
										</c:when>
										<c:otherwise>
											<div>
												<span style="color: red;"><fmt:formatNumber value="${data.artPercent }" pattern="#,###" />%</span>
												&nbsp;
												<span><fmt:formatNumber value="${data.artDiscount }" pattern="#,###" />원</span>
											</div>
											<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;"><fmt:formatNumber value="${data.artPrice }" pattern="#,###" />원</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${data.reviewCnt == 0 }">
										</c:when>
										<c:otherwise>
										<div class="minwoo_starRev" data-rate="${data.reviewValue }">
											<span class="minwoo_starR1">별1_왼쪽</span> <span class="minwoo_starR2">별1_오른쪽</span>
											<span class="minwoo_starR1">별2_왼쪽</span> <span class="minwoo_starR2">별2_오른쪽</span>
											<span class="minwoo_starR1">별3_왼쪽</span> <span class="minwoo_starR2">별3_오른쪽</span>
											<span class="minwoo_starR1">별4_왼쪽</span> <span class="minwoo_starR2">별4_오른쪽</span>
											<span class="minwoo_starR1">별5_왼쪽</span> <span class="minwoo_starR2">별5_오른쪽</span>
											<span style="margin-left: 10px;font-size: 12px; color: #666;">(<span>${data.reviewCnt }</span>)</span>
										</div>
										<span style="display: block;text-overflow:ellipsis;overflow: hidden;white-space: nowrap;">
											<span style="background-color: #EAEAEA; border: 1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
											&nbsp;<span style="color: #ABABAB; font-size: 60%;">${data.recentlyReviewContent }</span>
										</span>
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>
						</c:forEach>


					</div>
				</div>
			</div>




		</div>
		<!-- 푸터  -->
		<%@ include file="../../include/uFooter.jsp"%>
	</div>
</body>
<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';
function artCode(e){
	var art_code = e.id;
	var url = "/bomulsum/user/uProductInfo/"+art_code+".do?memberCode="+memberCode;
	window.open(url, "_blank");
}

window.onload = function(){
	var starRevPoint = $('.minwoo_starRev');
	starRevPoint.each(function(){
		var targetScore = $(this).attr('data-rate');
		console.log(targetScore);
		$(this).find('span:nth-child(-n+'+ targetScore +')').parent().children('span').removeClass('on');
		$(this).find('span:nth-child(-n+'+ targetScore +')').addClass('on').prevAll('span').addClass('on');
	});
}

</script>
</html>