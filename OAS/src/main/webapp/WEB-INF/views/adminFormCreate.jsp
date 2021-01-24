<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="formCreate" method="post" modelAttribute = "form">
		<label for ="formName">NAME: </label>
		<input type="text" id="formName" name="formName">
		
		<br><br>
		
		<label for ="test">TEST: </label>
		<input type="text" id="test" name="test">
		
		<br><br>
		
		<label for="plusPoint">POINT: </label>
		<input type="text" id="plusPoint" name="plusPoint">
		
		<br><br>
		
		<label for="startDate">Start Date: </label>
		<input type="date" id="startDate" name="startDate">
		
		<br><br>
		<input type="submit" value="Submit">
	</form>
</body>
</html>