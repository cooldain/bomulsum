<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 받은 선물 상세보기</title>
<style>
body a:link, a:visited, a:hover, a:active{
   text-decoration: none;
   border: none;
}
.content {
   width: 70%;
   margin-left: auto;
   margin-right: auto;
   padding-top: 36px;
   padding-bottom: 64px;
   display:flex;
}
.uRGiftCheckWrap{
   width:80%;
   margin-left:2%;
}
/* 작품 정보 박스*/
.jeonga_ugift_receive_check{
   padding:1%;
   border:1px solid #D8D8D8;
   display:flex;
   border-radius:5px;
   width:90%;
   margin-left:4%;
   margin-bottom:4%;
}
#jeonga_ugift_message{
   margin-top:3%;
   background-color: white;
   border:1px solid #D8D8D8;
   padding:5px;
   text-align: center;
     text-decoration: none;
     display: inline-block;
     font-size: 11px;
     width:92px;
     color:black;
 }
.jeonga_ugift_gift_address_input{
  width: 650px;
  padding: 8px 10px;
  border: 1px solid #D8D8D8;
  border-radius: 2px;
  font-size:12px;
}
.jeonga_ugift_gift_address_input_post{
  width: 150px;
  padding: 8px 10px;
  border: 1px solid #D8D8D8;
  border-radius: 2px;
  font-size:12px;
  margin-bottom:15px;
}

#jeonga_ugift_gift_address_update{
   margin-top:3%;
   background-color: white;
   border:1px solid #D8D8D8;
   padding:4px;
   text-align: center;
     text-decoration: none;
     display: inline-block;
     font-size: 12px;
     width:50px;
}
#adrButton{
   background-color: white;
   border:1px solid #D8D8D8;
   padding:7px;
   text-align: center;
     text-decoration: none;
     display: inline-block;
     font-size: 12px;
}
.jeonga_ugift_receive_buyer_info{
   width:70%;
   padding-left:2%;
   margin-top:auto;
   margin-bottom:auto;
   vertical-align: middle;
}
/* 다른 정보들 박스*/
.jeonga_ugift_gift_info, .jeonga_ugift_gift_address, .jeonga_ugift_gift_dispatch{
   margin-top:1%;
   border:1px solid #D8D8D8;
   padding:24px;
}

.jeonga_ugift_gift_title, .jeonga_ugift_gift_address_title, .jeonga_ugift_gift_dispatch_title, .jeonga_ugift_gift_caution_title, .jeonga_ugift_gift_other_title{
   font-size:16px; 
   font-weight:bold;
}
.jeonga_ugift_gift_info_left, .jeonga_ugift_gift_address_detail_left, .jeong_ugift_gift_dispatch_detail_left{
   font-size:14px; 
   font-weight: bold;
   width:64px;
}

.jeonga_ugift_gift_info_right, .jeonga_ugift_gift_address_datail_right, .jeong_ugift_gift_dispatch_detail_right{
   font-size:14px; 
   padding:8px 25px;

}
.jeonga_ugift_receive_buyer_name{
   font-weight: bold;
   font-size:18px;
   margin:15px, 0px;
}
.jeonga_ugift_receive_buyer_message{
   padding-top:15px;
   font-size:16px;
}
.jeonga_ugift_gift_other_first, .jeonga_ugift_gift_caution_first{
   display:flex;
   justify-content: space-between;
}

.jeonga_ugift_gift_caution, .jeonga_ugift_gift_other{
   margin-top:1%;
   padding:24px;
   border:1px solid #D8D8D8;

}
.jeong_ugift_gift_infotable, .jeong_ugift_gift_address_detail, .jeong_ugift_gift_dispatch_detail{
   margin-top:2%;
}
.jeonga_ugift_alink{
   text-decoration: none;
   color:black;
}
.jeonga_ugift_gift_caution_more{
   width:100px;
   height:27px;
}
#jeonga_ugift_gift_check{
   background-color: #1f76bb;
   padding:2% 11%;
   margin-top:3%;
   margin-left:35%;
   color:white;
   cursor: pointer;
   border:none;
   font-size: 13pt;
}
input:focus {outline:none;}
</style>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   
   //배송주소 입력 여부 확인
   <c:forEach var="i" items="${receiveGiftDetailList}">
   var data = '${i.order_address_input}';
   var recipientName = '${i.gift_recipient_name}';
   var recipientPhone = '${i.gift_recipient_phone}';
   var zipcode = '${i.order_zipcode}';
   var addressFirst = '${i.order_address_first}';
   var addressSecond= '${i.order_address_second}';
   </c:forEach>
   
   //배송주소 입력 했을 경우
   if(data =='Y'){
      //값 설정
      $('#jeonga_address_name').val(recipientName);
      $('#jeonga_address_phone').val(recipientPhone);
      $('#sample6_postcode').val(zipcode);
      $('#sample6_address').val(addressFirst);
      $('#sample6_detailAddress').val(addressSecond);
      
      //수정 불가
      $('#jeonga_ugift_gift_check').css("display", "none");
      $('#jeonga_address_name').css("border", "none");
      $('#jeonga_address_phone').css("border", "none");
      $('#adrButton').css("display", "none");
      $('#sample6_postcode').css("border", "none");
      $('#sample6_address').css("border", "none");
      $('#sample6_detailAddress').css("border", "none");
      $('#jeonga_relived_num').css("display", "none");
      $('#jeonga_other').css("display", "none");
      $('#jeonga_caution').css("display", "none");
      
      
   }
});

/*우편번호 찾기*/
function postcode() {
   new daum.Postcode({
       oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
         addr = data.roadAddress;
       } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
       }
       // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
       if(data.userSelectedType === 'R'){
        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
         if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
              extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
         if(data.buildingName !== '' && data.apartment === 'Y'){
              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
         }
         // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
         if(extraAddr !== ''){
              extraAddr = ' (' + extraAddr + ')';
         }
     } 

       // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('sample6_postcode').value = data.zonecode;
           document.getElementById("sample6_address").value = addr + extraAddr;
           // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
         }
     }).open();
   }


/*유의사항 자세히 보기*/
function doCautionDisplay(){
   var con=document.getElementById("jeonga_ugift_gift_caution_content");
   if(con.style.display=='none'){
       con.style.display='block';
    }else{
       con.style.display='none';
    }
}
/*개인 정보 제공 고시*/
function doOtherDisplay(){
   var con=document.getElementById("jeonga_ugift_gift_other_content");
   if(con.style.display=='none'){
       con.style.display='block';
    }else{
       con.style.display='none';
    }
}

</script>
</head>
<body>
   <div>
   <!-- 헤더 -->
   <%@ include file="../../include/uHeader.jsp"%>

	<div class="content">
		<!-- 사이드메뉴 -->
		<%@ include file="../../include/uside.jsp"%>
		<!-- 내용 여기다 넣으시오 -->
		<div class="uRGiftCheckWrap">
			<div class="jeonga_ugift_rctitle">
				<h2 id="jeonga_ugift_rctitle_text">선물 확인</h2>
			</div>
			<!-- 작품 정보 -->
			<c:forEach var="receiveGiftList" items='${receiveGiftDetailList}'>
			<div class="jeonga_ugift_receive_check">
				<div class="jeonga_ugift_receive_image">
				<img src="<c:url value='/upload/${receiveGiftList.art_photo}'/>" style="width: 250px; height:250px;">
				</div>
				<div class="jeonga_ugift_receive_buyer_info">
					<div class="jeonga_ugift_receive_buyer_name">
						 ${receiveGiftList.member_name}(${receiveGiftList.member_phone})님의 선물
					</div> 
					<div class="jeonga_ugift_receive_buyer_message">
						${receiveGiftList.gift_message}
					</div>
				</div>
			</div>
			<!-- 선물정보 -->
			<div class="jeonga_ugift_gift_info">
				<div class="jeonga_ugift_gift_title">
					선물정보
				</div>
				<table class="jeong_ugift_gift_infotable">
					<tr>
						<td class="jeonga_ugift_gift_info_left">받는 분</td>
						<td class="jeonga_ugift_gift_info_right">${receiveGiftList.gift_recipient_name}</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_info_left">작품명</td>
						<td class="jeonga_ugift_gift_info_right">${receiveGiftList.b_art_name}</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_info_left">작가명</td>
						<td class="jeonga_ugift_gift_info_right">${receiveGiftList.writer_brand_name}
						<a href="/bomulsum/user/message.do?writer=${receiveGiftList.b_writer_code_seq}" id="jeonga_ugift_message">메시지로 문의</a>
					</tr>
				
				</table>
			</div>
			<!-- 선물 받을 주소(배송지) -->
			<form action="<c:url value='/user/addressRegister.do'/> " method="get">
			<div class="jeonga_ugift_gift_address">
				<div class="jeonga_ugift_gift_address_title">
					선물받을 주소 (배송지)
				</div>
				<table class="jeong_ugift_gift_address_detail">
					<tr>
						<td class="jeonga_ugift_gift_address_detail_left">받는 분</td>
						<td style="display:none">
						<input type="text" name="orderCodeSeq" value="${receiveGiftList.order_code_seq}">
						</td>
						<td class="jeonga_ugift_gift_address_datail_right">
						<input class="jeonga_ugift_gift_address_input" name="recipientName" id="jeonga_address_name" type="text" placeholder="이름을 입력해주세요." 
						autocomplete="off" required="required"/>
						</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_address_detail_left">전화</td>
						<td class="jeonga_ugift_gift_address_datail_right">
						<input class="jeonga_ugift_gift_address_input" name="recipientPhone" id="jeonga_address_phone" type="text" placeholder="전화번호를 입력해주세요." 
						autocomplete="off" required="required"/>
						</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_address_detail_left">주소</td>
						<td class="jeonga_ugift_gift_address_datail_right">	
						<input class="jeonga_ugift_gift_address_input_post" name="recipientZipcode" id="sample6_postcode" type="text" 
							placeholder="우편번호" autocomplete="off" required="required"/>
						<button id="adrButton" onclick="postcode()"> 주소 찾기</button><br>
						<input class="jeonga_ugift_gift_address_input" name="addressFirst" id="sample6_address" type="text" 
							placeholder="기본주소" autocomplete="off" 	required="required" style="margin-bottom:15px;" /><br>
						<input class="jeonga_ugift_gift_address_input" name="addressSecond" id="sample6_detailAddress" type="text" 
							placeholder="나머지 주소" autocomplete="off" required="required" /><br>
						
						<!--  <button id="jeonga_ugift_gift_address_update">수정</button></td>-->
					</tr>
				</table>
				<div id="jeonga_relived_num" style="font-size:14px;"><input type="checkbox" name="reliveNum" required="required" style="margin-bottom:0px;">1회용 안심번호를 사용합니다.</div>
			</div>
			
			<!-- 발송정보 -->
			<div class="jeonga_ugift_gift_dispatch">
				<div class="jeonga_ugift_gift_dispatch_title">
					발송정보
				</div>
				<table class="jeong_ugift_gift_dispatch_detail">
					<tr>
						<td class="jeong_ugift_gift_dispatch_detail_left">발송 상태</td>
						<td class="jeong_ugift_gift_dispatch_detail_right">${receiveGiftList.order_status}</td>
					</tr>
			
				</table>
			</div>
			<!-- 유의사항 -->
			<div class="jeonga_ugift_gift_caution" id="jeonga_caution">
				<div class="jeonga_ugift_gift_caution_first">
					<div class="jeonga_ugift_gift_caution_title">
					유의사항
					</div>
					<div class="jeonga_ugift_gift_caution_more" style="font-size:16px;">
					<a class="jeonga_ugift_alink" href="javascript:doCautionDisplay();">자세히보기
					<i class="fa fa-angle-down" aria-hidden="true" id="ardown"></i></a>
					</div>
				</div><!-- end jeonga-ugift-gift-caution-first -->
				<div id="jeonga-ugift-gift-caution-content" style="display:none; margin-top:2%; font-size:14px;">
					- 위 유효기간까지 배송 주소 입력이 완료되어야 하며, 유효기간 만료 시 선물은 취소됩니다.<br/>
					- 배송 주소 입력 후, 선물 받으신 작품의 품절 혹은 작가의 사정에 의해 주문취소가 진행될 수 있습니다.<br/>
					- 제주/도서 산간 지역은 선물하기 서비스가 제한됩니다.
				</div>
			</div>
			<!-- 개인정보 제3자 제공고지 -->
			<div class="jeonga_ugift_gift_other" id="jeonga_other">
				<div class="jeonga_ugift_gift_other_first">
					<div class="jeonga_ugift_gift_other_title" >
					<input type="checkbox" required="required" name="addressInfoAgree">	개인정보 제3자 제공고지
					</div>
					<div class="jeonga_ugift_gift_other_more" style="font-size:16px;">
						<a class="jeonga_ugift_alink" href="javascript:doOtherDisplay();">자세히보기 <i class="fa fa-angle-down" aria-hidden="true"></i></a>
					</div>
				</div> <!-- end jeonga-ugift-gift-other-first -->
				<div id="jeonga_ugift_gift_other_content" style="display:none; margin-top:2%; font-size:14px;">
					① 개인정보의 수집·이용목적 : 작품 배송<br/>
					② 수집하려는 개인정보의 항목 :성명, 전화번호, 주소<br/>
					③ 개인정보의 보유 및 이용기간(근거법률) : 6개월<br/>
					④ 동의를 거부할 수 있으며, 동의 거부시 서비스가 제공되지 않습니다.
				</div>
			</div>
			<input type="submit" id="jeonga_ugift_gift_check" value="선물받기"/>
			</form>
			</c:forEach>

      </div><!-- end uRGiftCheckWrap -->
   </div>
   <!-- 푸터  -->
   <%@ include file="../../include/uFooter.jsp"%>
   </div>
</body>
</html>