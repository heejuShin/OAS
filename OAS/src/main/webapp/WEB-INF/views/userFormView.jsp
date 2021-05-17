<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User View Form</title>

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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/css/main.css?ver=1">
	
	<!-- checkbox CSS -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/style.css">
	
	<!-- Form JS -->
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/animsition/js/animsition.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/countdowntime/countdowntime.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/vendor/noui/nouislider.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
   
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/css/formView.css?ver=2">
	
	<style type="text/css">
  	@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
 	
 	*{
 		font-family: 'NanumSquare', sans-serif !important;
 		font-style:normal;
 		font-weight:normal;
 	}
 	</style>

</head>
<body>
<!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form" action="submit" id="userForm" method="POST">
				<span>신청이 완료된 폼입니다.</span>
				<input type="hidden" name="csrfToken" value="${sessionScope.CSRF_TOKEN}" />
				<span class="contact100-form-title" id="form_title"></span>

				<div class="wrap-input100 bg0">
					<p class="label-input100 form_explanation" ></p>
					<p class="label-input100 form_date"> 신청 기간 : <span id="startDate"></span> ~ <span id="endDate"></span></p>
					
					<p class="label-input100 submit_dates"> 제출 일자 : <span id="submitDate"></span> / 수정 일자 : <span id="editDate"></span></p>
				</div>
				
				<div id="fieldInputs"  class="contact100-form">
						<!-- field insert 구역 -->
						
				</div>
			</form>
			
				<!-- home button -->
				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn" id="submitB" onclick="location.href='<%=request.getContextPath()%>/'">
						<span>메인 페이지로</span>
					</button>
				</div>
			
		</div>
	</div>
	
</body>

<script>
	$(document).ready(function () {

			
		
		var formInfo = ${form_info};
		var fieldInfo = ${field_list};

		console.log("step1");
		console.log("title : " + formInfo[0].form_name);
		
		$('#form_title').text(formInfo[0].form_name);
		$('.form_explanation').html(formInfo[0].form_detail);
		$('#startDate').text(moment(formInfo[0].form_startDate).format('YYYY.MM.DD HH:mm'));
		$('#endDate').text(moment(formInfo[0].form_endDate).format('YYYY.MM.DD HH:mm'));

		$('#submitDate').text(formInfo[0].form_submitDate);
		if(formInfo[0].form_editDate != "2000-01-01 00:00:00"){
			$('#editDate').text(formInfo[0].form_editDate);
		}else{
			$('#editDate').text(formInfo[0].form_submitDate);
		}
		
/* 		$('#editDate').text(formInfo[0].form_editDate);
 */
		console.log("step2");

		for(var i = 0 ; i < fieldInfo.length; i++){

			var divTitle = $('<div id="result_'+i+'" class="wrap-input100 bg1"></div>');
			$("#fieldInputs").append(divTitle);

			var questionBox;

			if(fieldInfo[i].field_star == 1)
				questionBox = $('<p class="label-input100 nameMargin questionP">Q. '+fieldInfo[i].field_name+'<span class="redCSS">*</span></p>');
			else
				questionBox = $('<p class="label-input100 nameMargin questionP">Q. '+fieldInfo[i].field_name+'</p>');

			$("#fieldInputs").children("#result_"+i).append(questionBox);

			if(fieldInfo[i].field_content == "")
				var answerBox = $('<p class="label-input100 nameMargin answerP">응답 없음</p>')
			else{
				var result_content = fieldInfo[i].field_content;
				console.log("field_content : " + result_content);


				if(fieldInfo[i].field_type == "checkbox" && result_content.indexOf("$") != -1 ){ //checkbox type이고 답이 복수 일 때
					result_content = result_content.slice(0,-1); //마지막 $ 삭제
					result_content = result_content.split("$").join(" / "); // $를 /로 대체
				}
				
				if(fieldInfo[i].field_type == "file"){
					var answerBox = $('<div class="wrap-input100 bg0 text_center marginTop "><button> '+fieldInfo[i].field_file+' 다운 <img src="resources/img/download.png" alt="" style="height: 12px; width: 12px;"></button></div>');
					console.log("field_file : " + fieldInfo[i].field_file);
				}
				else{			var answerBox = $('<p class="label-input100 nameMargin answerP">A. '+result_content+'</p>')
}
			}
			
			$("#fieldInputs").children("#result_"+i).append(answerBox);	
			}

	}); //document ready
	</script>
</html>