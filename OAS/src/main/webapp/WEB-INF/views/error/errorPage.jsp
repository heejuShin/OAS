<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
	<p>400 : 잘못 된 요청입니다.</p>    
	</c:if>	
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 403}">
	<p>403 :</p>    
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
	<p>404 : 요청하신 페이지를 찾을 수 없습니다.</p>    
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
	<p>405 : 요청된 메소드가 허용되지 않습니다.</p>    
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
	<p>500 : 서버에 오류가 발생하여 요청을 수행할 수 없습니다.</p>
	</c:if>
	
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
	<p>503 : 서비스를 사용할 수 없습니다.</p>
	</c:if>
</body>