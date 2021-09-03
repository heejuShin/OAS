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
<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/adminUserManage.css?ver=2">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>	
  		@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
 	 	* {font-family: 'NanumSquare', sans-serif !important;}   
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/basic/header.jsp" /> 

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/uploadAjax.js"></script>

<!-- html 에디터 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<main>


<div id="headTitle"><h2>게시물 수정 </h2></div>
<form:form commandName="u" action="../../../board/editok" method="POST">
	<form:hidden path="seq"/>
	<div class="formField">
		<table id="edit" class="update_table">
			<tr><td class="first">Category:</td><td><form:input path="category" /></td></tr>
			<tr><td class="first">Title:</td><td><form:input path="title" /></td></tr>
			<tr><td class="first">Writer:</td><td><form:input path="writer" /></td></tr>
			
			
		<%-- <c:if test="${board.fileName ne null}">
				<tr>
					<td bgcolor="orange">첨부파일</td>
					<td align="left"><a href="fileDownload.do?fileName=${board.fileName}">${board.fileName}</a></td>
				</tr>
		</c:if> --%>
		</table>
		<hr/>
		<div><form:textarea id="summernote" class="form-control" name="content" cols="50" rows="5" path="content"></form:textarea></div>
		<script>
		  $('#summernote').summernote({
	        tabsize: 3,
	        height: 300
	      });
	    </script>
	</div>
	<input type="hidden" name="csrfToken" value="${sessionScope.CSRF_TOKEN}" />
	<div class="buttonDiv">
		<input type="submit" id="but" class="submit" value="수정하기" />
		<input type="button" id="but"  class="back" value="취소하기" onclick="history.back()"/>	
	</div>
</form:form>
</main>

<footer>
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
</footer>

</body>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/addPost.css?ver=<%=System.currentTimeMillis()%>">
</html>