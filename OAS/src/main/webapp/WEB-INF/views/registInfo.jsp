<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- wschool css -->
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  
    <style>
      .w3-section{
          display:grid;
            justify-content: stretch;
            grid-template-columns: repeat(2, 1fr);
            grid-column-gap: 10px;
        }
        .w3-black{
          padding:7px 15px;
            margin: 0 0 20px 0;
            float: left;
          position: relative;
          left: 45%;
        }
    </style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/basic/header.jsp" />
		<div id="id01" class="contact-form">
        <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
    
          <div class="w3-container">
          <span class="w3-quarter" style='font-weight:bold;font-size:27px;'>기본정보</span>
          </div>
          
          <form class="w3-container" action="regist" method="POST">
            <div class="w3-section">
              <div class="col-lg-12 col-md-12 col-sm-12">
              <label>이름</label>
              <input class="w3-input w3-border w3-margin-bottom w3-light-grey" type="text" value="${user.userName}" name="userName" id="userName" readonly></div>
              <div class="col-lg-12 col-md-12 col-sm-12">
              <label>학번</label>
              <input class="w3-input w3-border w3-margin-bottom w3-light-grey" type="input" id="studentId" name="studentId" >
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12">
              <label>이메일</label>
              <input class="w3-input w3-border w3-margin-bottom w3-light-grey" type="input" value="${user.email}"  name="email" id="email" readonly>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12">
              <label>핸드폰 번호</label>
              <input class="w3-input w3-border w3-margin-bottom w3-light-grey" type="input" placeholder="Enter your phone" name="phoneNum" id="phoneNum">
              </div>
              
              <div class="col-lg-12 col-md-12 col-sm-12">
			  <label>학부</label>
				<select id="department"  class="w3-input w3-border w3-margin-bottom w3-light-grey" name="department" onchange="categoryChange(this)">
                  
                  <option value="전산전자공학부" selected>전산전자공학부</option>
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
                </div>
                
                <div class="col-lg-12 col-md-12 col-sm-12">
              <label>전공</label>
              <select id="major" class="w3-input w3-border w3-margin-bottom w3-light-grey" type="input" name="major">
			      <option value="컴퓨터공학전공" selected>컴퓨터공학전공</option>
                  <option value="전자공학전공">전자공학전공</option>
                  <option value="컴퓨터공학심화전공">컴퓨터공학심화전공</option>
                  <option value="전자공학심화전공">전자공학심화전공</option>
                  <option value="IT전공">IT전공</option>
			  </select>
              </div>
              
              <div class="col-lg-12 col-md-12 col-sm-12">
              <label>학년</label>
              <select id="grade" class="w3-input w3-border w3-margin-bottom w3-light-grey" name="grade" onchange="semesterChange(this)">
	            <option value="1" selected>1학년</option>
	            <option value="2">2학년</option>
	            <option value="3">3학년</option>
	            <option value="4">4학년</option>
              </select>
              </div>
              
              <div class="col-lg-12 col-md-12 col-sm-12">
              <label>학기</label>
              <select id="semester" class="w3-input w3-border w3-margin-bottom w3-light-grey" name="semester">
            	<option value="1" selected>1학기</option>
            
              </select>
              </div>
              
              
            </div >
            <button class="w3-button w3-black" type="submit">확인</button>
          </form>
    
        </div>
      </div>
      
      <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
      
      <script>
    
      // Get the modal
      var modal = $('#id01');
      
		function categoryChange(e) {
			var csee = ["컴퓨터공학전공", "전자공학전공", "컴퓨터공학심화전공", "전자공학심화전공", "IT전공"];
			var life_science = ["생명과학전공"];
			var isll = ["국제지역학전공", "영어전공"];
		    var gls = ["글로벌 리더십학부"];
			var me = ["경영학전공", "경제학전공", " GM전공"];
		    var law = ["한국법전공", "U.S. & International Law 전공"];
			var communication = ["공연영상학전공", "언론정보학전공"];
		    var sese = ["건설공학전공", "도시환경공학전공"];
			var mce = ["기계공학전공", "전자제어공학전공"];
		    var ccd = ["시각디자인전공", "제품디자인전공"];
			var cpsw = ["상담심리학전공", "사회복지학전공"];
		    var geict = ["ICT창업전공", "GE(국제적 기업가정신) 전공", "ICT융합전공"];
			var scce = ["학생설계융합전공", "글로벌융합전공", "글로벌한국학전공", "수학통계전공"];
			var target = document.getElementById("major");
		
			if(e.value == "전산전자공학부") var d = csee;
			else if(e.value == "공간환경시스템공학부") var d = sese;
			else if(e.value == "ICT창업학부") var d = good_c;
		    else if(e.value == "글로벌리더십학부") var d = gls;
			else if(e.value == "경영경제학부") var d = me;
		    else if(e.value == "국제어문학부") var d = isll;
			else if(e.value == "커뮤니케이션학부") var d = communication;
		    else if(e.value == "콘텐츠융합디자인학부") var d = ccd;
			else if(e.value == "상담심리사회복지학부") var d = cpsw;
		    else if(e.value == "법학부") var d = law;
			else if(e.value == "생명과학부") var d = life_science;
		    else if(e.value == "기계제어공학부") var d = mce;
		    else if(e.value == "창의융합교육원") var d = scce;
		    
		
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