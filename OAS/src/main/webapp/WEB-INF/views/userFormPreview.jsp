<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Form Preview</title>
	<!--  Form CSS -->

	
	<script>
	$(document).ready(function () {
		
		var formInfo = ${form_info};
		var fieldInfo = ${field_list};
		var optionList = ${optionList};
		console.log(formInfo);
		//form title & explation 만들기 
		console.log("title : " + formInfo[0].form_name);
		
		$('#form_title').text(formInfo[0].form_name);
		
		$('.form_explanation').text(formInfo[0].form_detail);
		$('#preview_startDate').text(formInfo[0].form_startDate);
		$('#preview_endDate').text(formInfo[0].form_endDate);

		console.log("step2");
		var idx=0;

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
					console.log("optionList="+optionList);

					 if(fieldInfo[i].field_type == 'select'){
						 console.log("step5");
						 var selectID = "select" + fieldInfo[i].field_id;
						 $("#field_"+ fieldInfo[i].field_id).children('p').attr("for",selectID);
 						  var selectTag = $("<select id='"+selectID+"' class='form-control' name='content'></select>");
 							$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(selectTag);
					 }

					 for(var j=0; j < fieldInfo[i].item_count; j++){
						 if(optionList[idx].content==""){
							idx++;
							continue;
						 }
						 console.log("step6");
						 console.log(optionList[idx].content);
								 $("#field_"+ fieldInfo[i].field_id).children(".inputDiv").addClass("marginTop")
							if(fieldInfo[i].field_type == 'select'){
							   
									var optionTag = $("<option value='"+optionList[idx].content+"'>"+optionList[idx].content+"</option>");
								
									if(optionList[idx].isDefault == 1)
										optionTag.attr("selected",""); //default값 지정 
									$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").children('select').append(optionTag);
						  
							 }else if(fieldInfo[i].field_type == 'radio'){
								  
									var values = optionList[idx].content;
									var labelNum = fieldInfo[i].field_id +"-"+ idx;
									
									var listTag = $("<div class='contact100-form-radio'><input id='"+labelNum+"' class='input-radio100' type='"+fieldInfo[i].field_type+"' name='radio_"+fieldInfo[i].field_id+"' value='"+values+"'><label class='label-radio100' for='"+labelNum+"'> "+values+" </label></div>");

									if(optionList[idx].isDefault == 1)
											$(listTag.children('input')).attr("checked", "checked");

									$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(listTag);
									
							  }else if(fieldInfo[i].field_type == 'checkbox'){
								  
										  var values = optionList[idx].content;
									var listTag = $("<label class='checkbox-wrap'> "+values+"<input type='"+fieldInfo[i].field_type+"' name='content' value='"+values+"'><span class='checkmark'></span></label>");

									if(optionList[idx].isDefault == 1)
											$(listTag.children('input')).attr("checked", "checked");

									$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(listTag);
									
							  }
							idx++;
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

			 $('#confirm').on('click', function() {
					console.log("confirm click");
					$("#modal_message").html("설문지 작성이 완료되었습니다.");
					var name = $("#formName").val();
					if(name=="") {
						name= "<span style=\"color:red\">내용없음</span>";
						
						$("#modal_message").html("설문지 작성이 미완료되었습니다.");
					}
				    $("#confirm_title").html(name);
				    var select_category = $("#category_select option:selected").html();
					if ($("#category_select option:selected").val()=="") {
						select_category = "<span style=\"color:red\">내용없음</span>";
						$("#modal_message").html("설문지 작성이 미완료되었습니다.");
						
					}
				    $("#confirm_category").html(select_category);
				    $("#confirm_start").html($("#startDate").val()+ " " + $("#startTime").val());
				    $("#confirm_end").html($("#endDate").val()+ " " + $("#endTime").val());
				    // 모달창 띄우기
				    modal('confirm_modal');
				});


	}); //document ready
	function modal(id) {
	    var zIndex = 9999;
	    var modal = $('#' + id);

		$("#preview_modal").css("display","none");
	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = $('<div>')
	        .css({
	            position: 'fixed',
	            zIndex: zIndex,
	            left: '0px',
	            top: '0px',
	            width: '100%',
	            height: '100%',
	            overflow: 'auto',
	            // 레이어 색갈은 여기서 바꾸면 됨
	            backgroundColor: 'rgba(0,0,0,0.4)'
	        })
	        .appendTo('body');
	
	    modal
	        .css({
	            position: 'fixed',
	            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
	            // 시꺼먼 레이어 보다 한칸 위에 보이기
	            zIndex: zIndex + 1,
	
	            // div center 정렬
	            top: '50%',
	            left: '50%',
	            transform: 'translate(-50%, -50%)',
	            msTransform: 'translate(-50%, -50%)',
	            webkitTransform: 'translate(-50%, -50%)'
	        })
	        .show()
	        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	        .find('.modal_close_btn')
	        .on('click', function() {
	        	
	            bg.remove();
	            modal.hide();
	        });
	}
	</script>
</head>
<body>
	<div class="container-contact100">
		<div class="wrap-contact100">
			
				<input type="hidden" name="form_index" value="${form_ID}" >
				<span class="contact100-form-title" id="form_title"> </span>

				<div class="wrap-input100 bg0">
					<p class="label-input100 form_explanation" ></p>
					<p class="label-input100 form_date">신청기간 : 
						<span id="preview_startDate"></span> ~ <span id="preview_endDate"></span>
					</p>
				</div>
				
				<div id="fieldInputs"  class="contact100-form">
						<!-- field insert 구역 -->
				</div>

				<!-- input type : submit -->
				<div id="submitDiv" class="container-contact100-form-btn form edit button">
					<button class="contact100-form-btn" type="button" id="confirm">
						<span>확인</span>
					</button>
					
					<button class='modal_close_btn cancleB' type='button'><span>취소</span></button>
					
					<!-- <a class='modal_close_btn'>
						<button class='modal_close_btn' type='button'>취소</button>
					</a> -->
				</div>
			
		</div>
	</div>
</body>

	
</html>