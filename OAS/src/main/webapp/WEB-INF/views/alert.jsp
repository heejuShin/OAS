<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HGU CSEE 신청 시스템</title>

  <!-- Responsive Tables -->
  
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


 
 <script type="text/javascript">
 var url = "${url}";
 var msg = "${msg}";
 alert(msg);
 location.href = url;
</script>


</head>
<body>
   
   <jsp:include page="/WEB-INF/views/basic/header.jsp" />
    
    <main>
   
   </main>
   <footer>
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
   </footer>
   
   
   
</body>
</html>