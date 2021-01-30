<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 입력 </title>

<style>.field_div{border: 1px solid blue;}</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.redCSS{color:red};

</style>

<script type="text/javascript">
	$(document).ready(function () {
		var formInfo = ${form_info};
		var fieldInfo = ${field_list};
		
		//form title & explation 만들기 
		$('#form_title').text(formInfo[0].form_name);
		$('#form_explation').text(formInfo[0].form_detail);
		
		//field 만들기 
		for(var i = 0 ; i < fieldInfo.length; i++){
			
				

				//form 제출시 확인 필요한 필드 클래스 명으로 지정 
				if(fieldInfo[i].field_star == 1){
						var divTitle = $("<div id='field_"+ fieldInfo[i].field_id+"' class='field_div'><h1>"+fieldInfo[i].field_name+"<span class='redCSS'>*</span></h1><input type='hidden' name='field_ids' value='"+fieldInfo[i].field_id+"'><div class='inputDiv checkDiv'></div></div>");
						$("#userForm").append(divTitle);
					}else{
						var divTitle = $("<div id='field_"+ fieldInfo[i].field_id+"' class='field_div'><h1>"+fieldInfo[i].field_name+"</h1><input type='hidden' name='field_ids' value='"+fieldInfo[i].field_id+"'><div class='inputDiv'></div></div>");
						$("#userForm").append(divTitle);
						}

				//아래의 항목의 경우 별도의 옵션 필요
				if(fieldInfo[i].field_type == 'select' || fieldInfo[i].field_type == 'radio' || fieldInfo[i].field_type == 'checkbox'){

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

	            		});//옵션 부르기 끝
	            		
					//console.log(" 옵션 확인 ");
					//console.log(optionlist);

                     if(fieldInfo[i].field_type == 'select'){
	                  		var selectTag = $("<select name='content'></select>");
	                        $("#field_"+ fieldInfo[i].field_id).children("div").append(selectTag);
	                 }

                     for(var idx=0; idx < optionlist.length; idx++){
	                        if(fieldInfo[i].field_type == 'select'){
		                       
	                        		var optionTag = $("<option value='"+optionlist[idx].content+"'>"+optionlist[idx].content+"</option>");
	                        	
	                        		if(optionlist[idx].isDefault == 1)
		                       	 	optionTag.attr("selected",""); //default값 지정 
		                       	 $("#field_"+ fieldInfo[i].field_id).children(".inputDiv").children('select').append(optionTag);
	                      
		                     }else {
			                        var values = optionlist[idx].content
			                        var listTag = $("<label><input type="+fieldInfo[i].field_type+" name='content' value='"+values+"'> "+values+"</label>");
			                        if(optionlist[idx].isDefault == 1)
			                        	$(listTag.children('input')).attr("checked", "checked");

			                        $("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(listTag);
			                        
			                    }
	                   }//option만큼 반복 
	                        

				}else if(fieldInfo[i].field_type == 'textarea'){
						var textTag = $("<textarea name='content'></textarea>");
						
						if(fieldInfo[i].field_star == 1)
							textTag.attr("required", "");
						
						$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(textTag);
		
				}else{
						var inputTag = $("<input type='"+fieldInfo[i].field_type +"' name='content' value=''>");
						
						if(fieldInfo[i].field_star == 1)
							inputTag.attr("required", "");
						
						$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(inputTag);
				}


			}//field 수 만큼 반복 


			 $("#submitB").click(function () {
				console.log("저장 ");
				var is_empty = 0; // 필수 조건 충족 여부 확인 

				//필수 필드 검사 
				$('.checkDiv').each(function(){

					if ( $(this).children().is('input, textarea') && $(this).children().val().length < 1 ) {
						is_empty = 1;
						if($(this).siblings('.redMsg').length < 1) {
							var msg = $("<p class='redCSS redMsg' >필수값입니다.</p>");
							$(this).siblings('h1').after(msg);
						}
			        }else if($(this).children('label').children().is(':checkbox, :radio') && !$(this).children('label').children().is(':checked') ){
			        		is_empty = 1;
						if($(this).siblings('.redMsg').length < 1) {
							var msg = $("<p class='redCSS redMsg' >필수값입니다.</p>");
							$(this).siblings('h1').after(msg);
						}
				   }else{$(this).siblings('.redMsg').remove();}
					
				});//필수 값 검사 

				//필수값이 모두 입력 되었을 때 form submit 처리 
				if(is_empty == 0) {
					
					$(".inputDiv").each(function (){
						//radio,checkbox 가 필수가 아닐때 hidden input(관련 field_id) 지움
						if ($(this).children('label').children().is(':checkbox, :radio') && !$(this).children('label').children().is(':checked') ) {
							$(this).siblings('input[name=field_ids]').remove();
				        };

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
		});//submit 함수 
		
	});//document ready

	

</script>

</head>
<body>
 
<main>

	<div >
		<h1 id="form_title"></h1>
		<h3 id="form_explation"></h3>
	</div>
	
	<div id="fields">
		<form action="submit" id="userForm" method="POST">
			<input type="hidden" name="form_index" value="${form_ID}" >
		</form>
		<button id="submitB">제출하기</button>
	</div>

</main>

</body>
</html>