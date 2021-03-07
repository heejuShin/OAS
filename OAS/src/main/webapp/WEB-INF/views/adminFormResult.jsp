<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/assets/css/formView.css?ver=2">

<style>
		.under_tab {
			list-style: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		/* Float the list items side by side */
		.under_tab li {
			float: left;
		}
		/* Style the links inside the list items */
		.under_tab li a{
			display: inline-block;
			color: black;
			text-align: center;
			text-decoration: none;
			padding: 18px 45px;
			font-size: 17px;
			transition:0.3s;
		}
		
		
		/* Style the tab content */
		.under_tabcontent {
			display: none;
            width: 100%;
			padding: 6px 12px;
		}
		ul.under_tab li.under_current{
			border-radius: 6px 6px 0px 0px;
			background-color: white;
			color: #222;
		}
		.under_tabcontent.under_current {
			display: block;
		}
</style>
<script>
	function replaceAll(str, searchStr, replaceStr) {
	  return str.split(searchStr).join(replaceStr);
	}

	$(document).ready(function () {
		
		var formInfo = ${form_info};
		var fieldInfo = ${field_list};
		var category = ${category_name};
		var date = ${date_list};
		var resultContent = ${read_list};
		var category_isDeleted = ${category_isDeleted};
		
		console.log("step1");
		//form title & explation 만들기 
		console.log("title : " + formInfo[0].form_name);
		$('#form_title').text(formInfo[0].form_name);
		$('#form_explation').text(formInfo[0].form_detail);
		$('#startDate').text(formInfo[0].form_startDate);
		$('#endDate').text(formInfo[0].form_endDate);
		if(category_isDeleted == 0){$('#category_name').text("카테고리 없음");}
		else{$('#category_name').text(category[0].categoryName);}
		$('#regDate').text("제출 일자: " + date[0].regDate);
		if(date[0].editDate != "2000-01-01 00:00:00"){
			$('#editDate').text("마지막 수정 날짜: " + date[0].editDate);
		}else{
			$('#editDate').text("마지막 수정 날짜: "+ date[0].regDate);
		}
		console.log("step2");
		//field 만들기 
		for(var i = 0 ; i < fieldInfo.length; i++){
			console.log("step3");
				//form 제출시 확인 필요한 필드 클래스 명으로 지정 
				if(fieldInfo[i].field_star == 1){
						var divTitle = $("<div id='field_"+ fieldInfo[i].field_id+"' class='wrap-input100 bg1'><p class='label-input100 nameMargin questionP'>Q. "+fieldInfo[i].field_name+"<span class='redCSS'>*</span></p> <input type='hidden' name='field_ids' value='"+fieldInfo[i].field_id+"'><div class='inputDiv checkDiv'></div></div>");
 						$("#fieldInputs").append(divTitle);
 				}else{
						var divTitle = $("<div id='field_"+ fieldInfo[i].field_id+"' class='wrap-input100 bg1'><p class='label-input100 nameMargin questionP'>Q. "+fieldInfo[i].field_name+"</p><input type='hidden' name='field_ids' value='"+fieldInfo[i].field_id+"'><div class='inputDiv'></div></div>");
						$("#fieldInputs").append(divTitle);
					} 
				console.log("step3.5");
				//아래의 항목의 경우 별도의 옵션 필요
				if(fieldInfo[i].field_type == 'select' || fieldInfo[i].field_type == 'radio' || fieldInfo[i].field_type == 'checkbox'){
					console.log("step4");
					var optionlist;
					var fieldID = fieldInfo[i].field_id;
					
					 if(fieldInfo[i].field_type == 'select'){
						 console.log("step5");
						 var selectID = "select" + fieldInfo[i].field_id;
						 $("#field_"+ fieldInfo[i].field_id).children('p').attr("for",selectID);
						 if(resultContent[i].content != ""){
 						  	var selectTag = $("<p id='"+selectID+"' class='label-input100 nameMargin answerP' name='content'>A. "+resultContent[i].content+"</p>");
						 }else{
							 var selectTag = $("<p id='"+selectID+"' class='label-input100 nameMargin answerP' name='content'>선택하지 않음 </p>");
						 }
 							$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(selectTag);
				 	 }else if(fieldInfo[i].field_type == 'checkbox'){
					 	 	//alert(resultContent[i].content);
							var rC_list =replaceAll(resultContent[i].content,"$","/");
							console.log("step5");
							if(resultContent[i].content != ""){
								var listTag = $("<p class='label-input100 nameMargin answerP' name='content'>A. "+rC_list+"</p>");
								
					  		}else{
					  			var listTag = $("<p class='label-input100 nameMargin answerP' name='content'>선택하지 않음 </p>");
					  			//alert(optionlist.length);
					  		}
					  		
							$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(listTag);
							
					  }else if(fieldInfo[i].field_type == 'radio'){
						 	//alert(optionlist[idx].content);
							console.log("step5");
							if(resultContent[i].content == ""){
								var listTag = $("<p class='label-input100 nameMargin answerP' name='content'>선택 안함 </p>");
							}else{
								var listTag = $("<p class='label-input100 nameMargin answerP' name='content'>A. "+resultContent[i].content+"</p>");
							}
							$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(listTag);
							
					  }
					//console.log(" 옵션 확인 ");
					//console.log(optionlist.length);
					console.log(optionlist);
							
				}else if(fieldInfo[i].field_type == 'textarea'){//타입이 textarea일 때 
					if(resultContent[i].content != "")
						var textTag = $("<p class='label-input100 nameMargin answerP' name='content'>A. "+resultContent[i].content+"</p>");
					else
						var textTag = $("<p class='label-input100 nameMargin answerP' name='content'>응답 내역 없음 </p>");
						//alert(resultContent[i].content);
					$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(textTag);
				}else{
						if(fieldInfo[i].field_type == 'text'){//타입이 text일 때 
							if(resultContent[i].content != ""){
								var inputTag = $("<p class= 'label-input100 nameMargin answerP' name='content'>A. "+resultContent[i].content+"</p>");
							}
							else{
								var inputTag = $("<p class= 'label-input100 nameMargin answerP' name='content'>응답 내역 없음 </p>");
							}
							
						}
						else if(fieldInfo[i].field_type == 'file'){//type이 file일때 
							var inputTag = $("<p class= 'input100' type='"+fieldInfo[i].field_type +"' name='content'>"+resultContent[i].content+"</p>");
							if(fieldInfo[i].field_file != ""){
								var downTag = $('<div class="wrap-input100 bg0 text_center marginTop "><button> '+fieldInfo[i].field_file+' 다운 <img src="resources/img/download.png" alt="" style="height: 12px; width: 12px;"></button></div>');
								$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(downTag);
							}else{
								var downTag = $("<p class= 'label-input100 nameMargin answerP' name='content'>제출 내역 없음 </p>");
							}
							inputTag.addClass("fileinput");
						}
						else{//type이 date일때
							if(resultContent[i].content != ""){
								var inputTag = $("<p class= 'label-input100 nameMargin answerP' name='content'>A. "+resultContent[i].content+"</p>");
							}
							else{
								var inputTag = $("<p class= 'label-input100 nameMargin answerP' name='content'>응답 내역 없음 </p>");
							}
						
						}
						
						$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(inputTag);
				}
			}//field 수 만큼 반복
	}); //document ready
	</script>
	<script>
/* 하위 탭 */
$(function() {
	$('ul.under_tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.under_tab li').removeClass('under_current');
		$('.under_tabcontent').removeClass('under_current');
		$(this).addClass('under_current');
		$('#' + activeTab).addClass('under_current');
	})
});
</script>
</head>
<body>
<div class="container-contact100">
		<div class="wrap-contact100">
			<button type="button" class="btn btn-default" data-dismiss="modal" style="position: absolute; top:30px; right: 60px; background: #ddd;">Close</button>
			<form class="contact100-form" action="submit" id="userForm" method="POST">
				<span class="contact100-form-title" id="form_title"></span>

				<div class="wrap-input100 bg0">
					<p class="label-input100 submit_dates">카테고리 : <span id="category_name"></span></p>
					<p class="label-input100 form_explanation"  id="form_explation"></p>
					<p class="label-input100 form_date"> 신청 기간 : <span id="startDate"></span> ~ <span id="endDate"></span></p>
					
					<p class="label-input100 submit_dates"><span id="regDate"></span> / <span id="editDate"></span></p>
				</div>
				
				<div id="fieldInputs"  class="contact100-form">
						<!-- field insert 구역 -->
				</div>
				<div id="submitDiv" class="container-contact100-form-btn form edit button">
					<button class="contact100-form-btn" type="button" data-dismiss="modal"  id="closeModal">
						<span>닫기</span>
					</button>

				</div>
				
			</form>
			
				
			
		</div>
	</div>

				
				
				
</body>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-23581568-13');
</script>
	
</html>
