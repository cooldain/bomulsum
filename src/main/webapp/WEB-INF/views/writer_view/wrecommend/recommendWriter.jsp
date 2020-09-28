<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
<meta charset="UTF-8">
<title>실시간 추천</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">
<style type="text/css">
.page-link {
  position: relative;
  display: block;
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
</style>
<script type="text/javascript">
	$(function() {
		$.ajax({			 
			url: "${pageContext.request.contextPath}"+"/writer/checkArtList.wdo",  //클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			type: "POST", // HTTP 요청 메소드 (GET , POST 등)
			dataType: "json",
			success: function(data){
			const jsData = data;
			$('#recommandPay').text(jsData);
			},
			error: function(data){
				alert('에러입니다');
			}
		 });	
		$(this).click(function(){
				$("input[id=artListCheckBox]:checked").each(function(i) {
					const id = this.value;
					const tmep = this.name;
					const data = [
						id,
						tmep
					];
					console.log(data);
					console.log(id);
					console.log(tmep);
					$.ajax({			 
						url: "${pageContext.request.contextPath}"+"/writer/getTempUpdate.wdo", //클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
						data:   {
							"seq" : data
						}, //HTTP 요청과 함꼐 서버로 보낼 데이터
						method: "POST", // HTTP 요청 메소드 (GET , POST 등)
						traditional: true,
						success: function(data){
						const jsData = data; 
						location.href = "/bomulsum/writer/recommendWriter.wdo";
						},
						error: function(data){
						}
					 });					
				});
				
		});
		//검색 버튼 이벤트 처리
		$("#searchBtn")
				.click(
						function() {
							console.log("검색 버튼이 클릭됨!");
							const keyword = $("#keywordInput").val();

							const condition = $("#condition option:selected")
									.val();

							location.href = "/bomulsum/writer/recommendWriter.wdo?keyword="
									+ keyword
						});

		//엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key) {
			if (key.keyCode == 13) { //키가 13번이면 실행 (엔터 -> 13)
				$("#searchBtn").click();
			}
		});
		$('#pay').click(function(){
			const size = $('#conatainerNext').attr('class');
			if(size <= 0){
				alert('추천상품을 선택해 주세요');
				return false;
			}else{
				$.ajax({
					url : "/bomulsum/writer/recommendUp.wdo",
					method : "POST",
					data:{
						count:size
					},
					success : function(e){
						if(e == 'success'){
							alert('추천 작품에 등록 되었습니다.');
							location.href = "/bomulsum/writer/recommendWriter.wdo";							
						}else{
							alert('잔여 포인트가 부족합니다.');
							location.href = "/bomulsum/writer/gempoint.wdo";
						}
					},
					error: function(){
						alert('오류입니다.');
					}
				});
			}
			
		});
	});
</script>
</head>
<body id="page-top">
	<div id="wrapper">
		<!-- Header/Nav -->
		<%@ include file="../include/side.jsp" %>
		<div id="content-wrapper" class="d-flex flex-column">
			<%@ include file="../include/head.jsp" %>
			<!-- end Header/Nav -->
			<div id="content">
					



					<section>
        <div style="margin: 2%">
            <p>나의 신청내역</p>
            <hr>
        </div>
					<div style="margin-left: 2%; font-size: 80%; font-style: italic;">
						<p>
							<i class="fas fa-exclamation-circle" style="color: red;"> 매월
								오전 9시 ~ 오후 9시까지 광고 입찰을 받은 후, 입찰에 성공한 작품을 12시간씩 고정적으로 노출하는 기능입니다.
							</i>
						</p>
						<p>
							<i class="fas fa-exclamation-circle" style="color: red"> 순위별로
								지면이 할당되며 작품은 작가님 추천 탭에 노출됩니다. 12시간의 고정적 노출은 작품을 알릴 수 있는 좋은 기회이며,
								주력 작품을 더욱 효과적으로 알리 수 있습니다. </i>
						</p>
						<p>
							<i class="fas fa-exclamation-circle" style="color: red"> 한 광고
								당 1개 작품만 등록이 가능합니다. (오전 광고 : 6:00 ~ 18:00,오후 광고 : 18:00 ~ 익일
								6:00) 다른작품으로 변경은 불가능합니다. </i>
						</p>
						<p>
							<i class="fas fa-exclamation-circle" style="color: red"> 입찰하신
								결제금액은 취소가 불가능합니다. 입찰 전 결제 금액을 신중히 선택해주세요. </i>
						</p>
						<p>
							<i class="fas fa-exclamation-circle" style="color: red"> 젬
								포인트가 부족한 경우에는, 젬 포인트가 차감 된 후 부족한 차액만큼 등록된 카드로 결제됩니다. </i>
						</p>
						<p>
							<i class="fas fa-exclamation-circle" style="color: red"> 금일
								입찰 성공 시, 다음 날 광고가 노출되는 시점(6:00 또는 18:00)에서 결제가 진행됩니다. 금손포인트의 유효
								기간과 결제가 가능한 카드인지 확인해 주세요. </i>
						</p>
						<p>
							<i class="fas fa-exclamation-circle" style="color: red">
								21:00:00 이전까지 입찰건에 대해서만 유효합니다. </i>
						</p>
					</div>
					<br>
        <div style="display: flex; flex-direction: row; margin-top: auto; align-items: flex-end;">
            <div style="display: flex; flex-direction:column; border: 1px solid rgba(24, 7, 7, 0.13); width: 45%; height: 500px; margin: 2%;">
                <div style="display: flex;border-bottom: 1px solid rgba(24, 7, 7, 0.13);flex-direction: row;justify-content: space-between;margin-bottom: 5%;padding-bottom: 1%;">
                    <div style="margin-left: 1%;">
                        <p style="margin-top: 30%; width: 120%;margin-left: 30%;">작품선택</p>
                    </div>
                    <div style="margin-top: 2.4%; margin-right: 4%">
                        <input type="text" name="keyword" value="${param.keyword}" id="keywordInput" placeholder="검색어" style="color: #007bff; background-color: #fff;  border: 1px solid #dee2e6;">
	                    	<input type="button" value="검색" id="searchBtn" style="color: #007bff; background-color: #fff;  border: 1px solid #dee2e6;">                                       
                    </div>
                </div>
                <div>
					
                    <div id="containerPrev">
                    <c:if test="${artList.size() <= 0 }">
                    <div style="width:100%; text-align: center; margin-top: 10%;">
	                      검색결과가 존재하지 않습니다.    
                    </div>
					</c:if>
					<c:if test="${artList.size() > 0}">
					<c:forEach var="artList" items="${artList}">
                        <ul id="${artList.artCodeSeq }">
                            <li style="display: flex; flex-direction: row;">
	                            <input style="margin: 6%" type="checkbox" id="artListCheckBox" name="${artList.temp }" value="${artList.artCodeSeq }">&nbsp;&nbsp;
	                            <img style="width: 10%;" src="<c:url value='/upload/${artList.artPhoto }'/>" id="abc">&nbsp;&nbsp;
	                            <p style="margin: 5%" id="def">${artList.artName }</p>   
                            </li>
                        </ul>
                    </c:forEach>
                    </c:if>
                    </div>
                </div>
             <div style="margin-top: auto; margin-bottom: 2%;  width: 100%; display:flex;justify-content: center;" >
                <c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
                    <a class="page-link" style="margine: 1%" href="<c:url value='/writer/recommendWriter.wdo${pc.makeURI(pageNum)}' />">${pageNum }</a>&nbsp;
                </c:forEach>
                </div>
            </div>
               
            <!--end of 작품선택 상자-->
            
            
            
            <div style="border: 1px solid rgba(24, 7, 7, 0.13); width: 40%; height: 500px; margin-right: auto; margin: auto">
							<div style="height: 80%; overflow: auto;">
								<p style="margin: 4%;">추천작품선택</p>
								<div id="conatainerNext" style="border-top: 1px solid rgba(24, 7, 7, 0.13);padding-top: 6%;" class="${tempList.size()}">
								 <c:if test="${tempList.size() <= 0 }">
			                    <div style="width:100%; text-align: center; margin-top: 10%;">
				                      	추천작품이 존재하지 않습니다.    
			                    </div>
								</c:if>
								<c:if test="${tempList.size() > 0 }">
								<c:forEach var="tempList" items="${tempList }">
										 <ul id="${tempList.artCodeSeq }">
                            <li style="display: flex; flex-direction: row;">
	                            <input style="margin: 6%" type="checkbox" id="artListCheckBox" name="${tempList.temp }" value="${tempList.artCodeSeq }">&nbsp;&nbsp;
	                            <img style="width: 10%;" src="<c:url value='/upload/${tempList.artPhoto }'/>" id="abc">&nbsp;&nbsp;
	                            <p style="margin: 5%" id="def">${tempList.artName }</p>   
                            </li>
                        </ul>
									</c:forEach>
									</c:if>
								</div>
							</div>
							<div style="margin-top:8%;">
								<hr>
								<div style="display: flex; flex-direction: row;padding-left: 3%;">
									<h6 style="width: 60%; padding: 1%;">결제할 금액 : &nbsp;</h6>
									<h5 id="recommandPay" style="padding: 1%;"></h5>&nbsp;&nbsp;&nbsp;
									<h6 style="width: 40%;align-items: center;padding: 1%;display: flex;">원</h6>
								</div>
							</div>
						</div>
            <!--추천작품 선택-->
        </div>


    </section>
    <div style="text-align: center;">
        <input id="pay" type="button" value="추천up" style="padding: 1%; margin: 1%;color: #007bff; background-color: #fff;  border: 1px solid #dee2e6;">
    </div> 



				<%@ include file="../include/footer.jsp" %>
				<!-- end footer -->
				<!-- Scroll to Top Button-->
				<a class="scroll-to-top rounded" href="#page-top"> <i
					class="fas fa-angle-up"></i>
				</a>

		
				<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

				<!-- Core plugin JavaScript-->
				<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

				<!-- Custom scripts for all pages-->
				<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>

				
			</div>
		</div>
	</div>
</body>
</html>