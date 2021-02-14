<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- jsp directives 사용됨. -->
<%@ page import="com.walab.oas.Board.BoardDAO,com.walab.oas.Board.BoardVO,java.util.*"%> <!-- jsp directives 사용됨. -->


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- jsp directives, tag library 사용됨. -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #d1454a;
  color: white;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		//if(a) location.href='deletepost.jsp?id=' + id;
		if(a) location.href='deleteok/' + id;
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/basic/header.jsp" />
<!-- <h1>자유게시판</h1> -->
<table id="list" width="90%">
<tr>
	<th>Id</th>
	<th>Category</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Content</th>
	<th>Regdate</th>
	<th>View</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getSeq()}</td>
		<td>${u.getCategory()}</td>
		<td>${u.getTitle()}</td>
		<td>${u.getWriter()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getRegdate()}</td>
		<td><a href="view/${u.getSeq()}">View</a></td> <!-- here -->
		<td><a href="editform/${u.getSeq()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
	</tr>
</c:forEach>
</table>

<br/><a href="add">Add New Post</a>
<footer>
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
</footer>
</body>
</html>