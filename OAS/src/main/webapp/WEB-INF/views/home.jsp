<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- Responsive Tables -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">
  
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


 <style>
	
	/* 전체   */
      html, body{height:100%;}
      
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
      .title {
      	margin-left:35%;
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
      td{
      text-align: center;}
      
      
       /* board2 */
       
      /* templatemo-sixteen.css 612 수정필요  */
      .board2{
      	width: 100%;
      	height:100%;
      	margin-top: 2%;
      	border: 1px solid grey;
      	border-radius: 20px;
      }
      .products, .container, .row, #contestsDiv, .filters-content, .row gridss{
      	height:90%;
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
     		width:250px;
     		height:300px;
      }
      
      .down-content{
      	padding: 4%;
      	height:200px;
      	
      }
      
      .gridss{
      	width:100%;
      	height:100%;
      }
      
      .row{
      	margin-left:0px;
      	margin-right:0px;
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

                            $(document).ready(function () {
                                /* CSS */
                                	$('.gridss').css("height","100px");

	                            var form_list=${form_list};
	                            var category_list=${category_list};
	                            for(var i=0; i<category_list.length;i++){
	                            	var filter_li = $("<li data-filter='.category_"+category_list[i].id+"'>"+category_list[i].categoryName+"</li>");
	                            	$(".ul_filters").append(filter_li);
		                        }
	                            
	                            for(var i=0; i < form_list.length; i++){
	                                
	                    		    /*설문지 별 div 만듦 (div1)*/
	                    		    var divOne = $("<div class='col-lg-4 col-md-4 grid-item category_"+ form_list[i].category_id+"' style='top :0px; lefot:0px;'></div>"); 
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


</head>
<body>
	
	<jsp:include page="/WEB-INF/views/basic/header.jsp" />
    
    <main>
    
    <div class="board1">
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
	
 
        <div class="board2">
		
            <div class="products" style="margin-top:0px">
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
                    
                        <div class="gridss"  style="overflow:scroll; height:100px"><!--  class : row 삭제 -->
                        </div>
                            
                            
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

	</main>
	
	<jsp:include page="/WEB-INF/views/basic/footer.jsp" />
	
	
</body>
</html>