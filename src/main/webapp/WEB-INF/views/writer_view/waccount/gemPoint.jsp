<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 작가홈 | 젬 포인트</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
<!-- myInformation _ CSS -->
<style>
.subcontent {
	margin-left: 2%;
}


.flexContainer{
	width: 90%;
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
	margin-bottom: 20px;
}

.bold{
	font-weight: bold;
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

.subcontent table {
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
	background-color: #f2f2f2;
}

.subcontent h4, h5 {
	font-weight: bold;
}

footer span{
	margin-right: 10%;
}

.dainGempointBtn{
	 margin-left: 30px; 
	 background-color: white;
	 border: 1px solid #d9d9d9;
	 border-radius: 3px;
	 color: #999999;
	 padding: 3px 10px;
}
.dainGempointBtn:focus{
	outline: none;
}

.chargeMoneyChoice{
	 margin: 0px 10px;
	 border:1px solid #cfdae0; 
	 border-radius: 10px; 
	 background-color: #edf4fa; 
	 padding: 10px 0px;
	 font-size: 12px;
	 color: #666666;
}

.chargeMoneyChoice img{
	border:1px solid #cfdae0;
	border-radius: 10px;
}
.dainChargeBtn{
	margin-top:15px;
	margin-bottom:15px;
	border-radius: 3px;
	font-size: 15px;
}

.dainChargeBtn:hover{
	background-color: #1f76bb;
	color:white;

}


.paging{
   text-align: center;
   font-size: 18px;
}


.minwoo_pagination{
    margin-left: auto;
    margin-right: auto;
    width: 100%;
}

.minwoo_pagination {
   margin-top: 20px;
   text-align: center;
   margin-bottom: 100px;
}

.minwoo_pagination a {
   display: inline-block;
   margin: 0 3px;
   text-decoration: none;
   padding: 5px 10px;
   border: 1px solid #ccc;
   color: #999999;
   background-color: #fff;
}



</style>

</head>

<body id="page-top">
	<div id="wrapper">
		<!-- Header/Nav -->
			<%@ include file="../include/side.jsp" %>
		<div id="content-wrapper" class="d-flex flex-column">

			<div class="content">
					<%@ include file="../include/head.jsp" %>
				<!-- end Header/Nav -->

				<div class="subcontent">
					<h4>젬 포인트</h4>
					<hr>
					<br />
					<!-- 젬 포인트 테이블 -->
					<p>
						젬 포인트는 작가님들의 작품 홍보를 위해 제공되는 가상 포인트 제도입니다. <br> 이 곳에서 포인트를 충전할 수 있고, 
						충전된 포인트를 작가님 추천에 사용할 수 있습니다.
					</p>
					<table>
						<tr>
							<th class="daintdth" style="width: 20%">보유 포인트 </th>
							<!-- 보유포인트 -->
							<td class="daintdth" id="gemPoint" class="bold"
								style="color: #36a7b3; display:flex; align-items: center;">
								<span id="gemP"><fmt:formatNumber value="${gemsum.GEMSUM}" pattern="#,###"/>P</span>
								<div>
								<button class="dainGempointBtn" data-toggle="modal"  
								data-target="#chargePointModal" >충전하기</button></div></td>
						</tr>
					</table>


					<div class="flexContainer">
						<h5 style="margin: 0; font-weight: bold">이용 내역</h5>
						<!-- 몇개씩 보는지 선택옵션 -->
						<select name="rowPerPage" id="rowPerPage" >
							<option value="10">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
						</select>
					</div>
					<!-- 이용 내역 테이블 -->
					<table id="gemTable">
						<!-- 테이블 제목 -->
						<thead>
						<tr>
							<th class="daintdth" style="width: 18%; text-align: center;">일자</th>
							<th class="daintdth" style="width: 46%; text-align: center;">내역</th>
							<th class="daintdth" style="width: 18%; text-align: center;">포인트</th>
						</tr>
						</thead>
						<!-- 테이블 내용 -->
						  <tbody class="dain_table_body">
                              <!-- 데이터 들어올 영역 -->
                          </tbody>
                          
		<%-- 				<c:forEach var="gemforeach" items="${article}">
						<tr>
							<!-- 일자 -->
							<td class="daintdth" style="text-align: center">${gemforeach.gemDate}</td>
							<!-- 내역 -->
							<td class="daintdth">${gemforeach.gemLog}</td>
							<!-- 포인트 사용 -->
							<c:if test="${gemforeach.gemUsage eq 'Y'}">
								<td class="daintdth bold" style="text-align: center; color: #e35852;">
								<fmt:formatNumber value="${gemforeach.gemPrice}" pattern="#,###"/>P
								</td>
							</c:if>
							<!-- 포인트 충전 -->
							<c:if test="${gemforeach.gemUsage eq 'N'}">
								<td class="daintdth bold" style="text-align: center; color: #36a7b3;">
	    						+<fmt:formatNumber value="${gemforeach.gemPrice}" pattern="#,###"/>P
								</td>
							</c:if>
						</tr>
						</c:forEach> --%>

					</table>

					<!-- 페이징 처리 -->
					<div id="pagination" class="minwoo_pagination" style="padding-right: 8%;"></div>
			<!-- 		<div class="paging" style="width: 90%;">
						<a class="arrow prev" href="#">이전</a> <a href="#">1</a> <a
							class="arrow next" href="#">다음</a>
					</div> -->
					
					
			<!-- modal -->
	          <div class="modal fade" id="chargePointModal" data-backdrop="static" tabindex="-1" 
	          role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	         <div class="modal-dialog modal-lg" role="document" style="max-width:570px; ">
	            <div class="modal-content">
	               <div class="modal-header">
	                   <h5 class="modal-title" >젬 포인트 충전하기</h5> 
	                     <button type="button" class="close" data-dismiss="modal"aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                     </button>
	               </div>
	               <div  style="display:flex;  margin:12px 30px 6px 30px; align-items: center;" >
	                  <div id="staticBackdropTitle" style="font-weight: bold; font-size: 18px; color:#1f76bb;">
	                  	<div style="margin: 3% 0 2% 2%; font-size: 14px;">충전할 포인트 선택</div>
	                  	<div>
	                  	
		                  	<form id="dainChargeForm" action="<c:url value='/writer/gempoint/charge.wdo'/>" method="get">
		                  	<div style="display:flex; flex-wrap: wrap;">
		                  	 <label for="chargeMoney1">
		                  	 <div class="chargeMoneyChoice" align="center">
							  <img alt="10000p" width="60%" src="<c:url value='/resources/img/10000point.png'/>">
							  <br>가격: 10,000원<br>
							  <input type="radio" id="chargeMoney1" name="chargeMoney" value=10000>
							  </div></label>
							  
							  <label for="chargeMoney2">
							  <div class="chargeMoneyChoice" align="center">
							  <img alt="20000p" width="60%" src="<c:url value='/resources/img/20000point.png'/>">
							  <br>가격: 20,000원<br>
							  <input type="radio" id="chargeMoney2" name="chargeMoney" value=20000>
							  </div></label>
							  
							  
							  <label for="chargeMoney3">
							  <div class="chargeMoneyChoice" align="center">
							  <img alt="30000p" width="60%" src="<c:url value='/resources/img/30000point.png'/>">
							  <br>가격: 30,000원<br>
							  <input type="radio" id="chargeMoney3" name="chargeMoney" value=30000>
							  </div></label>
							  
							  <label for="chargeMoney4">
							  <div class="chargeMoneyChoice" align="center">
							  <img alt="40000p" width="60%" src="<c:url value='/resources/img/40000point.png'/>">
							 <br>가격: 40,000원<br>
							 <input type="radio" id="chargeMoney4" name="chargeMoney" value=40000>
							 </div></label>
							 </div>
							 
							 <div align="center">
							 <button type="button" class="dainGempointBtn dainChargeBtn" onclick="goPayment()">충전하기</button>
							 </div>
							 </form>
						 </div>
	                  </div>
	               </div>
	              
	 
	               <!-- body -->
	                  
	               

	            </div>
	         </div>
	         </div>
	      <!-- modal end -->
      
				</div><!-- end subcontent -->


				<!-- 푸터영역 -->
				<%@ include file="../include/footer.jsp" %>
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

		

		</div>
	</div>
	
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   <script>
 //아임포트 결제api
   var IMP = window.IMP; // 생략가능
   IMP.init('imp54276316'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

   function goPayment(){
	   
	   var chargeMoney = $('input[name="chargeMoney"]:checked').val(); //충전할금액
	   var brandName = '${proVO.writerBrandName}'; //브랜드네임
	   
	   
   IMP.request_pay({
       pg : 'inicis', // version 1.1.0부터 지원.
       pay_method : 'card',
       merchant_uid : 'merchant_' + new Date().getTime(),
       name : '젬포인트 충전',
       amount : chargeMoney, //판매 가격
        buyer_email : 'abc@bomulsum.com',
       buyer_name : brandName,
       /*     buyer_tel : '010-1234-5678',
       buyer_addr : '서울특별시 강남구 삼성동',
       buyer_postcode : '123-456' */
   }, function(rsp) {
       if ( rsp.success ) {
           var msg = '결제가 완료되었습니다.';
/*            msg += '고유ID : ' + rsp.imp_uid;
           msg += '상점 거래ID : ' + rsp.merchant_uid;
           msg += '결제 금액 : ' + rsp.paid_amount;
           msg += '카드 승인번호 : ' + rsp.apply_num; */
           
           document.getElementById('dainChargeForm').submit();
       } else {
           var msg = '결제에 실패하였습니다.';
       }
       alert(msg);
   });
   }
   
   
      $(document).ready(function(){
         pagingFunc();
         $("#rowPerPage").change(function(){
            pagingFunc();
         });
         
         //보유 젬포인트 0원처리
         var jbText = $( '#gemP' ).text();
         if(jbText == 'P'){
        	$('#gemP').html("0P");
         }
      });
   
      //글자수 제한
      $(function() {
         $('#comment').keyup(function(e) {
         var comment = $(this).val();
         $(this).height(((comment.split('\n').length + 1) * 1.5) + 'em');
         $('#counter').html(comment.length + '/1000');
         });
         $('#comment').keyup();
      });
      
      //페이지 시작하면 처음 보여주면서 처리해야할 기능
       //페이징 처리를 위한 스크립트
      var commentsResult = new Array();
      var result = new Array();
      
       <c:forEach var="gemforeach" items="${article}">
          var json = new Object();//객체로 배열에 담기
          json.gem_date = '${gemforeach.gemDate}';
          json.gem_log = '${gemforeach.gemLog}';
          json.gem_price = '${gemforeach.gemPrice}';
          json.gem_usage = '${gemforeach.gemUsage}';
          commentsResult.push(json);
       </c:forEach>
      //전체 데이터에서, 카테고리 설정 했을 때&검색했을때 데이터에 따라 페이징이 바뀌어야 하므로 이 배열을 가공한 다른 배열들이 필요하다.
      
      var pageCount = 10;
      
      var pagingFunc = function(){
         result = commentsResult;
         pageCount = $("#rowPerPage").val();// 셀렉박스에 몇개씩 볼지 선택된 값에 따라 페이징 다르게 해주기
         
          // 한 페이지에 보여질 개수
         var blockCount = 5; // 페이지 몇개를 하나의 그룹(?)으로 묶은  정의하는 블럭 개수
         var totalPage = Math.ceil(result.length / pageCount); // 총 페이지가 몇개 나올지 - 총 입력된 데이터의 개수에서 한페이지에 보여줄 글 목록 개수로 나눴다.
         var totalBlock = Math.ceil(totalPage / blockCount); // 총 블럭 개수가 몇개 나올지
         var pagination = document.getElementById('pagination');//페이징 기능 들어갈 영역(테이블 영역 아래)
         var testTable = document.getElementById('gemTable').querySelector("tbody");//페이징 처리를 하면 표시될 데이터가 들어갈 테이블영역
         
         var renderTableAndPagination = function(page = 1){
            renderTable(page);//테이블 그리는 함수
            renderPagination(page);//페이징 처리 함수
         };
         
         //테이블 그리는 함수
         var renderTable = function(page){
            var html = '';
   
            var startNum = (pageCount * (page - 1)); 
            var endNum = ((pageCount * page) >= result.length) ? result.length : (pageCount * page);
            
            //여기서 만들어진 html 을 테이블 tbody 영역에 innerhtml 해줄거임.
            for(var index = startNum; index < endNum; index++){
                html += '<tr><td class="daintdth" style="text-align: center">' + result[index].gem_date 
                 + '</td><td class="daintdth"> ' + result[index].gem_log
                 + '</td>';
                 //포인트 충전인지 사용인지 구분
                 if(result[index].gem_usage == "Y"){
                	 html += '<td class="daintdth bold" style="text-align: center; color: #e35852;">' 
           			+  addComma(result[index].gem_price)+ 'P</td>';
                 } else if(result[index].gem_usage =="N"){
                	 html += '<td class="daintdth bold" style="text-align: center; color: #36a7b3;">+' 
                	+  addComma(result[index].gem_price) + 'P</td>';
                 }
                 html += '</tr>';
         	  }
            
    
            testTable.innerHTML = html;
            
         };
         
         //숫자에 콤마 넣는 함수
         function addComma(num) {
        	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
        	  return num.toString().replace(regexp, ',');
        }
         
         //pagination 그리는 함수
          var renderPagination = function(page){
            var block = Math.floor((page-1)/blockCount)+1;
            var startPage = ((block-1)*blockCount)+1;
            var endPage = ((startPage + blockCount - 1) > totalPage) ? totalPage : (startPage + blockCount - 1);
                        
            var paginationHTML = '';
                        
            if(page !== 1) paginationHTML += "<a style='cursor:pointer' class='first_page'>처음&nbsp;&nbsp;</a>";
            if(block !== 1) paginationHTML += "<a style='cursor:pointer' class='back_page'>이전...&nbsp;&nbsp;</a>";
                        
            for(var index = startPage; index <= endPage; index++){
               paginationHTML += (parseInt(page) === parseInt(index)) ? " <a style='color:#ff8400'>" + index + "</a> " :" <a style='cursor:pointer' class='go_page' data-value='" + index + "'>" + index + "</a> ";
            }
                        
            if(block < totalBlock) paginationHTML += "<a style='cursor:pointer' class='next_page'>&nbsp;&nbsp;...다음</a>";
            if(page < totalPage) paginationHTML += "<a style='cursor:pointer' class='last_page'>&nbsp;&nbsp;끝</a>";
                   
            pagination.innerHTML = paginationHTML;
            addEventPagination(startPage, endPage);
         }; 
                
         //클릭이벤트, 클릭할 때마다 테이블을 새로 그려주는 거임
         var addEventPagination = function(startPage, endPage){
            if(!!document.querySelector(".first_page")){
               document.querySelector(".first_page").addEventListener('click', ()=>{
                  renderTableAndPagination(1);
               });
            }
            if(!!document.querySelector(".back_page")){
               document.querySelector(".back_page").addEventListener('click', ()=>{
                  renderTableAndPagination(startPage-1);
               });
            }
            document.querySelectorAll(".go_page").forEach(goPage => {
               goPage.addEventListener('click', e => {
                  renderTableAndPagination(parseInt(e.target.getAttribute('data-value')));
               });
            });
            if(!!document.querySelector(".next_page")){
               document.querySelector(".next_page").addEventListener('click', ()=>{
                  renderTableAndPagination(endPage+1);
               });
            }
            if(!!document.querySelector(".last_page")){
               document.querySelector(".last_page").addEventListener('click', ()=>{
                  renderTableAndPagination(totalPage);
               });
            }
         };  
         renderTableAndPagination();
         //페이징 처리 끝
      };
   
      
      
   </script>	
	
	
	
</body>
</html>