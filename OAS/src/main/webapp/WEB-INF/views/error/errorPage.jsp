<%-- 
<script>
var message=${msg};
alert(msg);
document.location.href = "/";

</script>
errorPage입니당
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script language = "javascript">
alert("한동 이메일(handong.edu)로 로그인해주세요");
document.location.href = "<%=request.getContextPath()%>/";
</script>