<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- jsp directives 사용됨. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전산전자공학부 공지   </title>
<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/adminUserManage.css?ver=2">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="/WEB-INF/views/basic/header.jsp" /> 
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/uploadAjax.js"></script>

<!-- html 에디터 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<main>

<div id="headTitle"><h2>게시물 작성 </h2></div>

<div class="container-contact100">
<form action="addok" method="post"  enctype="multipart/form-data">
	<div class="formField">
		<table>
			<tr><td>Category:</td><td><input type="text" name="category"/></td></tr>
			<tr> <td>Title:</td> <td><input type="text" name="title"/></td></tr>
			<tr><td>Writer:</td><td>${name}<input type="hidden" name="writer" value="${name}"/></td></tr>
		</table>
		
		<hr/>
		
		<div id="textField"> <textarea id="summernote" class="form-control" name="content"></textarea> <!-- <p>Content:</p><textarea cols="50" rows="5" name="content"></textarea> --></div>
		<script>
		  $('#summernote').summernote({
	        tabsize: 3,
	        height: 300
	      });
	    </script>
	    <div class="file">
			<div class="fileInput"><p>파일 업로드: </p>
				<div class="uploadDiv">
					<input type="file" name="uploadFile" multiple>
				</div>
				<!-- <button id="uploadBtn">Upload</button> -->
			</div>
			<input type="hidden" name="csrfToken" value="${sessionScope.CSRF_TOKEN}" />
			<div class="uploadResult">
				<ul></ul>
			</div>
			
			<div class='bigPictureWrapper'>
				<div class='bigPicture'></div>
			</div>
		</div>
	</div>
	<div class="buttonDiv">
		<button id="but" class="button" type="submit">Add Post</button>
		<span id="but" class="button" onclick="location.href='<%=request.getContextPath()%>/board/list'">목록보기 </span>
	</div>

</form>
</div>
</main>

<footer>
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
</footer>

</body>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/addPost.css?ver=<%=System.currentTimeMillis()%>">
</html>