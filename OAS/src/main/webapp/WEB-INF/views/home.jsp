<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.walab.oas.Board.BoardDAO,com.walab.oas.Board.BoardVO,java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- jsp directives, tag library 사용됨. -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HGU CSEE 신청 시스템</title>

  <!-- Responsive Tables -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">
  
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


 <style>
   
   /* 전체   */
      html, body{height:auto}
      
      main {
         margin: 2% 15%;
         height:100%;
      }
      
      /* board1 */
      
      .board1 {
         height: 300px;
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
         height:auto;
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
      
      /*--------------------*/
      
      .discription{
      	overflow: hidden;
      	background-color:#f7f7f7;
      }
      
      .down-content p{
     
      height:120px;
      border: #f7f7f7 1px solid;
      border-radius:10px;
      padding: 2px 4px;
      color: black;
    font-family: NanumGothic;
    font-weight: 600;
      
      }
      
      .formLink{
      	display:bolck;
      	text-align:center;
      	margin-bottom:10px;
      }
      
      .formDate{
      	margin-bottom:2%;
      }
      
      .product-item .down-content h4{
      margin-top: 40px;
	text-align:center;
      }
      
      .a.filled-button{
      font-weight: 600;
      padding: 10px;
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

                            $(document).ready(function () {
                                /* CSS */

                           //      	$('.gridss').css("height","100px");

	                        //     var form_list=${form_list};
	                        //     var category_list=${category_list};
	                        //     for(var i=0; i<category_list.length;i++){
	                        //     	var filter_li = $("<li data-filter='.category_"+category_list[i].id+"'>"+category_list[i].categoryName+"</li>");
	                        //     	$(".ul_filters").append(filter_li);
		                     //    }
	                            
	                        //     for(var i=0; i < form_list.length; i++){
	                                
	                    		//     /*설문지 별 div 만듦 (div1)*/
	                    		//     var divOne = $("<div class='col-lg-4 col-md-4 grid-item category_"+ form_list[i].category_id+"' style='top :0px; left:0px;'></div>"); 
	                    		//    	$(".gridss").append(divOne);

	                    		//    	if(form_list[i].state_id==0)
	                    		//    		$($(".gridss").children()[i]).addClass('미신청');
	                    		//    	else
	                    		//    		$($(".gridss").children()[i]).addClass('신청완료');
	
	                    		//    	/* div1의 안에 들어갈 div => "product-item" */
	                    		//     var divTwo = $("<div></div>"); 
	                    		//     divTwo.addClass("product-item");
	                    		//     $($(".gridss").children()[i]).append(divTwo);
	
	                    		    
	                    		//     var formName =  $("<h4 class='form_name'>"+form_list[i].formName +"</h4><hr class='line'>"); 
	                    		//     $($($(".gridss").children()[i]).children()[0]).append(formName);
	
	                    		    
									// var formContent= $("<div class='down-content'></div>");
									// $($($(".gridss").children()[i]).children()[0]).append(formContent);
	
									// var category =  $("<h5 class='category'>"+form_list[i].categoryName +"</h5><p class='discription'>"+form_list[i].explanation+"</p>"); 
	                    		//     $($($($(".gridss").children()[i]).children()[0]).children()[2]).append(category);
									
		                    	// 	var ul = $("<ul class='period'></ul>");
		                    	// 	$($($($(".gridss").children()[i]).children()[0]).children()[2]).append(ul);
	
		                    	// 	var li=$("<li class='start'><span>"+form_list[i].startDate+"</span></li> <li><span>~</span></li> <li class='end'><span>"+form_list[i].endDate+"</span></li>");
									// $($($($($(".gridss").children()[i]).children()[0]).children()[2]).children()[2]).append(li);

									// if(form_list[i].state_id==0){
									// 	var a=$("<a id='form_"+form_list[i].id+"' class='filled-button' onClick = 'openForm("+form_list[i].id+");'>신청완료</a>");
									// 	$($($(".gridss").children()[i]).children()[0]).append(a);
									// }
									// else{
									// 	var a=$("<a id='form_"+form_list[i].id+"' class='filled-button' onClick = 'openForm("+form_list[i].id+");'>신청하기</a>");
									// 	$($($(".gridss").children()[i]).children()[0]).append(a);
									// }
									// var form=$("<form id='myform_"+form_list[i].id+"' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+form_list[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+form_list[i].state_id+"'/></form>");
									// $($($(".gridss").children()[i]).children()[0]).append(form);
									
			                	// }

                        /*var tools = $('.grid').children().val();
                        var getty = $('<p></p>');
                        $('.grid').append(getty);
                        console.log("shit : "+tools);
                        */
                               var form_list=${form_list};
                               var category_list=${category_list};
                               for(var i=0; i<category_list.length;i++){
                                  var filter_li = $("<li data-filter='.category_"+category_list[i].id+"'>"+category_list[i].categoryName+"</li>");
                                  $(".ul_filters").append(filter_li);
                              }

                             
                               
                               for(var i=0; i < form_list.length; i++){
                                  var timestmp = form_list[i].startDate;
                                  var ndate = new Date();
                                  ndate.setTime(timestmp);
                                  //form_list[i].startDate = date("Y-m-d", form_list[i].startDate);
                                  //form_list[i].endDate = date("Y-m-d", form_list[i].endDate);
                                 /*설문지 별 div 만듦 (div1)*/
                                 var divOne = $("<div class='col-lg-4 col-md-4 grid-item category_"+ form_list[i].category_id+"'></div>"); 
                                   $(".grid").append(divOne);
   
                                   /* div1의 안에 들어갈 div => "product-item" */
                                 var divTwo = $("<div></div>"); 
                                 divTwo.addClass("product-item");
                                 $($(".grid").children()[i]).append(divTwo);
                      
                           var formContent= $("<div class='down-content'></div>");
                           $($($(".grid").children()[i]).children()[0]).append(formContent);
                           
                           var formName =  $("<h6 class='formDate'>"+form_list[i].startDate+"~"+form_list[i].endDate+"</h6><h4 class='form'>"+form_list[i].formName +"</h4><p class='discription'>"+form_list[i].explanation+"</p>"); 
                                 $($($($(".grid").children()[i]).children()[0]).children()[0]).append(formName);
                           
                                 var category =  $("<span class='category_name'>"+form_list[i].categoryName +"</span>"); 
                                 $($($($(".grid").children()[i]).children()[0]).children()[0]).append(category);
                             
                           var a=$("<div class='formLink'><a id='form_"+form_list[i].id+"' class='filled-button' style='color: white; onClick = 'openForm("+form_list[i].id+");'>신청하기</a></div>");
                           $($($(".grid").children()[i]).children()[0]).append(a);
                           
                            }

                            });

                     function openForm(form_id){
                               $("#myform_"+form_id).submit();
                            }


                            $(document).ready( function() {   

                               var $grid = $('.grid').isotope({
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


                            	var $table = $('.gridss').isotope({
                            		itemSelector: '.grid-item',
                              	  	percentPosition: true,
                      	          getSortData: {
                      	              status : '[data-status]', 
                      	           }
                      	        });
                      	        
                            	$('.filter-status').on('change', function() {
                            
                              	  var filterValue = $(this).find(':selected').attr('data-filter');
                              	  console.log(filterValue);
                              	  $table.isotope({ filter: filterValue });
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
              <h2><a href='<%=request.getContextPath()%>/board/list'><span><img src="<%=request.getContextPath()%>/resources/img/home_1.png" alt="img section"></span>SW 최신 공지</a></h2>
           </div>
                <div class="tablelist">
                   <table class="table table-hover">
                   	<!-- <thead>
                            <tr>
                                <th>Title</th>
                                <th>등록일자 </th>
                            </tr>
                    </thead> -->
                    <tbody>
                    <c:forEach items="${list}" var="BoardVO" end="4">
                            <tr>
                            	<td>${BoardVO.title}</td>
      							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${BoardVO.regdate}"/></td>
                            </tr>
                    </c:forEach>
                    </tbody>  
                    <%-- <tr><td>2021-1학기 맥북 신청 일정 </td><td>2021-02-09</td></tr>    
                    <tr><td>2021 1학기 마일리지 신청 </td><td>2021-02-06</td></tr>  
                    <tr><td>2021 여름방학 소프트웨어 봉사단 모집 </td><td>2021-02-05</td></tr>
                    <tr><td>2021 2학기 공학 프로젝트 기획 신청  </td><td>2021-02-04</td></tr> --%>
 
               </table>  
                </div>
      </div>
        
    </div>
   
 
        <div style="border:0;" class="board2">
      
            <div class="products">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="filters">
              <ul class="ul_filters">
                  <li class="active" data-filter="*">All Products</li>
              </ul>
              <form class="form-inline" name="searchForm" action="<%=request.getContextPath()%>/" method="GET" style="float:right;">
                    <select name="searchType">
                       <option value="all" <c:out value="${searchType =='all'? 'selected':'' }"/>>전체</option>
                       <option value="formName" <c:out value="${searchType =='formName'? 'selected':'' }"/>>제목</option>
                       <option value="categoryName" <c:out value="${searchType =='categoryName'? 'selected':'' }"/>>카테고리</option>
                    </select>
                    <input type="text" class="form-control mr-sm-2" name="keyword" value="${keyword}" placeholder="검색" aria-label="검색">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                 </form>
              
            </div>
          </div>
          <div id="contentsDiv" class="col-md-12">
            <div class="filters-content">
                <div class="row grid">
                   

                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
            </div><!-- board2 -->

   </main>
   <footer>
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
   </footer>
   
   
   
</body>
</html>