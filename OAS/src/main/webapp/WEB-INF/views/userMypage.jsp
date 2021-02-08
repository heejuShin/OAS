<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Sixteen Clothing HTML Template</title>
    
    <!-- Responsive Tables -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">
   

    <!-- Latest compiled and minified Bootstrap JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/rwd-table.js?v=5.3.1"></script>
	 
    
   <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <script type="text/javascript">
      $(function() {
    		$('ul.tab li').click(function() {
    			var activeTab = $(this).attr('data-tab');
    			$('ul.tab li').removeClass('current');
    			$('.tabcontent').removeClass('current');
    			$(this).addClass('current');
    			$('#' + activeTab).addClass('current');
    		})
      });
      
    </script>
    
    <style type="text/css">
    html, body{height:100%;}
        	
    	.page-header{
    		display:block;
    		overflow: auto;
    		}
    		
    	.page-header div{
    		display:block;
    		float:left;
    	}
    	#profileImg{
    	width:70px;
    	height:70px;
    	
    	}
    	.filter_search{
    		clear:both;
    	
    	}
    	#welcomeMsg h1{
    		width:max-content;
    		margin:5% 0% 5% 5%;
    	}
    	
    	#settingsIcon{
    	width:35px;
    	height:35px;
    	}
    	
    	/* tab */
    	main{
			margin-top:20%px;
			width:100%;
			margin:0 auto;
			
			/*text-align:center;*/
		}
		.tab {
			list-style: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		/* Float the list items side by side */
		.tab li {
			float: left;
		}
		/* Style the links inside the list items */
		.tab li a{
			display: inline-block;
			color: black;
			text-align: center;
			text-decoration: none;
			padding: 18px 45px;
			font-size: 17px;
			transition:0.3s;
		}
		
		
		/* Style the tab content */
		.tabcontent {
			display: none;
            width: 100%;
			padding: 6px 12px;
		}
		ul.tab li.current{
			border-radius: 6px 6px 0px 0px;
			background-color: white;
			color: #222;
		}
		.tabcontent.current {
			display: block;
		}
    </style>
  </head>

  <body>

    <jsp:include page="/WEB-INF/views/basic/header.jsp" />
    
    <main>
	    <div id="wrap" class="banner header-text">
	    	<!-- 탭 부분 -->
		    <ul class="tab">
					<li class="current" data-tab="tab1"><a href="#">신청한 폼</a></li>
					<li data-tab="tab2"><a href="#">신청하기</a></li>
					<li data-tab="tab3"><a href="#">신청마감</a></li>
			</ul>
			
			<div style='height:100px;'></div>
			
			<!-- tab1. 신청중인 폼 중 신청한것 -->
			<div id="tab1" class="tabcontent current">
				<jsp:include page="/WEB-INF/views/userMypageTab1.jsp" />
			</div>
			
			<!-- tab2. 신청중인 폼 중 신청 안 한것 -->
			<div id="tab2" class="tabcontent">
				<jsp:include page="/WEB-INF/views/userMypageTab2.jsp" />
			</div>
			
			<!-- tab3. 신청마감 중 신청한것 -->
			<div id="tab3" class="tabcontent">
				<jsp:include page="/WEB-INF/views/userMypageTab3.jsp" />
			</div>
		</div>
	</main>

  <jsp:include page="/WEB-INF/views/basic/footer.jsp" />

     
  <jsp:include page="/WEB-INF/views/userInfo.jsp" />

  </body>

</html>
