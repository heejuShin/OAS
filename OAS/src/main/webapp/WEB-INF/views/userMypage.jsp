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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>User my page</title>
    
    <!-- Responsive Tables -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">
      <!--  button css-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/buttonstyle.css?v=2">
   

    <!-- Latest compiled and minified Bootstrap JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/rwd-table.js?v=5.3.1"></script>
	 
    
   <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
   
     <link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/mypage.css?ver=1">
    
  
    

      <script>
      $(document).ready(function () {

  		var categoryList=${categoryList};
  		for(var i=0; i < categoryList.length; i++){
  			var option=$("<option data-filter='.category"+categoryList[i].id+"' value='.category"+categoryList[i].id+"'>"+categoryList[i].categoryName+"</option>");
  			$(".filter-category").append(option);
  		}

  		
  		var userList=${userList};
  	   	for(var i=0; i < userList.length; i++){
  	                                
  		   	/*설문지 별 tr 만듦*/
  		  	var divOne = $("<tr class='form-item"+i+" item-row category"+userList[i].category_id+"' data-category='category"+userList[i].category_id+"' ></tr>"); 
  		   	$(".tbodies").append(divOne);
  	
  			/* tr의 안에 들어갈 td */
  		 	var td1 = $("<td>"+(i+1)+"</td>"); 
  		 	$($(".tbodies").children()[i]).append(td1);
  		
  			var th1 = $("<th>"+userList[i].categoryName+"<span class='co-name'></span></th>"); 
  			$($(".tbodies").children()[i]).append(th1);
  	
  		  	var td2 = $("<td>"+userList[i].formName+"</td>"); 
  		 	$($(".tbodies").children()[i]).append(td2);
  	
  		 	var td3 = $("<td>"+moment(userList[i].startDate).format('YYYY.MM.DD HH')+" ~ "+moment(userList[i].endDate).format('YYYY.MM.DD HH')+"</td>"); 
  		  	$($(".tbodies").children()[i]).append(td3);
  	
  		  	var td4 = $("<td>"+moment(userList[i].regDate).format('YYYY.MM.DD')+"</td>"); 
  			$($(".tbodies").children()[i]).append(td4);
  	
  			var td5 = $("<td>"+userList[i].userName+"</td>"); 
  		  	$($(".tbodies").children()[i]).append(td5);
  		                    			
  			var a=$("<td><button type='button' id='form_"+userList[i].id +"' class='btn mb-2 mb-md-0 btn-round' style='border: 3px solid #ffd500;' onClick = 'openForm(this);'>"+userList[i].stateName+"</button></td>");
  			$($(".tbodies").children()[i]).append(a);
  		
  			var form=$("<form id='form' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+userList[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+userList[i].state_id+"'/></form>");
  			$($(".tbodies").children()[i]).append(form);
  										
  		}

  	});
        
      </script>

  </head>

  <body>

    <jsp:include page="/WEB-INF/views/basic/header.jsp" />
    

    <!-- <script src="<%=request.getContextPath()%>/resources/assets/js/isotope.js"></script> -->

    
    <main>
    
    <div id="headTitle">
		    	<div id="welcomeMsg"><img id="profileImg" src="<%=request.getContextPath()%>/resources/img/smile.png"><h2 >안녕하세요 ${name} 님 <span><img id="settingsIcon" alt="profileImg" src="<%=request.getContextPath()%>/resources/img/settings.png"></span></h2></div>
     </div>

    
    <section id="demo">
	    
      <div class="container">

          <div class="table-responsive" data-pattern="priority-columns">
              <table cellspacing="0" id="tech-companies-1" class="table table-small-font table-bordered table-striped">
                  <thead>
                      <tr>
                          <th></th>
                          <th>
                          	<select class="filters filter-category" data-filter-group='category'>

			  					<option data-filter='' value="*">카테고리</option>

			  			  	</select>
			  			  </th>
                          <th data-priority="1">제목</th>
                          <th data-priority="2">신청 기간</th>
                          <th data-priority="2">등록 일자</th>
                          <th data-priority="2">등록자</th>
                          <th data-priority="1">상태</th>
                      </tr>
                  </thead>
                  
                  <tbody class="tbodies">
                  </tbody>
              </table>
		  </div>    
		    
          <div id="moreContent">  
          <ul class="pagination">
			    <c:if test="${pageMaker.prev}">
			    <li>
			        <a href='<%=request.getContextPath()%>/mypage?page=${pageMaker.startPage-1}&filterType=${cri.filterType}&searchType=${cri.searchType}&keyword=${keyword}'>&laquo;</a>

			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li>

			        <a href='<%=request.getContextPath()%>/mypage?page=${idx}&filterType=${cri.filterType}&searchType=${cri.searchType}&keyword=${keyword}'>${idx}</a>

			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    <li>

			        <a href='<%=request.getContextPath()%>/mypage?page=${pageMaker.endPage+1}'>&raquo;</a>
			    </li>
			    </c:if>
		  </ul>
		  </div>
		  
		  <!--Start_Filter and Search part-->
          <nav class="filter_search" >
            
            <form class="form-inline" name="searchForm" action="<%=request.getContextPath()%>/mypage" method="GET" >
	  			<input type="hidden" name="searchType" value="all">
	  			<input type="text" class="form-control mr-sm-2" name="keyword" value="${keyword}" placeholder="검색" aria-label="검색">
	  			
	  			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	  			<select name="filterType" class="filterType">
	  				<option value="all" <c:out value="${filterType =='all'? 'selected':'' }"/>>전체</option>
	  				<option value="applyForm" <c:out value="${filterType =='applyForm'? 'selected':'' }"/>>신청현황</option>
	  				<option value="noApplyForm" <c:out value="${filterType =='noApplyForm'? 'selected':'' }"/>>신청하기</option>
	  				<option value="pastForm" <c:out value="${filterType =='pastForm'? 'selected':'' }"/>>신청했던폼</option>
	  			</select>
  			</form>
            
          </nav>
          
          <!--End_Filter and Search part-->
		  
      </div> <!-- end container -->
  </section> <!-- end section -->
	   
	   
	</main>


  <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
  <jsp:include page="/WEB-INF/views/userInfo.jsp" />
  
  <script>
                        	
	//표 동적 생성하는 부분
  	$(document).ready(function () {

  		var categoryList=${categoryList};
		for(var i=0; i < categoryList.length; i++){
			var option=$("<option data-filter='.category"+categoryList[i].id+"' value='.category"+categoryList[i].id+"'>"+categoryList[i].categoryName+"</option>");
			$(".filter-category").append(option);
		}

		
		var userList=${userList};
	   	for(var i=0; i < userList.length; i++){
	                                
		   	/*설문지 별 tr 만듦*/
		  	var divOne = $("<tr class='form-item"+i+" item-row category"+userList[i].category_id+"' data-category='category"+userList[i].category_id+"' ></tr>"); 
		   	$(".tbodies").append(divOne);
	
			/* tr의 안에 들어갈 td */
		 	var td1 = $("<td>"+(i+1)+"</td>"); 
		 	$($(".tbodies").children()[i]).append(td1);
		
			var th1 = $("<th>"+userList[i].categoryName+"<span class='co-name'></span></th>"); 
			$($(".tbodies").children()[i]).append(th1);
	
		  	var td2 = $("<td>"+userList[i].formName+"</td>"); 
		 	$($(".tbodies").children()[i]).append(td2);
	
		 	var td3 = $("<td>"+moment(userList[i].startDate).format('YYYY.MM.DD HH')+" ~ "+moment(userList[i].endDate).format('YYYY.MM.DD HH')+"</td>"); 
		  	$($(".tbodies").children()[i]).append(td3);
	
		  	var td4 = $("<td>"+moment(userList[i].regDate).format('YYYY.MM.DD')+"</td>"); 
			$($(".tbodies").children()[i]).append(td4);
	
			var td5 = $("<td>"+userList[i].userName+"</td>"); 
		  	$($(".tbodies").children()[i]).append(td5);

		  	//신청했던 폼 : 신청마감 (자신이 신청했던거 볼 수 있게)
		  	if(new Date()>new Date(userList[i].endDate)){
		  		var a=$("<td><a href='#' id='form_"+userList[i].id+"' class='filled-button' onClick = 'openForm(this);'>신청마감</a></td>");
				$($(".tbodies").children()[i]).append(a);
		  	}	
		  	else{
		  		//신청하기 (그 폼 신청페이지로 넘어가게)
			  	if(userList[i].state_id==0){
			  		var a=$("<td><a href='#' id='form_"+userList[i].id+"' class='filled-button' onClick = 'openForm(this);'>신청하기</a></td>");
					$($(".tbodies").children()[i]).append(a);
				}
			    //신청한 폼 : 상태 확인 (자신이 신청했던거 볼 수 있게)
			  	else{
			  		var a=$("<td><a href='#' id=' form_"+userList[i].id+"' class='filled-button' onClick = 'openForm(this);'>"+userList[i].stateName+"</a></td>");
					$($(".tbodies").children()[i]).append(a);
				}

			}
			var form=$("<form id='form' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+userList[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+userList[i].state_id+"'/></form>");
			$($(".tbodies").children()[i]).append(form);

			
		}

	});

    function openForm(obj){
   		$(obj).parent().siblings("#form").submit();
    }

    $(document).ready( function() {   
    	//테이블 카테고리, 상태 select
	       var $table = $('.tbodies').isotope({
	          itemSelector: '.item-row',
              layoutMode: 'vertical',
	          getSortData: {
	              category : '[data-category]',
	           }
	        });

	        var filters = {};
	        // bind filter on select change,
	        $('.filter-category').on( 'change', function() {
	          // get filter value from option value
	          var $this = $(this);
	          var filterGroup = $this.attr('data-filter-group');
	          // set filter for group
	          //filters[filterGroup] = $this.value;
	          filters[filterGroup] = $this.find(':selected').attr('data-filter');

	       	  // combine filters
	          var filterValue = '';
	          for (var prop in filters) {
	            filterValue += filters[prop];
	          }
	          console.log(filterValue);
	          
	          $table.isotope({ 
	            filter : filterValue 
	          });
	        });

	        $('.filterType').on( 'change', function() {
	        	$(".form-inline").submit();
		     });

      });
</script>

  </body>
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
  <script>
	//표 동적 생성하는 부분
	
  function openForm(obj){
 		$(obj).parent().siblings("#form").submit();
  }

  $(document).ready( function() {   
  	//테이블 카테고리, 상태 select
	       var $table = $('.tbodies').isotope({
	          itemSelector: '.item-row',
            layoutMode: 'vertical',
	          getSortData: {
	              category : '[data-category]',
	           }
	        });

	        var filters = {};
	        // bind filter on select change,
	        $('.filter-category').on( 'change', function() {
	          // get filter value from option value
	          var $this = $(this);
	          var filterGroup = $this.attr('data-filter-group');
	          // set filter for group
	          //filters[filterGroup] = $this.value;
	          filters[filterGroup] = $this.find(':selected').attr('data-filter');

	       	  // combine filters
	          var filterValue = '';
	          for (var prop in filters) {
	            filterValue += filters[prop];
	          }
	          console.log(filterValue);
	          
	          $table.isotope({ 
	            filter : filterValue 
	          });
	        });

    });
  </script>

</html>
