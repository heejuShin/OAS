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
<!--  button css-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/buttonstyle.css?v=2">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" /> <!-- div 크기 조정 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> <!-- 카테고리 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" /> <!-- 상태 -->

<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/adminUserManage.css?ver=2">


	<!--  Form CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/noui/nouislider.min.css">
	
	<!-- checkbox CSS -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/style.css">
	
<!-- 합쳐지고 최소화된 최신 CSS --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/css/util.css">


<style>

input:not(.submit,.back),textarea{
		width:100%;
}
.update_table{
  width:90%;
  padding:0 5%;
  border-collapse: separate;
  border-spacing: 0 10px;
}

textarea{
  resize:none;
  height:300px;
  overflow:scroll;
}

*:focus {
    outline: 0;
}

.buttonBox{
  margin-top:2%;
  margin-left:45%;
}
.submit{
  background-color: #d69fa9;
  border: #d69fa9;
  border-radius:5px;
  padding:1%;
  width:10%;
  display:inline-block;
}
.back{
  background-color: #EAEAEA;
  border: #EAEAEA;
  border-radius:5px;
  padding:1%;
  width:10%;
  display:inline-block;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/basic/header.jsp" /> 

<main>


<div id="headTitle"><h2>게시물 수정 </h2></div>
<form:form commandName="u" action="../../../board/editok" method="POST">
	<form:hidden path="seq"/>
	<table id="edit" class="update_table">
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

	<div class="buttonBox">
		<input type="submit" class="submit" value="수정하기" />
		<input type="button" class="back" value="취소하기" onclick="history.back()"/>	
	</div>
</form:form>
</main>

<footer>
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
</footer>

</body>
</html>