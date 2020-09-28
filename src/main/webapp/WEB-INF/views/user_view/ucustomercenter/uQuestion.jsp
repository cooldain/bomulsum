<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 자주 묻는 질문</title>
<script src="https://kit.fontawesome.com/fea5b9b7d0.js" crossorigin="anonymous"></script>
<style type="text/css">

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}

.minwoo_notice_body{
	width:1054px;
	margin-left:auto;
	margin-right:auto;
	border:1px #D8D8D8 solid;
	margin-top: 1px;
}

.minwoo_notice_one a{
    display: inline-block;
    padding:10px;
    width: 100%;
    font-size: 15px;
    color: #333;
}

.minwoo_notice_one a:hover:not(.active) {
    color: #1f76bb;
}

.minwoo_notice_one{
 	width:100%;
 	border-top:1px #D8D8D8 solid;
 	height:50px;
 	display: flex;
 	flex-direction: row;
 	justify-content: center;
}

.minwoo_paging {
	margin-top: 20px;
	text-align: center;
	margin-bottom: 100px;
}

.minwoo_paging a {
	display: inline-block;
	margin: 0 3px;
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #ccc;
	color: #999999;
	background-color: #fff;
}

.minwoo_paging a:hover:not(.active) {
    color: #1f76bb;
    border: 1px solid #ccc;
}s

.minwoo_arrow prev {
	border: 0px;
}

.minwoo_arrow next {
	border: 0px;
}

::-webkit-scrollbar {
  width: 6px;
}
::-webkit-scrollbar-track {
  background-color: transparent;
}
::-webkit-scrollbar-thumb {
  border-radius: 3px;
  background-color: gray;
}
::-webkit-scrollbar-button {
  width: 0;
  height: 0;
}
</style>
</head>
<body>
<div>
	<%@ include file="../include/uHeader.jsp"  %>
	
	<!-- 게시판 영역 -->
	<div class="minwoo_notice_body">
		<!-- 헤더 시작-->
		<div style="width:100%;">
			<div style="width:100%; height: 55px;">
				<p style="font-weight:bold; font-size:22px; color:#848484; padding-left:20px;">자주 묻는 질문</p>
			</div>
		</div>
		<!-- 헤더 종료 -->
		
		<!-- 글 들어올 바디 영역 시작 -->
		<div id="mainContent" class="minwoo_notice_body_body">
			<!-- 내용물 -->          
			
			<!-- 내용물 -->
		</div>
		<!-- 글 들어올 바디 영역 종료 -->
		
	</div>
	<div class="minwoo_paging">
		<div id="pagination">
		</div>
	</div>
	
	<%@ include file="../include/uFooter.jsp" %>
</div>
</body>
<script>
	var curPage = 1;
	var nums;
	$(function(){
		var list = new Array();
		
		<c:forEach items="${boardVo}" var="i">
			var json = new Object();
			json.noticeSeq = "${i.noticeSeq}";
			json.noticeCategory = "${i.noticeCategory}";
			json.noticeTitle = "${i.noticeTitle}";
			json.noticeContent = `${i.noticeContent}`;
			json.noticeDate = "${i.noticeDate}";
			console.log(json);
			list.push(json);
		</c:forEach>
		
		
		/* if(list.length / 10 != 0){
			nums = Math.floor(list.length / 10) + 1;
		}else{
			nums = Math.floor(list.length / 10);
		}
		for(var i = 2; i <= nums; i++){
			var aTag = $("<a>");
			aTag.addClass('pagination');
			aTag.attr('id', i);
			aTag.html(i);
			aTag.insertAfter('#1');
		} */
		
		
		
		var pagingFunc = function(){
			
			var pageCount = 10; // 한 페이지에 보여질 개수
			var blockCount = 5; // 페이지 몇개를 하나의 그룹(?)으로 묶은  정의하는 블럭 개수
			var totalPage = Math.ceil(list.length / pageCount); // 총 페이지가 몇개 나올지 - 총 입력된 데이터의 개수에서 한페이지에 보여줄 글 목록 개수로 나눴다.
			var totalBlock = Math.ceil(totalPage / blockCount); // 총 블럭 개수가 몇개 나올지
			var pagination = document.getElementById('pagination');//페이징 기능 들어갈 영역(테이블 영역 아래)
			var testTable = document.getElementById('mainContent');//페이징 처리를 하면 표시될 데이터가 들어갈 테이블영역
			
			var renderTableAndPagination = function(page = 1){
			   renderTable(page);//테이블 그리는 함수
			   renderPagination(page);//페이징 처리 함수
			};
			
			//테이블 그리는 함수
			var renderTable = function(page){
				var html = '';

				var startNum = (pageCount * (page - 1)); 
				var endNum = ((pageCount * page) >= list.length) ? list.length : (pageCount * page);
				
				//여기서 만들어진 html 을 테이블 tbody 영역에 innerhtml 해줄거임.
				for(var index = startNum; index < endNum; index++){
			  		html += '<div class=\"minwoo_notice_one\">' + '<a href=\"/bomulsum/user/board/noticeDetail.do?seq='+ list[index].noticeSeq + '\">'
						+ '<span>❑&nbsp;</span>' + '<span>' + list[index].noticeTitle + '</span></a>'
						+ '<a style=\"display:flex; justify-content: flex-end; align-itmes: center;\">' + list[index].noticeDate + '</a></div>';
				}
				testTable.innerHTML = html;
			};
		
			//pagination 그리는 함수
			 var renderPagination = function(page){
				var block = Math.floor((page-1)/blockCount)+1;
				var startPage = ((block-1)*blockCount)+1;
				var endPage = ((startPage + blockCount - 1) > totalPage) ? totalPage : (startPage + blockCount - 1);
				            
				var paginationHTML = '';
				            
				if(page !== 1) paginationHTML += "<a style='cursor:pointer' class='first_page'>처음&nbsp;&nbsp;</a>";
				if(block !== 1) paginationHTML += "<a style='cursor:pointer' class='back_page'>이전...&nbsp;&nbsp;</a>";
				            
				for(var index = startPage; index <= endPage; index++){
					paginationHTML += (parseInt(page) === parseInt(index)) ? "| <a style='color:#ff8400'>" + index + "</a> |" :"| <a style='cursor:pointer' class='go_page' data-value='" + index + "'>" + index + "</a> |";
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
		
		$(document).ready(function(){
			pagingFunc();
		});
	});
</script>
</html>