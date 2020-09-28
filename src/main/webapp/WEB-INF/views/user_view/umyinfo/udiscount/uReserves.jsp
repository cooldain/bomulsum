<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 적립금</title>
<style>
.content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px;
	padding-bottom: 64px;
	display:flex;
}

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}

.dndud_content{
	width:80%;
	display:flex;
	flex-direction: column;
	margin-left: 2%;
	margin-bottom:2%;
}

.reserves_table{
	width:96%;
	display:flex;
	flex-direction: column;
	padding:2%;
	background-color:#1f76bb;
	margin-bottom: 6%;
	color:white;
}

.reserves_table_top{
	display:flex;
	flex-direction: column;
	border-bottom: 1px solid white;
	padding-bottom:0.5%;
}

.reserves_table_top div:nth-child(1){
	font-size:16px;
}

.reserves_table_top div:nth-child(2){
	font-size:30px;
	font-weight:bold;
	align-self: flex-end;
}

.reserves_table_bottom{
	display:flex;
	flex-direction: row;
	padding-top:1%;
	padding-bottom:1%;
}

.reserves_table_bottom_left{
	width:50%;
	display:flex;
	flex-direction: column;
}

.reserves_table_bottom_left div:nth-child(1){
	font-size:13px;
	border-right: 1px solid white;
	padding-right:5%;
}

.reserves_table_bottom_left div:nth-child(2){
	font-size:24px;
	padding-right:5%;
	font-weight:bold;
	align-self: flex-end;
	border-right: 1px solid white;
}

.reserves_table_bottom_right{
	padding-left:2%;
	width:50%;
	display:flex;
	flex-direction: column;
}

.reserves_table_bottom_right div:nth-child(1){
	font-size:13px;
	padding-right:5%;
}

.reserves_table_bottom_right div:nth-child(2){
	padding-right:5%;
	font-size:24px;
	font-weight:bold;
	align-self: flex-end;
}

.reserves_use_list{
	width:100%;
	display:flex;
	flex-direction: column;
	margin-bottom: 4%;
	font-size:15px;
}

.reserves_use_list_top{
	width:100%;
	display:flex;
	flex-direction: row;
	justify-content: space-between;
	padding-bottom:1%;
	border-bottom: 1px solid #d9d9d9;
}

.reserves_use_list_top span:nth-child(1){
	font-weight: bold;
	font-size: 18px;
}

.reserves_use_list_top span:nth-child(2){
	border: 1px solid #d9d9d9;
	font-size: 13px;
	display:flex;
	justify-content: center;
	align-items: center;
	padding:0.2%;
	cursor:pointer;
}

.reserves_use_list_content{
	margin-top: 2%;
	font-size: 13px;
	color: gray;
	display: flex;
	flex-direction: column;
	border-bottom: 1px solid #d9d9d9;
	padding-bottom: 2%;
}


.reserves_use_list_content div{
	display: flex;
	justify-content: space-between;
	padding-right:1%;
	align-items: center;
}

.reserves_use_list_content div span:nth-child(1){
	color: #333;
}

.reserves_use_list_content div span:nth-child(2){
	font-weight: bold;
}

.dndud_content_footer{
	width:100%;
	display:flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-bottom: 6%;
}

.dndud_content_footer span{
	color:gray;
	font-size: 13px;
}

.dndud_content_paging{
	width:100%;
	display:flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.dndud_content_paging_num{
	width:50%;
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.dndud_content_paging_num a{
	color:red;
	padding:0.5% 1% 0.5% 1%;
	border: 1px solid #d9d9d9;
}

.dainA:link,.dainA:visited,.dainA:active,.dainA:hover{
	color: black;
	text-decoration: none;
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
<body>
<div>
	<!-- 헤더 -->
	<%@ include file="../../include/uHeader.jsp"  %>
	
	
	
	<div class="content">
	<!-- 사이드메뉴 -->
	<%@ include file="../../include/uside.jsp" %>
	<!-- 내용 여기다 넣으시오 -->
	
		<div class="dndud_content">
			<div class="reserves_table">
			<div class="reserves_table_top">
					<div><span>사용가능한 적립금</span></div>
					<div><span><fmt:formatNumber value="${usablepoint}" pattern="#,###"/>P</span></div>
				</div>
				<div class="reserves_table_bottom">
					<div class="reserves_table_bottom_left">
						<div><span>환불 적립금</span></div>
						<div><span>-<fmt:formatNumber value="${refundpoint}" pattern="#,###"/>P</span></div>
						
					</div>
					<div class="reserves_table_bottom_right">
						<div><span>총 사용 적립금</span></div>
						<div><span>-<fmt:formatNumber value="${usepoint}" pattern="#,###"/>P</span></div>
					</div>
				</div>
			</div>
			
			<div class="reserves_use_list">
				<div class="reserves_use_list_top">
					<span>적립금 이용 내역</span>
					<span><a href="/bomulsum/user/board/noticeDetail.do?seq=admin_notice_seq174" 
					style="text-decoration: none;" class="dainA">안내사항 ></a></span>
				</div>
				
				<table id="resTable">
				  <tbody class="dain_table_body">
               	 <!-- 데이터 들어올 영역 -->
                   <!-- 적립금 이용내역 -->
			<%-- 		<c:forEach var="res" items="${ureserves}">
					<tr><td>
					<div class="reserves_use_list_content">
						<span>${res.point_date} ${res.point_detail}</span>
						<div>
							<c:if test="${res.point_category eq '적립'}">
								<span>적립</span>
							</c:if>
							<c:if test="${res.point_category eq '사용'}">
								<span>사용</span>
							</c:if>
							<span>${res.point_amount}P</span>
						</div>
					</div>
					</td></tr>
					</c:forEach>  --%>
                  </tbody>
				</table>
	
			</div>
			
		
					
			<div class="dndud_content_footer">
				<span>최근 1년까지 내역을 확인할 수 있습니다.</span>
			</div>
			
			
			<!-- 페이징 처리 -->
			<div id="pagination" class="minwoo_pagination" style="padding-right: 8%;"></div>
			
<!-- 			<div class="dndud_content_paging">
				<div class="dndud_content_paging_num">
					<a>1</a>
				</div>
			</div> -->
		</div>
		
		
		
	
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script>
      $(document).ready(function(){
         pagingFunc();
         $("#rowPerPage").change(function(){
            pagingFunc();
         });
         
      });

      
      //페이지 시작하면 처음 보여주면서 처리해야할 기능
       //페이징 처리를 위한 스크립트
      var commentsResult = new Array();
      var result = new Array();
      
       <c:forEach var="res" items="${ureserves}">
          var json = new Object();//객체로 배열에 담기
          json.point_date = '${res.point_date}';
          json.point_detail = '${res.point_detail}';
          json.point_category = '${res.point_category}';
          json.point_amount = '${res.point_amount}';
          commentsResult.push(json);
       </c:forEach>
      //전체 데이터에서, 카테고리 설정 했을 때&검색했을때 데이터에 따라 페이징이 바뀌어야 하므로 이 배열을 가공한 다른 배열들이 필요하다.
      console.log(result);
      var pageCount = 10;
      
      var pagingFunc = function(){
         result = commentsResult;
         pageCount = 10;// 셀렉박스에 몇개씩 볼지 선택된 값에 따라 페이징 다르게 해주기
         
          // 한 페이지에 보여질 개수
         var blockCount = 5; // 페이지 몇개를 하나의 그룹(?)으로 묶은  정의하는 블럭 개수
         var totalPage = Math.ceil(result.length / pageCount); // 총 페이지가 몇개 나올지 - 총 입력된 데이터의 개수에서 한페이지에 보여줄 글 목록 개수로 나눴다.
         var totalBlock = Math.ceil(totalPage / blockCount); // 총 블럭 개수가 몇개 나올지
         var pagination = document.getElementById('pagination');//페이징 기능 들어갈 영역(테이블 영역 아래)
         var testTable = document.getElementById('resTable').querySelector("tbody");//페이징 처리를 하면 표시될 데이터가 들어갈 테이블영역
         
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
            	
                 //포인트 충전인지 사용인지 구분
                 if(result[index].point_category == "적립"){
                	 html += '<tr><td> <div class="reserves_use_list_content"> <span>' + result[index].point_date +' '+
                     '<a style="color: #36a7b3;font-weight: bold;margin-left: 1%;">'+result[index].point_category+ '</a></span><div>';
                	 html += '<span>'+result[index].point_detail+'</span>' ;
                	 html += '<span style="text-align: center; color: #36a7b3;">+' + addComma(result[index].point_amount) 
                	 + 'P</span></div></div></td></tr>';
           			// addComma(result[index].gem_price)+ 'P</td>';
                 } else{
                	 html += '<tr><td> <div class="reserves_use_list_content"> <span>' + result[index].point_date +' '+
                	 '<a style="color: #e35852;font-weight: bold;margin-left: 1%;">'+result[index].point_category+ '</a></span><div>';
                	 html += '<span>'+result[index].point_detail+'</span>' ;
                	 html += '<span style="text-align: center; color: #e35852;">-' + addComma(result[index].point_amount) 
                	 + 'P</span></div></div></td></tr>';
                 }
                 //html += '<span>' + addComma(result[index].point_amount) + 'P</span></div></div></td></tr>';
                 console.log(result[index].point_detail);
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
</html>