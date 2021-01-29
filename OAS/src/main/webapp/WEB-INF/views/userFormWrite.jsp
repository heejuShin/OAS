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

<script type="text/javascript">
	$(document).ready(function () {
		var formInfo = ${form_info};
		var fieldInfo = ${field_list};
		
		//form title & explation 만들기 
		$('#form_title').text(formInfo[0].form_name);
		$('#form_explation').text(formInfo[0].form_detail);
		
		//field 만들기 
		for(var i = 0 ; i < fieldInfo.length; i++){
				var divTitle = $("<div id='field_"+ fieldInfo[i].field_id+"' class='field_div'><h1>"+fieldInfo[i].field_name+"</h1><input type='hidden' name='field_ids' value='"+fieldInfo[i].field_id+"'><div>");
				$("#userForm").append(divTitle);

				if(fieldInfo[i].field_type == 'select' || fieldInfo[i].field_type == 'radio' || fieldInfo[i].field_type == 'checkbox'){

					var optionlist;
					var fieldID = fieldInfo[i].field_id;

					//field별 옵션 부르
					$.ajax({
	                    url:'<%=request.getContextPath()%>/getItem',
	                    type:'POST',
	                    data: {fieldID : fieldInfo[i].field_id} ,
	                    dataType : 'json',
	                    async: false,
	                    success:function(data){
		                    optionlist = data;
	                        console.log(" 옵션 가져오기 성공!!");
       
	                    },
	                    error:function(jqXHR, textStatus, errorThrown){
	                        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	                    }

	            });
					console.log(" 옵션 확인 ");
					console.log(optionlist);

                     if(fieldInfo[i].field_type == 'select'){
	                  		var selectTag = $("<select name='content'></select>");
	                        $("#field_"+ fieldInfo[i].field_id).append(selectTag);
	                 }

                     for(var idx=0; idx < optionlist.length; idx++){
	                        if(fieldInfo[i].field_type == 'select'){
		                       
	                        	var optionTag = $("<option value='"+optionlist[idx].content+"'>"+optionlist[idx].content+"</option>");
	                        	
	                        	if(optionlist[idx].isDefault == 1)
		                        	optionTag.attr("selected","");
	                        	
	                        	$($("#field_"+ fieldInfo[i].field_id).children('select')).append(optionTag);
	                      
		                        }else {
			                        var values = optionlist[idx].content
			                        var listTag = $("<label><input type="+fieldInfo[i].field_type+" name='content' value='"+values+"'> "+values+"</label>");
			                        if(optionlist[idx].isDefault == 1)
			                        	$(listTag.children('input')).attr("checked", "checked");

			                        $("#field_"+ fieldInfo[i].field_id).append(listTag);
			                        
			                    }



	                        }//option만큼 반복 
	                        
				
				
					
				}else if(fieldInfo[i].field_type == 'textarea'){
						var textTag = $("<textarea name='content'></textarea>");
						
						if(fieldInfo[i].field_star == 1)
							textTag.attr("required", "");
						
						$("#field_"+ fieldInfo[i].field_id).append(textTag);

						
						
				}else{
						var inputTag = $("<input type='"+fieldInfo[i].field_type +"' name='content'>");
						
						if(fieldInfo[i].field_star == 1)
							inputTag.attr("required", "");
						
						$("#field_"+ fieldInfo[i].field_id).append(inputTag);
				}


			}//field 수 만큼 반복 

			var submitB = $('<input type="submit" value="제출하기">');
			$("#userForm").append(submitB);

			 $("#submitB").click(function () {
				console.log("저장 ");
				/* $("#1page_myForm").attr("action", "portfolio_two");
		          $("#1page_myForm").attr("target", "")*/
		          $("#userForm").submit();

				});
				//submit 함수 

		
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
		
		<button id="submitB">버튼 </button>
	</div>
	

	
	
	
	
</main>


</body>
</html>