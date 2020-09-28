<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의정보</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"
   type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
<!-- CSS 영역 -->
<style>
.onSaleContainer{
	width:90%;
	margin-left:2%;
}
.topLine{
	height:40px;
}
.name-link{
  float:left;
  position: relative;
  display: block;
  color: #007bff;
  cursor: pointer;
}
.name-link:hover {
  z-index: 2;
  color: #0056b3;
  text-decoration: none;
  background-color: #e9ecef;
  border-color: #dee2e6;
}
.page-link {
  position: relative;
  display: block;
  padding: 0.5rem 0.75rem;
  margin-left: -1px;
  line-height: 1.25;
  color: #007bff;
  background-color: #fff;
  border: 1px solid #dee2e6;
}

.page-link:hover {
  z-index: 2;
  color: #0056b3;
  text-decoration: none;
  background-color: #e9ecef;
  border-color: #dee2e6;
}
.button {
	background-color: white;
	color: black;
	border: 1px solid #008CBA;
	text-align: center;
	padding:2%,2%;
}

.registerButton {
	float: right;
}

.textTitle {
	float: left;
}

.onSaleTitle {
	float: center;
}

.ttable {
	margin-top:10px;
	text-align:center;
}

.bottomLine{
	margin:1%;
}

#ordertable{
	width:100%;
	table-layout:fixed;
	border-top: 1px solid #ddd;
	border-left: 0px;
	border-right: 0px;
	border-bottom: 1px solid #ddd;
}

.alignLeft{
	float:left;
}

.alignRight{
	float:right;
}
.formAction {
	float: right;
}

form {
	display: inline;
}

.paging {
 	margin-top:20px;
    text-align: center;
    margin-bottom:100px;
}

 .paging a {
    display: inline-block;
    margin:0 3px;
    text-decoration: none;
    padding: 5px 10px;
    border:1px solid #ccc;
    color:#999999;
    background-color:#fff;
 }
 .arrow prev{
 	border:0px;
 }
.arrow next{
	border:0px;
}
.check{
	width:30px;
}
#orderSeq{
	width:100%;
}
</style>
<style>
.workRegisterContainer {
	width: 80%;
}

.basicInformationContainer {
	width: 100%;
	margin-left: 2%;
}

.provideInformationContainer, .targetContainer, .optionContainer,
	.savecontainer {
	width: 100%;
	margin-left: 2%;
	margin-top: 3%;
}

.loadButton {
	float: right;
}

.basicInfoTable, .provideInfoTable, .targetTable, .optionTable {
	margin-top: 1%;
	width: 100%;
	table-layout: fixed;
	border-top: 1px solid #ddd;
	border-left: 0px;
	border-right: 0px;
	border-bottom: 1px solid #ddd;
}

td {
	padding: 10px;
}

h4 {
	margin: 0px;
}

.left {
	background-color: #f2f2f2;
}

.workNameRegister {
	width: 30%;
	height: 10%;
	position: relative;
	display: inline-block;
}

#counter {
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
}

.imageContainer {
	width: 800px;
	margin: 10px;
	display: flex;
	flex-direction: center;
}

.imageContainer img {
	max-width: 100px;
}

.flexcontainer {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}

.flexCon {
	display: flex;
	flex-direction: row;
}

.savecontainer {
	display: flex;
	justify-content: center;
	align-item: center;
	margin-left: 0;
	margin-top: 2%;
	margin-bottom: 2%;
	margin-right: 0;
}

#imgs {
	margin-right: 2%;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

#keywordContainer {
	width: 100%;
	height: fit-content;
	padding: 1% 0;
}
</style>
</head>
<c:if test="${param.check eq 1}">
 	<script type="text/javascript">
 			alert("글이 등록 되었습니다.");
			location.href="/bomulsum/writer/classInfo.wdo";
 		</script>
  </c:if>
<!-- body 시작 -->
<body id="page-top">
   <div id="wrapper">
      <!-- Header/Nav -->
      <%@ include file="../include/side.jsp" %>
      <div id="content-wrapper" class="d-flex flex-column">
         <div id="content">
            <%@ include file="../include/head.jsp" %>
            <!-- end Header/Nav -->
     <!-- 판매중 작품 영역 -->
	<div class="onSaleContainer">
		<!-- topLine -->
		<div class="topLine">           
			<div class="textTitle">
				<h4>강의정보</h4>
			</div>
			<div class="registerButton">
				<a class="collapse-item" href="<c:url value='/writer/midasRegister.wdo'/>">
					<button class="button"id="register" type="button">작품등록</button>
				</a>
			</div>
		</div> 	<!-- end of topLine -->
	<hr>
	<div class="middleLine">
	<form class="search" action="#" >
		<input id="keywordInput"  type="text"  placeholder="강의명을 입력하세요" name="search2" value="${param.keyword}" >
		<input class="button" type="button" id="searchBtn" value="검색">
		<a href="classInfo.wdo"><input type="button" value="검색 초기화" class="button"></a>
		<input id="keywordValue"value="midas_name" ${param.condition == 'title' ? 'selected' : ''} type="hidden">
	</form>

	<div class="formAction">
		<form action="#" class="menu_search">
			<select name="menu" id="menu_id" onchange="conditionValue(this.value)">
				<option>정렬</option>
				<option class="conditionValue" value="regDate">등록일</option>
				<option class="conditionValue" value="midasName">강의명</option>
				<option class="conditionValue" value="midasPrice">정상가격</option>
				<option class="conditionValue" value="midasDiscount">할인가격</option>
				<option class="conditionValue" value="bookmark">즐겨찾기</option>
				<option class="conditionValue" value="comment">댓글</option>
				<option class="conditionValue" value="numberofsales">수강인원</option>
			</select>
		</form>
		<select id="count-per-page" onchange="pageValue(this.value)">
			<option>페이지 수 선택</option>
			<option class="PageValue" value="5">5개씩 보기</option>
			<option class="PageValue" value="10">10개씩 보기</option>
			<option class="PageValue" value="15">15개씩 보기</option>			
		</select>	
		
		</div>
	</div>	<!-- middleLine -->
	<!-- 테이블 시작 -->
	<div class="ttable">
		<table border="1" id="ordertable">
			<tr>
				<th class="check" style="width:4%"><input type="checkbox" id="checkAll"></th>
				<th style="width:15%">상품번호</th>
				<th style="width:7%">이미지</th>
				<th style="width:18%">강의명</th>
				<th style="width:7%">정상가</th>
				<th style="width:7%">할인</th>
				<th style="width:4%">즐겨찾기</th>
				<th style="width:4%">댓글</th>
				<th>조회수</th>
				<th>수강인원</th>
				<th>진행여부</th>
				<th>등록일</th>
				<th>수정</th>
			</tr>
			<c:if test="${classList.size() <= 0 }">
				<tr>
					<td colspan="12" align="center">
						<strong>검색 결과가 없습니다.</strong>
					</td>
				</tr>
			</c:if>
			<c:if test="${classList.size() > 0}">
			<c:forEach var="classList" items="${classList }">
			<c:set var="disCountPrice" value="${classList.midasPrice-classList.midasDiscount }"/>
				<tr id=${classList.orderSeq }>
				<td><input type="checkbox" name="listCheck" value="${classList.orderSeq }"></td>
				<td id="orderSeq">${classList.orderSeq }</td>
				<td><img style="overflow: hidden; align-items: center; justify-content: center; width: 75px; height: 75px"
					src="<c:url value='/upload/${classList.orderImg }'/>" /></td>
				<td >
					<div style="text-align: center;">
						<a class="name-link ${(pc.paging.page == pageNum) ? 'page-active' : '' }" style="color: black; cursor:pointer; text-style: bold;" >
						${classList.midasName }</a><br>
						
					</div>
					<div class="alignRight" style="text-align: right">
						<br> <label style="text-decoration: line-through; margin-bottom: 0rem"><fmt:formatNumber value="${classList.midasPrice }" pattern="#,###"/>원</label>
						<br> <label style="margin-bottom: 0rem; color: #28E7FF" id="calc"><fmt:formatNumber value="${disCountPrice }" pattern="#,###"/>원</label>
					</div>
				</td>
				<td><fmt:formatNumber value="${classList.midasPrice }" pattern="#,###"/>원</td>
				<td><fmt:formatNumber value="${classList.midasDiscount }" pattern="#,###"/>원</td>
				<td>1</td>
				<td>6</td>
				<td>1</td>
				<td>334</td>
				<td id="runYN">${classList.run }</td>
				<td id="regDate"><fmt:formatDate value="${classList.regDate }" pattern="YY/MM/dd"></fmt:formatDate></td>
				<td><button id="update" onchange="keywordResetting(e)" type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#staticBackdrop">수정</button>
				</td>
			</tr>
			<script>
				var pageValue = function(value){
					const keyword = "${param.keyword}";
					const condition = "${param.condition}";
					location.href='/bomulsum/writer/classInfo.wdo?page=${pc.paging.page}&countPerPage=' + value;
			
				}
				var conditionValue = function(value){
					const keyword = "${param.keyword}";
					const condition = "${param.condition}";
					location.href="/bomulsum/writer/classInfo.wdo?keyword=" + "&condition=" + value;
			
				}
					$(function(){
							var calc = ${classList.midasPrice} - ${classList.midasDiscount };
						$('#<c:out value='${classList.orderSeq }'/>').click(function(){
									var seq = '<c:out value='${classList.orderSeq }'/>'
									
							$.ajax({
								url: "${pageContext.request.contextPath}"+"/writer/classInfoArticle.wdo", //클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
								data:   {"orderSeq" : seq}, //HTTP 요청과 함꼐 서버로 보낼 데이터
								method: "GET", // HTTP 요청 메소드 (GET , POST 등)
								dataType: "json",
								success: function(data){
									const jsData = data;
									
									$('#classInfo_Modal_OrderSeq').text(jsData.orderSeq);
									$('#classInfo_Modal_OrderImg').text(jsData.oderImg);
									$('#classInfo_Modal_ClassName').text(jsData.midasName);
									$('#classInfo_Modal_StartDate').text(jsData.startDate);
									$('#classInfo_Modal_EndDate').text(jsData.endDate);
									$('#classInfo_Modal_Day').text(jsData.day);
									$('#classInfo_Modal_StartTime').text(jsData.startTime);
									$('#classInfo_Modal_EndTime').text(jsData.endTime);
									$('#classInfo_Modal_Category').text(jsData.category);
									$('#classInfo_Modal_MaxNumber').text(jsData.maxNumber);
									$('#classInfo_Modal_Balance').text(jsData.balance);
									$('#classInfo_Modal_Address1').text(jsData.address1);
									$('#classInfo_Modal_Address2').text(jsData.address2);
									$('#classInfo_Modal_Keyword').text(jsData.keyword);
									$('#classInfo_Modal_Run').text(jsData.run);
									var classInfo_Modal_About = $('#classInfo_Modal_About');
									classInfo_Modal_About.html(jsData.about);
									
									
								
									$('#modOrderSeq').val(jsData.orderSeq);
									$('#image').html(jsData.oderImg);
									$('#midasName').val(jsData.midasName);
									$('#midasPrice').val(jsData.midasPrice);
									$('#maxNumber').val(jsData.maxNumber);
									$('#summernote').val(jsData.about);
									$('#sample4_roadAddress').val(jsData.address1);
									$('#sample4_detailAddress').val(jsData.address2);
									$('#salePrice').val(jsData.midasDiscount);
									$('#startDate').val(jsData.startDate);
									$('#endDate').val(jsData.endDate);
									$('#startTime').val(jsData.startTime);
									$('#endTime').val(jsData.endTime);
									$('#summernote').val(jsData.about);
									$('.note-editable').html(jsData.about);
								
									
									
									var keywordArr = jsData.keyword.split(' ');
									var value = [];
									let keywordTagArr = [];
									let keywordTag = 	document.createElement('a');
									let shopTagArr = [];
									let shopTag = document.createElement('span');
									let valueTagArr = []; 
									let valueTag = document.createElement('span');
									keywordTag.setAttribute('style','cursor:pointer; margin-right:10px; padding: 5px 10px;background-color: #4e73df;border-radius: 10px;color: white; font-size: 13px');
									keywordTag.setAttribute('class','keyword');
									valueTag.setAttribute('id','valueTag');
									valueTag.setAttribute('class','valueTag');
									shopTag.innerHTML = '#';
								
									
									for(i=0; i<keywordArr.length-1; i++){
										console.log('value : ' + keywordArr[i].html);
										
										valueTagArr[i] = '<a id="valueTag" class="keyword" style='+'"cursor:pointer; margin-right:10px; padding: 5px 10px;background-color: #4e73df;border-radius: 10px;color: white; font-size: 13px"><span>#</span><span class="valueTag">' + keywordArr[i] + '</span></a>';
										$('#keywordNum').text(i+1);
									}
										$('#keywordContainer').html(valueTagArr);
										$('#copyKeyword').val(keywordArr);
							
									
									
									
									
									
									
								}
							});
						});
					});
			</script>
			</c:forEach>
			</c:if>

		</table>
		<script>
			$(function(){
				$("#checkAll").click(function(){
					if($("#checkAll").prop("checked")){
			   	    	$("input[name=listCheck]").prop("checked",true);
			   	    		
					}else{
						$("input[name=listCheck]").prop("checked",false);
					}
				});
			 
			 $('#deleteWork').click(function(){
					var i = 0;
					deleteList = [];
					 $("input[name=listCheck]:checked").each(function(i) { 
						 deleteList.push($(this).val());
						 
					 });
					 console.log(deleteList);
					 if(deleteList == ''){
							alert('삭제하실 상품을 선택해주세요.');
							return false;
						}
					 $.ajax({
							 
							url: "${pageContext.request.contextPath}"+"/writer/midasDelete.wdo", //클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
							data:   {"orderSeq" : deleteList}, //HTTP 요청과 함꼐 서버로 보낼 데이터
							method: "POST", // HTTP 요청 메소드 (GET , POST 등)
							traditional: true,
							success: function(data){
								const jsData = data;
								alert('삭제가 완료되었습니다.');
								location.href="classInfo.wdo";
							},
							error: function(data){
								alert('오류가 발생하였습니다.');
								console.log(data);
							}
						 });
						
					});
					 $('#pauseSales').click(function(){
							
							var i = 0;
							reList = [];
							
							 $("input[name=listCheck]:checked").each(function(i) { 
								 reList.push($(this).val());
							 });
							 console.log(reList);
							 if(reList == ''){
									alert('정지 및 재개하실 상품을 선택해주세요.');
									return false;
								}
							 $.ajax({
									url: "${pageContext.request.contextPath}"+"/writer/midasRunUpdate.wdo", //클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
									data:   {"orderSeq" : reList}, //HTTP 요청과 함꼐 서버로 보낼 데이터
									dataType: 'json',
									method: "POST", // HTTP 요청 메소드 (GET , POST 등)
									traditional: true,
									success: function(data){
										const jsData = data;
										const run = jsData.run;
										const value = $('.PageValue');
										let id = jsData.orderSeq;
										console.log(id.querySelect);	
										for(var i =0; i<reList.length; i++){
											var message = [];
											if(run == 'Y' && reList.length == 1){
												message = reList[i] + ' 강의를 재개합니다.';
												alert(message);
											}else if(run == 'N' && reList.length == 1){
												message = reList[i] + ' 강의를 중지합니다.';
												alert(message);
											}else if(reList.length > 1){
												alert('수정이 완료되었습니다.');
												break;
											}
										}
										location.href="classInfo.wdo?page=${pc.paging.page}&countPerPage=${pc.paging.countPerPage}";
									},
									error: function(data){
										alert('오류가 발생하였습니다.');
										
									}
								 });
							});
			 });
			</script>
			<c:if test="${param.check eq 1}">
				 	<script type="text/javascript">
				 			
				 	</script>
				  </c:if>
	</div>
					<!-- 테이블 끝 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document" style="max-width:1000px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">강의수정</h5>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
									<!-- 강의 정보 -->
	<c:if test="${param.check eq 1}">
 		<script type="text/javascript">
 			alert("글이 수정 되었습니다.");
			location.href="/bomulsum/writer/classInfo.wdo";
 		</script>
  	</c:if>
			</div>
  		<form action="<c:url value="/writer/midasModify.wdo"/>" method="post" enctype="multipart/form-data" name="formSubmit">
					<div class="workRegisterContainer">
						<div class="basicInformationContainer">
							<table border="1" class="basicInfoTable">
								<tr>
									<td class="left" style="width: 20%">상품번호</td>
									<td><input id="modOrderSeq" name="orderSeq" readonly style="border: none;">
										</td>
								</tr>
								<tr>
									<td class="left" style="width: 20%">사진등록</td>
									<td><input type="file" id="image" accept="image/*"
										name="orderPicture[]" onchange="setThumbnail(event)" multiple
										required="required" />
										<div class="imageContainer"></div></td>
								</tr>
								<tr>
									<td class="left">강의명</td>
									<td><div class="workNameRegister">
											<input id="midasName" type="text" name="midasName"
												maxlength="20" autocomplete="off" required="required">
											<span id="nameCounter"></span>
										</div></td>
								</tr>
								<tr>
									<td class="left">가격</td>
									<td>
									<input type="number" name="midasPrice" id="midasPrice"
										autocomplete="off" required="required"> 원</td>
								</tr>
								<tr>
									<td class="left">할인</td>
									<td><input type="number" id="salePrice" autocomplete="off"
										name="midasDiscount"> 원</td>
								</tr>
								<tr>
									<td class="left">최대인원</td>
									<td><input required="required" id="maxNumber"
										type="number" min="1" style="width: 10%; text-align: center;"
										name="maxNumber"> 명</td>
								</tr>
								<tr>
									<td class="left" id="dateId">날짜</td>
									<td><input required="required" type="date" id="startDate"
										name="startDate"> &nbsp;~&nbsp; <input
										required="required" type="date" id="endDate" name="endDate">
									</td>
								</tr>
								<tr>
									<td class="left" id="dayId">요일</td>
									<td>
										<input id="dayMon" type="checkbox" value="월"name="day">월&nbsp; 
										<input id="dayTue" type="checkbox" value="화" name="day">화&nbsp; 
										<input id="dayWen" type="checkbox" value="수" name="day">수&nbsp; 
										<input id="dayThu" type="checkbox" value="목" name="day">목&nbsp;
										<input id="dayFri" type="checkbox" value="금" name="day">금&nbsp;
										<input id="daySat" type="checkbox" value="토" name="day">토&nbsp;
										<input id="daySon" type="checkbox" value="일" name="day">일</td>
								</tr>
								<tr>
									<td class="left" id="timeId">시간</td>
									<td><input type="time" id="startTime" name="startTime"
										required="required"> &nbsp;~&nbsp; <input type="time"
										id="endTime" name="endTime" required="required"></td>
								</tr>
								<tr>
									<td class="left">강의설명</td>
									<td><textarea rows="4" cols="80"
											style="overflow-y: scroll;"
											placeholder="작품 설명을 적어주세요." id="summernote"
											required="required"></textarea></td>
								</tr>
								<tr>
									<td class="left">난이도</td>
									<td><select id="balance" name="balance">
											<option value="nulll">선택창</option>
											<option value="상">상</option>
											<option value="중">중</option>
											<option value="하">하</option>
									</select></td>
								</tr>
								<tr>
									<td class="left">카테고리</td>
									<td><select name="category" id="category_id"
										name="category">
											<option value="nulll">선택창</option>
											<option value="공예">공예</option>
											<option value="요리">요리</option>
											<option value="미술">미술</option>
											<option value="플라워">플라워</option>
											<option value="뷰티">뷰티</option>
											<option value="체험 및 기타">체험 및 기타</option>

									</select></td>
								</tr>
							</table>
								<textarea style="display: none;" name="about" id="copysummer"></textarea>
						</div>
						<!-- end 기본정보 영역  -->

						<!-- 작품 정보 제공 고시 영역 -->
						<div class="provideInformationContainer">
							<!-- topLine -->
							<div class="topLine">
								<div class="textTitle">
									<h4>주소창</h4>
								</div>
							</div>
							<!-- end of topLine -->
							<table border="1" class="provideInfoTable">
								<tr>
									<td class="left" style="width: 20%">주소</td>
									<td><input type="text" id="sample4_postcode"
										placeholder="우편번호" required="required"> <input
										type="button" onclick="sample4_execDaumPostcode()"
										value="우편번호 찾기" required="required"><br> <input
										type="text" id="sample4_roadAddress" placeholder="도로명주소"
										name="address1" required="required" readonly="readonly">
										<input type="text" id="sample4_jibunAddress"
										placeholder="지번주소" required="required" readonly="readonly">
										<span id="guide" style="color: #999; display: none"></span> <input
										type="text" id="sample4_detailAddress" placeholder="상세주소"
										required="required" name="address2"> <input
										type="text" id="sample4_extraAddress" placeholder="참고항목">
									</td>
								</tr>
							</table>

						</div>

						<!-- 타겟설정 영역 -->
						<div class="targetContainer">
							<!-- topLine -->
							<div class="topLine">
								<h4>타겟설정</h4>
							</div>
							<!-- end of topLine -->
							<table border="1" class="targetTable">
								<tr>
									<td class="left" style="width: 20%">작품키워드</td>
									<td>
										<div id="add" style="display: flex; flex-direction: row;">
											<input type="text" id="keyword" autocomplete="off"
												maxlength="5"> <input type="button" value="추가"
												id="keywordBtn">
											<div style="margin-left: 1%;"></div>
										</div>
										<div id="keywordContainer"></div> <span
										id="keywordNum">0</span>/10개<br> 띄어쓰기, 문장 기호가 특수 문자를 사용한
										등록이 불가능하며, 최대 10개까지 등록이 가능합니다. <input type="hidden"
										name="keyword" id="copyKeyword" name="keyword">
									</td>
								</tr>
							</table>
		

						</div>

					</div>
				</form>
					<!-- end workRegisterContainer -->
					<div class="savecontainer">
						<input id="save" value="저장하기" type="button" onclick="saveWork(event);"> 
					</div>
					<!-- content -->
				
		</div>
	</div>
</div>
<!-- end of 수정 modal -->

<!-- 강의정보 modalList -->
<div class="modal fade"  id="classInfoModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel"aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document" style="max-width:1000px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">강의정보</h5>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
									<!-- 강의 정보 -->
			</div>
			<!-- header -->
			<!-- body -->
			<div>
				<table class="basicInfoTable"style="padding: 1%; margin: 1%; width:100%;">
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%;margin: 1%;">
<!-- 강의명 -->		<td style="border-right: 1px solid #ABABAB;width:20%;  background-color: #f2f2f2;">강의명</td>
					<td>
						<div style="padding: 1%;margin: 1%;">
							<span id="classInfo_Modal_ClassName"></span>
						</div>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%;margin: 1%;">
					<td style="border-right: 1px solid #ABABAB;  background-color: #f2f2f2;">날짜</td>
					<td style="padding: 1%;margin: 1%;"><span id="classInfo_Modal_StartDate"></span>&nbsp;~&nbsp; 
					<span id="classInfo_Modal_EndDate"></span></td>
				</tr>
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%;margin: 1%;">
					<td style="border-right: 1px solid #ABABAB;  background-color: #f2f2f2;">요일</td>
					<td style="padding: 1%;margin: 1%;">
						<span id="classInfo_Modal_Day"></span>
				</tr>
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%;margin: 1%;">
					<td style="border-right: 1px solid #ABABAB;  background-color: #f2f2f2;">시간</td>
					<td style="padding: 1%;margin: 1%;">
						<span id="classInfo_Modal_StartTime"></span>&nbsp;~&nbsp; 
						<span id="classInfo_Modal_EndTime"></span>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%; margin: 1%;">
					<td style="border-right: 1px solid #ABABAB; background-color: #f2f2f2;">강의설명</td>
					<td style="padding: 1%;margin: 1%;">
						<span id="classInfo_Modal_About"></span>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%; margin: 1%;">
					<td style="border-right: 1px solid #ABABAB;  background-color: #f2f2f2;">카테고리</td>
					<td style="padding: 1%;margin: 1%;">
						<span id="classInfo_Modal_Category"></span>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%; margin: 1%;">
					<td style="border-right: 1px solid #ABABAB;  background-color: #f2f2f2;">최대인원</td>
					<td style="padding: 1%;margin: 1%;">
						<span id="classInfo_Modal_MaxNumber"></span><span>명</span>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%; margin: 1%;">
					<td style="border-right: 1px solid #ABABAB;  background-color: #f2f2f2;">난이도</td>
					<td style="padding: 1%;margin: 1%;">
						<span id="classInfo_Modal_Balance"></span>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%; margin: 1%;">
					<td style="border-right: 1px solid #ABABAB;  background-color: #f2f2f2;">키워드</td>
					<td style="padding: 1%;margin: 1%;">
						<span id="classInfo_Modal_Keyword"></span>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #ABABAB; padding: 1%; margin: 1%;">
					<td style="border-right: 1px solid #ABABAB;  background-color: #f2f2f2;">진행여부</td>
					<td style="padding: 1%;margin: 1%;">
						<span id="classInfo_Modal_Run"></span>
					</td>
				</tr>
			<tr style="border-bottom: 1px solid #ABABAB; padding: 1%; margin: 1%;">
					<td style="border-right: 1px solid #ABABAB;  background-color: #f2f2f2;">주소</td>
					<td style="padding: 1%;margin: 1%;">
						<span id="classInfo_Modal_Address1"></span><br>
						<span id="classInfo_Modal_Address2"></span>
					</td>
				</tr>
			</table>
				<div style="border: 1px solid #ABABAB; width: 100%;">
					<div style="display: flex; justify-content: center;">
							<h4 style="padding: 1%; margin-right: 7%;">인원정보</h4>
					</div>
					<table style="display: flex;  width: 100%;">
						<tbody style="width: 100%;">
							<tr style="display: flex; padding:1%; width: 100%; justify-content: space-between;">
								<td style="margin-left:15%; display: flex; padding:1%;">조원희</td>
								<td style="display: flex; padding:1%;">abc@abc.com</td>
								<td style="margin-right:15%; display: flex; padding:1%;">010-1234-1234</td>
							</tr>
							
							
					</tbody>
					</table>
				</div>
			<!-- end body -->
			<div class="modal-footer" style="display: flex; flex-direction: column;">
					<button data-dismiss="modal"aria-label="Close">닫음</button>
			</div>
			</div>
		</div>
	</div>
</div>
<!-- listModal end -->
					<!-- 아래 버튼 -->
	<div class="bottomLine">
	<button class="button" id="pauseSales" type="button">강의 정지/재개</button>
	<button class="button" id="deleteWork" type="button">강의 삭제</button>
	</div>
	<!-- 아래 버튼 끝 -->
	<!-- 페이징 처리 -->
	 <div class="paging">
	 <c:if test="${pc.prev}">
	   <a class="page-link" href="<c:url value='/writer/classInfo.wdo${pc.makeURI(pc.beginPage - 1)}' />">
	   	이전
	   </a>
	   </c:if>
	 <c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
        <a class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : '' }" 
        	href="<c:url value='/writer/classInfo.wdo${pc.makeURI(pageNum)}'/>">
        ${pageNum}
        </a>
     </c:forEach>
        <c:if test="${pc.next}">
       <a class="page-link" 
       href="<c:url value='/writer/classInfo.wdo${pc.makeURI(pc.endPage + 1)}' />" >
     	  다음
       </a>
       </c:if>
      
    </div>

            <%@ include file="../include/footer.jsp" %>
            <!-- end footer -->
        
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top"> <i
               class="fas fa-angle-up"></i>
            </a>

            <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>

            <!-- Core plugin JavaScript-->
            <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
            <script
					src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
				<script
					src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

				<!-- Core plugin JavaScript-->
				<script
					src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

				<!-- Custom scripts for all pages-->
				<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>
            

 

         </div> <!-- end of content -->
      </div>
   </div>
  </div>
</body>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<link
	href="<c:url value='/resources/css/summernote/summernote-lite.css'/>"
	rel="stylesheet" type="text/css">
<script
	src="<c:url value='/resources/js/summernote/lang/summernote-ko-KR.js'/>"></script>
<script
	src="<c:url value='/resources/js/summernote/summernote-lite.js'/>"></script>
<script>
      $('#summernote').summernote({
        placeholder: '수정사실 내용을 작성해 주세요',
        tabsize: 2,
        height: 100,
        lang: 'ko-KR' // default: 'en-US'
      });
    </script>
<script
					src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>

<!-- 도로명 주소 -->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                }  else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

</script>
<!-- 도로명 주소 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 등록 검사 -->
<script type="text/javascript">
var i = 0;
	function saveWork(event){
		console.log('saveWork 들어옴');
		event.preventDefault();
		
		let valueTag = document.getElementsByClassName('valueTag');
		let copyKeyword = document.getElementById('copyKeyword');
		var keywordValue='';
		for(var j = 0; j < valueTag.length; j++){
			let copyTag =  valueTag[j].innerText;
			keywordValue += copyTag + ' ';
			console.log(keywordValue);
		}
		copyKeyword.value = keywordValue;
		
		
		
		let today = new Date();
		today = new Date(today.getFullYear(),today.getMonth(),today.getDate());
		let startD = new Date(document.getElementById('startDate').value);
		let endD = new Date(document.getElementById('endDate').value);
		let startT = document.getElementById('startTime').value;
		let endT = document.getElementById('endTime').value;
		let minClassTime = startD.getMinutes();
		let balance = document.getElementById('balance');
		let category = document.getElementById('category_id');
		let image = document.getElementById('image');
		let midasName = document.getElementById('midasName');
		let midasPrice = document.getElementById('midasPrice');
		let maxNumber = document.getElementById('maxNumber');
		let summernote = document.getElementById('summernote');
		let sample4_postcode = document.getElementById('sample4_postcode');
		let sample4_roadAddress = document.getElementById('sample4_roadAddress');
		let sample4_detailAddress = document.getElementById('sample4_detailAddress');
		let salePrice = document.getElementById('salePrice');
		let keyword = document.getElementById('keyword');
		let keywordNum = document.getElementById('keywordNum');
		let mon = document.getElementById('dayMon').checked;
		let tue = document.getElementById('dayTue').checked;
		let wen = document.getElementById('dayWen').checked;
		let thu = document.getElementById('dayThu').checked;
		let fri = document.getElementById('dayFri').checked;
		let sat = document.getElementById('daySat').checked;
		let son = document.getElementById('daySon').checked;
		let copysummer = document.getElementById('copysummer');
		
		copysummer.value = summernote.value;
		
		console.log(copysummer.value);
		
		var regex= /[^0-9]/g
		
		let chkArr = new Array(mon,tue,wen,thu,fri,sat,son);
		
		let chk = false
		
		console.log(salePrice.value);
		console.log(midasPrice.value);
		console.log(maxNumber.value);
		
		parseInt(salePrice.value);
		parseInt(maxNumber.value);
		parseInt(midasPrice.value);
		
		console.log(parseInt(salePrice.value));
		console.log(parseInt(midasPrice.value));
		console.log(parseInt(maxNumber.value));
		
		if(image.value == ''){
			alert('사진을 등록해 주세요.');
			image.focus();
			return false;
		}
		if(midasName.value == ''){
			alert('강의명을 입력해 주세요.');
			midasName.focus();
			return false;
		}
		if(midasPrice.value == ''){
			alert('가격을 입력해 주세요.');
			midasPrice.focus();
			return false;
		}
		if(maxNumber.value == ''){
			alert('인원을 입력해 주세요.');
			maxNumber.focus();
			return false;
		}
		if(maxNumber.value > 50){
			alert('최대 인원은 50명입니다.')
			maxNumber.focus();
			return false;
		}
		
		
		//타입 스탬프 변환
		
		if(endD == 'Invalid Date' || startD == 'Invalid Date'){
			alert('날짜를 입력해 주세요.');
			document.getElementById('startDate').focus();
			return false;
		}
		today = Date.parse(today);
		startD = Date.parse(startD);
		endD = Date.parse(endD);
		
		if(endD == startD || startD > endD || endD == today || startD == today || startD < today){
			alert('날짜를 확인해 주세요');
			document.getElementById('startDate').focus();
			return false;
		}
		
		//요일 체크
		
		for(var i = 0; i < chkArr.length; i++){
			if(chkArr[i] == true){
				chk = true;
				break;
			}
			else {
				alert('요일을 확인 해주세요.');
				document.getElementById('dayMon').focus();
				return false;
				break;
			}
		}
		
		if(startT >= endT || startT == '' || endD == ''){
			alert('시간을 확인해 주세요.');
			document.getElementById('startTime').focus();
			return false;
		}
		
		if(summernote.value = ''){
			alert('강의 설명을 등록해 주세요.');
			summernote.focus();
			return false;
		}
	
		if(sample4_postcode.value == ''){
			alert('우편번호를 입력해주세요.');
			sample4_postcode.focus();
			return false;
		}
		if(sample4_roadAddress.value == ''){
			alert('도로명 주소를 입력해주세요.');
			sample4_roadAddress.focus();
			return false;
		}
		if(sample4_detailAddress.value == ''){
			alert('상세주소를 입력해주세요.');
			sample4_detailAddress.focus();
			return false;
		}
		
		if(balance.value == 'nulll'){
			alert('난이도를 정해주세요.');
			balance.focus();
			return false;
		}
		if(category.value == 'nulll'){
			alert('카테고리를 정해주세요.');
			category.focus();
			return false;
		}
		
		if(keywordNum.innerHTML == 0){
			alert('키워드를 등록해 주세요.');
			keyword.focus();
			return false;
		}
		if(salePrice.value == ''){
			salePrice.value = 0;
			console.log(midasPrice.value);
		}
		
		
		formSubmit.submit();			
	};



window.onload = function(){
		document.getElementById('keywordBtn').onclick = function(){
			let keyword = document.getElementById('keyword');
			let container = document.getElementById('keywordContainer');
			let keywordNum = document.getElementById('keywordNum');
			var regExp6 = /^[가-힣a-zA-Z]+$/; //한글+영문
			
			if(i > 0){
				
					let valueTag = document.getElementsByClassName('valueTag');
					let copyKeyword = document.getElementById('copyKeyword');
						for(var j = 0; j < valueTag.length; j++){
							let copyTag =  valueTag[j].innerText;
							console.log(copyTag)
							if(keyword.value == copyTag){
								alert('동일한 키워드가 존재합니다.');
								keyword.value = '';
								return false;
							}
						}
			
			
			}	
			if(keyword.value == ''){
				alert('키워드를 입력해주세요.');
				return false;
			}if(!regExp6.test(keyword.value)){
				alert('한글과 영문 5자 이내 작성가능합니다. 초성 및 숫자 특수문자는 사용이 불가합니다.');
				keyword.value = '';
				return false;
			}else {
				
				i+=1;
				keywordNum.innerHTML = i;
				if(i==11){
					alert('최대 키워드는 10개 입니다.');
					keyword.value = '';
					keywordNum.innerHTML = 10;
					i = 10;
					return false;
				}
			
				let keywordTag = document.createElement('a');
				let shopTag = document.createElement('span');
				let valueTag = document.createElement('span');
				
				keywordTag.setAttribute('style','cursor:pointer; margin-right:10px; padding: 5px 10px;background-color: #4e73df;border-radius: 10px;color: white; font-size: 13px');
				keywordTag.setAttribute('class','keyword');
				valueTag.setAttribute('id','valueTag');
				valueTag.setAttribute('class','valueTag');
				shopTag.innerHTML = '#';
				valueTag.innerHTML = keyword.value;

			
				keywordTag.append(valueTag);
				keywordTag.prepend(shopTag);
				container.append(keywordTag);
				console.log(keywordTag);
				keyword.value = '';
				
				
			}
			
		}
		

	};


$(function(){
	$(document).on('click', ".keyword", function(){
		console.log('clickEvent');
		console.log($(this));
		$(this).remove();
		i-=1;
		keywordNum.innerHTML = i;
		
	});
});
</script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            }  else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

</script>
<!-- 도로명 주소 -->
<script> 
function removeImg(){
	   var id = document.getElementById('imgs');
	   id.removeChild(id);

	}
	function setThumbnail(event) {  
		$(".imageContainer").empty();
	   for (var image of event.target.files) { 
	      var reader = new FileReader(); 
	      reader.onload = function(event) { 

	         var img = document.createElement("img"); 
	         img.setAttribute("src", event.target.result); 
	        
	            // 파일 유효성 검사
	            const fileEx = image.name.slice(image.name.lastIndexOf(".")+1).toLowerCase();
	            if(fileEx != "jpg" && fileEx != "png" && fileEx != "gif" && fileEx != "bmp" && fileEx != "jpeg") {
	               alert('파일은 이미지파일(jpg, jpeg, png, gif, bmp)만 가능합니다.');
	               return false;
	            }
	         
	         
	         var divEle = document.createElement("a");
	        // divEle.setAttribute("href","#");
	         //divEle.setAttribute("onclick","removeImg();")
	         //divEle.setAttribute("id","imgs")
	         divEle.appendChild(img);
	         document.querySelector("div.imageContainer").appendChild(divEle);
	      }; 
	      console.log(image); 
	      reader.readAsDataURL(image);
	   }  
	}
	//start jQuery
	$(function() {
	
		
	
		$("#searchBtn").click(function() {
			console.log("검색 버튼이 클릭됨!");
			const keyword = $("#keywordInput").val();
			console.log("검색어: " + keyword);
			
			const condition = $("#keywordValue").val();
			console.log("검색 조건: " + condition);
			
			location.href="/bomulsum/writer/classInfo.wdo?keyword=" + keyword +  "&condition=" + condition;
			keyword = ' ';	
		});
		
		//엔터키 입력 이벤트
		$("#keywordInput").keydown(function (key) {
			if(key.keyCode == 13) { //키가 13번이면 실행 (엔터 -> 13)
				$("#searchBtn").click();
			}
		});
		
		
		
		
		
	}); //end jQuery
	
	
</script>


</html>