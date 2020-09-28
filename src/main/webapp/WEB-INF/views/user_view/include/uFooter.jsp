<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.dainfooter{
	background-color: #ffffff;
	font-size: 12px;
	padding-bottom: 2%;
	z-index: 99;

}
.dain-borderright{
	border-right: 1px solid black;
}

.dainfooter-table{
	margin-top: 10px;
	margin-bottom: 10px;
	
}
.dainfooter-table td{
	padding-left : 20px;
	padding-right : 20px;
}

.dainfooter-link{
	border-top: 3px solid #1f76bb;
	border-bottom: 1px solid #f1f1f1;
}

.dainfooter-copy{
	padding-top: 10px;
	padding-bottom: 10px;

}

.dain-footer-a:link, .dain-footer-a:visited, .dain-footer-a:hover, .dain-footer-a:active {
  text-decoration: none;
  color: black;
  
}

.dainfooter-middle {
	display: flex;
	justify-content: space-between;
	margin-left: auto;
	margin-right: auto;
	height: 52%;
	width: 70%;
}

.dainfooter-middle-inner{
	width: 100%;
	padding: 32px 0;
	display: flex;
	justify-content: space-between;
}

/*SNS아이콘*/
.dainfa {
  padding: 10px;
  font-size: 20px;
  width: 20px;
  text-align: center;
  text-decoration: none;
  margin: 5px 2px;
  border-radius: 50%;
}

.dainfa:hover {
    opacity: 0.7;
}


.fa-facebook {
  background: #3B5998;
}

.fa-twitter {
  background: #55ACEE;
}

.fa-google {
  background: #dd4b39;
}

.fa-instagram {
  background: #125688;
}
</style>
</head>
<body>
<!-- Footer -->
<footer class="dainfooter">
<!-- footer link부분 -->
<div class="dainfooter-link" align="center">
	<table class="dainfooter-table">
		<tr>
			<td class="dain-borderright"><a class="dain-footer-a" href="<c:url value='/user/board/notice.do'/> ">공지사항</a></td>
			<td class="dain-borderright"><a class="dain-footer-a" href="#">자주 묻는 질문</a></td>
			<td class="dain-borderright"><a class="dain-footer-a" href="https://docs.google.com/forms/d/1e_tZ-hKrAQ5ur0rM82lZjRjib9T3HuAeTEfBfYaVqTc/edit">입점문의</a></td>
			<td><a class="dain-footer-a" href="#">About Bomulsum</a></td>
		</tr>
	</table>
</div>

<!-- footer Copyright -->
<div class="dainfooter-middle">
<div class="dainfooter-middle-inner">
	<div class="footerinner1">
		<img alt="Logo" src="<c:url value='/resources/img/Logo_gray.png'/>" height="128px">
	</div>
	<div class="footerinner2">
		<p style="font-size: 12px;">(주)보물섬</p>
		<p style="font-size: 12px;">대표 : 6조<br>
		강민우 목정아 조원희 최다인 최우영 <br>
		사업자 등록번호 : 111-11-11111 <br>
		통신판매업신고 : 2020-서울종로구-2020<br></p>
		<p style="font-size: 10px;">보물섬은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
		따라서 보물섬은 상품 거래정보 및 거래에 대하여<br> 책임을 지지 않습니다.</p>
	</div>
	<div class="footerinner3">
		<p style="font-size: 12px;">고객센터 <span style="font-size: 10px;">(평일 오전 10시 ~ 저녁 6시까지)</span></p>
		<table style="font-size: 12px;">
			<tr>
				<td style="padding-right: 10px;">카카오톡</td>
				<td>보물섬</td>
			</tr>
			<tr>
				<td>대표번호</td>
				<td>1111-1111</td>
			</tr>
			<tr>
				<td>메일</td>
				<td>cooldain@daum.net</td>
			</tr>
			<tr>
				<td>제휴문의</td>
				<td>cooldain@daum.net</td>
			</tr>
		</table>
	
		<p style="font-size: 10px;">보물섬 이용 중 궁금하신 점이 있으신가요?<br>
		메일 또는 플러스친구 '보물섬'으로 연락해주세요.<br>
		최선을 다해 도와드리겠습니다.</p>
	</div>
	<div class="footerinner4">
		<p style="font-size: 12px;">Follow Us</p>
		<div >
			<a href="https://www.facebook.com/" class="fa fa-facebook dainfa" style="color: #fff;"></a>
			<a href="https://twitter.com/" class="fa fa-twitter dainfa" style="color: #fff;"></a>
			<a href="https://www.google.com/" class="fa fa-google dainfa" style="color: #fff;"></a>
			<a href="https://www.instagram.com/" class="fa fa-instagram dainfa" style="color: #fff;"></a>
		</div>
		<br>
		<div style="font-size: 10px;">Copyright &copy; 2020 Bomulsum All right reserved.</div>
	</div>

</div>
</div>
</footer>
<!-- Footer 끝 -->
</body>
</html>

