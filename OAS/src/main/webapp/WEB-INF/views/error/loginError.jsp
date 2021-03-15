<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script language = "javascript">

	alert("로그인을 해주세요!");
	document.location.href = "<%=request.getContextPath()%>/login/redirectUrl";

</script>