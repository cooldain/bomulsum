<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 작가홈 | 판매중 작품</title>
<link
	href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>"
	rel="stylesheet">
<!-- CSS 영역 -->
<style>
.jeongaonSaleContainer {
	width: 90%;
	margin-left: 2%;
}

.topLine {
	height: 40px;
}

.button {
	background-color: white;
	color: black;
	border: 1px solid #008CBA;
	text-align: center;
	padding: 2%, 2%;
}

h4{
	float: left;
}
.onSaleTitle {
	float: center;
}

.jeongaSaleTable {
	margin-top: 10px;
	text-align: center;
}

#jeongaUpdate{
	background-color: white;
	border: 1px solid #e7e7e7;
	height: 35px;
	color:#666666;
	font-size: 16px;
	padding:5px;
}

.bottomLine {
	margin-top: 1%;
}

#ordertable {
	width: 100%;
	table-layout: fixed;
	border-top: 1px solid #ddd;
	border-left: 0px;
	border-right: 0px;
	border-bottom: 1px solid #ddd;
}

.alignLeft {
	float: left;
}

.alignRight {
	float: right;
}

.formAction {
	float: right;
}

form {
	display: inline;
}

#jeongapagination {
	margin-top: 20px;
	text-align: center;
	margin-bottom: 100px;
}

.arrow prev {
	border: 0px;
}

.arrow next {
	border: 0px;
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

<!-- body 시작 -->
<body id="page-top">
	<c:if test="${param.check eq 1}">
		<script type="text/javascript">
			alert("글이 수정 되었습니다.");
			location.href="/bomulsum/writer/workOnsale.wdo";
		</script>
	</c:if>


	<div id="wrapper">
		<!-- Header/Nav -->
		<%@ include file="../include/side.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../include/head.jsp"%>
				<!-- end Header/Nav -->
				<!-- 판매중 작품 영역 -->
				<div class="jeongaonSaleContainer">
					<!-- topLine -->
					<div class="topLine">
						<h4>판매중 작품</h4>
					</div>
					<!-- end of topLine -->
					<hr>
					<div class="middleLine">
						<input type="text" placeholder="작품명을 입력하세요" id="search_box"
							autocomplete="off">
						<button class="button" type="submit" onclick="search()">검색</button>

						<div class="formAction">
							<!--  <form action="<c:url value='/writer/categorySort.wdo'/> "
								class="sortSearch">-->
								<select id="sortList" onchange="formAction()">
									<option value="art_name">작품명</option>
									<option value="art_register_date">등록일</option>
									<option value="art_price">정상가격</option>
									<option value="art_sale_count">판매수</option>
								</select>
							<!--  </form>-->
							<select name="show" id="rowPerPage">
								<option value="10">10개씩 보기</option>
								<option value="30">30개씩 보기</option>
								<option value="50">50개씩 보기</option>
							</select>
						</div>
					</div>
					<!-- middleLine -->
					<!-- 테이블 시작 -->
					<div class="jeongaSaleTable">
						<table border="1" id="ordertable">
							<thead>
								<tr>
									<th style="width: 4%"><input type="checkbox"
										id="selectAll"></th>
									<th colspan="4" style="width: 40%">작품명</th>
									<th style="width: 5%">수량</th>
									<th style="width: 7%">정상가</th>
									<th style="width: 7%">할인가</th>
									<th style="width: 7%">즐겨찾기</th>
									<th style="width: 5%">댓글</th>
									<th>조회수</th>
									<th>판매수</th>
									<th style="width: 5%">후기</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>

								<%-- 	<c:forEach var="onSaleArt" items="${onSaleList}">
			<tr>
		
				<td><input type="checkbox" class="selectCheckBox" name="selectCheck"value="Y"></td>
				<td style="display:none"> <span class="artCode">${onSaleArt.artCodeSeq}</span></td>
				<td>
				<img style="overflow: hidden; align-items: center; justify-content: center; width: 75px; height: 75px"
					src="<c:url value='/upload/${onSaleArt.artPhoto}'/>"/></td> <!-- ${onSaleArt.artPhoto} -->
				<td colspan="3">
					<div class="alignLeft" style="text-align: left">
						<a href="#" style="color: black; text-style: bold;">
						${onSaleArt.artName}</a> 
						<label style="text-align: center; background-color: #5EC75E; width: auto; margin-bottom: 0rem; color: white">
							<i class="fas fa-tags"></i>
						</label>
					</div>
					<div class="alignRight" style="text-align: right">
						<br> <label style="text-decoration: line-through; margin-bottom: 0rem"> ${onSaleArt.artPrice}원</label>
						<br> <label style="margin-bottom: 0rem; color: #28E7FF">${onSaleArt.artDiscount}원 </label>
					</div>
				</td>
				
				<td>${onSaleArt.artAmount}</td>
				<td>${onSaleArt.artPrice}원</td>
				<td>${onSaleArt.artDiscount}원</td>
				<td>${onSaleArt.bookMarkCount}</td>
				<td>${onSaleArt.commentCount}</td>
				<td>${onSaleArt.artViewCount}</td>
				<td>${onSaleArt.artSaleCount}</td>
				<td>${onSaleArt.reviewCount}</td>
				<td><button id="update" type="button" onClick="location.href ='<c:url value='/writer/workRegister.wdo'/>'">수정</button></td>
				
			</tr>
			</c:forEach> --%>
							</tbody>
						</table>
					</div>

					<!-- 테이블 끝 -->

					<!-- 아래 버튼 -->
					<div class="bottomLine">
						<button class="button" id="pauseSales" type="button">판매 일시 중지</button>
						<button class="button" id="deleteArt" type="button">작품 삭제</button>
					</div>
					<!-- 아래 버튼 끝 -->
				</div>
				<!-- end of Container -->
				<!-- 페이징 처리 -->
				<div id="jeongapagination" class="minwoo_pagination"></div>

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

			</div>
			<!-- end of content -->
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	pagingFunc();
	
	$("#rowPerPage").change(function(){
        pagingFunc();
     });
});
    //최상단 체크박스 클릭
    $("#selectAll").click(function(){
        //클릭되었으면
        if($("#selectAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=selectCheck]").prop("checked",true);
            //클릭이 안되어있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=selectCheck]").prop("checked",false);
        }
    });
    
    //판매 일시중지 버튼
    $("#pauseSales").on('click', function(){ 
       var arr = [];
       $(".selectCheckBox:checked").each(function(){
       		var $data = $(this).parent().next().children('.artCode').text();
          	arr.push($data);
       });
       console.log(arr);
       var data = {
             "saleState" : arr,
       }
       
       console.log(data);
       pauseSale(data);
    });
    
    //판매일시중지 값 넘기기
    function pauseSale(data){   
        $.ajax({
           url:"/bomulsum/writer/pauseSalesArt.wdo",
           data:data,
           success : function(){
              alert('변경에 성공했습니다.');
              location.reload(true);
           },
           error : function(err){
              console.log(err);
           }
        }).done(function(data){
        	console.log(data);
        });
     }   
    
 	// 작품 삭제 버튼
    $("#deleteArt").on('click', function(){ 
        var arr = [];
        $(".selectCheckBox:checked").each(function(){
        		var $data = $(this).parent().next().children('.artCode').text();
           	arr.push($data);
        });
        console.log(arr);
        var data = {
              "artDelete" : arr,
        }
        
        console.log(data);
        if(confirm('정말 삭제하시겠습니까?'))	{
        	deleteArt(data);
        }
        else{
        	return false;
        }
     });
     
 	//작품 삭제 값 넘기기
     function deleteArt(data){   
         $.ajax({
            url:"/bomulsum/writer/deleteArt.wdo",
            data:data,
            success : function(){
               alert('변경에 성공했습니다.');
               location.reload(true);
            },
            error : function(err){
               console.log(err);
            }
         }).done(function(data){
         	console.log(data);
         });
      }   
 
//페이지 시작하면 처음 보여주면서 처리해야할 기능
//페이징 처리를 위한 스크립트
var onSaleResult = new Array();
var searchResult = new Array(); // 검색 결과물 담을 배열
var searchCheck = false; // 검색어로 들어온 결과인지 아닌지
var result = new Array();// 전체 데이터에서 페이징 처리 될 때마다 새롭게 테이블을 짜야 하므로 조건에 따른 결과를 넣어줄 배열을 여기서 초기화 해준다.
var sortCheck = false;  //정렬 확인
var sortResult = new Array();	//정렬 담은 배열

<c:forEach var="i" items='${onSaleList}'>
   var json = new Object();//객체로 배열에 담기
   json.artCodeSeq = '${i.artCodeSeq}';
   json.artPhoto = '${i.artPhoto}';
   json.artName = '${i.artName}';
   json.artAmount = '${i.artAmount}';
   json.artPrice = '${i.artPrice}';
   json.artDiscount = '${i.artDiscount}';
   json.bookMarkCount = '${i.bookMarkCount}';
   json.commentCount = '${i.commentCount}';
   json.artViewCount = '${i.artViewCount}';
   json.artSaleCount = '${i.artSaleCount}';
   json.reviewCount = '${i.reviewCount}';
   json.artRegisterDate = '${i.artRegisterDate}'; 
   var discountPercent = (('${i.artPrice}' - '${i.artDiscount}') /'${i.artPrice}')*100;
   json.artDiscountPercent =Math.round(discountPercent);
   onSaleResult.push(json);
</c:forEach>



//전체 데이터에서, 카테고리 설정 했을 때&검색했을때 데이터에 따라 페이징이 바뀌어야 하므로 이 배열을 가공한 다른 배열들이 필요하다.

//데이터 정렬
function date(a,b){
	pagingFunc();
	var sortDate = "artRegisterDate";
	var dateA = new Date(a[sortDate]).getTime();
	var dateB = new Date(b[sortDate]).getTime();
	return dateA < dateB ? 1: -1;
};


function formAction(){
	sortResult = [];
	var sortSelect = $("#sortList option:selected").val();

	//등록일순 정렬 (내림차순)
	if(sortSelect == 'art_register_date'){
		sortResult = onSaleResult.sort(date);
		console.log(sortResult);
	}
	//이름순 정렬 (오름차순)
	if(sortSelect == 'art_name'){
		sortResult = onSaleResult.sort(function(a,b){
			return a.artName < b.artName ? -1 : a.artName > b.artName ? 1: 0;
		});
		console.log(sortResult);
	}

	//가격순 정렬(오름차순)
	if(sortSelect == 'art_price'){
		var sortPrice = "artPrice";
		sortResult=onSaleResult.sort(function(a,b){
		return a[sortPrice] - b[sortPrice];
		});
		console.log(sortResult);
	}
	//판매순 정렬 (내림차순)
	if(sortSelect == 'art_sale_count'){
		var sortSaleCount = "artSaleCount";
		sortResult=onSaleResult.sort(function(a,b){
		return b[sortSaleCount] - a[sortSaleCount];
		});
		console.log(sortResult);
	}
	sortCheck = true;
	pagingFunc();
	
};
	
//검색 기능
var search = function(){//눌렀다 때서 안되나보다
	var k = $("#search_box").val();
	searchResult = [];
	for(var i=0; i < onSaleResult.length; i++){
		if(onSaleResult[i].artName.includes(k)){
		//검색할 객체 배열(카테고리가 선택되었으면에서 title 이 입력한 검색어가 포함되는 것만 다시 검색한다.
		//카테고리가 선택되었으면, 카테고리 배열에서, 선택되어있지 않다면 전체배열에서 얻어와야 된다.
			searchResult.push(result[i]);
		}
	}

	searchCheck = true;
	//검색 매소드가 실행 될 때 검색하는 데이터 영역이 pagingFunc()를 실행하고 난 다음 얻어진 데이터 영역이므로 카테고리를 지정하더라도 result에 값이 있으므로 false로 넘어간다.
	pagingFunc();
};

var pageCount = 10; // 한 페이지에 보여질 개수
var pagingFunc = function(){
	result = [];
	result=onSaleResult;
	
	if(sortCheck){
		result = sortResult;
	}
	
	 if(searchCheck) { // 아니라면 전체 리스트에서 가지고 온다.
		var k = $("#search_box").val();
		if(k==""){
			result = onSaleResult;
			searchCheck = false;
		} else{
			result = searchResult;
		}
	 }

	pageCount=$("#rowPerPage").val();
	
	var blockCount = 5; // 페이지 몇개를 하나의 그룹(?)으로 묶은  정의하는 블럭 개수
	var totalPage = Math.ceil(result.length / pageCount); // 총 페이지가 몇개 나올지 - 총 입력된 데이터의 개수에서 한페이지에 보여줄 글 목록 개수로 나눴다.
	var totalBlock = Math.ceil(totalPage / blockCount); // 총 블럭 개수가 몇개 나올지
	var pagination = document.getElementById('jeongapagination');//페이징 기능 들어갈 영역(테이블 영역 아래)
	var testTable = document.getElementById('ordertable').querySelector("tbody");//페이징 처리를 하면 표시될 데이터가 들어갈 테이블영역
	
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
	  		html += '<tr><td><input type=\"checkbox\" class=\"selectCheckBox\" name=\"selectCheck\"></td>'+
	  		'<td style=\"display:none\">'+'<span class=\"artCode\">'+result[index].artCodeSeq + '</span></td>'+
	  		'<td style=\"display:none\">'+result[index].artRegisterDate + '</td>'+
	  		'<td>' + '<img src="${pageContext.request.contextPath}/upload/'+result[index].artPhoto+ '" ' + 
	  		'style="overflow: hidden; align-items: center; justify-content: center; width: 75px; height: 75px">'+'</td>'+ 
			'<td colspan=\"3\" style="padding:10px;">' +'<div class=\"alignLeft\" style=\"text-align: left\">' +
				'<a href="${pageContext.request.contextPath}/user/uProductInfo/'+result[index].artCodeSeq+'.do?memberCode=null" style=\"color: black; text-style: bold;\">'+ result[index].artName + '</a>' + 
				'<br>' + '<br>' +'<label style=\"text-align: center; background-color: #5EC75E; width: auto; margin-bottom: 0rem; color: white\">'+
				'<i class=\"fas fa-tags\">'+result[index].artDiscountPercent+'%</i></label></div>' + 
				'<div class=\"alignRight\" style=\"text-align: right\">' + 
				'<br> <label style=\"text-decoration: line-through; margin-bottom: 0rem\">'+ result[index].artPrice +'원</label>'+
				'<br> <label style=\"margin-bottom: 0rem; color: #28E7FF\">'+ result[index].artDiscount +'원 </label>'+
				'</div></td>' + '<td>'+result[index].artAmount + '</td>' +
				'<td>'+ result[index].artPrice + '</td>' + '<td>' + result[index].artDiscount + '</td>' +
				'<td>'+ result[index].bookMarkCount+'</td>' + '<td>'+ result[index].commentCount+'</td>' +
				'<td>'+ result[index].artViewCount+'</td>' + '<td>'+ result[index].artSaleCount+'</td>' +
				'<td>'+ result[index].reviewCount+'</td>' + 
				'<td>'+'<a href="${pageContext.request.contextPath}/writer/updateWork/'+result[index].artCodeSeq+'.wdo" id="jeongaUpdate">'
				+'수정'+'</a>'+'</td></tr>'


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
			paginationHTML += (parseInt(page) === parseInt(index)) ? "<a style='color:#ff8400'>" + index + "</a> " :" <a style='cursor:pointer' class='go_page' data-value='" + index + "'>" + index + "</a> ";
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