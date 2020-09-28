<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 작가홈 | 내정보</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
<!-- myInformation _ CSS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- JQuery -->

<script>
	$(document).ready(function(){
	    //보유 젬포인트 0원처리
	    var jbText = $( '#gemP' ).text();
	    if(jbText == 'P'){
	   	$('#gemP').html("0P");
	    }
	 });
 
/* 	function validCheck(){
		 var pageAddress = $("#pageAddress").val();
		 var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		 var symbolecheck= /[`~!@#$%^&*(){}+=/,.]/gi; 
		 
		 if(pageAddress.length < 5 || pageAddress.length > 20){
		  alert("5자리 ~ 20자리 이내로 입력해주세요.");
		  return false;
		 }else if(pageAddress.search(/\s/) != -1){
		  alert("주소를 공백 없이 입력해주세요.");
		  return false;
		 }else if(hangulcheck.test(pageAddress)){
		  alert("주소는 영문, 숫자, 하이픈(-), 언더바(_)로만 입력해주세요.");
		  return false;
		 }else if (symbolecheck.test(pageAddress)) { 
		  alert("주소는 영문, 숫자, 하이픈(-), 언더바(_)로만 입력해주세요."); 
		  return false; 
		}else {
		  return true;
		 }
	} */
	
</script>

<style>
.subcontent {
	margin-left: 2%;
}

 .modal-body{
 	display: flex;
 }

.subcontent .btn2{
	background-color: white;
	margin-left : 10px;
	border: 1px solid #e7e7e7;
	height: 35px;
	outline: none;
	color: #666666;
	border-radius: 3px;
}


.daintable {
	/*font-family: arial, sans-serif;*/
	border-collapse: collapse;
	width: 90%;
	margin-bottom: 50px;
}

.daintdth {
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

.subcontent th {
	width: 15%;
	background-color: #f2f2f2;
}

.subcontent h4, h5 {
	font-weight: bold;
}

footer span{
	margin-right: 10%;
}


.daininput:invalid {
    border: 1.4px solid red;
    border-radius: 3px;
    outline: none;
}
.daininput,
.daininput:valid {
	border: 1px solid #ccc;
    border-radius: 3px;
    outline:none;
}

</style>

</head>

<body id="page-top">
	<div id="wrapper">
		<!-- Header/Nav -->
		<jsp:include page="../include/side.jsp" />
		<div id="content-wrapper" class="d-flex flex-column">

			<div class="content">
				<jsp:include page="../include/head.jsp" />
				<!-- end Header/Nav -->

				<div class="subcontent">
					<h4>내정보</h4>
					<hr>
					<br />
					<!-- 기본 정보 -->
					<h5 style="font-weight: bold;">기본정보</h5>
					<p>주문 접수시 등록된 번호로 SMS가 발송되며 등록된 이메일 주소로 정산 내역 등 중요 이메일이 발송도
						됩니다.</p>
					<table class="daintable">
						<tr>
							<th class="daintdth" style="width: 15%;">작가명</th>
							<td class="daintdth"  style="width: 85%;">${myinfo.writerBrandName}
							<c:if test="${myinfo.writerBrandName eq null}">
							<button class="btn2" style="margin-left: 0px;" onclick="location.href ='<c:url value='/writer/profile.wdo'/>'">프로필 등록</button>
							</c:if>



							</td>
						</tr>
						<tr>
							<th class="daintdth"  style="width: 15%;">이메일</th>
							<td class="daintdth"  style="width: 85%;">${myinfo.writerEmail}</td>
							<!-- 여기 값 넣어야함 -->
						</tr>
						<tr>
							<th class="daintdth"  style="width: 15%;">전화번호</th>
							<td class="daintdth"  style="width: 85%;">
								<form action="<c:url value='/writer/insertphone.wdo'/>">
								<input type="text" value="${myinfo.writerPhone}" id="dainPhone" name="writerPhone" class="daininput"
								placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" />
								<input class="btn2" type="submit" value="등록" id="dainPhoneBtn" onclick="checkPhoneBtn()">
								</form>
							</td>
							<!-- 여기 값 넣어야함 -->
						</tr>
						<tr>
							<th class="daintdth"  style="width: 15%;">작가 URL</th>
							<td class="daintdth"  style="width: 85%;">
								<div>
									웹사이트를 통해 노출되는 작가님의 페이지 주소입니다.<br>
									<form action="<c:url value='/writer/inserturl.wdo'/>" method="get">
										http://www.bomulsum.com/ 
										<input type="text" value="${myinfo.writerUrl}" id="pageAddress" name="writerUrl" class="daininput"
										 pattern="^([a-z0-9_]){5,20}$" maxlength="20" />
										<input class="btn2" type="submit" value="등록" id="dainUrlBtn" onclick="checkUrlBtn()">
									</form>
								</div>
								<p style="font-size: 13px;">※ 작가 URL은 최소 5자 이상 20자 이하의 영문 소문자, 숫자, 언더바(_)로만
									입력해주세요. <br>※ 미등록시 이메일 상 아이디로 등록됩니다.</p>
							</td>
						</tr>

					</table>


					<!-- 판매 사업자 정보 테이블 -->
					<h5 style="font-weight: bold;" >판매 사업자 정보</h5>
					<table class="daintable">
						<tr>  
							<th class="daintdth"  style="width: 15%;">사업자명</th>
							<td class="daintdth"  style="width: 35%;">${myinfo.writerHonorName}</td>
							<!-- 여기에 값 들어감 -->
							<th class="daintdth"  style="width: 15%;">사업자 등록번호</th>
							<td class="daintdth"  style="width: 35%;">${myinfo.writerHonorNum}</td>
							<!-- 여기에 값 들어감 -->
						</tr>
						<tr>
							<th class="daintdth"  style="width: 15%;">통신판매업신고</th>
							<td class="daintdth"  style="width: 35%;">
							<c:if test="${myinfo.writerAboutDispatch eq 'y'}">
							O
							</c:if>
							<c:if test="${myinfo.writerAboutDispatch eq 'n'}">
							X
							</c:if>
							</td>
							<!-- 여기에 값 들어감 -->
							<th class="daintdth"  style="width: 15%;">사업자 계좌번호</th>
							<td class="daintdth" style="width: 35%;">${myinfo.writerHonorAccount}</td>
							<!-- 여기에 값 들어감 -->
						</tr>
					</table>


					<!-- 멤버십 관리 테이블 -->
					<h5 style="font-weight: bold;">젬포인트 충전</h5>
					<table class="daintable">
						<tr>
							<th class="daintdth" style="width: 15%;">젬포인트</th>
							<td class="daintdth" style="width: 85%; color: #36a7b3;">
							<span id="gemP"><fmt:formatNumber value="${pointsum.GEMSUM}" pattern="#,###"/>P</span>
								<button type="submit" class="btn2" onclick="location.href ='<c:url value='/writer/gempoint.wdo'/>'">포인트 충전</button>
							</td>
						</tr>
					</table>
					<br> <br />
				
				
				</div>
				<!-- 끝 subcontent -->


				<!--모달 안에 뜨는 내용-->
				<div class="modal fade" id="staticBackdrop" data-backdrop="static"
					tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document" style="width:350px; margin-left: 35%; margin-top: 15%;">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel" style="font-weight: bold;">작가명 변경하기</h5>
								<!-- 닫기버튼 -->
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						
							<div class="modal-body">
								<div>
									<input type="text" maxlength="20" placeholder="변경할 작가명"
										style="min-width: 200px; height: 30px; font-size: 12pt; margin-left: 3%">
								</div>
								<input type="submit" value="변경" style="margin-left: 3%">
							</div>
							<div style="font-size: 13px; margin-top: auto; margin-bottom: 3%; margin-left: 3%; ">
								* 작가명은 20자까지 가능합니다.</div>
						</div>
						<!-- end for modal content -->
					</div>
					<!-- end for modal dialog -->
				</div>
				<!--끝_ 모달안에 뜨는 내용-->






				<jsp:include page="../include/footer.jsp" />
				<!-- end footer -->
			</div>

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>

			<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
			<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

			<!-- Core plugin JavaScript-->
			<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

			<!-- Custom scripts for all pages-->
			<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>

			<!-- Page level plugins -->
			<script src="<c:url value='/resources/vendor/chart.js/Chart.min.js'/>"></script>

			<!-- Page level custom scripts -->
		

		</div>
	</div>
<script>

//전화번호 등록 alert 띄우려고 input pattern 체크
function checkPhoneBtn(){
	var numberField = document.getElementById("dainPhone");
	//console.log(numberField.validity.patternMismatch);
	if(!numberField.validity.patternMismatch){
		   alert("등록되었습니다.");
	}
}

function checkUrlBtn(){
	var urlField = document.getElementById("pageAddress");
	console.log(urlField.validity.patternMismatch);
	if(!urlField.validity.patternMismatch){
		   alert("등록되었습니다.");
	}
}
</script>

</body>
</html>