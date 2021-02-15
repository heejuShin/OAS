<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	
	<%-- <c:if test="${board.fileName ne null}">
			<tr>
				<td bgcolor="orange">첨부파일</td>
				<td align="left"><a href="fileDownload.do?fileName=${board.fileName}">${board.fileName}</a></td>
			</tr>
	</c:if> --%>
	</table>

	
	<input type="submit" value="수정하기" />
	<input type="button" value="취소하기" onclick="history.back()"/>	
 </form:form>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.walab.oas.Board.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Member</title>
<link rel="stylesheet" href="member.css">
</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");
	BoardVO u=boardDAO.getBoard(Integer.parseInt(id)); //에러 (java.lang.NumberFormatException: null)
	request.setAttribute("vo",u);
%>
<table id="list" width="90%">
<tr>
	<th>Id</th>
	<th>Category</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Content</th>
	<th>Regdate</th>
	<th>Edit</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getSeq()}</td>
		<td>${u.getCategory()}</td>
		<td>${u.getTitle()}</td>
		<td>${u.getWriter()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getRegdate()}</td>
		<td><a href="editform/${u.getSeq()}">Edit</a></td>
	</tr>
</c:forEach>
</table>

<h1 id='title'>View</h1>
<br>
<table>
<tr><td class='addform'>ID:</td><td class='info'><%= u.getSeq()%></td></tr>
<tr><td class='addform'>Category:</td><td class='info'><%= u.getCategory()%></td></tr>
<tr><td class='addform'>Title:</td><td class='info'><%= u.getTitle()%></td></tr>
<tr><td class='addform'>Writer:</td><td class='info'><%= u.getWriter()%></td></tr>
<tr><td class='addform'>Content:</td><td class='info'><%= u.getContent()%></td></tr>
<tr><td class='addform'>photo:</td><td ><c:if test="${vo.getPhoto() ne ''}" ><br />
<img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class = "photo"></c:if></td></tr>
</table>
<a href="editform.jsp?id=${vo.getSeq()}" class='buttonform'>Edit</a>
</body>
</html> --%>
