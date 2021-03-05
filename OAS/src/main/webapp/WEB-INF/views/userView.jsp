<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.walab.oas.Board.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Member</title>
<link rel="stylesheet" href="member.css">

<style>
	#list {text-align:center;}
</style>
</head>
<body>

<%
	/* String id=request.getParameter("read_list");
	System.out.println("view의 id는 "+id); */
	
	/* BoardVO read_list = BoardDAO.getBoard(Integer.parseInt(id));
	request.setAttribute("read_list", read_list); */
%>

<h1 id='title'>View</h1>

<table id="list" width="90%">
	<tr>
	<th>Id</th>
	<th>Category</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Content</th>
	<th>Regdate</th>
	<th>File</th>
</tr>
	<tr>
		<td>${u.getSeq()}</td>
		<td>${u.getCategory()}</td>
		<td>${u.getTitle()}</td>
		<td>${u.getWriter()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getRegdate()}</td>
		
		<c:if test="${files.fileName ne null}">
			
				<td bgcolor="orange">첨부파일</td>
				<td align="left"><a href="fileDownload.do?fileName=${files.filename}">${files.filename}</a></td>
			
		</c:if>
	</tr>
	

</table>

<button class="btn btn-default pull-right" name='stateB' id="stateB" onclick="location.href='../list'">목록보기 </button>

</body>
</html>
