<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.walab.oas.Board.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Member</title>

<!--  button css-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/buttonstyle.css?v=2">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" /> <!-- div 크기 조정 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> <!-- 카테고리 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" /> <!-- 상태 -->

<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/adminUserManage.css?ver=2">


	<!--  Form CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/noui/nouislider.min.css">
	
	<!-- checkbox CSS -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/style.css">
	
<!-- 합쳐지고 최소화된 최신 CSS --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/css/util.css">

<style>

input:not(.submit),textarea{
		width:100%;
}
.read_table{
  width:90%;
  padding:0 5%;
  border-collapse: separate;
  border-spacing: 0 10px;
}

.submit{
  margin-top:2%;
  margin-left:50%;
  background-color: #d69fa9;
  border: #d69fa9;
  border-radius:5px;
  padding:1%;
  width:5%;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/basic/header.jsp" /> 

<div id="headTitle"><h2>게시물 보기 </h2></div>

<div class="container-write">
<table class="read_table" >
	
	<tr><td>Category:</td><td>${u.getCategory()}</td></tr>
	<tr><td>제목:</td><td>${u.getTitle()}</td></tr>
	<tr><td>등록자:</td><td>${u.getWriter()}</td></tr>
	<tr><td>등록일:</td><td>${u.getRegdate()}</td></tr>
	<tr style="height:300px;"><td>내용:</td><td>${u.getContent()}</td></tr>
	<tr><c:if test="${files.fileName ne null}">
			
				<td bgcolor="orange">첨부파일</td>
				<td align="left"><a href="fileDownload.do?fileName=${files.filename}">${files.filename}</a></td>
			
		</c:if></tr>

</table>
</div>
<button class="btn btn-default pull-right" name='stateB' id="stateB" onclick="location.href='../list'">목록보기 </button>

</body>
</html>
