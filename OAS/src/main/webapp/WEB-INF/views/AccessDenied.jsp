<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script language = "javascript">
alert("접근할 수 없는 페이지 입니다.");
document.location.href = "<%=request.getContextPath()%>/";
</script>