<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<!-- css -->

<!-- Font Awesome -->
  <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
  

  <!-- Latest compiled and minified Bootstrap CSS -->
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
  
    <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Additional CSS Files -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/fontawesome.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/templatemo-sixteen.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/owl.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/adding.css">
	
	<!-- js -->
	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Additional Scripts -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/owl.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/slick.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/isotope.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/accordions.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/isotope.pkgd.min.js"></script>
	
	<style>
 
 	/*  Header start*/
 	
	/* templatemo-sixteen.css 313 수정필요  */
	.banner{ padding-top:0px;} 
    /* templatemo-sixteen.css 219 수정필요 */
	header .navbar {padding: 10px 0px;}
	
	 .siteName h2 {
		margin-top: 0px;
	} 
	
	.navbar_right {
		float:right;
	}
	</style>

<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-19870163-1']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
    </script>
    
</head>
<body>
	<header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand siteName" href="<%=request.getContextPath()%>"><h2>HGU CSEE <em>신청 시스템</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto navbar_right">
              <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/admin/mypage">Admin My Page</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/mypage">User myPage</a>
              </li>
              <!--<li class="nav-item">
                <a class="nav-link" href="contact.html">Contact Us</a>
              </li> -->
            </ul>
          </div>
        </div>
      </nav>
    </header>
    
    <!-- Banner Starts Here (Div 겹침 방지) -->
    <div style="height: 80px;"></div>
    
    <div class=" header-text " style="height: 100px; display:none">
     </div>


</body>
</html>