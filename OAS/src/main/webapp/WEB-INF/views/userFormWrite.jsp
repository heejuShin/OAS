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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/css/main.css?ver=3">
	
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
   
	<!-- select CSS & JS-->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  	<style>	
  		@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
 	 	* {font-family: 'NanumSquare', sans-serif !important;}   
	</style>

	
	<script>
	$(document).ready(function () {
		
		var formInfo = ${form_info};
		var fieldInfo = ${field_list};
		
		console.log("step1");
		//form title & explation 만들기 
		console.log("title : " + formInfo[0].form_name);
		
		$('#form_title').text(formInfo[0].form_name);
		$('.form_explanation').text(formInfo[0].form_detail);
		$('#startDate').text(moment(formInfo[0].form_startDate).format('YYYY.MM.DD HH:mm'));
		$('#endDate').text(moment(formInfo[0].form_endDate).format('YYYY.MM.DD HH:mm'));

		console.log("step2");

		//field 만들기 
		for(var i = 0 ; i < fieldInfo.length; i++){
			console.log("step3");

				//form 제출시 확인 필요한 필드 클래스 명으로 지정 
				if(fieldInfo[i].field_star == 1){
						var divTitle = $("<div id='field_"+ fieldInfo[i].field_id+"' class='wrap-input100 bg1'><p class='label-input100 nameMargin'>"+fieldInfo[i].field_name+" <span class='redCSS'>*</span></p> <input type='hidden' name='field_ids' value='"+fieldInfo[i].field_id+"'><div class='inputDiv checkDiv'></div></div>");
 						$("#fieldInputs").append(divTitle);
 				}else{
						var divTitle = $("<div id='field_"+ fieldInfo[i].field_id+"' class='wrap-input100 bg1'><p class='label-input100 nameMargin'>"+fieldInfo[i].field_name+" </p><input type='hidden' name='field_ids' value='"+fieldInfo[i].field_id+"'><div class='inputDiv'></div></div>");
						$("#fieldInputs").append(divTitle);
					} 

				console.log("step3.5");
				//아래의 항목의 경우 별도의 옵션 필요
				if(fieldInfo[i].field_type == 'select' || fieldInfo[i].field_type == 'radio' || fieldInfo[i].field_type == 'checkbox'){
					console.log("step4");
					var optionlist;
					var fieldID = fieldInfo[i].field_id;

					//field별 옵션 호출 
					 $.ajax({
						url:'<%=request.getContextPath()%>/getItem',
						type:'POST',
						data: {fieldID : fieldInfo[i].field_id} ,
						dataType : 'json',
						async: false,
						success:function(data){
							optionlist = data;
						},
						error:function(jqXHR, textStatus, errorThrown){
							alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
						}

						}); //옵션 부르기 끝
						
					//console.log(" 옵션 확인 ");
					//console.log(optionlist);

					 if(fieldInfo[i].field_type == 'select'){
						 console.log("step5");
						 var selectID = "select" + fieldInfo[i].field_id;
						 $("#field_"+ fieldInfo[i].field_id).children('p').attr("for",selectID);
 						  var selectTag = $("<select id='"+selectID+"' class='form-control' name='content'></select>");
 							$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(selectTag);
					 }

					 for(var idx=0; idx < optionlist.length; idx++){
						 console.log("step6");
						 
								 $("#field_"+ fieldInfo[i].field_id).children(".inputDiv").addClass("marginTop")
							if(fieldInfo[i].field_type == 'select'){
							   
									var optionTag = $("<option value='"+optionlist[idx].content+"'>"+optionlist[idx].content+"</option>");
								
									if(optionlist[idx].isDefault == 1)
										optionTag.attr("selected",""); //default값 지정 
									$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").children('select').append(optionTag);
						  
							 }else if(fieldInfo[i].field_type == 'radio'){
								  
									var values = optionlist[idx].content;
									var labelNum = fieldInfo[i].field_id +"-"+ idx;
									
									var listTag = $("<div class='contact100-form-radio'><input id='"+labelNum+"' class='input-radio100' type='"+fieldInfo[i].field_type+"' name='radio_"+fieldInfo[i].field_id+"' value='"+values+"'><label class='label-radio100' for='"+labelNum+"'> "+values+" </label></div>");

									if(optionlist[idx].isDefault == 1)
											$(listTag.children('input')).attr("checked", "checked");

									$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(listTag);
									
							  }else if(fieldInfo[i].field_type == 'checkbox'){
								  
										  var values = optionlist[idx].content;
									var listTag = $("<label class='checkbox-wrap'> "+values+"<input type='"+fieldInfo[i].field_type+"' name='content' value='"+values+"'><span class='checkmark'></span></label>");

									if(optionlist[idx].isDefault == 1)
											$(listTag.children('input')).attr("checked", "checked");

									$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(listTag);
									
							  }
					   }//option만큼 반복 
							
					 
				}else if(fieldInfo[i].field_type == 'textarea'){
						var textTag = $("<textarea class='input100' name='content'></textarea>");
						$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(textTag);

				}else{
						var inputTag = $("<input class= 'input100' type='"+fieldInfo[i].field_type +"' name='content'>");

						if(fieldInfo[i].field_type == 'text')
							inputTag.addClass("bottomLine");
						else if(fieldInfo[i].field_type == 'file'){
							if(fieldInfo[i].field_file){
								var downTag = $('<div class="wrap-input100 bg0 text_center marginTop "><button> '+fieldInfo[i].field_file+' 다운 <img src="resources/img/download.png" alt="" style="height: 12px; width: 12px;"></button></div>');
								$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(downTag);
							}
							inputTag.addClass("fileinput");
						}
						
						$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(inputTag);
				}

			}//field 수 만큼 반복



			 $("#submitB").on('click', function () {
					console.log("저장 ");
					var is_empty = 0; // 필수 조건 충족 여부 확인 

					//필수 필드 검사 
					$('.checkDiv').each(function(){

						if ( $(this).children().is('input, textarea') && $(this).children().val().length < 1 ) {
							is_empty = 1;
							if($(this).siblings('.redMsg').length < 1) {
								var msg = $("<p class='redCSS redMsg' >필수값입니다.</p>");
								$(this).after(msg);
							}
				        }else if($(this).children('label').children().is(':checkbox') && $(this).children('label').children().is(':checked') < 1){
				        		is_empty = 1;
							if($(this).siblings('.redMsg').length < 1) {
								var msg = $("<p class='redCSS redMsg' >필수값입니다.</p>");
								$(this).after(msg);
							}
					   }else if($(this).children('div').children().is(':radio') && $(this).children('div').children().is(':checked')< 1 ){
			        		is_empty = 1;
						if($(this).siblings('.redMsg').length < 1) {
							var msg = $("<p class='redCSS redMsg' >필수값입니다.</p>");
							$(this).after(msg);
						}
				   }else{$(this).siblings('.redMsg').remove();}
						
					});//필수 필드 검사 끝

					//필수값이 모두 입력 되었을 때 form submit 처리 
					if(is_empty == 0) {
						
						$(".inputDiv").each(function (){
							//radio,checkbox 가 필수가 아닐때 hidden input(관련 field_id) 지움
							if ($(this).children('div').children().is(':radio') && $(this).children('div').children().is(':checked') < 1 ) {
								$(this).append('<input type="hidden" name="content" value="">');
					        }else if($(this).children('label').children().is(':checkbox') && $(this).children('label').children().is(':checked') < 1) {
					        	$(this).children('label').children('input:checkbox').attr("name", "removeI");
					        	$(this).append('<input type="hidden" name="content" value="">');
					        }else if($(this).children('div').children().is(':radio') && $(this).children('div').children().is(':checked') == 1 ) {
					        	$(this).children('div').children('input:radio').each(function (){
						        	if($(this).is(':checked')){
							        	var newInput = $('<textarea name="content" style="display:none;">'+$(this).val()+'</textarea>');
							        	$(this).append(newInput);
							        	}
							        
					        	});
						        }

					        

							//checkbox value $로 엮기
							if($(this).children('label').children("input:checkbox[name=content]:checked").length > 0){
								//checkbox value 문자열 생성 
								var newContent = "";
								$(this).children('label').children("input:checkbox[name=content]:checked").each(function(){
									newContent += $(this).val() ;
									newContent += "$";
								});

								$(this).children('label').children("input:checkbox").attr("name", "");
								var newTag = $("<textarea name='content' style='display: none;'>"+newContent+"</textarea>");
								$(this).append(newTag);
							}
						}); // checkbox 또는 radio 검사 

			        	$("#userForm").submit(); //제출 
				}//필수값이 모두 입력 되었을 때 끝 
					
				
			});//submitB 함수 끝


	}); //document ready
	</script>
</head>
	
<jsp:include page="/WEB-INF/views/basic/header.jsp" />
	
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
			<form class="contact100-form" action="../submit" id="userForm" method="POST">
				<input type="hidden" name="form_index" value="${form_ID}" >
				<span class="contact100-form-title" id="form_title"> </span>

				<div class="wrap-input100 bg0">
					<p class="label-input100 form_explanation" ></p>
					<p class="label-input100 form_date">신청기간 : <span id="startDate"></span> ~ <span id="endDate"></span></p>
				</div>
				
				<div id="fieldInputs"  class="contact100-form">
						<!-- field insert 구역 -->
				</div>
				
				<div class="wrap-input100 button rs1-wrap-input100 formbts">
					<button class="contact100-form-btn" type="button" id="mypageB" onclick="location.href='<%=request.getContextPath()%>/'" >
						<span>설문 작성 취소</span>
					</button>
				</div>
				<!-- input type : submit -->
				<div class="wrap-input100 button rs1-wrap-input100 formbts">
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
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	
</html>
