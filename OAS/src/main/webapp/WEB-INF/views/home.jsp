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
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/home.css?ver=7">


 <style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);

body {font-family: 'NanumSquare', sans-serif !important;}
.formNameToolTip {
	display: none;
	position: absolute;
	z-index: 100;
	background-color: black;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    opacity: 0.7;
	padding: 3px;
	top: 70px;
	left: 0px;
	height:30px;
	font-size:11px !important;
	right:0px !important;
}

h4:hover span.formNameToolTip {
	display: block;
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
                             
                            
                               var form_list=${form_list};
                               var category_list=${category_list};
                               console.log(category_list);
                               var c_list = new Map();
                               for(var i=0;i<category_list.length;i++){
                            	   c_list.set(category_list[i].categoryName,0);
                               }
                               for (const [key, value] of c_list) {
                            	    console.log("These are ", key, value);
                            	}
                               for(var i=0;i<form_list.length;i++){
                            		  var a = c_list.get(form_list[i].categoryName);
                            		  console.log("a is " + a);
                            		  c_list.set(form_list[i].categoryName,a+1);
                            	   }
                               
                               for (const [key, value] of c_list) {
                           	    console.log("Those are ", key, value);
                           		}
                               for(var i=0; i<category_list.length;i++){
                            	   console.log("c is" + c_list.get(category_list[i].categoryName));
               					  var filter_li = $("<li data-filter='.category_"+category_list[i].id+"'>"+category_list[i].categoryName+"</li>");
                                  if(category_list[i].id!=0 && c_list.get(category_list[i].categoryName) !=0 )
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
							
							//해당 폼 신청자 수 적기
							var resultCount;
							$.ajax({ //해당 form의 신청자 count가져오기
								url : "admin/resultCount",
								type : "post",
								data:{"form_id":form_list[i].id},
								dataType : "json",
								async: false,
								success: function(data){
									resultCount = data;
								},
								error:function(request, status, error){
									console.log("code:"+request.status+"\n"+"\n"+"error:"+error);
								}
							});	
							
						   var applyNum="";
						   if(resultCount!=null)
						   var applyNum=$("<div class='applyNum'><h6>신청자:</h6><h5>"+resultCount+"</h5><h6>명</h6></div>")
                           $($($($(".grid").children()[i]).children()[0]).children()[0]).append(applyNum);
                           
                           if(form_list[i].formName.length > 17){
                        	   var shortFormName = form_list[i].formName.substring(0,16);
                        	   var formName =  $("<h6 class='formDate'>"+moment(form_list[i].startDate).format('YYYY-MM-DD')+"~"+moment(form_list[i].endDate).format('YYYY-MM-DD')+"</h6><h4 class='form'>"+shortFormName +" ...<span class='formNameToolTip'>"+form_list[i].formName+"</span></h4><p class='discription'>"+form_list[i].explanation+"</p>"); 
                        	   $($($($(".grid").children()[i]).children()[0]).children()[0]).append(formName);
                           }else{
                           	var formName =  $("<h6 class='formDate'>"+moment(form_list[i].startDate).format('YYYY-MM-DD')+"~"+moment(form_list[i].endDate).format('YYYY-MM-DD')+"</h6><h4 class='form'>"+form_list[i].formName +"</h4><p class='discription'>"+form_list[i].explanation+"</p>"); 
                                 $($($($(".grid").children()[i]).children()[0]).children()[0]).append(formName);
                           }
                                 //$t = $(".discription").val().replace();
                           
                                 var category =  $("<span class='category_name'>"+form_list[i].categoryName +"</span>"); 
                                 $($($($(".grid").children()[i]).children()[0]).children()[0]).append(category);
								 
                                 if(form_list[i].state_id==0){
                                	var a=$("<div class='formLink'><a id='form_"+form_list[i].id+"' class='filled-button' style='color: white;cursor:pointer;' onClick = 'openForm(this);'>신청하기</a></div>");
  		                            $($($(".grid").children()[i]).children()[0]).append(a);
 								 }
                                 else{
                                     var editDate=$("<span class='regDate'>신청일: "+moment(form_list[i].editDate).format('YYYY-MM-DD')+"</span>");
                                     $($($(".grid").children()[i]).children()[0]).append(editDate);
                                	 var a=$("<div class='formLink'><a id='form_"+form_list[i].id+"' class='filled-button' style='color: white; background-color:rgb(53, 96, 177); margin-right:3px;cursor:pointer;' onClick = 'openForm(this);'>신청완료</a><a id='form_"+form_list[i].id+"' class='filled-button' style='color: white; background-color:rgb(198, 193, 216);cursor:pointer;' onClick = 'delSubmitForm(this);'>신청취소</a></div>");                                            $($($(".grid").children()[i]).children()[0]).append(a);

                                	 $($($(".grid").children()[i]).children()[0]).append(a);
                                 }
 								 
 								var form=$("<form id='myform' action='form/"+form_list[i].url+"' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+form_list[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+form_list[i].state_id+"'/><input type='hidden' id='select_formID' name='select_formID' value='"+form_list[i].id+"'/><input type='hidden' id='linkName' name='linkName' value='"+form_list[i].url+"'/></form>");
 								$($($(".grid").children()[i]).children()[0]).append(form);
 								var form2=$("<form id='viewForm' action='viewForm/"+form_list[i].url+"' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+form_list[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+form_list[i].state_id+"'/></form>");
 								$($($(".grid").children()[i]).children()[0]).append(form2);
 								var form3=$("<form id='delMyForm' action='delMyForm/"+form_list[i].url+"' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+form_list[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+form_list[i].state_id+"'/></form>");
 								$($($(".grid").children()[i]).children()[0]).append(form3);
                            }

                            //command injection 방지
                              var replaceId = /[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi;
                              $("#keyword").on("focusout", function() {
                                  var x = $(this).val();
                                  if (x.length > 0) {
                                      if (x.match(replaceId)) {
                                         x = x.replace(replaceId, "");
                                      }
                                      $(this).val(x);
                                  }
                              }).on("keyup", function() {
                                  $(this).val($(this).val().replace(replaceId, ""));

                              });
                            });

                     		function openForm(obj){
                     			console.log("openForm");
                     			var state_ID=$(obj).parent().siblings("#myform").find("#stateID").val();
                     			var urlLink = $(obj).parent().siblings("#myform").find("#linkName").val();
                     			var randomString = Math.random().toString(36).slice(2);
                     			var openTap = window.open('form/'+urlLink,randomString);
                     			var formTap = document.myform;
                     			formTap.target=randomString;
                     			formTap.submit();
                     			if(state_ID==0)
                     				$(obj).parent().siblings("#myform").submit();
                     			else
                     				$(obj).parent().siblings("#viewForm").submit();

                            }

                     		function delSubmitForm(obj){
                         		console.log("deleteMyForm");
                         		if(confirm("신청을 취소하겠습니까?")){
	                         		var state_ID=$(obj).parent().siblings("#myform").find("#stateID").val();
	                           		$(obj).parent().siblings("#delMyForm").submit();
                         		}
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


                            	var $table = $('.grid').isotope({
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
   <!-- ***** Preloader Start ***** -->
    <div id="preloader">    
        <div class="jumper">
            <div></div>
            <div></div><br>                      
            <h3 class="textdiv" >Chrome 브라우저 이용을 권장합니다.</h3>           
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
   <jsp:include page="/WEB-INF/views/basic/header.jsp" />
    
    <main>
    
    <div class="board1">
      <div class="board_image">
                <img src="<%=request.getContextPath()%>/resources/img/home_4.jpg" alt="img section">
         </div>
        <div class="board_section">
           <div class="title">
   
              <h2><a href='<%=request.getContextPath()%>/board/list' style="color:#f33f3f"><span></span>CSEE 최신 공지</a></h2>
           	  <h5 style="position:absolute;right:17%;"><a href='<%=request.getContextPath()%>/board/list' style="color:#000"><span>더보기</span></a></h5>

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
                            	<td><a href="<%=request.getContextPath()%>/board/view/${BoardVO.seq}" class="titlelink" style="color:#000;">${BoardVO.title}</a></td>
      				<td class="board_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${BoardVO.regdate}"/></td>
                            </tr>
                    </c:forEach>
                    </tbody>  
 
               </table>  
                </div>
      </div>        
    </div>
   
 
        <div style="border:0;" class="board2">
      
            <div class="products">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="filters" style="padding-bottom:45px; margin-bottom:30px;">
              <ul class="ul_filters">
                  <li class="active" data-filter="*">전체</li>
              </ul>     
	            <form class="form-inline" name="searchForm" action="<%=request.getContextPath()%>/" method="POST" style="float:right;">
	                    <input type="hidden" name="searchType" value="all">
	                    <input type="text" class="form-control mr-sm-2" id="keyword" name="keyword" value="${keyword}" placeholder="검색" aria-label="검색">
	                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	            </form>
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

   </main>
   <footer>
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
   </footer>
   
   
   
</body>
</html>
