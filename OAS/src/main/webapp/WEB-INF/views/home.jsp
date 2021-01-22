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

</head>
<body>
	<header class="">
        <nav class="navbar navbar-expand-lg">
          <div class="container">
            <a class="navbar-brand" href="index.html"><h2> <!--Logo--> </h2></a>
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
                  <a class="nav-link" href="products.html">Our Products</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="about.html">About Us</a>
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
                      <ul>
                          <li class="active" data-filter="*">All Products</li>
                          <li data-filter=".des">Featured</li>
                          <li data-filter=".dev">Flash Deals</li>
                          <li data-filter=".gra">Last Minute</li>
                      </ul>
                      <form class="form-inline">
                          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                      </form>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="filters-content" >
                        <div class="row grid"  style="overflow:auto;">
                        
                            <div class="col-lg-4 col-md-4 all des">
                              <div class="product-item">
                                  <h4 class="form_name">설문지 제목</h4>
                                  <hr class="line">
                                <div class="down-content">
                                  <h5 class="category">카테고리</h5>
                                  <p class="discription">설문지1에 대한 설명이 여기에 들어갈겁니당!! 설문지에 대한 설명중~~</p>                      
                                  <ul class="period">
                                      <li class="start"><span>21.01.10</span></li>
                                      <li><span>~</span></li>
                                      <li class="end"><span>21.01.25</span></li>
                                    </ul>
                                </div>
                                <a href="#" class="filled-button">상 태</a>
                              </div>
                              
                              <!-- <form id="checkForm" class="checkForm" action="checkPortfolio" method="POST">
			            		<input type="hidden" id="select_portID" name="select_portID" value=""/>
			            	</form> -->
                            </div>
                            
                            <!-- <script>
								for(var i=0; i< card_list.length; i++){
									//방법 1
									var card= $("div");
									card.attr('id','col-lg-4 col-md-4 all des card_'+card_list.id);
									$('div').children('.grid').append(card);
									
									var form_name= $("h4");
									form_name.attr('class'.'form_name').html(card_list.name);
									$('div').children('.card_'+card_list.id).append(form_name);

									//방법 2
									$('div').children('.grid').append('<div class="col-lg-4 col-md-4 all des card_'+card_list.id+'"><div class="product-item">');
									
								}
								
								$(document).ready(function() {
	                     
			            	   	  	$(".select_port").click(function() {
				            	   	  	
			            	   	  	document.getElementById('select_portID').value = this.id;
			            	   	  	$("#checkForm").submit();
			            		});
			            	 });

                            </script> -->
                            
                            <div class="col-lg-4 col-md-4 all dev">
                              <div class="product-item">
                                  <h4 class="form_name">설문지 제목</h4>
                                  <hr class="line">
                                <div class="down-content">
                                  <h5 class="category">카테고리</h5>
                                  <p class="discription">설문지1에 대한 설명이 여기에 들어갈겁니당!! 설문지에 대한 설명중~~</p>                      
                                  <ul class="period">
                                      <li class="start"><span>21.01.10</span></li>
                                      <li><span>~</span></li>
                                      <li class="end"><span>21.01.25</span></li>
                                    </ul>
                                </div>
                                <a href="#" class="filled-button">상 태</a>
                              </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-4 all gra">
                              <div class="product-item">
                                  <h4 class="form_name">설문지 제목</h4>
                                  <hr class="line">
                                <div class="down-content">
                                  <h5 class="category">카테고리</h5>
                                  <p class="discription">설문지1에 대한 설명이 여기에 들어갈겁니당!! 설문지에 대한 설명중~~</p>                      
                                  <ul class="period">
                                      <li class="start"><span>21.01.10</span></li>
                                      <li><span>~</span></li>
                                      <li class="end"><span>21.01.25</span></li>
                                    </ul>
                                </div>
                                <a href="#" class="filled-button">상 태</a>
                              </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-4 all gra">
                              <div class="product-item">
                                  <h4 class="form_name">설문지 제목</h4>
                                  <hr class="line">
                                <div class="down-content">
                                  <h5 class="category">카테고리</h5>
                                  <p class="discription">설문지1에 대한 설명이 여기에 들어갈겁니당!! 설문지에 대한 설명중~~</p>                      
                                  <ul class="period">
                                      <li class="start"><span>21.01.10</span></li>
                                      <li><span>~</span></li>
                                      <li class="end"><span>21.01.25</span></li>
                                    </ul>
                                </div>
                                <a href="#" class="filled-button">상 태</a>
                              </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-4 all dev">
                              <div class="product-item">
                                  <h4 class="form_name">설문지 제목</h4>
                                  <hr class="line">
                                <div class="down-content">
                                  <h5 class="category">카테고리</h5>
                                  <p class="discription">설문지1에 대한 설명이 여기에 들어갈겁니당!! 설문지에 대한 설명중~~</p>                      
                                  <ul class="period">
                                      <li class="start"><span>21.01.10</span></li>
                                      <li><span>~</span></li>
                                      <li class="end"><span>21.01.25</span></li>
                                    </ul>
                                </div>
                                <a href="#" class="filled-button">상 태</a>
                              </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-4 all des">
                              <div class="product-item">
                                  <h4 class="form_name">설문지 제목</h4>
                                  <hr class="line">
                                <div class="down-content">
                                  <h5 class="category">카테고리</h5>
                                  <p class="discription">설문지1에 대한 설명이 여기에 들어갈겁니당!! 설문지에 대한 설명중~~</p>                      
                                  <ul class="period">
                                      <li class="start"><span>21.01.10</span></li>
                                      <li><span>~</span></li>
                                      <li class="end"><span>21.01.25</span></li>
                                    </ul>
                                </div>
                                <a href="#" class="filled-button">상 태</a>
                              </div>
                            </div>
                            
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