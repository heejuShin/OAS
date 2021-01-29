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

<!-- table css -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  


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
	
	/*  Header end*/
	
	/* 전체   */
      html, body{height:120%;}
      
      main {
      	margin: 2% 15%;
      	height:100%;
      }
      
      /* board1 */
      
      .board1 {
      	height: 30%;
      	padding: 0 2%;
      }
      
      .board_image{
      display:block;
      	width: 25%;
      	height: 100%;
      }
      
      .board_image, .board_section{
      	float:left;
      }
      
      .board2{
      	clear:both;
      }
      
      .board_section{
      	display: block;  
      	width: 73%; 
      	
      	margin-left:2%;
      	
      }

      .title h1{
      	font-size: 350%;
      	font-family: inherit;
      	font-style: normal;
      	font-weight:700;
      }
      
       .swLink{
      	font-size: 50%;
      	text-decoration: underline;
    	text-underline-position: under;
      } 
      
      .board_image img{
      	  width: 100%;
		  height: 100%;
		  object-fit: cover;
      }
      
      .title img {
		  width: 8%;
		  height: 8%;
		  object-fit: contain;
		  margin-right:1.5%;
		  margin-top: -1%;
		}
		      
      
      /* 공지 테이블  */
      .tablelist{
      	margin-top: 4%;
      	width: 100%;
      }
      
      .tablelist th{
      	text-align: center;
      }
      
      #headTable {
      	background-color: rgb(223, 223, 223);
      }
      
       /* board2 */
      /* templatemo-sixteen.css 612 수정필요  */
      .board2{
      	width: 100%;
      	height:70%;
      	margin-top: 2%;
      	border: 1px solid grey;
      	border-radius: 20px;
      }
      .products, .container, .row, #contestsDiv, .filters-content, .row gridss{
      	height:100%;
      	width:100%;
      }
      
      .products{
      	width: 100%;
      	margin: 0;
      	padding: 0;
      }
      
      .products div{
      	padding: 0;
      }
      
      .products{
      	width:100%;
     }
      .row{
      	margin: 0;
      }
      
      .col-md-12 {
      padding: 0;
      width:100%;
      }
      
      /* 검색 필터  */
      
       .products .filters{
       	width:100%;
      	padding-bottom: 2%;
      	margin-bottom: 1%;
      	
      }
  
      
      .ul_filters{
     	padding: 2% 0;
     	width:100%;
      }
      
      .form_inline{
      	width:100%;
      }
      
     
      
      #searchB{
      	border: 1px solid #28a745;
      }
      
      /* card  */
      
      .col-lg-4{
     		margin: 0 1%;
     		width:330px;
     		height:350px;
      }
      
      .down-content{
      	padding: 4%;
      	height:200px;
      	
      }
      
      .gridss{
      	width:100%;
      }
      
      .filled-button{
      	margin-left:110px;
      	margin-bottom:30px;
      }
      
      .product-item{
      	margin-bottom: 10px;
      }
      
      .product-item h4{
      	text-align: center;
      }
      
      hr{
      margin: 0;
      }
      
      
      
      
      
      
      
      
      
      
      
      /* 지울 내용 */
      
     /*  .board_image{
        border: 1px solid black;
      } 
       */
      /* 
      .col-lg-4{
     		border: 2px solid red;
      }
      
        	.col-lg-4 div{
        border: 1px solid black;
      } 
      	.board2 div{
        border: 2px solid black;
      } 
      
      main {
      	border: 3px solid blue;
      }
      
      .board1 {
      	border: 3px solid red;
      }
      .board2 {
      	border: 3px solid green;
      } 

      
      
       .filters {
      	border: 3px solid red;
      } */

      
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
          <a class="navbar-brand siteName" href="index.html"><h2>HGU CSEE <em>신청 시스템</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto navbar_right">
              <li class="nav-item active">
                <a class="nav-link" href="index.html">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/admin/mypage">My Page</a>
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
    
    <main>
    
    
    <!-- Banner Ends Here -->
    
     <!-- Banner Starts Here -->
    <div class="banner header-text board1">
 
		<div class="board_image">
                <img src="<%=request.getContextPath()%>/resources/img/home_4.jpg" alt="img section">
         </div>

        <div class="board_section">
	        <div class="title">
	        	<h1><span><img src="<%=request.getContextPath()%>/resources/img/home_1.png" alt="img section"></span>SW 최신 공지 <span class="swLink"><a href='#'>Link</a></span></h1>
	        </div>

                <div class="tablelist">
	                <table class="table table-hover">  
						  <tr id="headTable"><th>Id</th><th>title</th></tr>  
						  <tr><td>101</td><td>2021-1학기 맥북 신청 일정 </td></tr>  
						  <tr><td>102</td><td>2021 하계 SW 캠프 일정 공지 </td></tr>  
						  <tr><td>103</td><td>2021 1학기 마일리지 신청 </td></tr>  
						  <tr><td>104</td><td>2021 여름방학 소프트웨어 봉사단 모집 </td></tr>
						  <tr><td>105</td><td>2021 2학기 공학 프로젝트 기획 신청  </td></tr>    
					</table>  
                </div>
      </div>
        
    </div>
    <!-- Banner Ends Here -->
      
	
 
        <div class="board2">
		
            <div class="products">
              <div class="container">
                <div class="row">
                  <div class="col-md-12">
                    <div class="filters">
                      <ul class="ul_filters">
                          <li class="active" data-filter="*">All Products</li>
                      </ul>
                      <form class="form-inline">
                          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                          <button id="searchB" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                      </form>
                    </div>
                  </div>
                  <div id="contestsDiv" class="col-md-12">
                    <div class="filters-content" >
                    
                        <div class="row gridss"  style="overflow:auto;">
                        </div>
                            
                            <script>

                            $(document).ready(function () {

	                            var form_list=${form_list};
	                            var category_list=${category_list};
	                            for(var i=0; i<category_list.length;i++){
	                            	var filter_li = $("<li data-filter='.category_"+category_list[i].id+"'>"+category_list[i].categoryName+"</li>");
	                            	$(".ul_filters").append(filter_li);
		                        }
	                            
	                            for(var i=0; i < form_list.length; i++){
	                                
	                    		    /*설문지 별 div 만듦 (div1)*/
	                    		    var divOne = $("<div class='col-lg-4 col-md-4 grid-item category_"+ form_list[i].category_id+"'></div>"); 
	                    		   	$(".gridss").append(divOne);
	
	                    		   	/* div1의 안에 들어갈 div => "product-item" */
	                    		    var divTwo = $("<div></div>"); 
	                    		    divTwo.addClass("product-item");
	                    		    $($(".gridss").children()[i]).append(divTwo);
	
	                    		    
	                    		    var formName =  $("<h4 class='form_name'>"+form_list[i].formName +"</h4><hr class='line'>"); 
	                    		    $($($(".gridss").children()[i]).children()[0]).append(formName);
	
	                    		    
									var formContent= $("<div class='down-content'></div>");
									$($($(".gridss").children()[i]).children()[0]).append(formContent);
	
									var category =  $("<h5 class='category'>"+form_list[i].categoryName +"</h5><p class='discription'>"+form_list[i].explanation+"</p>"); 
	                    		    $($($($(".gridss").children()[i]).children()[0]).children()[2]).append(category);
									
		                    		var ul = $("<ul class='period'></ul>");
		                    		$($($($(".gridss").children()[i]).children()[0]).children()[2]).append(ul);
	
		                    		var li=$("<li class='start'><span>"+form_list[i].startDate+"</span></li> <li><span>~</span></li> <li class='end'><span>"+form_list[i].endDate+"</span></li>");
									$($($($($(".gridss").children()[i]).children()[0]).children()[2]).children()[2]).append(li);
	
									var a=$("<a id='form_"+form_list[i].id+"' class='filled-button' onClick = 'openForm("+form_list[i].id+");'>상 태(DB)</a>");
									$($($(".gridss").children()[i]).children()[0]).append(a);
	
									var form=$("<form id='myform_"+form_list[i].id+"' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='1'/></form>");
									$($($(".gridss").children()[i]).children()[0]).append(form);
									
			                	}
                            });

                            function openForm(form_id){
                                
                            	$("#myform_"+ form_id).children("input").val(form_id);

                            		/* var buf = 	$("#myform_"+ form_id).children("input").val();
                                console.log("form id : "+form_id+ " / form create : " + buf); */
                                
	                            //	$('#select_formID').value = form_id;
	                            	//$("#myform").attr("action", "form");
	                            	$("#myform_"+form_id).submit();
                            }


                            $(document).ready( function() {   

                            	var $grid = $('.gridss').isotope({
                            	  itemSelector: '.grid-item',
                            	  percentPosition: true,
                                  masonry: {
                                    columnWidth: ".grid-item"
                                  }
                            	});

                            	// filter items on button click
                            	$('.ul_filters').on( 'click', 'li', function() {
                            	  var filterValue = $(this).attr('data-filter');
                            	  $grid.isotope({ filter: filterValue });
                            	  $('.ul_filters li').removeClass('active');
                            	  $(this).addClass('active');
                            	});

                          
                            });
                            </script>
                            
                            

                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
		</div>
		
		
		
	</main>
	
	
	
	
	
	   <footer>
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="inner-content">
             	<p>Copyright &copy; 2020 Sixteen Clothing Co., Ltd.
              
              - Design: <a rel="nofollow noopener" href="https://templatemo.com" target="_blank">TemplateMo</a></p> 
              </div>
            </div>
          </div>
        </div>
      </footer>
</body>
</html>