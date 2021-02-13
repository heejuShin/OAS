<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/adminUserManage.css?ver=2">
	
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
</head>
<body>

	<jsp:include page="/WEB-INF/views/basic/header.jsp" />

	<!-- main -->
    <main>

         <div id="headTitle"><h2>회원 관리</h2></div>
        
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
		                      <th data-priority="6">전공</th>
		                      <th data-priority="7">회원 등급</th>
		                      <th data-priority="8">탈퇴 관리</th>
		                    </tr>
		                  </thead> 
		                  
		                  <!-- user information list -->
		                  <tbody id="userlist"></tbody>

                </table>
              </div><!-- user table End -->
              
              
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

		 for(var i = 0; i < UserInfo.length;i++){
			 var no = i+1;
			 var sectionTag = $('<tr id="user_'+UserInfo[i].id+'"></tr>'); 
			 var userCheck = $('<td><input type="checkbox" name="result" value="'+UserInfo[i].id+'"/></td>');
			 var userNo = $('<td>'+no+'</td>');
			 var userName = $('<td class="userName">'+UserInfo[i].userName+'</td>');
			 var userNumber = $('<td>'+UserInfo[i].userNumber+'</td>');
			 var userEmail = $('<td>'+UserInfo[i].userEmail+'</td>');
			 var studentID = $('<td>'+UserInfo[i].studentID+'</td>');
			 var studentMajor = $('<td>'+UserInfo[i].studentMajor+'</td>');
			 var userLevel = $('<td><input type="radio"  value="2"> 학생<input type="radio"  value="1"> 선생님<input type="radio"  value="0"> 관리자</td>');
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
			 $('#user_'+UserInfo[i].id).children().children('input:radio').attr("name", "userRadio_"+UserInfo[i].id);
			 $('#user_'+UserInfo[i].id).children().children('input:radio[value='+UserInfo[i].userLevel+']').attr("checked","checked");

			 }//user list 만들기 끝

		//함수1. 체크박스 전체 선택 / 해제 함수
	        $("#allCheck").click(function () {

	          if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
	            $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
	          } else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
	            $("input[type=checkbox]").prop("checked",false); 
	          } 
	        });

			 //modal창 열기
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
	            $(this).parent().siblings().children("input:radio").each(function(){
	                if($(this).val() == level){
	                    $(this).prop("checked",true);
	                }else
	                	$(this).prop("checked",false);
	            });
	            
	            var test = $(this).val();
	            user_ids.push(test);
	          });
	          
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
	                        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	                    }
	            });
	          }

	          //check box 전체 해제
	          $("input[type=checkbox]").prop("checked",false); 
	        });

	       

	        //함수4. 개별 level 변경 
	        $("input:radio").on('change',function () {

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
	                        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	                    }
	            });
	 
	        });//함수4. 개별 level 변경 끝 

		 }); // $(document).ready End
		 
  
    </script>
</html>