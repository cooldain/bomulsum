<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 작가홈 | 작품 등록</title>

<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/css/summernote/summernote-lite.css'/>" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
<style>
.jeongaworkRegisterContainer{
   width:80%;
}
.jeongabasicInformationContainer {
   width: 100%;
   margin-left: 2%;
}

.jeongabasicInfoTable {
   margin-top: 1%;
   width: 100%;
   table-layout: fixed;
   border-top: 1px solid #ddd;
   border-left: 0px;
   border-right: 0px;
   border-bottom: 1px solid #ddd;
}

td{
   padding:10px;
}

h4 {
   margin: 0px;
}

.left {
   background-color: #f2f2f2;
}


.imageContainer {
   width: 800px;
   margin: 10px;
}

.imageContainer img {
   max-width: 120px;
   margin-right:1%;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#workName{
	height:30px;
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

#registerbtn{
	margin:5%;
}

#keyword1,#keyword2,#keyword3,#keyword4,#keyword5,#keyword6,#keyword7,#keyword8{
	margin:5px;
}
	
.keywordContainer {
	width: 100%;
	height: fit-content;
	padding: 1% 0;
}	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script> 
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
         divEle.appendChild(img);
         document.querySelector("div.imageContainer").appendChild(divEle);
      }; 
      console.log(image); 
      reader.readAsDataURL(image);
   }  
}

$(function() {
    $('#workName').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#nameCounter').html(content.length + '/20');
    });
    $('#workName').keyup();
});


$(document).ready(function() {
    $('#summernote').summernote({
       height : 350, // 에디터 높이
       minHeight : null, // 최소 높이
       maxHeight : null, // 최대 높이
       focus : true, // 에디터 로딩후 포커스를 맞출지 여부
       lang : "ko-KR", // 한글 설정
       placeholder:"작품 설명을 적어주세요." //placeholder 설정

    });
 });
 
//유효성 검사 
var i = 0;
function saveWork(event){
	event.preventDefault();
	
	let valueTag = document.getElementsByClassName('valueTag');
	let copyKeyword = document.getElementById('copyKeyword');
	var keywordValue='';
	for(var j = 0; j < valueTag.length; j++){
		let copyTag =  valueTag[j].innerText;
		keywordValue += copyTag + ',';
		console.log(keywordValue);
	}
	copyKeyword.value = keywordValue;
	console.log(copyKeyword.value);
	
	let image = document.getElementById('image');
	let workName = document.getElementById('workName');
	let workPrice = document.getElementById('workPrice');
	let salePrice = document.getElementById('salePrice');
	let num = document.getElementById('num');
	let summernote = document.getElementById('summernote');
	let categoryId = document.getElementById('categoryId');
	let category = document.getElementById('category_id');
	let wWeight = document.getElementById('wWeight');
	let wProduce = document.getElementById('wProduce');
	let wIngredient = document.getElementById('wIngredient');
	let wDate = document.getElementById('wDate');
	let wManage = document.getElementById('wManage');
	let wConfig = document.getElementById('wConfig');
	let wManual = document.getElementById('wManual');
	let wOption = document.getElementById('option1');
	let wOptionName = document.getElementById('name1');
	let wOptionPrice = document.getElementById('price1');
	
	if(image.value == ''){
		alert('사진을 등록해 주세요.');
		image.focus();
		return false;
	}
	if(workName.value == ''){
		alert('작품명을 입력해 주세요.');
		workName.focus();
		return false;
	}
	if(workPrice.value == ''){
		alert('가격을 입력해 주세요.');
		workPrice.focus();
		return false;
	}
	if(salePrice.value == ''){ 
		alert('할인가격을 입력해 주세요.');
		salePrice.focus();
		return false;

	}
	
	if(num.value == ''){
		alert('수량을 입력해 주세요.');
		num.focus();
		return false;
	}
	
	if(summernote.value == ''){
		alert('작품 설명을 등록해 주세요.');
		summernote.focus();
		return false;
	}

	if(categoryId.value == 'nulll'){
		alert('카테고리를 정해주세요.');
		categoryId.focus();
		return false;
	}
	if(category.value == 'nulll'){
		alert('카테고리를 정해주세요.');
		category.focus();
		return false;
	}
	
	if(wWeight.value == ''){
		alert('포장 단위별 용량을 등록해주세요.')
		wWeight.focus();
		return false;
	}
	if(wProduce.value == ''){
		alert('생산자 및 소재지를 등록해주세요.')
		wProduce.focus();
		return false;
	}
	if(wIngredient.value == ''){
		alert('원재료명 및 함량을 등록해주세요.')
		wIngredient.focus();
		return false;
	}
	if(wDate.value == ''){
		alert('제조년월일, 유통기한을 등록해주세요.')
		wDate.focus();
		return false;
	}
	if(wManage.value == ''){
		alert('관리법상 표시사항을 등록해주세요.')
		wManage.focus();
		return false;
	}
	if(wConfig.value == ''){
		alert('구성을 등록해주세요.')
		wConfig.focus();
		return false;
	}
	if(wManual.value == ''){
		alert('보관방법 또는 취급 방법을 등록해주세요.')
		wManual.focus();
		return false;
	}
	if(keywordNum.innerHTML == 0){
        alert('키워드를 등록해 주세요.');
        keyword.focus();
        return false;
     }
	if(wOption.value == ''){
		alert('옵션은 1개 이상 등록 필수입니다.')
		wOption.focus();
		return false;
	}
	if(wOptionName.value == ''){
		alert('옵션은 1개 이상 등록 필수입니다.')
		wOptionName.focus();
		return false;
	}
	if(wOptionPrice.value == ''){
		alert('옵션은 1개 이상 등록 필수입니다.')
		wOptionPrice.focus();
		return false;
	}
	
	formSubmit.submit();	
}

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
				i=10;
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
</head>
<body id="page-top">
	<c:if test="${param.check eq 1}">
		<script type="text/javascript">
			alert("글이 등록 되었습니다.");
			location.href="/bomulsum/writer/workRegister.wdo";
		</script>
	</c:if>


   <div id="wrapper">
      <!-- Header/Nav -->
      <%@ include file="../include/side.jsp" %>
      <div id="content-wrapper" class="d-flex flex-column">
         <div id="content">
            <%@ include file="../include/head.jsp" %>
            <!-- end Header/Nav -->
            <div class="jeongaworkRegisterContainer">
            <!-- 기본정보 영역 -->
             <div class="jeongabasicInformationContainer">
               <!-- topLine -->
               <div class="flexcontainer">
                  <div class="textTitle">
                     <h4>기본정보</h4>
                  		   등록하려는 작품에 대해 이야기해주세요
                  </div>
               </div>
               <!-- end flexcontainer -->
               <!-- end of topLine -->
            
            <!-- form 시작 -->
           	<form action="<c:url value='/writer/artregister.wdo'/> " method="post" enctype="multipart/form-data" name="formSubmit">
               <table border="1" class="jeongabasicInfoTable">

                  <tr>
                     <td class="left" style="width: 20%">사진등록</td>
                     <td>
                     <input type="file" id="image" accept="image/*" name="artPicture"
                        onchange="setThumbnail(event);" multiple />
                        <div class="imageContainer">                         
                        </div>
                        <span style="font-size:14px; color:red">* 파일 선택시 한 번에 여러장의 이미지를 올려주세요<br>
                        	* 사진은 가로,세로 비율이 같은 정사각형 모양의 사진으로 올려주세요
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="left">작품명</td>
                     <td>
                          <input type="text" id="workName" name="artName" style="max-height: 30px" maxlength="20" autocomplete="off" />
							<span id="nameCounter" style="font-size: 12px"> ### </span></td>
                  </tr>
                  <tr>
                     <td class="left">가격</td>
                     <td><input type="number" id="workPrice" name = "artPrice" autocomplete="off">&nbsp;원</td>
                  </tr>
                  <tr>
                     <td class="left">할인</td>
                     <td><input type="number" id="salePrice" name="artDiscount" autocomplete="off">&nbsp;원</td>
                  </tr>
                  <tr>
                     <td class="left">수량</td>
                     <td><input type="number" id="num" name = "artAmount" autocomplete="off"> 개</td>
                  </tr>
                  <tr>
                     <td class="left">작품설명</td>
                     <td><textarea id="summernote" name="artDescription" rows="8" cols="80" style="overflow-y: scroll; resize: none;"></textarea></td>
                  </tr>
       			
                  <tr>
                     <td class="left">카테고리</td>
                     <td>                    
                           <select name="artCategory" id="categoryId">
                           	  <option value="nulll">선택창</option>
                              <option value="식음료">식음료</option>
                              <option value="문구팬시">문구팬시</option>
                              <option value="전자기기">전자기기</option>
                              <option value="패션잡화">패션잡화</option>
                              <option value="반려동물">반려동물 용품</option>
                              <option value="인테리어">인테리어 소품</option>
                              <option value="신발">신발</option>
                              <option value="의류">의류</option>
                              <option value="육아,아동">육아.아동</option>
                              <option value="인형,장난감">인형.장난감</option>
                              <option value="공예">공예</option>
                              <option value="기타">기타</option>
                           </select>
                     </td>
                  </tr>
          
            <!-- end 기본 작품 정보 영역  -->
            
            <!-- 작품 정보 제공 고시 영역 -->
            <tr>
            <td colspan="2" style="border-right: 0px; border-left:0px;">
 
               <!-- topLine -->
               <div class="topLine">
                  <div class="detailTitle" style="padding-top:3%; padding-bottom:0px;">
                     <h4>작품 정보 제공 고시</h4>
                     <p style="margin-bottom:0px">전자상거래법에 따라 작품 정보제공 고시는 필수 입력사항입니다. 해당 정보에 대한 책임은 판매 작가님에게
                        있습니다.</p>
                  </div>
               </div>
               </td>
               </tr>
               <!-- end of topLine -->
                  <tr>
                     <td class="left" style="width: 20%">작품군</td>              
                     <td>
                        <div class="categoryDiv">

                              <select name="artInfoDetailCategory" id="category_id">
                              	 <option value="nulll">선택창</option>
                                 <option value="식음료">식음료</option>
                                 <option value="문구팬시">문구팬시</option>
                                 <option value="전자기기">전자기기</option>
                                 <option value="패션잡화">패션잡화</option>
                                 <option value="반려동물 용품">반려동물 용품</option>
                                 <option value="인테리어 소품">인테리어 소품</option>
                                 <option value="신발">신발</option>
                                 <option value="의류">의류</option>
                                 <option value="육아,아동">육아.아동</option>
                                 <option value="인형,장난감">인형.장난감</option>
                                 <option value="공예">공예</option>
                                 <option value="기타">기타</option>
                              </select>

                        </div> <!-- categoryDiv -->

                        <div class="infoBox" style="border: 1px solid #ddd; padding:15px; margin-top:2%; width:85%">
                           <div id="weight" >
                              <label>포장단위별 용량(중량), 수량</label><br> 
                              <input type="text" name="artInfoDetailWeight" id=wWeight size="78%" autocomplete="off">
                           </div>
                           <!-- end weight -->
                           <div id="produce" style="margin-top:1%">
                              <label>생산자 및 소재지</label><br> 
                              <input type="text" name="artInfoDetailFrom" id=wProduce size="78%" autocomplete="off">
                           </div>
                           <!-- end produce -->
                           <div id="ingredient" style="margin-top:1%">
                              <label>원재료명 및 함량</label><br> 
                              <input type="text" name="artInfoDetailMaterial" id=wIngredient size="78%" autocomplete="off">
                           </div>
                           <!-- end ingredient -->
                           <div id="date" style="margin-top:1%">
                              <label>제조년월일, 유통기한 또는 품질 유지기한</label><br> 
                              <input type="text" name="artInfoDetailExpdate" id=wDate size="78%" autocomplete="off">
                           </div>
                           <!-- end date -->
                           <div id="manage" style="margin-top:1%">
                              <label>관리법상 표시사항</label><br> 
                              <input type="text" name="artInfoDetailMust" id=wManage size="78%" autocomplete="off">
                           </div>
                           <!-- end manage -->
                           <div id="config" style="margin-top:1%">
                              <label>구성</label><br> 
                              <input type="text" name="artInfoDetailComponent" id=wConfig size="78%" autocomplete="off">
                           </div>
                           <!-- end config -->
                           <div id="manual" style="margin-top:1%">
                              <label>보관방법 또는 취급방법</label><br> 
                              <input type="text" name="artInfoDetailWay" id=wManual size="78%" autocomplete="off">
                           </div>
                           <!-- end manual -->

                        </div> <!-- end infoBox -->

                     </td>
                  </tr>
            <!-- end 작품 정보 제공 고시 영역  -->

            <!-- 키워드 타겟설정 영역 -->
               <!-- topLine -->
               <tr>
               <td style="border-right: 0px; border-left:0px;">
               <div class="topLine" style="padding-top:20px">
                  <h4>타겟설정</h4>
               </div>
               </td>
               </tr>
               <!-- end of topLine -->
                  <tr>
                     <td class="left" style="width: 20%">작품키워드</td>
					<td>
						<div id="add" style="display: flex; flex-direction: row;">
							<input type="text" id="keyword" autocomplete="off" maxlength="5"> 
							<input type="button" value="추가" id="keywordBtn">
							<div style="margin-left: 1%;"></div>
						</div>
							<div id="keywordContainer" class="keywordContainer"></div> 
							<span id="keywordNum">0</span>/10개
							<br> 띄어쓰기, 문장 기호가 특수 문자를 사용한 등록이 불가능하며, 최대 10개까지 등록이 가능합니다. 
							<input type="hidden" name="artKeyword" id="copyKeyword">
					</td>
				 </tr>
            <!-- end 타겟 설정 영역 -->

            <!-- 옴션설정 영역 -->
			<tr>
			<td colspan="2" style="border-right: 0px; border-left:0px;">
               <div class="flexcontainer">
                  <div class="textTitle" style="padding-top:3%; padding-bottom:0px;">
                     <h4>옵션</h4>
                  </div>
               </div>
               </td>
               </tr>
               <!-- end flexcontainer -->

                  <tr>
                     <td class="left" style="width: 20%">옵션1</td>
                     <td>
                        <div>
                           <div class="flexcontainer">
                              <div class="textTitle">
                                 <input type="text" name="artOptionCategory" id="option1" placeholder="구성 선택" autocomplete="off" required>
                              </div>
                           </div>
                           <!-- end flexcontainer -->

                        </div> <!-- end detail -->
                        <hr>
                        <div>
                           <div class="flexCon">
                              <div class="nameGroup" style="margin-left:3%">
                                 <div class="names">
                                    <label>이름</label> &nbsp;<input type="text" name="artOptionName" id="name1" size="30%" autocomplete="off">
                                 </div>
                                 <div class="names">
                                    <label>이름</label> &nbsp;<input type="text" name="artOptionName" id="name2" size="30%" autocomplete="off">
                                 </div>
                                 <div class="names">
                                    <label>이름</label> &nbsp;<input type="text" name="artOptionName" id="name3" size="30%" autocomplete="off">
                                 </div>
                              </div>
                              <div class="priceGroup" style="margin-left:9%">
                                 <div class="prices">
                                    <label>가격</label> &nbsp;<input type="text" name="artOptionPrice" id="price1" size="30%" autocomplete="off">
                                 </div>
                                 <div class="prices">
                                    <label>가격</label> &nbsp;<input type="text" name="artOptionPrice" id="price2" size="30%" autocomplete="off">
                                 </div>
                                 <div class="prices">
                                    <label>가격</label> &nbsp;<input type="text" name="artOptionPrice" id="price3" size="30%" autocomplete="off">
                                 </div>

                              </div>
                           </div>
                           <!-- end flexcon -->
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td class="left" style="width: 20%">옵션2</td>
                     <td>
                        <div>
                           <div class="flexcontainer">
                              <div class="textTitle">
                                 <input type="text" name="artOptionCategory" id="option2" placeholder="구성 선택" autocomplete="off">
                              </div>
                           </div>
                           <!-- end flexcontainer -->

                        </div> <!-- end detail -->
                        <hr>
                        <div>
                           <div class="flexCon">
                              <div class="nameGroup" style="margin-left:3%">
                                 <div class="names">
                                    <label>이름</label> &nbsp;<input type="text" name="artOptionName" id="name4" size="30%" autocomplete="off">
                                 </div>
                                 <div class="names">
                                    <label>이름</label> &nbsp;<input type="text" name="artOptionName" id="name5" size="30%" autocomplete="off">
                                 </div>
                                 <div class="names">
                                    <label>이름</label> &nbsp;<input type="text" name="artOptionName" id="name6" size="30%" autocomplete="off">
                                 </div>

                              </div>
                              <div class="priceGroup" style="margin-left:9%">
                                 <div class="prices">
                                    <label>가격</label> &nbsp;<input type="text" name="artOptionPrice" id="price4" size="30%" autocomplete="off">
                                 </div>
                                 <div class="prices">
                                    <label>가격</label> &nbsp;<input type="text" name="artOptionPrice" id="price5" size="30%" autocomplete="off">
                                 </div>
                                 <div class="prices">
                                    <label>가격</label> &nbsp;<input type="text" name="artOptionPrice" id="price6" size="30%" autocomplete="off">
                                 </div>
                              </div>
                           </div>
                           <!-- end flexcon -->
                        </div>
                     </td>
                  </tr>
                    <tr>
                     <td class="left" style="width: 20%">옵션3</td>
                     <td>
                        <div>
                           <div class="flexcontainer">
                              <div class="textTitle">
                                 <input type="text" name="artOptionCategory" id="option3" placeholder="구성 선택" autocomplete="off">
                              </div>
                           </div>
                           <!-- end flexcontainer -->

                        </div> <!-- end detail -->
                        <hr>
                        <div>
                           <div class="flexCon">
                              <div class="nameGroup" style="margin-left:3%">
                                 <div class="names">
                                    <label>이름</label> &nbsp;<input type="text" name="artOptionName" id="name7" size="30%" autocomplete="off">
                                 </div>
                                 <div class="names">
                                    <label>이름</label> &nbsp;<input type="text" name="artOptionName" id="name8" size="30%" autocomplete="off">
                                 </div>
                                 <div class="names">
                                    <label>이름</label> &nbsp;<input type="text" name="artOptionName" id="name9" size="30%" autocomplete="off">
                                 </div>

                              </div>
                              <div class="priceGroup" style="margin-left:9%">
                                 <div class="prices">
                                    <label>가격</label> &nbsp;<input type="text" name="artOptionPrice" id="price7" size="30%" autocomplete="off">
                                 </div>
                                 <div class="prices">
                                    <label>가격</label> &nbsp;<input type="text" name="artOptionPrice" id="price8" size="30%" autocomplete="off">
                                 </div>
                                 <div class="prices">
                                    <label>가격</label> &nbsp;<input type="text" name="artOptionPrice" id="price9" size="30%" autocomplete="off">
                                 </div>
                              </div>
                           </div>
                           <!-- end flexcon -->
                        </div>
                     </td>
                  </tr>
               </table>
			<div id="saveContainer" style="margin-left:46%">
	 		<input type="button" value="작품 등록" class="btn btn-primary" id="registerbtn" style="margin:10px;"onclick="saveWork(event);">
	 		</div>
	 		</form>
            </div> <!-- end basicInformationContainer -->
            <!-- end 옵션 영역 -->
            </div><!-- end jeongaworkRegisterContainer -->
            <!-- content -->

            <%@ include file="../include/footer.jsp" %>
            <!-- end footer -->
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
            </a>

            <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
            <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
			<script src="<c:url value='/resources/js/summernote/lang/summernote-ko-KR.js'/>"></script>
      		<script src="<c:url value='/resources/js/summernote/summernote-lite.js'/>"></script>
            <!-- Core plugin JavaScript-->
            <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

            <!-- Custom scripts for all pages-->
            <script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>

    
			</div><!-- end content -->
      </div>
   </div> 
</body>

</html>