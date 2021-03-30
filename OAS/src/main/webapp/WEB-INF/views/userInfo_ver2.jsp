<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	body{
	font-family: NanumGothic !important; 
	}
      .w3-section{
          display:grid;
            justify-content: stretch;
            grid-template-columns: repeat(2, 1fr);
            grid-column-gap: 10px;
        }
         .info_select {
     	height:40px;
     }
        .w3-black{
          padding:7px 15px;
            margin: 0 0 20px 0;
            float: left;
          position: relative;
          left: 45%;
        }
        
        #infoeditB{
        border-radius: 10px;
    	padding: 5px 15px;
    }
    
    form input,select,button{
    font-weight:600;}
    </style>
    
</head>
<body>


<div class="w3-container">
      
      <div id="id01" class="w3-modal">
        <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
    
          <div class="w3-center"><br>
            <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
          </div>
        
          <div class="w3-container">
          <span class="w3-quarter" style='font-weight:bold;font-size:27px;'>기본정보</span>
          </div>
          
          <form class="w3-container" action="<%=request.getContextPath()%>/admin/info/modify" method="POST">
            <div class="w3-section">
              <div>
              <label>이름</label>
              <input class="w3-input w3-border w3-margin-bottom w3-light-grey" type="text" placeholder="Enter Name" name="userName" id="userName" readonly></div>
              <div>
              <label>학번</label>
              <input class="w3-input w3-border w3-margin-bottom w3-light-grey" type="input" id="studentId" name="studentId" readonly>
              </div>
              <div>
              <label>이메일</label>
              <input class="w3-input w3-border w3-margin-bottom w3-light-grey" type="input" placeholder="Enter a valid email address" name="email" id="email" readonly>
              </div>
              <div>
              <label>핸드폰 번호</label>
              <input class="w3-input w3-border w3-margin-bottom w3-light-grey" type="input" placeholder="Enter your phone" name="phoneNum" id="phoneNum">
              </div>
              
              <div>
			  <label>학부</label> <span style="font-size: 6px"><img id="settingsIcon" alt="profileImg" style= "width: 15px; height: 15px;" src="<%=request.getContextPath()%>/resources/img/settings.png"></span>
				<select id="department"  class="info_select w3-input w3-border w3-margin-bottom w3-light-grey" name="department" onchange="categoryChange(this)">
                </select>
                </div>
                
                <div>
              <label>전공</label>
              <select id="major" class="info_select w3-input w3-border w3-margin-bottom w3-light-grey" type="input" name="major">
				<option>전공</option>
			  </select>
              </div>
              
              <div>
              <label>학년</label>
              <select id="grade" class="info_select w3-input w3-border w3-margin-bottom w3-light-grey" name="grade" onchange="semesterChange(this)">
	            <option value="1" selected>1학년</option>
	            <option value="2">2학년</option>
	            <option value="3">3학년</option>
	            <option value="4">4학년</option>
              </select>
              </div>
              
              <div>
              <label>학기</label>
              <select id="semester" class="info_select w3-input w3-border w3-margin-bottom w3-light-grey" name="semester">
            	<option value="1" selected>학기</option>
            
              </select>
              </div>
              
              
            </div>
            <button id="infoeditB" class="w3-button w3-black" type="submit">수정</button>
          </form>
    
        </div>
      </div>
      <!-- 모달 창 끝 -->
      
    </div>
    <script>
    

	  function userInfo_2(UserId){
		  console.log("userInfo_2 : " + UserId); 
			var userinfo;
			$.ajax({ //user 정보 가져오기
				url : '<%=request.getContextPath()%>/userInformation2',
				type : "get",
				data : {id : UserId},
				async: false,
				success: function(data){
					userinfo = data;
					console.log(userinfo); 
				}
			
			});
			
	        var department = ${department_list};

	        if($("#department").children().length == 0){
				for (var i = 0; i < department.length; i++) {
	        		var selectOption = $("<option value='"+department[i].name+"' selected>"+department[i].name+"</option>");
	        		$("#department").append(selectOption);
	        	}
		    }
	        

			$( 'input#userName' ).val( userinfo[0].userName );
			$( 'input#email' ).val( userinfo[0].email );
			$( 'input#phoneNum' ).val( userinfo[0].phoneNum );
			$( 'input#studentId' ).val( userinfo[0].studentId );
			if(userinfo[0].department != null && userinfo[0].department != "")
				$('#department option[value='+userinfo[0].department+']').prop('selected', 'selected').change();
			$('#major option[value='+userinfo[0].major+']').prop('selected', 'selected').change();
			$('#grade option[value='+userinfo[0].grade+']').prop('selected', 'selected').change();
			$("#semester option[value='"+userinfo[0].semester+"']").prop('selected', 'selected').change();
			
			$('#id01').css("display","block");
		  }//userInfo_2 function end
    
      // Get the modal
      var modal = $('#id01');
           
       window.onclick = function(event) {
        if (event.target == modal) {
        	$('#id01').style.display = "none";
        }
      }
      
    
      var department = ${department_list};
      var major = ${major_list};

      
		function categoryChange(e) {
			for(var i = 0; i< department.length; i++){
				eval("var "+department[i].name +"= new Array();");
			}
			for(var i = 0; i<major.length; i++){
				eval(major[i].department_name+".push('"+major[i].name+"');");
			}

			var target = document.getElementById("major");
		
			for(var i = 0; i<department.length; i++){
				if(i==0){
					eval("if(e.value == '"+department[i].name+"') var d = "+department[i].name+";")
				}
				else eval("if(e.value == '"+department[i].name+"') var d = "+department[i].name+";");
			}
		    
			target.options.length = 0;
		
			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				target.appendChild(opt);
			}	
		}
		
	function semesterChange(e) {
		var first = ["1", "2"];
		var second = ["3", "4"];
		var third = ["5", "6"];
	    var fourth = ["7", "8", "9~"];
	    
		var target = document.getElementById("semester");
	
		if(e.value == "1") var d = first;
		else if(e.value == "2") var d = second;
		else if(e.value == "3") var d = third;
	    else if(e.value == "4") var d = fourth;
	
		target.options.length = 0;
	
		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}	
	}
</script>

</body>
</html>