<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/adminFormCheck.css?ver=1">

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    

	
	 <script type="text/javascript">
      $(document).ready(function () {
        //함수1. 체크박스 전체 선택 / 해제 함수
        $("#allCheck").click(function () {
          if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
            $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
          } else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
            $("input[type=checkbox]").prop("checked",false); 
          } 
        });
        //함수2. 체크박스 해제시 전체 체크박스 해제
        $("input:checkbox[name=result]").click(function () {
          if($(this).is(":checked") == false){
            $("#allCheck").prop("checked",false);
          }
            
        });
        //함수3. '적용' 버튼 클릭시 함수 (체크된 라인의 상태가 바뀜)
        $("button[name='stateB']").click(function () {
	          var state = $("select[name=stateName]").val(); // 적용할 state_id 
	
	          //체크된 박스의 라인에 존재하는 상태 값 변경
	          $("input:checkbox[name=result]:checked").each(function() { 
	
	            $(this).parent().siblings().children("select").val(state).prop("selected",true);
	          });
	     
	        //check box 전체 해제
	        $("input[type=checkbox]").prop("checked",false); 
        });
        
		//확인 버튼을 눌렀을 때
        $("button[name='stateSubmitB']").click(function () {
        	var result_ids = new Array(); //checkbox의 value를 담는다.
        	var result_states = new Array(); //select의 value를 담는다.
          
           $("input:checkbox[name=result]").each(function() { 
	             var test = $(this).val();
		         result_ids.push(test);
		         var eachState=$(this).parent().siblings().children("select").val();
		         result_states.push(eachState);
           });
           var sendData = {"resultIDarray": result_ids, "stateArray" : result_states};
          //컨트롤러로 정보 전송(ajax) result_id로 state_name update
           $.ajax({
               url: "<%=request.getContextPath()%>/admin/form/update/check",
               type:'POST',
               traditional : true,
               data: sendData,
               success:function(data){
                   console.log(" 변경할 상태정보 전송 완료!");
               },
               error:function(request,status,error){
            	   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               }
       		});
        });
		/*
        //함수4. 개별 상태 변경 select
        $("select[name=state]").on('change',function () {
          var resultID = $(this).parent().siblings().children("input:checkbox").val();
          var newState = $(this).val();
          alert("resultID : " + resultID + ", newState : " + newState);
          //resultID, newState 위와 동일하게 ajax로 전달
          //   var sendData = {"resultIDarray": resultID, "newState" : state};
          //   $.ajax({
          //           url:"",
          //           type:'POST',
          //           data: sendData,
          //           success:function(data){
          //               console.log(" 변경할 상태정보 전송 완료!");
          //           },
          //           error:function(jqXHR, textStatus, errorThrown){
          //               alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
          //           }
          //   });
 
        });*/
      });
    </script>
 </head>
<body>

	<jsp:include page="/WEB-INF/views/basic/header.jsp" />
    <!-- main -->
    <main>
      <!-- list start -->
      <div >
        <div>
          <h2>Check</h2>
        </div>
        
        <div>
	        <div id="controlDiv">
	          <select id ="allState" name="stateName">
	          	<!-- js로 option list 넣기 -->
	          </select>
	          <button name='stateB'>적용</button>
	        </div>
	        
	        <div>
				<label>응답받기</label>
				<input type="checkbox" id="isAvailableCheck" name="isAvailableCheck" value="">
				<input type="hidden" id="isAvailable" name="isAvailable" value="">
			</div>

		<div id="headTitle">
			<h2>[${form_title}] 응답 관리</h2>
		</div>
		<!-- result control  -->
		
      <!-- table -->
              <div class="table-responsive tableDiv" data-pattern="priority-columns">
              
                <table id="checklist" summary="This table shows how to create responsive tables using RWD-Table-Patterns' functionality" class="table table-bordered table-hover">
<!--                   <caption class="text-center"> a responsive table based on RWD-Table-Patterns' <a href="http://gergeo.se/RWD-Table-Patterns/" target="_blank"> solution</a>:</caption>
 -->                  

                  <thead> 
                  <!-- result stop control -->
                  	<tr><th colspan="9">
	                  			<div id="stopControlDiv">
	                  				<input type="checkbox" id="isUserEditCheck" name="isUserEditCheck" value="">
									<label id="stopMsg">응답 중단하기</label>
									<input type="hidden" id="isUserEdit" name="isUserEdit" value="">
								</div>
					</th></tr>
					<!-- column  list -->
                    <tr>
                      <th><input type="checkbox" id="allCheck" /></th>
                      <th data-priority="1">NO</th>
                      <th data-priority="2">이름</th>
                      <th data-priority="3">전공</th>
                      <th data-priority="4">학번</th>
                      <th data-priority="5">이메일</th>
                      <th data-priority="6">제출일</th>
                      <th data-priority="7">상태</th>
                      <th data-priority="8">응답지</th>
                    </tr>
                  </thead> 
                  
                  <!-- column content -->
                  <tbody id="tbodies"><!-- js로 제출자 list 넣기 --></tbody>
                 

                  <tfoot><tr><th colspan="9"><button id="stateSubmitB" name='stateSubmitB'>확인</button></th></tr></tfoot>
                </table>
              
              </div><!--end of .table-responsive-->
              
               <div>
               		<!-- state control  -->
               		<div id="select_control">
			        <div id="controlDiv">
			          <select id ="allState" name="stateName">
			          	<!-- js로 option list 넣기 -->
			          </select>
			          <button id="stateB" name='stateB'>적용</button>
			        </div>
			        </div>
			        
	        		
			</div>
              
              <!-- form view modal -->
            <div id="yourModal" class="w3-modal" style="z-index: 99999; height: 800px; margin-left: 15%; width: 70%; margin-top: 150px; background: white; padding: 0px; top: -15%;">
			<div class="w3-modal-content w3-card-4 ">
				<div class="w3-container">
				</div>
			</div>
			</div>
			
			<div id="modal" class="modal fade" tabindex="-1" role="dialog" style="z-index: 99999; height: 800px; margin-left: 15%; width: 70%; margin-top: 150px;"> <div class="modal-dialog"> <div class="modal-content"> </div> </div> </div>
			<!-- form view modal end-->


<!--         <p class="p">Demo by George Martsoukos. <a href="http://www.sitepoint.com/responsive-data-tables-comprehensive-list-solutions" target="_blank">See article</a>.</p>
 -->   
       
    </main><!-- main End -->
	
	<jsp:include page="/WEB-INF/views/basic/footer.jsp" />

</body>
<script>
               	  //표 동적 생성하는 부분
                  $(document).ready(function () {
                      var submitterList=${submitterList};
                      var stateList=${stateList};
                      var isAvailable=${isAvailable};
                      var form_id=${form_id};
                      
                      if(isAvailable==0){
                  		$("#isAvailableCheck").attr("checked",false);
                		$("#isAvailableCheck").attr("value","0");
                	  }
                      else{

                    	$("#isAvailableCheck").attr("checked",true);
                  		$("#isAvailableCheck").attr("value","1");
                      }
                          
                      for(var x=0; x < stateList.length; x++){
                    	  if(stateList[x].stateName=="대기중"){
                    		  var optionName= $("<option value='"+stateList[x].id+"' selected>"+stateList[x].stateName+"</option>"); 
                        	  $("#allState").append(optionName);
		              	  }
                    	  else{
	                    	  var optionName= $("<option value='"+stateList[x].id+"'>"+stateList[x].stateName+"</option>"); 
	                    	  $("#allState").append(optionName);
                    	  }
                      }
                      
                      //제출자 리스트
                      for(var i=0; i < submitterList.length; i++){
                    	  console.log("here");
	              		    /*사람 별 tr 만듦*/
	              		    var divOne = $("<tr class='here'></tr>"); 
	              		  	$("#tbodies").append(divOne);
	              		  
	              		  	/* tr의 안에 들어갈 td */
	              		    var td1 = $("<td><input type='checkbox' name='result' value='"+submitterList[i].id+"'/></td>"); 
	              		    $($("#tbodies").children()[i]).append(td1);
	              		    
	              		  	
	  
	              		    var td2 = $("<td>"+(i+1)+"</td>"); 
	              		    $($("#tbodies").children()[i]).append(td2);
	
	              		    var td3 = $("<td>"+submitterList[i].userName+"</td>"); 
	              		    $($("#tbodies").children()[i]).append(td3);
	
	              		    var td4 = $("<td>"+submitterList[i].department+"</td>"); 
	              		    $($("#tbodies").children()[i]).append(td4);
	
	              		    var td5 = $("<td>"+submitterList[i].studentId+"</td>"); 
	              		    $($("#tbodies").children()[i]).append(td5);
	              		  	var td6 = $("<td>"+submitterList[i].email+"</td>"); 
	              		    $($("#tbodies").children()[i]).append(td6);
	              			
	              		  	var td7 = $("<td>"+submitterList[i].regDate+"</td>"); 
	              		    $($("#tbodies").children()[i]).append(td7);
	              		    
	              		  	var td8 = $("<td></td>"); 
	              		    $($("#tbodies").children()[i]).append(td8);

	              		    //select
	              		  	var selectInput= $("<select name='state'></select>"); 
	              		    $($($("#tbodies").children()[i]).children()[7]).append(selectInput);
	              		    
	              		    var td9 = $("<td><button onclick=\"document.getElementById('yourModal').style.display='block'\" class=\"modal_open viewFormB\" data-toggle=\"modal\" data-target=\"#yourModal\">개별 보기</button></td>"); 
	              		  	$($("#tbodies").children()[i]).append(td9);
	              		    
	              		    //option
	              		    for(var j=0; j<stateList.length; j++){
		              		    if(stateList[j].stateName=="대기중"){
		              		    	var optionName= $("<option value='"+stateList[j].id+"' selected>"+stateList[j].stateName+"</option>"); 
			              		    $($($($("#tbodies").children()[i]).children()[7]).children()[0]).append(optionName);
			              		}
		              		    else{
	              		    		var optionName= $("<option value='"+stateList[j].id+"'>"+stateList[j].stateName+"</option>"); 
		              		    	$($($($("#tbodies").children()[i]).children()[7]).children()[0]).append(optionName);
		              		    }
				        	}
	                	}

                      $("#isAvailableCheck").change(function(){
                          console.log("userAvailableCheck!!");
                          if($("#isAvailableCheck").is(":checked")){
                              $("#isAvailable").attr("value","1");
                          }else{
                              $("#isAvailable").attr("value","0");
                          }
                          var isAvailable= $("#isAvailable").val();
                          $.ajax({ //해당 폼의 userEdit 바꾸기
              	  			url : '<%=request.getContextPath()%>/admin/form/update/changeAvailable',
              	  			data:{"form_id":form_id,"isAvailable":isAvailable},
	              	  		type:'POST',
	                        traditional : true,
              	  			success: function(){
              	  				console.log("isAvailable Change"); 	
              	  					  		 
              	  			},
              			  	error:function(request, status, error){
              		
              				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              		
              				}
              	  	  	});
                      });
                      $( '.modal_open' ).click( function() {
                    	  //var link =  $(this).siblings(".link").html();
                    	  var link = "2021mac";
			  var id = $(this).siblings(".result_id").val();
                    	  $("#yourModal").load("./form/result/"+link+"/"+id);
                    	} );
                      $( '.modal_close' ).click( function() {
                    	  //var link =  $(this).siblings(".link").html();
                    	  console.log("close");
                    	  var link = "2021mac";
                    	  $("#yourModal").css("display", "none");
                    	} );
			  
		      
		      $(".w3-button").on('click', "#yourModal", function(){
                    	  $("#yourModal").modal("hide");
                    	  alert("버튼 확인 ");
                      });

                  });
                  </script>
</html>
