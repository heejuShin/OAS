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
          
          <!--Start_Filter and Search part-->
          <nav class="filter_search" >
            <div class="dropdown">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown button
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </div>
            
            <form class="form-inline" name="searchForm" action="<%=request.getContextPath()%>/mypage" method="GET" >
	  			<select name="searchType">
	  				<option value="all" <c:out value="${searchType =='all'? 'selected':'' }"/>>전체</option>
	  				<option value="writer" <c:out value="${searchType =='writer'? 'selected':'' }"/>>등록자</option>
	  				<option value="formName" <c:out value="${searchType =='formName'? 'selected':'' }"/>>제목</option>
	  				<option value="categoryName" <c:out value="${searchType =='categoryName'? 'selected':'' }"/>>카테고리</option>
	  			</select>
	  			<input type="text" class="form-control mr-sm-2" name="keyword" value="${keyword}" placeholder="검색" aria-label="검색">
	  			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  			</form>
            
          </nav>
          <!--End_Filter and Search part-->
          <div class="table-responsive" data-pattern="priority-columns">
              <table cellspacing="0" id="tech-companies-1" class="table table-small-font table-bordered table-striped">
                  <thead>
                      <tr>
                          <th><input type="checkbox" id="allCheck" /></th>
                          <th>카테고리</th>
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
		var formList2=${userTab2};
		for(var i=0; i < formList2.length; i++){
            
		   	/*설문지 별 tr 만듦*/
		  	var divOne = $("<tr></tr>"); 
		   	$(".tbodies2").append(divOne);
	
			/* tr의 안에 들어갈 td */
		 	var td1 = $("<td><input type='checkbox' name='result' value='"+formList2[i].id+"' /></td>"); 
		 	$($(".tbodies2").children()[i]).append(td1);
		
			var th1 = $("<th>"+formList2[i].categoryName+"<span class='co-name'></span></th>"); 
			$($(".tbodies2").children()[i]).append(th1);
	
		  	var td2 = $("<td>"+formList2[i].formName+"</td>"); 
		 	$($(".tbodies2").children()[i]).append(td2);
	
		   	var td3 = $("<td>"+moment(formList2[i].startDate).format('YYYY MM DD HH:mm:ss')+" ~ "+moment(formList2[i].endDate).format('YYYY MM DD HH:mm:ss')+"</td>"); 
		  	$($(".tbodies2").children()[i]).append(td3);
	
		 	var td4 = $("<td>"+moment(formList2[i].regDate).format('YYYY MM DD HH:mm:ss')+"</td>"); 
			$($(".tbodies2").children()[i]).append(td4);
	
			var td5 = $("<td>"+formList2[i].userName+"</td>"); 
		  	$($(".tbodies2").children()[i]).append(td5);
		                    			
			var a=$("<td><a href='#' id='form_"+formList2[i].id+"' class='filled-button' onClick = 'openForm("+formList2[i].id+");'>신청하기</a></td>");
			$($(".tbodies2").children()[i]).append(a);
		
			var form=$("<form id='form' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+formList2[i].id+"'/><input type='hidden' id='stateID' name='stateID' value='"+formList2[i].state_id+"'/></form>");
			$($(".tbodies2").children()[i]).append(form);
										
		}

});
</script>

