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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/home.css?ver=2">


 <style>


      
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
                             
                               var form_list=${form_list};
                               var category_list=${category_list};
                               for(var i=0; i<category_list.length;i++){
                                  var filter_li = $("<li data-filter='.category_"+category_list[i].id+"'>"+category_list[i].categoryName+"</li>");
                                  if(category_list[i].id!=0)
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
                           
                           var formName =  $("<h6 class='formDate'>"+moment(form_list[i].startDate).format('YYYY-MM-DD')+"~"+moment(form_list[i].endDate).format('YYYY-MM-DD')+"</h6><h4 class='form'>"+form_list[i].formName +"</h4><p class='discription'>"+form_list[i].explanation+"</p>"); 
                                 $($($($(".grid").children()[i]).children()[0]).children()[0]).append(formName);
                           
                                 var category =  $("<span class='category_name'>"+form_list[i].categoryName +"</span>"); 
                                 $($($($(".grid").children()[i]).children()[0]).children()[0]).append(category);
								 
                                 if(form_list[i].state_id==0){
                                	var a=$("<div class='formLink'><a id='form_"+form_list[i].id+"' class='filled-button' style='color: white;' onClick = 'openForm(this);'>신청하기</a></div>");
  		                            $($($(".grid").children()[i]).children()[0]).append(a);
 								 }
 								 else{
 									var a=$("<div class='formLink'><a id='form_"+form_list[i].id+"' class='filled-button' style='color: white; background-color:rgb(198, 193, 216);' onClick = 'openForm(this);'>신청완료</a></div>");

 		                            $($($(".grid").children()[i]).children()[0]).append(a);
 								 }
 								 
 								var form=$("<form id='myform' action='form/"+form_list[i].url+"' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+form_list[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+form_list[i].state_id+"'/></form>");
 								$($($(".grid").children()[i]).children()[0]).append(form);
 								var form2=$("<form id='viewForm' action='viewForm/"+form_list[i].url+"' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+form_list[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+form_list[i].state_id+"'/></form>");
 								$($($(".grid").children()[i]).children()[0]).append(form2);
                            }

                            });

                     		function openForm(obj){
                         		console.log("openForm");
                         		var state_ID=$(obj).parent().siblings("#myform").find("#stateID").val();
                         		if(state_ID==0)
                           			$(obj).parent().siblings("#myform").submit();
                                else
                                	$(obj).parent().siblings("#viewForm").submit();
                            }


                            $(document).ready( function() {   
                            	var qsRegex;
                               var $grid = $('.grid').isotope({
                                 itemSelector: '.grid-item',
                                 percentPosition: true,
                                  masonry: {
                                    columnWidth: ".grid-item"
                                  },
                                  filter: function() {
                                	return qsRegex ? $(this).text().match( qsRegex ) : true;
                                  }
                               });

                            // use value of search field to filter
                               var $quicksearch = $('.keyword').keyup( debounce( function() {
                                 qsRegex = new RegExp( $quicksearch.val(), 'gi' );
                                 $grid.isotope();
                               }, 200 ) );

                            // debounce so filtering doesn't happen every millisecond
                               function debounce( fn, threshold ) {
                                 var timeout;
                                 threshold = threshold || 100;
                                 return function debounced() {
                                   clearTimeout( timeout );
                                   var args = arguments;
                                   var _this = this;
                                   function delayed() {
                                     fn.apply( _this, args );
                                   }
                                   timeout = setTimeout( delayed, threshold );
                                 };
                               }


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
      							<td class="board_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${BoardVO.regdate}"/></td>
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
          <div class="col-md-12" style="margin-bottom: 20px;">
            <div class="filters" style="margin-bottom:20px;">
              <ul class="ul_filters">
                  <li class="active" data-filter="*">All Products</li>
              </ul>            
            </div>

            <div style="padding-bottom:5px;">
	            <div class="form-inline"  style="float:right;">
	                    <input type="text" class="form-control mr-sm-2 keyword" name="keyword" value="${keyword}" placeholder="검색" aria-label="검색">
	                    
	            </div>
            </div>
          </div>
          <div id="contentsDiv" class="col-md-12">
            <div class="filters-content">
                <div class="row grid leftDiv">
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