<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Test Form</title>
	<!--  Form CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/vendor/noui/nouislider.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/css/main.css">
	
	<!-- checkbox CSS -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/style.css">
	
	<!-- Form JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/animsition/js/animsition.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/select2/select2.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/countdowntime/countdowntime.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/noui/nouislider.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	
	
</head>
<body>
	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form" action="submit" id="userForm" method="POST">
				<span class="contact100-form-title"> 2021-1 맥북 신청서 </span>

				<div class="wrap-input100 bg0">
					<p class="label-input100 form_explanation">This is Macbook Applicant Form. HaHaHa. It's test description~~!!</p>
					<p class="label-input100 form_date">신청기간 : 2020-08-21 ~ 2020-09-25</p>
				</div>
				
				<div class="wrap-input100 bg0 text_center">
					<button>
						<span id="form_fileName">맥북 양식 신청서</span> 다운 <img src="<%=request.getContextPath()%>/resources/img/download.png" alt=""
							style="height: 12px; width: 12px;">
					</button>
				</div>
				<input type="hidden" name="form_index" value="1" >
				
				<div id="fieldIputs"  class="contact100-form">

				<!-- input type : text -->
				<div class="wrap-input100 bg1">
					<p class="label-input100">이름을 입력하시오 *</p> 
					<input type="hidden" name='field_ids' value='1'> 
					<div>
					<input class="input100 bottomLine" type="text" name='content'>
					</div>
					
				</div>

				<!-- input type : radio -->
				<div class="wrap-input100 bg1">
					<p class="label-input100">학년을 선택하세요 *</p>
					<input type="hidden" name='field_ids' value='2'>
					 
					<div class="marginTop">
					
						<div class="contact100-form-radio">
							<input class="input-radio100" id="radio1" type="radio"
								name="content" value="1학년"> <label
								class="label-radio100" for="radio1"> 1학년 </label>
						</div>

						<div class="contact100-form-radio">
							<input class="input-radio100" id="radio2" type="radio"
								name="content" value="2학년"> <label
								class="label-radio100" for="radio2"> 2학년 </label>
						</div>

						<div class="contact100-form-radio">
							<input class="input-radio100" id="radio3" type="radio"
								name="content" value="3학년"> <label
								class="label-radio100" for="radio3"> 3학년 </label>
						</div>
						<div class="contact100-form-radio">
							<input class="input-radio100" id="23" type="radio"
								name="content" value="4학년"> <label
								class="label-radio100" for="23"> 4학년 </label>
						</div>
					</div>
				</div>

				<!-- text,data,textarea, file 는 div X -->
				<!-- radio, checkbox, select  div O  -->

				<!-- input type : date -->
				<div class="wrap-input100 bg1">
					<span class="label-input100">수령 가능 날짜를 입력하세요 *</span>
					<input type="hidden" name='field_ids' value='4'>  
					<input class="input100" type="date" name="content">
				</div>

				<!-- input type : checkbox rs1-wrap-input100-->
				<div class="wrap-input100 bg1">
					<span class="label-input100">수강 중인 수업을 입력하세요 *</span>
					<input type="hidden" name='field_ids' value='5'> 
					<div class="marginTop">
						<label class="checkbox-wrap">자바 프로그래밍<input type="checkbox" name="content" value="자바 프로그래밍"> <span class="checkmark"></span></label> 
						<label class="checkbox-wrap">오픈소스 소프트웨어 실습<input type="checkbox" name="content" value="오픈소스 소프트웨어 실습"> <span class="checkmark"></span></label> 
						<label class="checkbox-wrap">C 프로그래밍 실습 <input type="checkbox"> <span class="checkmark" name="content" value="C 프로그래밍 실습"></span></label> 
						<label class="checkbox-wrap">알고리듬 <input type="checkbox" name="content" value="알고리듬"><span class="checkmark"></span></label>
					</div>
				</div>
				<!-- input type : textare -->
				<div class="wrap-input100 bg1">
					<span class="label-input100">맥북 활용 계획을 서술하시오</span>
					<input type="hidden" name='field_ids' value='6'> 
					<textarea class="input100" name="content"></textarea>
				</div>

				<!-- input type : select -->
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100">학기를 선택하세요 *</span>
					<input type="hidden" name='field_ids' value='7'>
					<div class="marginTop">
						<select class="js-select2" name="content">
							<option>1학기</option>
							<option>2학기</option>
							<option>3학기</option>
							<option>4학기</option>
						</select>
						<div class="dropDownSelect2"></div>
					</div>
				</div>

				
				<!-- input type : text -->
				<div class="wrap-input100 bg1">
					<span class="label-input100">학번을 입력하세요</span> 
					<input type="hidden" name='field_ids' value='8'> 
					<input class="input100" type="text" name="content">
				</div>

				<!-- input type : file -->
				<div class="wrap-input100 bg1">
					<span class="label-input100">양식을 다운받아 작성하시오</span> 
					<input type="file" class="input100 fileinput">
				</div>
				</div>

				<!-- input type : submit -->
				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn" id="submitB">
						<span>Submit<i class="fa fa-long-arrow-right m-l-7"
							aria-hidden="true"></i></span>
					</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
$("#submitB").click(function () {
	console.log("저장 ");
	

	$("#userForm").attr("action", "submit");


    $("#userForm").submit(); //제출 

	});//submit 함수 
</script>

<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
</script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	
</html>