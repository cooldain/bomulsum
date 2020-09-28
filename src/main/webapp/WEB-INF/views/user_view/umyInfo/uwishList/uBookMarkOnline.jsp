<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 즐겨찾는 온라인 클래스</title>
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

#wonBookContent {
	cursor: pointer;
}

#wonBookContent:hover {
	box-shadow: 1px 1px gray;
}

.dainClikedTab {
	width: 33%;
	padding: 2%;
	border: 1px solid #D9D9D9;
	color: #333333;
	font-weight: bold;
	text-align: center;
}

.dainUnClikedTab {
	width: 33%;
	padding: 2%;
	border: 1px solid #D9D9D9;
	text-align: center;
	color: #ACACAC;
	background-color: #F5F5F5;
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
	
	<div style="margin-left:2%; width: 100%;">
		<div>
			<h2 style="margin: 1%;">즐겨찾는(★) 작품</h2>
		</div>
		<div style="display: flex; flex-direction: row; margin: 1%;">
			<a id="wonBookButton" class="dainUnClikedTab" href="<c:url value='/user/wishlist/bookmarkWork.do'/>" 
			style="border: 1px solid #d9d9d9;">작품</a>
			
			<a id="wonBookButton" class="dainClikedTab" href="<c:url value='/user/wishlist/bookmarkOnline.do'/>" 
			style="border-top: 1px solid #d9d9d9;border-bottom: 1px solid #d9d9d9;">온라인</a>
			
			<a id="wonBookButton" class="dainUnClikedTab" href="<c:url value='/user/wishlist/bookmarkOffline.do'/>" 
			style="border: 1px solid #d9d9d9;">오프라인</a>
		</div>
	<%-- 	<div style="align-self: center;">
				<div style="display: flex; flex-wrap: wrap;">
					<div id="wonBookContent" style="width: 23%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
					<div id="wonBookContent" style="width: 23%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
					<div id="wonBookContent" style="width: 23%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
					<div id="wonBookContent" style="width: 23%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
					<div id="wonBookContent" style="width: 22%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
				</div>
				
		</div>--%>
		<div style="display: flex; flex-direction: row; justify-content:center; margin: 2%;">
						<!-- <a id="wonBookContent">
							<span style="text-align: center;">&lt;이전 |</span>
						</a> -->
						<a style="font-size: 12px; color:#b4b4b4; margin-top: 50px; font-weight: bold; cursor: pointer;">
							<span style="text-align: center;">| 다음&gt;</span>
						</a>
		</div> 
	</div>
	
	
	
	
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>
</body>
</html>