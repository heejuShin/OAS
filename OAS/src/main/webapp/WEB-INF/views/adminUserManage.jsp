<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/adminUserManage.css?ver=4">
	
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <style>
    #excelForm{
    	display: inline-block;
    	float: right;
    	font-size: 20px;
    }
    #excelDown{
    	margin-top: 15px;
    	border: 0px;
    	border-radius: 5px;
    	background: #d1d1d1;
    }
    </style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/basic/header.jsp" />

	<!-- main -->
    <main>

         <div id="headTitle"><h2>회원 관리 <form id="excelForm" name="excelForm" id="excelForm" method="POST" action="./manage/downloadExcelFile">
				    			  <input name="formID" value="${form_id}" type="hidden"/><input type="submit" id="excelDown" value="EXCEL 다운"/>
							      </form></h2></div>
         
         <!--Start_Filter and Search part-->
          <nav class="filter_search" >

            <form class="form-inline formgroup" name="searchForm" action="<%=request.getContextPath()%>/admin/manage" method="GET" >
	  			<input type="hidden" id="searchType" name="searchType" value="all">
	  			<input type="text" id = "keyword" class="form-control mr-sm-2" name="keyword" value="${keyword}" placeholder="이름+학번" aria-label="검색">
	  			<button class="btn btn-outline-success my-2 my-sm-0 submitB" type="submit">Search</button>
  			</form>

          </nav>
		   <!--End_Filter and Search part-->  
        
        <!-- user table  -->
              <div class="table-responsive tableDiv" data-pattern="priority-columns">
              
                <table id="checklist" summary="This table shows how to create responsive tables using RWD-Table-Patterns' functionality" class="table table-bordered table-hover">
<!--                   <caption class="text-center">An example of a responsive table based on RWD-Table-Patterns' <a href="http://gergeo.se/RWD-Table-Patterns/" target="_blank"> solution</a>:</caption>
 -->                
 						<!-- column name list -->
		                  <thead> 
		                  	
		                    <tr>
		                      <th><input type="checkbox" id="allCheck" /></th>
		                      <th data-priority="1">NO</th>
		                      <th data-priority="2">이름</th>
		                      <th data-priority="3">전화번호</th>
		                      <th data-priority="4">이메일</th>
		                      <th data-priority="5">학번</th>
		                      <th data-priority="6">
		                      <select class="filters filter-status" id="department" data-filter-group='department'>
                              <option data-filter='' value="">학부</option>
                              <option value="전산전자공학부">전산전자공학부</option>
			                  <option value="기계제어공학부">기계제어공학부</option>
			                  <option value="글로벌리더십학부">글로벌리더십학부</option>
			                  <option value="ICT창업학부">ICT창업학부</option>
			                  <option value="공간환경시스템공학부">공간환경시스템공학부</option>
			                  <option value="경영경제학부">경영경제학부</option>
			                  <option value="국제어문학부">국제어문학부</option>
			                  <option value="커뮤니케이션학부">커뮤니케이션학부</option>
			                  <option value="콘텐츠융합디자인학부">콘텐츠융합디자인학부</option>
			                  <option value="상담심리사회복지학부">상담심리사회복지학부</option>
			                  <option value="법학부">법학부</option>
			                  <option value="생명과학부">생명과학부</option>
			                  <option value="창의융합교육원">창의융합교육원</option>
                          		</select>
		                      
		                      </th>
		                      <th data-priority="7">
		                      <select class="filters filter-status" id="admin" data-filter-group='admin'>
                              <option data-filter='' value="">회원 등급</option>
                              <option data-filter='2' value="2">학생</option>
                              <option data-filter="1" value="1">선생님</option>
                              <option data-filter="0" value="0">관리자</option>
                          		</select>
                         
		                      </th>
		                      <th data-priority="8">탈퇴 관리</th>
		                    </tr>
		                  </thead> 
		                  
		                  <!-- user information list -->
		                  <tbody id="userlist"></tbody>

                </table>
              </div><!-- user table End -->
              <div id="moreContent">  
	          <ul class="pagination">
			    <c:if test="${pageMaker.prev}">
			    <li>
			        <a href='<%=request.getContextPath()%>/admin/manage?page=${pageMaker.startPage-1}&filterType=${cri.filterType}&searchType=${searchOption}&keyword=${keyword}'>&laquo;</a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li>
			        <a href='<%=request.getContextPath()%>/admin/manage?page=${idx}&filterType=${cri.filterType}&searchType=${searchOption}&keyword=${keyword}'>${idx}</a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    <li>
			        <a href='<%=request.getContextPath()%>/admin/manage?page=${pageMaker.endPage+1}&filterType=${cri.filterType}&searchType=${searchOption}&keyword=${keyword}'>&raquo;</a>
			    </li>
			    </c:if>
		  </ul>
		  </div>

		  
              
              
  			<!-- select controller  -->
	        <div id="select_control">
		        <div id="controlDiv">
		          <select id ="allLevel" class="form-control" name="levelName">
		            <option value="2" selected>학생</option>
		            <option value="1">선생님</option>
		            <option value="0">관리자</option>
		          </select>
		          <button name='stateB' id="stateB">적용</button>
		        </div>
	        </div><!-- select controller end -->
      
      
		      <!-- modal  -->
		      <div id="modal"></div>
		      <div id="deleteModal" style="display:none">
		      	<p><span  style="color:red" id="deleteUser"> </span> 님을 탈퇴 처리 하시겠습니까?</p>
		      	<div id="modal_buttons">
		      		<button id="deleteB" class="checkB">예</button>
		      		<button id="notDeleteB" class="checkB">아니오</button>
		      	</div>
		      </div><!-- modal end  -->
    
    
		    <!-- deleteForm  -->
		    <form id="userDeleteForm" method="POST"  action="deleteUser">
		    		<input type="hidden" value="" name="userID" id="deleteUserID">
		    </form>

    </main>


	<jsp:include page="/WEB-INF/views/basic/footer.jsp" />


</body>
<script type="text/javascript">

	 $(document).ready(function(){
		 
		 var UserInfo = ${userData};
		 var page = ${pageN} -1;
		 

		 var searchOption = ${searchOptionView};
		 var keyword = ${keywordView};

		 console.log("searchOption : " + searchOption);
		 console.log("keyword : " + keyword);


 	 if(searchOption == "admin" && keyword != "")
       		$("#admin").children("option[value="+keyword+"]").attr("selected","selected");
		 else
			 $("#admin").children("option[value='']").attr("selected","selected");
	 
 	if(searchOption == "department" && keyword != "")
   		$("#department").children("option[value="+keyword+"]").attr("selected","selected");
	 else
		 $("#department").children("option[value='']").attr("selected","selected"); 

		 for(var i = 0; i < UserInfo.length;i++){
			 var no = ( page * ${perPageN}) + i+1;
			 //var no = i+1;
			 var sectionTag = $('<tr id="user_'+UserInfo[i].id+'"></tr>'); 
			 var userCheck = $('<td><input type="checkbox" name="result" value="'+UserInfo[i].id+'"/></td>');
			 var userNo = $('<td>'+no+'</td>');
			 var userName = $('<td class="userName">'+UserInfo[i].userName+'</td>');
			 if(UserInfo[i].phoneNum == null)
				 UserInfo[i].phoneNum = "";
			 var userNumber = $('<td>'+UserInfo[i].phoneNum+'</td>');
			 var userEmail = $('<td>'+UserInfo[i].email+'</td>');
			 var studentID = $('<td>'+UserInfo[i].studentId+'</td>');
			 if(UserInfo[i].department == null)
				 UserInfo[i].department = "";
			 var studentMajor = $('<td>'+UserInfo[i].department+'</td>');
			 var userLevel = $('<td><select  class="form-control selectAdmin" name="levelName"><option value="2" >학생</option><option value="1">선생님</option><option value="0">관리자</option></select></td>');
			 /* var userLevel = $('<td><input type="radio"  value="2"> 학생<input type="radio"  value="1"> 선생님<input type="radio"  value="0"> 관리자</td>'); */
			 var deleteButton = $('<td><button class="askDelete">탈퇴</button><input type="hidden" value="'+UserInfo[i].id+'"></td>');
			 
			 
			 $('#userlist').append(sectionTag);
			 $('#user_'+UserInfo[i].id).append(userCheck);
			 $('#user_'+UserInfo[i].id).append(userCheck);
			 $('#user_'+UserInfo[i].id).append(userNo);
			 $('#user_'+UserInfo[i].id).append(userName);
			 $('#user_'+UserInfo[i].id).append(userNumber);
			 $('#user_'+UserInfo[i].id).append(userEmail);
			 $('#user_'+UserInfo[i].id).append(studentID);
			 $('#user_'+UserInfo[i].id).append(studentMajor);
			 $('#user_'+UserInfo[i].id).append(userLevel);
			 $('#user_'+UserInfo[i].id).append(deleteButton);
			 $('#user_'+UserInfo[i].id).children().children('select').attr("name", "userRadio_"+UserInfo[i].id);
			 $('#user_'+UserInfo[i].id).children().children('select').children('option[value='+UserInfo[i].admin+']').attr("selected","selected");

			 }//user list 만들기 끝

		//함수1. 체크박스 전체 선택 / 해제 함수
	        $("#allCheck").click(function () {

	          if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
	            $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
	          } else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
	            $("input[type=checkbox]").prop("checked",false); 
	          } 
	        });

			 

	        

	        //함수2. 체크박스 헤제시 전체 체크박스 해제
	        $("input:checkbox[name=result]").click(function () {

	          if($(this).is(":checked") == false){
	            $("#allCheck").prop("checked",false);
	          }
	            
	        });

	        //함수3. '적용' 버튼 클릭시 함수
	        $("button[name='stateB']").click(function () {

	          var level = $("select[name=levelName]").val(); // 적용할 userLevel
	          var user_ids = new Array(); //checkbox의 value를 담는다.

	          //체크된 박스의 라인에 존재하는 상태 값 변경
	          $("input:checkbox[name=result]:checked").each(function() {

		          //view 처리		          
	            $(this).parent().siblings().children("select").children('option').each(function(){
	                if($(this).val() == level){
	                    $(this).prop("selected",true);
	                }else
	                	$(this).prop("selected",false);
	            });
	            
	            var test = $(this).val();
	            user_ids.push(test);
	          });
	          alert("userIDs : " + user_ids + ", newState : " + level); 
	          
	          var sendData = {"userIDs": user_ids, "newState" : level };
	          //컨트롤러로 정보 전송(ajax) result_id로 state_id update
	           if(user_ids.length > 0){
		           
	              $.ajax({
	                    url:"<%=request.getContextPath()%>/admin/setLevel",
	                    type:'POST',
	                    data: sendData,
	                    success:function(){
	                        console.log(" 변경할 level info 전송 완료!");
	                    },
	                    error:function(jqXHR, textStatus, errorThrown){
	                        alert("선택 정보 변경 에러 발생~~ \n" + textStatus + " : " + errorThrown);
	                    }
	            }); 
	          }

	          //check box 전체 해제
	          $("input[type=checkbox]").prop("checked",false); 
	        });

	        //함수4. 개별 level 변경 
	        $(".selectAdmin").on('change',function () {
		        console.log("개별 변경");

	          var userID = $(this).parent().siblings().children("input:checkbox[name=result]").val();
	          var user_ids = new Array(); 
	          user_ids.push(userID);
		          
	          var newLevel = $(this).val();
	         

	          //alert("resultID : " + user_ids + ", newState : " + newLevel); 
	          var sendData = {"userIDs": user_ids, "newState" : newLevel };
	          	 
	         $.ajax({
	                    url:"<%=request.getContextPath()%>/admin/setLevel",
	                    type:'POST',
	                    data: sendData,
	                    success:function(){
	                        console.log(" 변경할 level info 전송 완료!");
	                    },
	                    error:function(jqXHR, textStatus, errorThrown){
	                        alert("개별 변경 에러 발생~~ \n" + textStatus + " : " + errorThrown);
	                    }
	            });
	 
	        });//함수4. 개별 level 변경 끝 

	      //탈퇴처리 - modal창 열기
	        $(".askDelete").click(function () {
		        $('#deleteUser').text($(this).parent().siblings('.userName').text());
		        $("#deleteUserID").val($(this).siblings('input').val());
	        	  $("#modal").fadeIn(300);
	        	$("#deleteModal").fadeIn(300);
		        });

	        $("#modal, #notDeleteB").on('click',function(){
	        	  $("#modal").fadeOut(300);
	        	  $("#deleteModal").fadeOut(300);
	        	});

	        $("#deleteB").on('click',function(){
		       console.log("삭제");
	        	  $("#userDeleteForm").submit();
	        	});

	     // select change,
  	        $('.filters').on( 'change', function() {
      	        console.log($(this).attr("id"));
      	        console.log($(this).val());
					$("#searchType").val($(this).attr("id"));
					$("#keyword").val($(this).val());
					$(".form-inline").submit();
  	        });

		 }); // $(document).ready End
		 
  
    </script>
</html>