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
<title>전산전자공학부 공지사항 </title>

<!-- css -->
<!-- Responsive Tables -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">
<!--  button css-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/buttonstyle.css?v=2">

<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/mypage.css?ver=2">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.css?v=5.3.2">
<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/adminUserManage.css?ver=2">

<style>
	.table tbodies {width:60%;}
	.table thead {background-color: #d69fa9;}
	.alink {color: #d69fa9;}
	.titlelink {color: black;}
	#stateB {
		background-color: #d69fa9;
		border: #d69fa9;
		float:right;
	}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		//if(a) location.href='deletepost.jsp?id=' + id;
		if(a) location.href='../board/deleteok/' + id;
	}
</script>
</head>
<body>
<%-- <%
	String id = "";
	id = String.valueOf(session.getAttribute("admin"));
	System.out.println("session id=" + id);
%> --%>
	
<jsp:include page="/WEB-INF/views/basic/header.jsp" />

<main>
<div id="headTitle"><h2>전산전자공학부 공지 </h2></div>

<div class="board_section">
<button name='stateB' id="stateB" onclick="location.href='../../oas/admin/board/add'">게시글 작성 </button>

<div class="table-responsive" data-pattern="priority-columns">
<table cellspacing="0" id="tech-companies-1" class="table table-small-font table-bordered table-striped">
<thead>
<tr>
	<th>NO</th>
	<th>카테고리 </th>
	<th>제목 </th>
	<th>등록자  </th>
	<th>등록 일자 </th>
	<c:set var="admin" value="${admin}" /><c:if test="${admin ne '2'}"><th>게시글 관리 </th></c:if>
</tr>

</thead>

<tbody class="tbodies">
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getSeq()}</td>
		<td>${u.getCategory()}</td>
		<td><a href="view/${u.getSeq()}" class="titlelink">${u.getTitle()}</a></td>
		<td>${u.getWriter()}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${u.getRegdate()}"/></td>
		<c:set var="admin" value="${admin}" />
		<c:if test="${admin ne '2'}">
		<td>
			<button type='button' class='btn mb-md-0 mb-2 btn-outline iconButton' onClick = "location.href='../../oas/admin/board/editform/${u.getSeq()}'"><img class='iconImg' src='../resources/img/edit2.png'><span class='tooltiptext'>수정</span></button>
			<button type='button' class='btn mb-md-0 mb-2 btn-outline iconButton' onClick = "javascript:delete_ok('${u.getSeq()}')"><img class='iconImg' src='../resources/img/trash2.png'><span class='tooltiptext'>삭제</span></button>
 		</td>
 		</c:if>
	</tr>
</c:forEach>
</tbody>
</table>
</div> 

</div>

<div id="moreContent">  
	          <ul class="pagination">
			    <c:if test="${pageMaker.prev}">
			    <li>
			        <a href='<%=request.getContextPath()%>/board/list?page=${pageMaker.startPage-1}&filterType=${cri.filterType}&searchType=${searchOption}&keyword=${keyword}'>&laquo;</a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li>
			        <a href='<%=request.getContextPath()%>/board/list?page=${idx}&filterType=${cri.filterType}&searchType=${searchOption}&keyword=${keyword}'>${idx}</a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    <li>
			        <a href='<%=request.getContextPath()%>/board/list?page=${pageMaker.endPage+1}&filterType=${cri.filterType}&searchType=${searchOption}&keyword=${keyword}'>&raquo;</a>
			    </li>
			    </c:if>
		  </ul>
		  </div>
</main>

<footer>
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
</footer>

<script>
$(document).ready( function() {   
    // select change,
    $('.filters').on( 'change', function() {
        console.log($(this).attr("id"));
        console.log($(this).val());
		$("#searchType").val($(this).attr("id"));
		$("#keyword").val($(this).val());
		$(".form-inline").submit();
    });

});
</script>
</body>
</html>