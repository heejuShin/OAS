<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.walab.oas.Board.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Member</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/basic/header.jsp" /> 
<div class="container">
	<div class="wrap">
    	<!-- Post content-->
        <div class="main">
       	<!-- Title-->
       		<div class="header">
	        	<h1 class="mt-4">${u.getTitle()}</h1>
	       		<!-- Author-->
	            <p class="lead">
	            	by ${u.getWriter()}
	            </p>
	        </div>
            <hr />
            <!-- Date and time-->
            <div class="date">
            	<p>Posted on ${u.getRegdate()}</p>
            </div>
            <hr />
            
            <!-- Post content-->
            <div class="content">
            	<p>
            	${u.getContent()}
            	</p>
            </div>
            <hr />
                   
		</div>
		<div class="buttonDiv">
			<button class="btn btn-default pull-right" name='stateB' id="stateB" onclick="location.href='../list'">목록보기 </button>
		</div>
	</div>
</div>
<%-- <div class="container">
	<div class="row">
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
	</div>
	<button class="btn btn-default pull-right" name='stateB' id="stateB" onclick="location.href='../list'">목록보기 </button>
	
</div> --%>
</body>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/boardView.css?ver=<%=System.currentTimeMillis()%>">
</html>
