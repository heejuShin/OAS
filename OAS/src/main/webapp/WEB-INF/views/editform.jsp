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


<h1>Edit Form</h1>
<form:form commandName="u" action="../editok" method="POST">
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