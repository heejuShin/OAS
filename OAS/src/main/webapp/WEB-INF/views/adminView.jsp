<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
<link rel="stylesheet" href="${path}/resources/css/editform_style.css">
</head>

<body>



<h1>View Form</h1>

<form:form commandName="u" action="redirect:list" method="POST">
 	<form:hidden path="seq"/>
	<table id="edit">
	<tr><td class="first">Category:</td><td><form:input path="category" /></td></tr>
	<tr><td class="first">Title:</td><td><form:input path="title" /></td></tr>
	<tr><td class="first">Writer:</td><td><form:input path="writer" /></td></tr>
	<tr><td class="first">Content:</td><td><form:textarea cols="50" rows="5" path="content"></form:textarea></td></tr>
	
	<c:if test="${board.fileName ne null}">
			<tr>
				<td bgcolor="orange">첨부파일</td>
				<td align="left"><a href="fileDownload.do?fileName=${board.fileName}">${board.fileName}</a></td>
			</tr>
	</c:if>
	</table>

	
	<input type="submit" value="수정하기" />
	<input type="button" value="취소하기" onclick="history.back()"/>	
 </form:form>
</body>
</html> --%>

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

<%--  <%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");
	BoardVO read_list=boardDAO.getBoard(Integer.parseInt(id)); //에러 (java.lang.NumberFormatException: null)
	request.setAttribute("vo",read_list);
%> --%>
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
<button type='button' class='btn mb-md-0 mb-2 btn-outline iconButton' onClick = "location.href='../editform/${u.getSeq()}'"><img class='iconImg' src='../resources/img/edit2.png'><span class='tooltiptext'>수정</span></button>

<button class="btn btn-default pull-right" name='stateB' id="stateB" onclick="location.href='../list'">목록보기 </button>

</body>
</html>
