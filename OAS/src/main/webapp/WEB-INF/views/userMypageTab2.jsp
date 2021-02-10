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
          
          <!--End_Filter and Search part-->
          <div class="table-responsive" data-pattern="priority-columns">
              <table cellspacing="0" id="tech-companies-1" class="table table-small-font table-bordered table-striped">
                  <thead>
                      <tr>
                          <th></th>
                          <th>
                          	<select class="filters filter-category2" data-filter-group='category'>
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
                  
                  <tbody class="tbodies2">
                  	   
                      
                  </tbody>
              </table>
          </div>      
          <ul class="pagination">
			    <c:if test="${pageMaker2.prev}">
			    <li>
			        <a href='<%=request.getContextPath()%>/mypage?page=${pageMaker2.startPage-1}'>&laquo;</a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker2.startPage}" end="${pageMaker2.endPage}" var="idx">
			    <li>
			        <a href='<%=request.getContextPath()%>/mypage?page=${idx}'>${idx}</a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker2.next && pageMaker2.endPage > 0}">
			    <li>
			        <a href='<%=request.getContextPath()%>/mypage?page=${pageMaker2.endPage+1}'>&raquo;</a>
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
			$(".filter-category2").append(option);
		}
	
		var formList2=${userTab2};
		for(var i=0; i < formList2.length; i++){
            
		   	/*설문지 별 tr 만듦*/
		  	var divOne = $("<tr class='form-item"+i+" item-row2 category"+formList2[i].category_id+"' data-category='category"+formList2[i].category_id+"' ></tr>"); 
		   	$(".tbodies2").append(divOne);
	
			/* tr의 안에 들어갈 td */
		 	var td1 = $("<td>"+(i+1)+"</td>"); 
		 	$($(".tbodies2").children()[i]).append(td1);
		
			var th1 = $("<th>"+formList2[i].categoryName+"<span class='co-name'></span></th>"); 
			$($(".tbodies2").children()[i]).append(th1);
	
		  	var td2 = $("<td>"+formList2[i].formName+"</td>"); 
		 	$($(".tbodies2").children()[i]).append(td2);
	
		   	var td3 = $("<td>"+moment(formList2[i].startDate).format('YYYY.MM.DD HH')+" ~ "+moment(formList2[i].endDate).format('YYYY.MM.DD HH')+"</td>"); 
		  	$($(".tbodies2").children()[i]).append(td3);
	
		 	var td4 = $("<td>"+moment(formList2[i].regDate).format('YYYY.MM.DD')+"</td>"); 
			$($(".tbodies2").children()[i]).append(td4);
	
			var td5 = $("<td>"+formList2[i].userName+"</td>"); 
		  	$($(".tbodies2").children()[i]).append(td5);
		                    			
			var a=$("<td><a href='#' id='form_"+formList2[i].id+"' class='filled-button' onClick = 'openForm(this);'>신청하기</a></td>");
			$($(".tbodies2").children()[i]).append(a);
		
			var form=$("<form id='form' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+formList2[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+formList2[i].state_id+"'/></form>");
			$($(".tbodies2").children()[i]).append(form);
										
		}

		//테이블 카테고리, 상태 select
	       var $table2 = $('.tbodies2').isotope({
	          itemSelector: '.item-row2',
              layoutMode: 'vertical',
	          getSortData: {
	              category : '[data-category]',
	           }
	        });

	        var filters = {};
	        // bind filter on select change,
	        $('.filter-category2').on( 'change', function() {
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
	          
	          $table2.isotope({ 
	            filter : filterValue 
	          });
	        });

});
</script>

