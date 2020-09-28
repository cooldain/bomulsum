<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 작가홈 | 판매정책</title>
<link
	href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>"
	rel="stylesheet">
<!-- myInformation _ CSS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- JQuery -->

<style>
#counter {
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
}

.subcontent {
	margin-left: 2%;
}

.subcontent .btn2 {
	background-color: #4169E1; /* blue */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
	font-size: 16px;
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

footer span {
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
		<%@ include file="../include/side.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">

			<div class="content">
				<%@ include file="../include/head.jsp"%>
				<!-- end Header/Nav -->

				<div class="subcontent">
					<h4 style="font-weight: bold;">판매정책</h4>
					<hr>
					<br />
					<!-- 배송비 테이블 -->
					<h5 style="font-weight: bold;">배송비</h5>
					<p>제주, 도서산간일 경우 기본료만 무료가 됩니다.</p>
					<form action="<c:url value='/writer/updateSalespolicy.wdo'/>"
						method="post" id="frm">
						<table class="daintable">
							<tr>
								<th class="daintdth" style="width: 15%;">결제방식</th>
								<td class="daintdth" style="width: 85%;"><select
									name="writerPayment">
								
								<c:if test="${salespolicy.writerPayment eq '선결제' or salespolicy.writerPayment eq null}">
									<option value="선결제" selected="selected">선결제</option>
									<option value="후결제">후결제</option>
								</c:if>
								<c:if test="${salespolicy.writerPayment eq '후결제'}">
									<option value="선결제">선결제</option>
									<option value="후결제" selected="selected">후결제</option>
								</c:if>
										
								</select></td>
							</tr>
							<tr>
								<th class="daintdth" style="width: 15%;">기본료</th>
								<td class="daintdth" style="width: 85%;"><input class="daininput" size="13"
									type="text" pattern="[0-9]{1,5}" value="${salespolicy.writerSendPrice}"
									placeholder="0" name="writerSendPrice" title="0원~99,999원 이하의 숫자만 입력하세요." 
									style="text-align: right;" required="required" id="primeShipping"/> 원</td>
							</tr>
							<tr>
								<th class="daintdth" style="width: 15%;">제주 / 도서산간 추가비용</th>
								<td class="daintdth" style="width: 85%;"><input size="13" class="daininput"
									type="text" placeholder="0" name="writerPlusPrice" required="required"
									value="${salespolicy.writerPlusPrice}" title="0원~99,999원 이하의 숫자만 입력하세요." 
									pattern="[0-9]{1,5}" style="text-align: right;" id="moreShipping"/> 원</td>
							</tr>
							<tr>
								<th class="daintdth" style="width: 15%;">배송비 무료 조건</th>
								<td class="daintdth" style="width: 85%;"><input size="13" class="daininput"
									type="text" placeholder="0" name="writerSendfreeCase" pattern="[0-9]{1,6}"
									value="${salespolicy.writerSendfreeCase}" title="0원~999,999원 이하의 숫자만 입력하세요."
									style="text-align: right;" required="required" id="freeShipping"/> 원 이상</td>
							</tr>
						</table>

						<!-- 교환 / 환불 테이블 -->
						<h5 style="font-weight: bold;">제작 / 배송</h5>
						<h5 style="font-weight: bold;">교환 / 환불</h5>
						<table class="daintable">
							<tr>
								<th class="daintdth" style="width: 15%;">상태</th>
								<td class="daintdth" style="width: 85%;"><select
									name="writerRefund">
								<c:if test="${salespolicy.writerRefund eq 'y'}">
									<option value="y" selected="selected">가능</option>
									<option value="n">불가능</option>
								</c:if>
								<c:if test="${salespolicy.writerRefund eq 'n'}">
									<option value="y" >가능</option>
									<option value="n" selected="selected">불가능</option>
								</c:if>
										
								</select></td>
							</tr>
							<tr>
								<th class="daintdth" style="width: 15%;">상세 내용</th>
								<td class="daintdth" style="height: 300px; width: 85%;"><textarea
										id="content" name="writerPolicyAbout" maxlength="300"
										style="min-height: 200px; max-height: 200px; min-width: 60%; max-width: 60%; max-width: scroll;">
${salespolicy.writerPolicyAbout}</textarea><br> <span id="counter">###</span></td>
								<!-- 위에 0/500에 글자수카운팅 들어가야함 -->
							</tr>
						</table>

						<div class="spButton" style="margin-bottom: 50px;">
							<div style="text-align: center; width: 90%;">
								<button class="btn btn-primary" type="submit" onclick= "formCheckBtn()"
									>확인</button>
							</div>
						</div>
					</form>
				</div>


				<%@ include file="../include/footer.jsp"%>
				<!-- end footer -->
			</div>

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>

			<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
			<script
				src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

			<!-- Core plugin JavaScript-->
			<script
				src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

			<!-- Custom scripts for all pages-->
			<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>

			<!-- Page level plugins -->
			<script
				src="<c:url value='/resources/vendor/chart.js/Chart.min.js'/>"></script>

			<!-- Page level custom scripts -->


		</div>
	</div>
</body>
<script>
	$(function() {
		$('#content').keyup(function(e) {
			var content = $(this).val();
			$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html(content.length + '/300');
		});
		$('#content').keyup();
	});
	
		//input pattern 체크
	function formCheckBtn(){
		var checkField1 = document.getElementById("content");
		var checkField2 = document.getElementById("freeShipping");
		var checkField3 = document.getElementById("moreShipping");
		var checkField4 = document.getElementById("primeShipping");
		theForm=document.frm;
		console.log(checkField1.validity.patternMismatch);
		console.log(checkField2.validity.patternMismatch);
		console.log(checkField3.validity.patternMismatch);
		console.log(checkField4.validity.patternMismatch);
		if(!checkField1.validity.patternMismatch && !checkField2.validity.patternMismatch &&
		!checkField3.validity.patternMismatch && !checkField4.validity.patternMismatch &&
		(theForm.writerSendPrice.value!="" || theForm.writerPlusPrice.value!="" || theForm.writerSendfreeCase.value!="")){
			  alert("등록되었습니다.");
		}
	}
		


</script>
</html>