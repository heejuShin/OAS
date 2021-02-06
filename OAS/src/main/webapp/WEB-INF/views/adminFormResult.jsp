<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Additional CSS Files -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/fontawesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/owl.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" /> <!-- div 크기 조정 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> <!-- 카테고리 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/form.css?a">

<!-- js -->
<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Additional Scripts -->
<script src="<%=request.getContextPath()%>/resources/assets/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/owl.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/slick.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/isotope.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/accordions.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/formCreate.js?adf"></script>
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
	$(document).ready(function () {
		
		var formInfo = ${form_info};
		var fieldInfo = ${field_list};
		var category = ${category_name};
		var date = ${date_list};
		var resultContent = ${read_list};
		
		console.log("step1");
		//form title & explation 만들기 
		console.log("title : " + formInfo[0].form_name);

		$('#form_title').text(formInfo[0].form_name);
		$('#form_explation').text(formInfo[0].form_detail);
		$('#startDate').text(formInfo[0].form_startDate);
		$('#endDate').text(formInfo[0].form_endDate);
		$('#category_name').text(category[0].categoryName);
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
 						  var selectTag = $("<select id='"+selectID+"' class='form-control' name='content' disabled></select>");
 							$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(selectTag);
					 }
					 for(var idx=0; idx < optionlist.length; idx++){
						 console.log("step6");
						 
								 $("#field_"+ fieldInfo[i].field_id).children(".inputDiv").addClass("marginTop")
							if(fieldInfo[i].field_type == 'select'){
								
									if(optionlist[idx].content == resultContent[i].content){
										var optionTag = $("<option value='"+optionlist[idx].content+"' selected>"+optionlist[idx].content+"</option>");
										//alert(optionlist[idx].content); 
									}else{
										var optionTag = $("<option value='"+optionlist[idx].content+"' >"+optionlist[idx].content+"</option>");
									}
									$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").children('select').append(optionTag);
						  
							 }else if(fieldInfo[i].field_type == 'radio'){
								 	//alert(optionlist[idx].content);
									var values = optionlist[idx].content;
									var labelNum = fieldInfo[i].field_id +"-"+ idx;
									
									if(values == resultContent[i].content){
										var listTag = $("<div class='contact100-form-radio'><input id='"+labelNum+"' class='input-radio100' type='"+fieldInfo[i].field_type+"' name='content' value='"+values+"' checked disabled><label class='label-radio100' for='"+labelNum+"'> "+values+" </label></div>");
									}else{
										var listTag = $("<div class='contact100-form-radio'><input id='"+labelNum+"' class='input-radio100' type='"+fieldInfo[i].field_type+"' name='content' value='"+values+"' disabled><label class='label-radio100' for='"+labelNum+"'> "+values+" </label></div>");
									}
									$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(listTag);
									
							  }else if(fieldInfo[i].field_type == 'checkbox'){
								  
									var values = optionlist[idx].content;
									if(values == resultContent[i].content){
										var listTag = $("<label class='checkbox-wrap'> "+values+"<input type='"+fieldInfo[i].field_type+"' name='content' value='"+values+"' checked disabled><span class='checkmark'></span></label>");
							  		}else{
							  			var listTag = $("<label class='checkbox-wrap'> "+values+"<input type='"+fieldInfo[i].field_type+"' name='content' value='"+values+"' disabled><span class='checkmark'></span></label>");
							  		}
									$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(listTag);
									
							  }
					   }//option만큼 반복 
							
					 
				}else if(fieldInfo[i].field_type == 'textarea'){
						var textTag = $("<textarea class='input100' name='content' readonly>"+resultContent[i].content+"</textarea>");
						//alert(resultContent[i].content);
						$("#field_"+ fieldInfo[i].field_id).children(".inputDiv").append(textTag);
				}else{
						var inputTag = $("<input class= 'input100' type='"+fieldInfo[i].field_type +"' name='content' value='"+resultContent[i].content+"' readonly>");
					//alert(resultContent[i].content);
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
<script> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
</script>
</head>
<body>

	<ul class="under_tab">
		<li class="under_current" data-tab="under_tab1"><a href="#">상태체크</a></li>
		<li data-tab="under_tab2"><a href="#">개별보기</a></li>
	</ul>
	
	<div id="under_tab1" class="under_tabcontent">
		<jsp:include page="/WEB-INF/views/adminFormCheck.jsp" />
	</div>
	
	<div id="under_tab2" class="under_tabcontent under_current">
		<form id='userForm'>
		  <div id="form_div">		
		    <div class="form view title">
          		<h5 id='category_name' style="float: right"></h5>
          		<h2 id="form_title" style="margin-top: 0px"></h2>
			<h5 id="form_date" style="background: white; padding: 5px 0px; width: 70%; border-radius: 2px; padding-left: 5px;"><span id="startDate"></span>~<span id="endDate"></span></h5>
			<p id="form_explation"></p>
      		    </div>
		 	<div class="form view field" id="date" style="height: 120px;">        
			    <p id="regDate"></p><br>
			    <p id="editDate"></p>
			</div>
			</div>
			</form>
			</div>
	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form" id="userForm" method="POST">
				<input type="hidden" name="form_index" value="${form_ID}" >
				<span class="contact100-form-title" id="form_title"> </span>

				<div class="wrap-input100 bg0">
					<p class="label-input100 form_explanation" ></p>
				</div>
				
				<div id="fieldInputs"  class="contact100-form">
						<!-- field insert 구역 -->
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
