<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬|알림</title>
<style type="text/css">

#wonAlarmButton{
	border: #D8D8D8;
	background-color: white;
	cursor: pointer;
}

#wonAlarmButton:hover{

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
</style>
</head>
<body>
<div>
	<%@ include file="../../include/uHeader.jsp"  %>
	<div style="height: 800px; width:50%; margin-left: 25%; margin-top: 1%; margin-right: 50%; border: 1px #D8D8D8 solid; overflow-y:scroll;">
		<div style="width: 100%;">
			<div style=" border-bottom: 1px #D8D8D8 solid; width:100%; height: 40px; font-weight:bold; text-align: center;">
				<p>알림</p>
			</div>
			<div style="display: flex; flex-direction: row; height:100%;overflow:scroll;">
				<div style="width:100%;">
				<!-- 내용물 -->
				<c:forEach begin="1" end="20">
					<button id="wonAlarmButton" style="width: 100%;">
						<div style="display: flex; flex-direction: row;">
							<div style="width: 10%;">
								<img src="<c:url value='/resources/img/test.png'/>" style="width: 100%;">
							</div>
							<div style="width:80%;">
								<div style="display: flex; flex-direction: row; width: 100%;">
									<span style="border:1px solid red; border-radius: 5px; font-size: 80%; color: red;">이벤트/공지</span>
									<span style="font-weight: bold; margin-left: 1%;">판매자 계정</span>
								</div>
								<div style="float: left; margin: 1%;">
									<span>알림 내용 입니다.</span>
								</div>
							</div>
							<div>
								<span style="font-size: 70%; color: #D8D8D8;">등록날짜</span>
							</div>
						</div>
					</button>
				</c:forEach>
				<!-- 내용물 -->
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../../include/uFooter.jsp" %>
</div>
</body>
</html>