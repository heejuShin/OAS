<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section id="demo">
	    
      <div class="container">
          <div class="page-header" style="border-bottom: 1px solid black; margin : 3% 0%; padding-bottom: 2%">
              <div><img id="profileImg" src="<%=request.getContextPath()%>/resources/img/smile.png"></div>
		    	<div id="welcomeMsg"><h1 >안녕하세요 김해린학부생 님 <span><img id="settingsIcon" onclick="userInfo()" alt="profileImg" src="<%=request.getContextPath()%>/resources/img/settings.png"></span></h1></div>
				
          </div>
          
          
          <div class="table-responsive" data-pattern="priority-columns">
              <table cellspacing="0" id="tech-companies-1" class="table table-small-font table-bordered table-striped">
                  <thead>
                      <tr>
                          <th></th>
                          <th>
							<select class="filters filter-category3" data-filter-group='category'>
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
                  
                  <tbody class="tbodies3">
                  	   
                      
                  </tbody>
              </table>
          </div>      
          <ul class="pagination">
			    <c:if test="${pageMaker3.prev}">
			    <li>
			        <a href='<%=request.getContextPath()%>/mypage?page=${pageMaker3.startPage-1}'>&laquo;</a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker3.startPage}" end="${pageMaker3.endPage}" var="idx">
			    <li>
			        <a href='<%=request.getContextPath()%>/mypage?page=${idx}'>${idx}</a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker3.next && pageMaker3.endPage > 0}">
			    <li>
			        <a href='<%=request.getContextPath()%>/mypage?page=${pageMaker3.endPage+1}'>&raquo;</a>
			    </li>
			    </c:if>
		  </ul>
		  
      </div> <!-- end container -->
  </section> <!-- end section -->
 

<script>
	
$(document).ready(function () {
	var categoryList=${categoryList};
	for(var i=0; i < categoryList.length; i++){
		var option=$("<option data-filter='.category"+categoryList[i].id+"' value='.category"+categoryList[i].id+"'>"+categoryList[i].categoryName+"</option>");
		$(".filter-category3").append(option);
	}
	
	var formList3=${userTab3};

		for(var i=0; i < formList3.length; i++){
            
		   	/*설문지 별 tr 만듦*/
		  	var divOne = $("<tr class='form-item"+i+" item-row3 category"+formList3[i].category_id+"' data-category='category"+formList3[i].category_id+"' ></tr>"); 
		   	$(".tbodies3").append(divOne);
	
			/* tr의 안에 들어갈 td */
		 	var td1 = $("<td>"+(i+1)+"</td>");
		 	$($(".tbodies3").children()[i]).append(td1);
		
			var th1 = $("<th>"+formList3[i].categoryName+"<span class='co-name'></span></th>"); 
			$($(".tbodies3").children()[i]).append(th1);
	
		  	var td2 = $("<td>"+formList3[i].formName+"</td>"); 
		 	$($(".tbodies3").children()[i]).append(td2);
	
		 	var td3 = $("<td>"+moment(formList3[i].startDate).format('YYYY MM DD HH:mm:ss')+" ~ "+moment(formList3[i].endDate).format('YYYY MM DD HH:mm:ss')+"</td>"); 
		  	$($(".tbodies3").children()[i]).append(td3);
	
		 	var td4 = $("<td>"+moment(formList3[i].regDate).format('YYYY MM DD HH:mm:ss')+"</td>"); 
			$($(".tbodies3").children()[i]).append(td4);
	
			var td5 = $("<td>"+formList3[i].userName+"</td>"); 
		  	$($(".tbodies3").children()[i]).append(td5);
		                    			
			var a=$("<td><a href='#' id='form_"+formList3[i].id+"' class='filled-button' onClick = 'openForm(this);'>신청마감</a></td>");
			$($(".tbodies3").children()[i]).append(a);
		
			var form=$("<form id='form' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+formList3[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+formList3[i].state_id+"'/></form>");
			$($(".tbodies3").children()[i]).append(form);
										
		}

		//테이블 카테고리, 상태 select
	       var $table3 = $('.tbodies3').isotope({
	          itemSelector: '.item-row3',
        	  layoutMode: 'vertical',
	          getSortData: {
	              category : '[data-category]',
	           }
	        });

	        var filters = {};
	        // bind filter on select change,
	        $('.filter-category3').on( 'change', function() {
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
	          
	          $table3.isotope({ 
	            filter : filterValue 
	          });
	        });

});
</script>

