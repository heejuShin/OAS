<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<!-- Font Awesome -->
  <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">

  <!-- Latest compiled and minified Bootstrap CSS -->
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
  
  <!-- Responsive Tables -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/fontawesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/owl.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/adding.css">

</head>
<body>

		<div class="contact-form">
              <form id="regist" action="regist" method="post">
                <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                      <input name="userName" type="text" class="form-control" id="userName" placeholder="이름" value="${user.userName}" readonly />
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                      <input name="email" type="text" class="form-control" id="email" placeholder="이메일" value="${user.email}" readonly />
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                      <input name="studentId" type="text" class="form-control" id="studentId" placeholder="학번" required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                      <input name="department" type="text" class="form-control" id="department" placeholder="학부" required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                    <fieldset>
                      <input name="major" type="text" class="form-control" id="major" placeholder="전공(1전공)" required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-12">
                    <fieldset>
                      <input name="grade" type="text" class="form-control" id="grade" placeholder="학년" required="">
                    </fieldset>
                    <fieldset>
                      <input name="semester" type="text" class="form-control" id="semester" placeholder="학기	" required="">
                    </fieldset>
                  </div>
                  <div class="col-lg-12">
                    <fieldset>
                      <button type="submit" id="form-submit" class="filled-button">확인</button>
                    </fieldset>
                  </div>
                </div>
              </form>
            </div>

</body>
</html>