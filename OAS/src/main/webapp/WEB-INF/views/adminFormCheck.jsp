<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- 해린 css -->

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<style>
		.tableDiv{
    display: block;
    margin-left: 12%;
    margin-right: 10%;
    width: 75%;
}

#controlDiv{
    display: block;
    width: 75%;
    margin: 2% 10% 2% 12%;
    
    padding: 1% 32% ;
}

/* table css */
h2 {
    text-align: center;
    padding: 20px 0;
}
  
.table-bordered {
    border: 1px solid #ddd !important;
}
  
table caption {
    padding: .5em 0;
}
  
@media screen and (max-width: 767px) {
    table caption {
      display: none;
    }
}
  
.p {
    text-align: center;
    padding-top: 140px;
    font-size: 14px;
}
		
	</style>
	
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


    <!-- main -->
    <main>

      <!-- list start -->
      <div >
        <div>
          <h2>Check</h2>
        </div>
        <div id="controlDiv">
          <select id ="allState" name="stateName">
          	<!-- js로 option list 넣기 -->
          </select>
          <button name='stateB'>적용</button>
        </div>
        

        <!-- <div class="container">
          <div class="row">
            <div class="col-xs-12"> -->
              <div class="table-responsive tableDiv" data-pattern="priority-columns">
              
                <table id="checklist" summary="This table shows how to create responsive tables using RWD-Table-Patterns' functionality" class="table table-bordered table-hover">
                  <caption class="text-center">An example of a responsive table based on RWD-Table-Patterns' <a href="http://gergeo.se/RWD-Table-Patterns/" target="_blank"> solution</a>:</caption>
                  
                  <!-- column name list -->
                  <thead> 
                    <tr>
                      <th><input type="checkbox" id="allCheck" /></th>
                      <th data-priority="1">NO</th>
                      <th data-priority="2">이름</th>
                      <th data-priority="3">전공</th>
                      <th data-priority="4">학번</th>
                      <th data-priority="5">이메일</th>
                      <th data-priority="6">제출일</th>
                      <th data-priority="7">상태</th>
                    </tr>
                  </thead> 

                  <!-- data list -->

                  <!-- Submit check box's value && select option's value -->

                  <!-- Value RULE -->
                  <!-- checkbox:value = T:result(id) -->
                  <!-- select:option:value == T:state(id) -->
                  <!-- [selected] select:option:value == T:result(state_id) -->

                  <!-- Name RULE -->
                  <!-- All checkbox name same, All select name same -->
                  
                  <tbody id="tbodies">
                  <!-- js로 제출자 list 넣기 -->
                    
                  </tbody>
                  <!-- data list End-->
                  
                  <script>
               	  //표 동적 생성하는 부분
                  $(document).ready(function () {

                      var submitterList=${submitterList};
                      var stateList=${stateList};

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
                  });
                  </script>
                  
                  <tfoot>
			        <tr>
			            <th colspan="8"><button name='stateSubmitB'>확인</button></th>
			        </tr>
			    </tfoot>

                </table>
              
              </div>
              <!--end of .table-responsive-->

        <p class="p">Demo by George Martsoukos. <a href="http://www.sitepoint.com/responsive-data-tables-comprehensive-list-solutions" target="_blank">See article</a>.</p>
      </div>
      
      
      <!-- list End -->

    
      
    </main>
    <!-- main End -->


    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="<%=request.getContextPath()%>/resources/assets/js/custom.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/owl.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/slick.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/isotope.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/accordions.js"></script>

	

</body>
</html>