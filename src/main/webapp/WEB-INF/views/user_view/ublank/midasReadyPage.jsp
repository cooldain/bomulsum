<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 금손 클래스 | 준비중 </title>
<style>


.minwoo_content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px;
	padding-bottom: 64px;
	display:flex;
	flex-direction:column;
}

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}

.minwoo_class_category_head{
	width:100%;
	display:flex;
}

.minwoo_class_category_head_title{
	width:23%;
}

.minwoo_class_category_head_title a{
	font-size: 23px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}

.minwoo_class_category_head_title a:hover:not(.active) {
    color: #1f76bb;
}

.minwoo_class_category_head_title hr{
	border:0;
	height:3px;
	background:black;
}

.minwoo_class_category_head_depth{
	width:75%;
	display: flex;
	margin-left: 2%;
}

.minwoo_class_category_head_depth a{
	font-size:13px;
	display: flex;
	flex-direction:row;
	justify-content:center;
	align-items:center;
    color: #666666;
    text-decoration: none;
    padding:5px;
    font-weight: bold;
}

.minwoo_class_category_head_depth a:hover:not(.active) {
    color: #1f76bb;
}


.minwoo_class_category_body{
	width:100%;
	display:flex;
}

.minwoo_class_category_side{
	width:23%;
}

.minwoo_class_category_side ul{
	 list-style-type: none;
	 padding-left:5px;
}

.minwoo_class_category_side ul li{
	display: block;
    text-decoration: none;
}
.minwoo_class_category_side ul li a{
 	display: block;
    color: #666666;
    text-decoration: none;
    margin-top:10px;
    padding-top:10px;
    font-size:14px;
    font-weight: bold;
}
.minwoo_class_category_side ul li a:hover:not(.active) {
    color: #1f76bb;
}

.minwoo_class_category_side ul li a i{
	float:right;
	padding-top:2%;
	padding-right:1%;
}


.minwoo_class_space {
	width:75%;
	display: flex;
	flex-wrap: wrap;
	margin-left: 2%;
}

.minwoo_class_space_one{
	width:250px;
	height:370px;
	margin-top:10px;
	padding-left:10px;
}

.minwoo_class_space_one a{
    color: #666666;
    text-decoration: none;
}

.minwoo_class_space_one_photo{
	height:65%;
	position: relative;
}

.minwoo_class_space_one_photo a{
    color: #666666;
    text-decoration: none;
}

.minwoo_class_space_one_photo a:hover:not(.active) {
    color: #666666;
}

.minwoo_class_space_one_text{
	height:35%;
	display:flex;
	flex-direction:column;
	padding:2%;
}

.minwoo_class_space_one_text a span{
	padding:5%;
    color: #666666;
    text-decoration: none;
    font-size:14px;
}

.minwoo_class_category_side ul li a:hover:not(.active) {
    color: #1f76bb;
}

.minwoo_class_space_one_location{
	position:absolute;
	left:0; 
	margin-top:5%;
	margin-left:5%;
	padding:2%; 
	font-size:13px;
	background-color:#6E6E6E;
	color:#FFFFFF;
	border-radius:5px;
}
.minwoo_uMhome_content_card{
	width:250px;
	height:352px;
	border:0.5px solid #D8D8D8;
	border-radius:5px 5px 5px 5px;
	margin:6px;
}
.minwoo_uMhome_content_card_locagion{
	background-color:#6E6E6E;
 	border-radius: 3px 3px 3px 3px;
 	font-weight:bold;
 	color: #f2f2f2;
  	font-size: 12px;
 	padding: 7px 10px;
	position: absolute;
	z-index: 99;
	margin:1%;
}
.minwoo_uMhome_content_card_star{
	margin:1%;
	padding-left:190px;
	position:absolute;
	z-index:80;
}

.minwoo_uMhome_content_card_star i{
	font-size:30px;
	align-self:flex-end;
	margin:2%;
	color: gray;
	-webkit-text-stroke-width: 2px;
	-webkit-text-stroke-color: white;
}
.minwoo_uMhome_content_card_img_link{
	position:relative;
	z-index: -1;
	margin:0;
	padding:0;

}
.minwoo_uMhome_content_info{
	padding:8px 10px;
}

.minwoo_uMhome_content_info span{
	color: #dd5850;
	font-size:12px;
}
.minwoo_uMhome_card_rating{
	padding:8px 10px;
}
</style>
</head>
<body>
<div>
	<%@ include file="../include/uHeaderClass.jsp"  %>

	<!-- content 시작 -->
	<div class="minwoo_content">
		
		
		<div style="align-self: center;">
			<img src="<c:url value='/resources/img/page_ready.png'/>" style="width:600px; height:600px;">
		</div>
		
	
	</div>
	<!-- end for content -->
	
	<%@ include file="../include/uFooter.jsp" %>
</div>


	<script>
	var memberCode = '<%= (String)session.getAttribute("member") %>';

	</script>


</body>
</html>