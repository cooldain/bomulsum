<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>강의등록</title>
<link
	href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>"
	href="<c:url value='/resources/vendor/clockpicker-gh-pages/src/clockpicker'/>"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">



<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>"
	rel="stylesheet">
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

.keywordContainer {
	width: 100%;
	height: fit-content;
	padding: 1% 0;
}
</style>

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
	
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
 <c:if test="${param.check eq 1}">
 	<script type="text/javascript">
 			alert("글이 등록 되었습니다.");
			location.href="/bomulsum/writer/midasRegister.wdo";
 		</script>
  </c:if>
<body id="page-top">
	<div id="wrapper">
		<!-- Header/Nav -->
		<%@ include file="../include/side.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../include/head.jsp"%>
				<!-- end Header/Nav -->
				<form action="<c:url value="/writer/midasClassRegister.wdo"/>" method="post" enctype="multipart/form-data" name="formSubmit">


					<div class="workRegisterContainer">
						<!-- 기본정보 영역 -->
						<div class="basicInformationContainer">
							<!-- topLine -->
							<div class="flexcontainer">
								<div class="textTitle">
									<h4>기본정보</h4>
									등록하려는 클래스에 대해 이야기해주세요
								</div>
							</div>
							<!-- end flexcontainer -->
							<!-- end of topLine -->
							<table border="1" class="basicInfoTable">
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
										<div id="keywordContainer" class="keywordContainer"></div> <span
										id="keywordNum">0</span>/10개<br> 띄어쓰기, 문장 기호가 특수 문자를 사용한
										등록이 불가능하며, 최대 10개까지 등록이 가능합니다. <input type="hidden"
										name="keyword" id="copyKeyword" name="keyword">
									</td>
								</tr>
							</table>

						</div>

					</div>
					<!-- end workRegisterContainer -->
					<div class="savecontainer">
						<input id="save" value="저장하기" type="button" onclick="saveWork(event);"> 
					</div>
					<!-- content -->
				</form>

				<%@ include file="../include/footer.jsp"%>
				<!-- end footer -->
				<!-- Scroll to Top Button-->
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>

				<script
					src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
				<script
					src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

				<!-- Core plugin JavaScript-->
				<script
					src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

				<!-- Custom scripts for all pages-->
				<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>


			</div>
			<!-- end content -->
		</div>
	</div>
</body>
<!-- include libraries(jQuery, bootstrap) 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->
<!-- include summernote css/js-->
<script
	src="<c:url value='/resources/js/summernote/summernote.js'/>"></script>
<script
	src="<c:url value='/resources/js/summernote/lang/summernote-ko-KR.js'/>"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<link
	href="<c:url value='/resources/css/summernote/summernote-lite.css'/>"
	rel="stylesheet" type="text/css">
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
<script>
$(function(){
	$(document).ready(function() {
	      $('#summernote').summernote({
	         height : 350, // 에디터 높이
	         minHeight : null, // 최소 높이
	         maxHeight : null, // 최대 높이
	         focus : true, // 에디터 로딩후 포커스를 맞출지 여부
	         lang : "ko-KR", // 한글 설정
	         placeholder :  "작품 설명을 써주세요~"//placeholder 설정

	      });
	   });
});
	</script>
<!-- 등록 검사 -->
<script type="text/javascript">
var i = 0;
	function saveWork(event){
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
		
	
		
		console.log(copyKeyword.value);
		
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
		
		
		console.log(keywordNum.innerHTML);
		
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
		const param = $.trim($(this).closest('tr').children('td').eq(2).text());
		$(this).remove();
		i-=1;
		keywordNum.innerHTML = i;
		
	});
});



</script>

</html>










