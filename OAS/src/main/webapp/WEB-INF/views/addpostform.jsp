<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- jsp directives 사용됨. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성  </title>

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

input:not(.submit),textarea{
		width:100%;
}
.write_table{
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

.submit{
  margin-top:2%;
  margin-left:50%;
  background-color: #d69fa9;
  border: #d69fa9;
  border-radius:5px;
  padding:1%;
  width:5%;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/basic/header.jsp" /> 

<main>

<div id="headTitle"><h2>게시물 작성 </h2></div>

<div class="container-write">
<form action="addok" method="post" enctype="multipart/form-data">
<table class="write_table">
<tr><td>Category:</td><td><input type="text" name="category" placeholder="카테고리를 입력해 주세요"/></td></tr>
<tr><td>Title:</td><td><input type="text" name="title" placeholder="제목을 입력해 주세요"/></td></tr>
<tr><td>Writer:</td><td><input type="text" name="writer"placeholder="등록자 이름을 입력해 주세요"/></td></tr>
<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>
<tr>
	<td>파일 업로드: </td><td align="left">
	<input type="file" name="files"/></td>
</tr>
</table>
<input class="submit" type="submit" value="등록"/>
</form>
</div>

<button class="btn btn-default pull-right" name='stateB' id="stateB" onclick="location.href='../../board/list'">목록보기 </button>

</main>

<footer>
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
</footer>
</body>
</html>