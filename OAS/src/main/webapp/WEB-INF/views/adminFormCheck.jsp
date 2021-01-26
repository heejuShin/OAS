<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--

    TemplateMo 546 Sixteen Clothing

    https://templatemo.com/tm-546-sixteen-clothing

    --> 
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/owl.css">

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

        //함수2. 체크박스 헤제시 전체 체크박스 해제
        $("input:checkbox[name=result]").click(function () {

          if($(this).is(":checked") == false){
            $("#allCheck").prop("checked",false);
          }
            
        });

        //함수3. '적용' 버튼 클릭시 함수
        $("button[name='stateB']").click(function () {

          var state = $("select[name=stateName]").val(); // 적용할 state_id

          var result_ids = new Array(); //checkbox의 value를 담는다.

          //체크된 박스의 라인에 존재하는 상태 값 변경
          $("input:checkbox[name=result]:checked").each(function() { 

            $(this).parent().siblings().children("select").val(state).prop("selected",true);
            var test = $(this).val();
            result_ids.push(test);
            //alert("test : "+ test);

          });

          alert(" result_id : " + result_ids + " |  state : " + state +" | length : " + result_ids.length);

          //컨트롤러로 정보 전송(ajax) result_id로 state_id update
          // if(result_ids.length > 0){
          //   var sendData = {"resultIDarray": result_ids, "newState" : state};

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
          // }

          //check box 전체 해제
          $("input[type=checkbox]").prop("checked",false); 
        });

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
 
        });


      });

  
    </script>
 </head>
<body>

	
    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="check.html"><h2>Sixteen <em>Clothing</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="check.html">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="products.html">Our Products</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">About Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact Us</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <!-- Header End -->

	<div style="height: 80px;"></div>

    <!-- main -->
    <main>

      <!-- list start -->
      <div >
        <div>
          <h2>Check</h2>
        </div>
        <div id="controlDiv">
          <select id ="allState" name="stateName">
            <option value="1" selected>대기중</option>
            <option value="2">입금 전</option>
            <option value="3">거절</option>
            <option value="4"> 확인 완료</option>
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
                  <tbody>
                    <tr>
                      <td><input type="checkbox" name="result" value="1" /></td>
                      <td>1</td>
                      <td>홍길동</td>
                      <td>전산전자공학부</td>
                      <td>22011123</td>
                      <td>22011123@handong.edu</td>
                      <td>21.01.13</td>
                      <td>
                        <select name="state">
                          <option value="1">대기중</option>
                          <option value="2">입금 전</option>
                          <option value="3">거절</option>
                          <option value="4" selected> 확인 완료</option>
                        </select>
                      </td>
                    </tr>

                    <tr>
                      <td><input type="checkbox" name="result" value="2"/></td>
                      <td>2</td>
                      <td>김한동</td>
                      <td>글로벌리더십</td>
                      <td>22111122</td>
                      <td>22111122@handong.edu</td>
                      <td>21.01.13</td>
                      <td>
                        <select name="state">
                          <option value="1" selected>대기중</option>
                          <option value="2">입금 전</option>
                          <option value="3">거절</option>
                          <option value="4" selected> 확인 완료</option>
                        </select>
                      </td>
                    </tr>

                    <tr>
                      <td><input type="checkbox" name="result" value="3"/></td>
                      <td>3</td>
                      <td>강나가</td>
                      <td>전산전자공학부</td>
                      <td>21811123</td>
                      <td>21811123@handong.edu</td>
                      <td>21.01.14</td>
                      <td>
                        <select name="state">
                          <option value="1" selected>대기중</option>
                          <option value="2">입금 전</option>
                          <option value="3">거절</option>
                          <option value="4"> 확인 완료</option>
                        </select>
                      </td>
                    </tr>

                    <tr>
                      <td><input type="checkbox" name="result" value="4"/></td>
                      <td>4</td>
                      <td>김가나</td>
                      <td>전산전자공학부</td>
                      <td>21911123</td>
                      <td>21911123@handong.edu</td>
                      <td>21.01.14</td>
                      <td>
                        <select name="state">
                          <option value="1" selected>대기중</option>
                          <option value="2">입금 전</option>
                          <option value="3">거절</option>
                          <option value="4"> 확인 완료</option>
                        </select>
                      </td>
                    </tr>
                  </tbody>
                  <!-- data list End-->

                </table>
              
              </div>
              <!--end of .table-responsive-->

        <p class="p">Demo by George Martsoukos. <a href="http://www.sitepoint.com/responsive-data-tables-comprehensive-list-solutions" target="_blank">See article</a>.</p>
      </div>
      
      
      <!-- list End -->

    
      
    </main>
    <!-- main End -->
    
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="inner-content">
              <p>Copyright &copy; 2020 Sixteen Clothing Co., Ltd.
            
            - Design: <a rel="nofollow noopener" href="https://templatemo.com" target="_blank">TemplateMo</a></p>
            </div>
          </div>
        </div>
      </div>
    </footer>


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>


    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
        if(! cleared[t.id]){                      // function makes it static and global
            cleared[t.id] = 1;  // you could use true and false, but that's more typing
            t.value='';         // with more chance of typos
            t.style.color='#fff';
            }
      }

    </script>
	

</body>
</html>