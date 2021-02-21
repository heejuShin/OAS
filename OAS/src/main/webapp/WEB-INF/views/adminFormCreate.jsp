
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Form</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" /> <!-- div 크기 조정 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> <!-- 카테고리 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" /> <!-- 상태 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/form.css?ver=5">

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

  
	<jsp:include page="/WEB-INF/views/basic/header.jsp" /> 

    <!--body-->
    
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
	
	<script src="<%=request.getContextPath()%>/resources/assets/js/formCreate.js?ver=13"></script>
	<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <!-- resizable -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- 카테고리 관련 CDN -->
	<script	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<!-- select2 javascript cdn -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>

	<!-- momment -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    
    <div class="container-contact100">
    
		<div class="wrap-contact100" style="padding : 62px 100px 90px 100px">
		<div id="menu-bar" style="cursor: pointer;"><p id="add_p">+</p></div>
				<form id="cseeForm" action="formCreate" class="contact100-form" method="post" modelattribute="form" onsubmit="return isValidForm()">
					<span class="contact100-form-title">
						설문 만들기
					</span>
					
      

          
          <div class="wrap-input100 bg1 rs1-wrap-input100">
							
			<select class="form-control select2-hidden-accessible InputFonts" id="category_select" name="category_id" required="" tabindex="-1" aria-hidden="true">
				<option value="" selected="" disabled="">카테고리 선택</option>
				<input name="categoryNum" value="3" type="hidden">
			</select>
 		</div>


			<div class="wrap-input100  bg1 rs1-wrap-input100" >
					<input class="input100 InputFonts" type="text" id="formName" name="formName" placeholder="제목을 입력해주세요" value="" required="">
			</div>
			
			<div class="wrap-input100  bg1 rs1-wrap-input100" >
				<p class="label-input100">신청 시작일</p>
				<input class="input100" style="margin-top: 10px" id="startDate" name="startDate" type="date" value="" required/> <input id="startTime" class="input100" name="startTime" type="time" value="10:00" required/>
			</div>
			
			<div class="wrap-input100  bg1 rs1-wrap-input100" >
				<p class="label-input100">신청 마감일</p>
				<input class="input100" id="endDate" name="endDate" type="date" value="" required/> <input id="endTime" class="input100" name="endTime" type="time" value="23:00" required/>
			</div>
			
			<div class="wrap-input100  bg1" >
				<textarea class="input100 InputFonts"  name="explanation" placeholder="설문지 설명"></textarea>
			</div>
			
			<div class="wrap-input100  bg1" >
				<p class="label-input100" style="margin-bottom:5px">상태 선택<span class="essential"> * </span></p>
				<select style="width: 650px; border:none;" id="state" multiple="multiple" style="width: 450px" class="form-state">
  
			    </select>
			</div>

			 				<input name="plusPoint" type="hidden" value="0"/> <!-- type="number" --> 
			 				<input name="isUserEdit" type="hidden" value="0"/> <!-- type="number" --> 
              				<input name="minusPoint" type="hidden" value="0"/> <!-- type="number" --> 

			<input type="hidden" id="state_selected" name="state" style="width:1000px;"/>
			
              				<input type="hidden" id="count" name="count" value="0"/>
			
			<div id="list" style="width: inherit;">
			
			</div> 
			
			<div id="submitDiv" class="wrap-input100 button rs1-wrap-input100 formbts">
					<button class="contact100-form-btn" type="button" id="mypageB" onclick="location.href='<%=request.getContextPath()%>/admin/mypage'" >
						<span>설문 만들기 취소</span>
					</button>
				</div>
			<!-- input type : submit -->
				<div id="submitDiv" class="wrap-input100 button rs1-wrap-input100 formbts">
					<button class="contact100-form-btn" type="button" id="preview">
						<span>확인</span>
					</button>
				</div>
				
			

          <div class="form edit button" style="display: none;"><!--UPDATE시 사용 예정 -->
            <button type="button" class="edit">수정</button>
            <button type="button" class="cancle">취소</button>
          </div>
         
        <script>
        	const randomString = Math.random().toString(36).slice(2);
        </script>

        <div id="confirm_modal">
	        <h4 id="modal_message">설문지 작성이 완료되었습니다.</h4>
	        <p>
	        <span class="modal_title">제목 : </span><span id="confirm_title" class="modal_content"></span><br>
	        <span class="modal_title">분류 : </span><span id="confirm_category" class="modal_content"></span><br>
	        <span class="modal_title">기간 : </span><span id="confirm_start" class="modal_content"></span> - <span id="confirm_end" class="modal_content"></span> <br>
<!-- 	        <span class="modal_title">링크 : </span><input id="link" style="text-transform:uppsercase;" class="modal_content" type="text" name="url" placeholder="사용할 폼 주소 url을 입력해주세요."/>
 -->	    <span class="modal_title">링크 : </span><input id="link" style="text-transform:uppsercase;" class="modal_content" type="text" onfocus="this.value= randomString;" name="url" placeholder="사용할 폼 주소 url을 입력해주세요."/>
	        
	        <button id="red_ck_link" type="button">중복 확인</button>
	        <span id="link_dup_txt" style="margin-left: 10px;"></span><br>
	        </p>
	        <div id="modal_buttons">
	        	<button type="submit" id="form_submit" class="submit modal_bts">확인</button>
	        	<button type="button" class="modal_bts modal_close_btn">취소</button>
	        </div>
	        
    	</div>
    	
    	
      </form>
      	</div>
	</div>
	
		<div id="preview_modal">
	        
    	</div>

      <div class="add" id="field_add">
        <div class="wrap-input100 bg0 form edit field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          			<button type="button" class="remove minusB">-</button>
					
					<input type="hidden" name="isEssential3" class="isEssential" value="0">
					<input type="hidden" class="index" value="3">
					<input type="hidden" class="count" id="count?" name="count3" value="0">		
					<input type="hidden" class="isFieldOri" name="isFieldOri?" value="0"/>
					<input class="field_title input1002 bg1 " name="f_title3" placeholder="질문을 입력해주세요.">
					
						<select class="field_type  " name="f_type3" style="clear:both"> <!-- TODO required -->
						  <option value="" selected="" disabled="">질문유형</option>
						  <option value="text">단답형</option>
						  <option value="textarea">장문형</option>
						  <option value="radio">객관식</option>
						  <option value="checkbox">체크박스</option>
						  <option value="select">드롭다운</option>
						  <option value="file">파일업로드</option>
						  <option value="date">날짜</option>
						  <option value="time">시간</option>
						  <!-- 직선단계, 객관식 그리드, 체크박스 그리드-->
						</select>
						
						

						<div style="float: right;">
						<input type="checkbox" class="isEssential_fake" name="isEssential_fake">
						<label for="필수질문">필수</label>
						</div>
	
						<div class="content"></div>
						
						<div style="margin-top: 10px;">
							<label  class="addFieldFileLabel">첨부 파일 추가 : </label>
							<input class="addFieldFile"  type="file">
						</div>
						<div style="clear: both;"></div>
						
        </div>
      </div>

    <div class="add" id="radio_add">
      <div>
        <input class="radio_fake" type="radio" disabled><label class="item" for=""></label></input><button type="button" class="remove_item optionCancleB">X</button>
        <input class="radio_real" type="hidden" name="?content?" value=""/>
      	<input class="isItemOri" type="hidden" name="?isItemOri?" value="0"/>
      </div>
    </div>

    <div class="add" id="chxbox_add">
      <div>
        <input class="checkbox_fake" type="checkbox" disabled><label class="item" for=""></label></input><button type="button" class="remove_item optionCancleB">X</button>
     	<input class="checkbox_real" type="hidden" name="?content?" value=""/>
      	<input class="isItemOri" type="hidden" name="?isItemOri?" value="0"/>
      </div>
    </div>

   <div class="add" id="select_add">
        <option class="option_fake" value=""/>
    </div>
    
    <div class="add" id="select_value_add">
    	<input class="option_real" type="hidden" name="?content?" value=""/>
    </div>
   

  </body>

    <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
    
<script>

	var state_list = ${state_list};
	for (var i = 0; i < state_list.length; i++) {
		var selectOption = $("<option id='"+state_list[i].stateName+"' selected=\"selected\" value='"+state_list[i].stateName+"'>"+ state_list[i].stateName+ "</option>");
		$("#state").append(selectOption);
	}
	
	var value = $("#state").val();
    var s = value.toString();
    $("#state_selected").val(s); 

	var today=moment(new Date()).format('YYYY-MM-DD');
    $('#startDate').val(today);
    $('#endDate').val(today);

   
$('#state').on('select2:select', function(e) {
    var id = e.params.data.id;
    var value = $(this).val();
    var s = value.toString();
    $("#state_selected").val(s); 
    //console.log(document.getElementById('state_selected').value);
      });
$('#state').on('select2:unselect', function(e) {
    var id = e.params.data.id;
    if(id=="대기중"){
    	alert("'대기중' 옵션은 삭제할 수 없습니다.");
    	$("#대기중").remove();
    	$("#select2-state-result-h02g-대기중").remove();
    	//(".select2-selection__rendered").prepend('<li class="select2-selection__choice" title="대기중" data-select2-id="select2-data-2-uqij"><button type="button" class="select2-selection__choice__remove" tabindex="-1" title="Remove item" aria-label="Remove item" aria-describedly="select2-state-container-choice-wzzt-대기중"><span aria-hidden="true">x</span></button><span class="select2-selection__choice__display" id="select2-state-container-choice-wzzt-대기중">대기중</span></li>');
    	$(".form-state").prepend("<option id='대기중' selected=\"selected\" value='대기중'>대기중</option>");
    }
    var value = $(this).val();
    var s = value.toString();
    $("#state_selected").val(s); 
    //console.log(document.getElementById('state_selected').value);
      });
  $("#state").select2({
      tags: true,
      tokenSeparators: [',', ' ']
  })
  
var category_list = ${category_list};
var categoryNum = $("<input name='categoryNum' value='"+category_list.length+"' type='hidden'>");
$(".form-div").append(categoryNum);
for (var i = 0; i < category_list.length; i++) {
	var selectOption = $("<option value='"+category_list[i].id+"'>"+ category_list[i].categoryName+ "</option>");
	$(".form-control").append(selectOption);
}
console.log(categoryNum);
$(".form-control").append(categoryNum).html();
//select2 초기화
$(".form-control").select2({
	tags : true
});


$('#link').bind("keyup", function(){
    $(this).val($(this).val().toLowerCase());
});

$(document).click(function(e) {
    if (!$(e.target).closest('#preview_modal').length) {
    	$("#preview_modal").css({ display : "none"});
		$("#bg").remove();
    }
    
});
</script>
</html>
