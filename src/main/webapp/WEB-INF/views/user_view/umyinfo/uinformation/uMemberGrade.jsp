<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 회원 등급</title>
<style>
.content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px;
	padding-bottom: 64px;
	display: flex;
}

body a:link, a:visited, a:hover, a:active, :active{
	text-decoration: none;
	border: none;
}

.dainSection {
	margin-left: 2%;
	width: 80%;
}

.dainUmgTitle {
	margin-bottom: 24px;
}

.dainMembershipTable {
	border: 1px solid #d9d9d9;
	width: 100%;
}

.dainMbArea1 {
	display: flex;
}

.dainPbSplit {
	height: 10px;
	width: 96%;
	margin-left: 2%;
	background: #f2f2f2;
}

.dainPbName{
	font-size: 12px;
	display: flex;
	justify-content: space-between;
	margin-top: 4%;
}

.nomargin{
	margin: 0px;
}

.nextMb{
	 font-size: 14px;
	 text-align: center;
	 border: 2px solid black;
	 border-radius: 3px;
	 padding: 10px 0px;
	 margin: 20px 0px 0px;
	 width: 100%;
}

.dainUmgSubTitle{
	margin-top: 24px;
	padding: 40px 0px 4px;
}

.gradeName{
	font-size: 14px; 
	width: 100%; 
	text-align: center; 
	font-weight: bold; 
	margin-top: 6px;
}

.dl{
	margin: 0px;
}

table{
	border-collapse: collapse;
}

.dainUmgGuide-top{
	display: flex; 
	justify-content: space-between;
	padding-top: 40px;
	margin-bottom: 24px;
}


.dainUmgGuide-top :hover {
	background-color: #faf9f9;
}

.arrow {
  border: solid black;
  border-width: 0 1px 1px 0;
  display: inline-block;
  padding: 3px;
}

.right {
  transform: rotate(-45deg);
  -webkit-transform: rotate(-45deg);
}

.NowGradeCircle{
	width: 18px;
	height: 18px;
	border-radius: 50%;

	
}

.colBlue{
	background-color: #1f76bb;
	border: 1px solid #1c6ba9;
}
.colGray{
	background-color: #f5f5f5;
	border: 1px solid #acacac;
}

a:link, a:visited, a:hover, a:active{
	text-decoration: none;
	color: black;
}

#remainSum{
	border:none;
	background-color: none;
	font-weight: bold;
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
	<section class="dainSection">
	 	<div class="dainUmgTitle">
		<h1 style="margin: 0px;">회원등급</h1>
		</div>
		
		

		
		<!-- 현재 회원등급 표시영역 -->
		<table class="dainMembershipTable">
		<tr> 
			<td style="padding:42px 32px; width: 50%;">
				<div class="dainMbArea1" style="display: flex; align-items: center;">
					
					<!-- 20200812 테스트수정중 -->
				<%-- 	<c:choose>
					<c:when test="${paysum < 100000}">
					
					</c:when>
					<c:when test="${paysum < 1000000 and paysum >= 100000}"> ... </c:when>
					<c:when test="${paysum < 5000000 and paysum >= 1000000}"> ... </c:when>
					<c:when test="${paysum >= 5000000}"> ... </c:when>
					<c:otherwise> ... </c:otherwise>
					</c:choose>
					
					<c:if test="${paysum < 100000}">
					</c:if>
					<c:if test="${paysum < 1000000 and paysum >= 100000}">
					</c:if>
					<c:if test="${paysum < 5000000 and paysum >= 1000000}">
					</c:if>
					<c:if test="${paysum >= 5000000}">
					</c:if> --%>
					<!-- 20200812 테스트수정중 -->
					<div>
						<div>
						<c:if test="${paysum < 100000 or paysumperiod eq 0}">
							<i class="fas fa-gem fa-5x" style="color: #ad734e"></i>
						</c:if>
						<c:if test="${paysum < 1000000 and paysum >= 100000 and paysumperiod ne 0}">
							<i class="fas fa-gem fa-5x" style="color: silver"></i>
						</c:if>
						<c:if test="${paysum < 5000000 and paysum >= 1000000 and paysumperiod ne 0}">
							<i class="fas fa-gem fa-5x" style="color: gold"></i>
						</c:if>
						<c:if test="${paysum >= 5000000 and paysumperiod ne 0}">
							<i class="fas fa-gem fa-5x" style="color: #99ffff"></i>
						</c:if>
						</div>
					</div>
					<div style="margin-left: 24px;">
						<c:if test="${paysum < 100000 or paysumperiod eq 0}">
							<h1>브론즈</h1>
							<p style="color: #29aae1; font-size: 14px; font-weight: bold;">작품 구매시 적립률 10%</p>
						</c:if>
						<c:if test="${paysum < 1000000 and paysum >= 100000 and paysumperiod ne 0}">
							<h1>실버</h1>
							<p style="color: #29aae1; font-size: 14px; font-weight: bold;">작품 구매시 적립률 10%<br>3만원 쿠폰 제공</p>
						</c:if>
						<c:if test="${paysum < 5000000 and paysum >= 1000000 and paysumperiod ne 0}">
							<h1>골드</h1>
							<p style="color: #29aae1; font-size: 14px; font-weight: bold;">작품 구매시 적립률 10%<br>5만원 쿠폰 제공</p>
						</c:if>
						<c:if test="${paysum >= 5000000 and paysumperiod ne 0}">
							<h1>다이아</h1>
							<p style="color: #29aae1; font-size: 14px; font-weight: bold;">작품 구매시 적립률 10%<br>10만원 쿠폰 제공</p>
						</c:if>
					
					</div>
				</div>
			</td>
			
			<!-- 다음달 예상등급 표시영역 -->
			<td style="padding: 24px; border-left: 1px solid #d9d9d9; width: 50%; ">
				<div class="dainMbArea2">
					<div style="padding-bottom:20px;">
					<strong>8월 예상등급</strong>
					</div>
					<div class="dainProgressBar" style="display: flex; align-items: center;">
						<div class="dainPbSplit" ></div>
						<div style="width: 25%; height: 20px; display: flex; z-index: 99;
						position: absolute; justify-content: space-between; ">
						<div id="dainCir1" class="NowGradeCircle" ></div>
						<div id="dainCir2" class="NowGradeCircle" ></div>
						<div id="dainCir3" class="NowGradeCircle" ></div>
						<div id="dainCir4"  class="NowGradeCircle" ></div>
						</div>
					</div>
					<div class="dainPbName">
						<div>브론즈</div>
						<div>실버</div>
						<div>골드</div>
						<div>다이아</div>
					</div>
					<div class="nextMb" style="font-size: 14px;">
						<p class="nomargin" style="margin-bottom: 4px;" id="remainSumD">현재 등급에서 <span id="remainSum">100,000</span>원 이상 더 사면,</p>
						<p class="nomargin" style="font-weight: bold;" id="nextGrade"> 실버 등급!</p> 
					</div>
				</div>
			</td>
		</tr>
	</table>
	<!-- 등급별 혜택 안내 영역 -->
	<div class="dainUmgSubTitle">
	<h4>등급별 혜택 알아보기</h4>
	<table style="width: 100%; ">
		<tr>
			
			<td style="padding:16px 50px; width: 50%; border-top:1px solid #d9d9d9;">
				<div class="dainMbArea1" style="display: flex; align-items: center;">
					<div>
						<div><i class="fas fa-gem fa-3x" style="color: #99ffff"></i></div>
						<div class="gradeName">다이아</div>
					</div>
					<div style="margin-left: 24px;">
					<dl>
						<dt style="font-size: 12px;">작품 구매시 혜택</dt>
						<dd style="font-size: 13px; margin: 0px; font-weight: bold; color: #1f76bb">적립률 10%<br>10만원 쿠폰 제공</dd>
						<dt style="font-size: 12px; margin-top: 16px;">등급조건</dt>
						<dd style="font-size: 14px; margin: 0px; font-weight: bold;">500만원 이상 구매시</dd>
					</dl>
					</div>
				</div>
			</td>
			<td style="padding:16px 50px; width: 50%; border-top:1px solid #d9d9d9; border-top:1px solid #d9d9d9;">
				<div class="dainMbArea1" style="display: flex; align-items: center;">
					<div>
						<div><i class="fas fa-gem fa-3x" style="color: gold"></i></div>
						<div class="gradeName">골드</div>
					</div>
					<div style="margin-left: 24px;">
					<dl>
						<dt style="font-size: 12px;">작품 구매시 혜택</dt>
						<dd style="font-size: 13px; margin: 0px; font-weight: bold; color: #1f76bb">적립률 10%<br>5만원 쿠폰 제공</dd>
						<dt style="font-size: 12px; margin-top: 16px;">등급조건</dt>
						<dd style="font-size: 14px; margin: 0px; font-weight: bold;">100만원 이상, 500만원 미만 구매시</dd>
					</dl>
					</div>
				</div>
			</td>
			</tr>
			<tr> 
			<td style="padding:16px 50px; width: 50%; border-top:1px solid #d9d9d9; border-bottom:1px solid #d9d9d9;">
				<div class="dainMbArea1" style="display: flex; align-items: center;">
					<div>
						<div><i class="fas fa-gem fa-3x" style="color: silver"></i></div>
						<div class="gradeName">실버</div>
					</div>
					<div style="margin-left: 24px;">
					<dl>
						<dt style="font-size: 12px;">작품 구매시 혜택</dt>
						<dd style="font-size: 13px; margin: 0px; font-weight: bold; color: #1f76bb;">적립률 10%<br>3만원 쿠폰 제공</dd>
						<dt style="font-size: 12px; margin-top: 16px;">등급조건</dt>
						<dd style="font-size: 14px; margin: 0px; font-weight: bold;">10만원 이상, 100만원 미만 구매시</dd>
					</dl>
					</div>
				</div>
			</td>
			<td style="padding:16px 50px; width: 50%; border-top:1px solid #d9d9d9; border-bottom:1px solid #d9d9d9;">
				<div class="dainMbArea1" style="display: flex; align-items: center;">
					<div>
						<div><i class="fas fa-gem fa-3x" style="color: #ad734e;"></i></div>
						<div class="gradeName">브론즈</div>
					</div>
					<div style="margin-left: 24px;">
					<dl>
						<dt style="font-size: 12px;">작품 구매시 혜택</dt>
						<dd style="font-size: 13px; margin: 0px; font-weight: bold; color: #1f76bb">적립률 10%</dd>
						<dt style="font-size: 12px; margin-top: 16px;">등급조건</dt>
						<dd style="font-size: 14px; margin: 0px; font-weight: bold;">10만원 미만 구매시</dd>
					</dl>
					</div>
				</div>
			</td>
			</tr>
	</table>
	</div>
	
	<!-- 등급 안내사항 영역 -->
	<div class="dainUmgGuide">
	<div class="dainUmgGuide-top">
		<div style="font-size: 16px; font-weight: bold;">안내사항</div>
		<a href="#" style="text-decoration: none; border: 1px solid #d9d9d9; 
		height:80%; padding: 3px 5px; line-height: 24px; padding: 0px 12px; 
		border-radius: 3px;" onclick="location.href ='<c:url value='/user/board/noticeDetail.do?seq=admin_notice_seq174'/>'" ><span style="font-size: 10px;">자세히 보기 <i class="arrow right"></i></span></a>
	</div>
	<p style="font-size: 12px; padding: 16px 24px; margin: 0px 12px; background-color: #FAF9F9">
	‣ 전월 3개월 기준으로, 구매내역이 없을 시 브론즈 등급으로 등급이 하락합니다. <br>
	‣ 회원 등급이 적용되기 전에 취소/환불 시, 구매 금액에서 제외되니 유의해주세요.<br>
	‣ 회원 등급 산정 및 혜택은 당사 사정에 의해 변경될 수 있습니다.
	</p>
	</div>
	</section> 

	</div> <!-- end content -->
	
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>
<!-- 스크립트 -->
	<script>
	$(document).ready(function(){
		//콤마찍기
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
	        
			//현재 등급 표시
			if(${paysumperiod}==0 && ${paysum} > 0){ //3개월 내 구매내역없을때
				$('#dainCir1').addClass('colBlue');
				$('#dainCir2').addClass('colGray');
				$('#dainCir3').addClass('colGray');
				$('#dainCir4').addClass('colGray');
				$('#remainSumD').html('최근 3개월 내 구매내역이 없어 등급이 하락했습니다.');
				$('#nextGrade').html('작품 구매시 원래 등급으로 변경됩니다.'); 
				
			}else if(${paysum} < 100000 ){
				// console.log(${paysum});
				$('#dainCir1').addClass('colBlue');
				$('#dainCir2').addClass('colGray');
				$('#dainCir3').addClass('colGray');
				$('#dainCir4').addClass('colGray');
				var remain=100000-${paysum};
				remain=comma(remain);
				console.log(remain);
				$('#remainSum').html(remain);
				$('#nextGrade').html('실버 등급!'); 
				
			}else if(${paysum} < 1000000){
				$('#dainCir1').addClass('colGray');
				$('#dainCir2').addClass('colBlue');
				$('#dainCir3').addClass('colGray');
				$('#dainCir4').addClass('colGray');
				var remain=1000000-${paysum};
				remain=comma(remain);
				console.log(remain);
				$('#remainSum').html(remain);
				$('#nextGrade').html('골드 등급!');
				
			}else if(${paysum} < 5000000){
				$('#dainCir1').addClass('colGray');
				$('#dainCir2').addClass('colGray');
				$('#dainCir3').addClass('colBlue');
				$('#dainCir4').addClass('colGray');
				var remain=5000000-${paysum};
				remain=comma(remain);
				console.log(remain);
				$('#remainSum').html(remain);
				$('#nextGrade').html('다이아 등급!');
				
			}else if(${paysum} >= 5000000){
				$('#dainCir1').addClass('colGray');
				$('#dainCir2').addClass('colGray');
				$('#dainCir3').addClass('colGray');
				$('#dainCir4').addClass('colBlue');
			
				$('#remainSum').html('-');
				$('#nextGrade').html('다이아 등급!');
			}
	      });
	</script>    
</body>
</html>