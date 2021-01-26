<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Additional CSS Files -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/fontawesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/owl.css">

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

</head>
<body>
	<header class="">
        <nav class="navbar navbar-expand-lg">
          <div class="container">
            <a class="navbar-brand" href="#"><h2> <!--Logo--> </h2></a>
            <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button> -->
            <!--MyPage 버튼 추가-->
            <!--Login / Logout 버튼 추가-->
            <div class="collapse navbar-collapse" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.html">Home
                    <span class="sr-only">(current)</span>
                  </a>
                </li> 
                <li class="nav-item">
                  <a href="<%=request.getContextPath()%>/admin/mypage">Our Products</a>
                </li>
                <li class="nav-item">
                  <a  href="<%=request.getContextPath()%>/mypage">About Us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="contact.html">Contact Us</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      
	<div class="main">
 
        <div class="board">
           
            <div class="board_image">
                이미지 영역
            </div>

        
            <div class="board_section">
                <div class="title">
                    <h1>SW 최신 공지</h1>
                    <h4><a href='#'>Link</a></h4>
                </div>
                <div class="tablelist">
                    <table border="1">
                        <tr> <!--tr, th에 class 입히기-->
                            <th>COLUMN 1</th>
                            <th>COLUMN 2</th>
                            <th>COLUMN 3</th>
                            <th>COLUMN 4</th>
                        </tr>
                        <tr>
                            <td>Item #1</td>
                            <td>description</td>
                            <td>description</td>
                            <td>description</td>
                        </tr>
                        <tr>
                            <td>Item #2</td>
                            <td>description</td>
                            <td>description</td>
                            <td>description</td>
                        </tr>
                        <tr>
                            <td>Item #3</td>
                            <td>description</td>
                            <td>description</td>
                            <td>description</td>
                        </tr>
                        <tr>
                            <td>Item #4</td>
                            <td>description</td>
                            <td>description</td>
                            <td>description</td>
                        </tr>
                        <tr>
                            <td>Item #5</td>
                            <td>description</td>
                            <td>description</td>
                            <td>description</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
  
        
        <div class="board2">
		
            <div class="products">
              <div class="container">
                <div class="row">
                  <div class="col-md-12">
                    <div class="filters">
                      <ul class="ul_filters">
                          <li class="active" data-filter="*">All Products</li>
                      </ul>
                      
                      <!-- <form class="form-inline">
                          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                      </form> -->
                      <!-- search{s} -->

					<div class="form-group row justify-content-center">
			
						<!-- <div class="w100" style="padding-right:10px">
			
							<select class="form-control form-control-sm" name="searchType" id="searchType">
								<option value="category">카테고리</option>
								<option value="title">제목</option>
								<option value="reg_id">작성자</option>
							</select>
						</div> -->
			
						<form class="form-inline" name="searchForm" action="<%=request.getContextPath()%>/" method="GET" >
				  			<select class="form-control form-control-sm" id="searchType" name="searchType">
				  				<option value="all" <c:out value="${searchType =='all'? 'selected':'' }"/>>등록자+제목+카테고리</option>
				  				<option value="writer" <c:out value="${searchType =='writer'? 'selected':'' }"/>>등록자</option>
				  				<option value="formName" <c:out value="${searchType =='formName'? 'selected':'' }"/>>제목</option>
				  				<option value="categoryName" <c:out value="${searchType =='categoryName'? 'selected':'' }"/>>카테고리</option>
				  			</select>
				  			<input type="text" class="form-control mr-sm-2" name="keyword" value="${keyword}" placeholder="검색" aria-label="검색">
				  			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			  			</form>
					</div>
			
					<!-- search{e} -->

                      
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="filters-content" >
                    
                        <div class="row gridss"  style="overflow:auto;">
                        	
                              
                            </div>
                            
                            <script>

                            /*  검색 버튼을 클릭했을 때 
                            $(document).on('click', '#btnSearch', function(e){

                        		e.preventDefault();
                        		var url = "${pageContext.request.contextPath}/board/search";
                        		url = url + "?searchType=" + $('#searchType').val();
                        		url = url + "&keyword=" + $('#keyword').val();
                        		location.href = url;
                        		console.log(url);

                        	});	 */

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
	
									var a=$("<a href='#' id='form_"+form_list[i].id+"' class='filled-button' onClick = 'openForm("+form_list[i].id+");'>상 태(DB)</a>");
									$($($(".gridss").children()[i]).children()[0]).append(a);
	
									var form=$("<form id='form' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value=''/></form>");
									$($($(".gridss").children()[i]).children()[0]).append(a);
									
			                	}
                            });

                            function openForm(form_id){
                            	$('#select_formID').value = form_id;
                            	$("#form").submit();
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
	</div>
	
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
                          