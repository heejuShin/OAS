<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 </title>
</head>
<body>
<% 
	String filename = "";
	int sizeLimit = 15*1024*1024;
	String realPath= request.getServletContext().getRealPath("upload");
	System.out.println(realPath);
	File dir = new File(realPath);
	if(!dir.exists())
		dir.mkdir();
	
	MultipartRequest multipartRequest = new MultipartRequest(request,realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	filename = multipartRequest.getFilesystemName("photo");
%>
파일명: <%= filename %><br />
<img src='${pageContext.request.contextPath}/upload/<%=filename%> '>
</body>
</html>