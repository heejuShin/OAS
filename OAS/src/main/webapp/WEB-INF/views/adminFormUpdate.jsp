<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" /> <!-- div 크기 조정 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> <!-- 카테고리 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" /> <!-- 상태 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/form.css?ver=13">

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
	<!-- resizable -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	
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
    
    <!-- momment -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    
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
	
	<script src="<%=request.getContextPath()%>/resources/assets/js/formCreate.js?ver=4"></script>
  	<script src="<%=request.getContextPath()%>/resources/assets/js/formUpdate.js?ver=57"></script>
	<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <!-- resizable -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- 카테고리 관련 CDN -->
	<script	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<!-- select2 javascript cdn -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>

	
	
    <div class="container-contact100">
    
		<div class="wrap-contact100" style="padding : 0px 100px 90px 100px">
		<div id="menu-bar"><p id="add_p">+</p></div>
		<form id="cseeForm" action="formUpdate" class="contact100-form" method="post">
					<span class="contact100-form-title">
						설문 수정하기
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
					<input class="input100" style="margin-top: 10px" id="startDate" name="startDate" type="date" value="" required/> <input id="startTime" class="input100" name="startTime" type="time" value="" required/>
				</div>
				
				<div class="wrap-input100  bg1 rs1-wrap-input100" >
					<p class="label-input100">신청 마감일</p>
					<input class="input100" id="endDate" name="endDate" type="date" value="" required/> <input id="endTime" class="input100" name="endTime" type="time" value="" required/>
				</div>
				
				<div class="wrap-input100  bg1" >
					<textarea class="input100 InputFonts"  name="explanation" placeholder="설문지 설명"></textarea>
				</div>
				<input type="hidden" id="state_selected" name="state"/>
				<input name="plusPoint" type="hidden" value="0"/> <!-- type="number" -->
                <input name="minusPoint" type="hidden" value="0"/> <!-- type="number" -->
                <input name="isHeaderModified" id="isHeaderModified" type="hidden" value="0"/>
                <input name="formId" id="formId" type="hidden" value="<%=request.getAttribute("form_id")%>"/>
                <input type="hidden" id="count" name="count" value="0"/>
          	    <input type="hidden" class="fieldCount" name="fieldCount?" value="0"/>
				<input name="isUserEdit" type="hidden" value="0"/> <!-- type="number" --> 
		
              
            <div class="wrap-input100  bg1" >
				<p class="label-input100" style="margin-bottom:5px">상태 선택<span class="essential"> * </span></p>
				<select style="width: 650px; border:none;" id="state" multiple="multiple" style="width: 450px">
			          <option selected="selected" value="대기중">대기 중</option>
			          <option selected="selected" value="입금전">입금 전</option>
			          <option selected="selected" value="방문요망">방문요망</option>
			          <option selected="selected" value="완료">완료</option>
			          <option selected="selected" value="불가">불가</option>
			          <option selected="selected" value="신청중">신청 중</option>
			          <option selected="selected" value="신청마감">신청마감</option>
			          <option selected="selected" value="예약">예약</option>    
			      </select>
			      
			</div>
			
			<input type="hidden" id="state_selected" name="state"/>

          <div id="list" style="width: inherit;"></div>
          
             <div id="submitDiv" class="wrap-input100 button rs1-wrap-input100 formbts"><!--UPDATE시 사용 예정 -->
			<button class="contact100-form-btn cancle" type="button" id="cancle" onclick="location.href='<%=request.getContextPath()%>/admin/mypage'">
				<span>취소</span>
			</button>	
          </div>
          
        
          <div id="submitDiv" class="wrap-input100 button rs1-wrap-input100 formbts"><!--UPDATE시 사용 예정 -->
            <button class="contact100-form-btn edit" type="button" id="updatePreview" >
				<span>수정</span>
			</button>
          </div>

        
        <div id="confirm_modal">
	        <h4 id="modal_message">설문지 작성이 완료되었습니다.</h4>
	        <p>
	        <span class="modal_title">제목 : </span><span id="confirm_title" class="modal_content"></span><br>
	        <span class="modal_title">분류 : </span><span id="confirm_category" class="modal_content"></span><br>
	        <span class="modal_title">기간 : </span><span id="confirm_start" class="modal_content"></span> - <span id="confirm_end" class="modal_content"></span> <br>
	        <span class="modal_title">링크 : </span><input id="link" class="modal_content" type="text" name="url" placeholder="사용할 폼 주소 url을 입력해주세요."/>
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
        	<button type="button" class="remove removeField minusB">-</button>
					
          
          <input type="hidden" name="isEssential?" class="isEssential" value="0"/>
          <input type="hidden" class="index" value="0"/>
          <input type="hidden" class="count" id="count?" name="count3" value="0">
          <input type="hidden" class="isModified" name="isModified" value="0"/>
          <input type="hidden" class="itemCount" name="itemCount?" value="0"/>
          
          <input type="hidden" class="isFieldOri" name="isFieldOri?" value="0"/>
          <input type="hidden" class="isFieldDel" name="isFieldDel?" value="0"/>
         
          <input type="hidden" class="fieldId" name="fieldId" value=""/>
		  <input class="field_title input1002 bg0 " name="f_title3" placeholder="질문을 입력해주세요.">
					
						<select class="field_type  " name="f_type3" style="clear:both"> <!-- TODO required -->
						  <option value="" selected disabled>질문유형</option>
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
	
						<div class="content" style="clear: both;"></div>
        </div>
      </div>

    <div class="add" id="radio_add">
      <div>
      	<input class="radio_itemId" type="hidden" name="?itemId?" value=""/>
        <input class="radio_fake" type="radio" disabled><label class="item" for=""></label></input>
        <button type="button" class="remove_item remove_item_Update">X</button>
        <input class="isItemOri" type="hidden" name="?isItemOri?" value="0"/>
        <input class="radio_real" type="hidden" name="?content?" value=""/>
        <input type="hidden" class="isItemDel" name="?isItemDel?" value="0"/>
      </div>
    </div>

    <div class="add" id="chxbox_add">
      <div>
      	<input class="checkbox_itemId" type="hidden" name="?itemId?" value=""/>
        <input class="checkbox_fake" type="checkbox" disabled><label class="item" for=""></label></input>
        <button type="button" class="remove_item remove_item_Update">X</button>
        <input class="isItemOri" type="hidden" name="?isItemOri?" value="0"/>
     	<input class="checkbox_real" type="hidden" name="?content?" value=""/>
     	<input type="hidden" class="isItemDel" name="?isItemDel?" value="0"/>
      </div>
    </div>

   <div class="add" id="select_add">
        <option class="option_fake" value=""/>
    </div>
    <div class="add" id="selectBox_add">
    	<div>
       		<label class="item" for=""></label><button type="button" class="remove_selectOption_Update remove_item">X</button>
    	</div>
    </div>
    <div class="add" id="select_value_add">
    	<input class="isItemOri" type="hidden" name="?isItemOri?" value="0"/>
    	<input class="select_itemId" type="hidden" name="?itemId?" value=""/>
    	<input class="option_real" type="hidden" name="?content?" value=""/>
    	<input type="hidden" class="isItemDel" name="?isItemDel?" value="0"/>
    </div>
   
	<jsp:include page="/WEB-INF/views/basic/footer.jsp" />

  </body>
  
  <script>
  $( document ).ready(function() {
		var value = $("#state").val();
	    var s = value.toString();
	    $("#state_selected").val(s); 

	});

	
	$('#state').on('select2:select', function(e) {
	    var id = e.params.data.id;
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

	$(document).click(function(e) {
	    if (!$(e.target).closest('#preview_modal').length) {
	    	$("#preview_modal").css({ display : "none"});
			$("#bg").remove();
			$("#preview_modal").empty();
	    }
	    
	});
	/** TODO
	* 자동으로 height 조정 (현재는 마우스로 크기조정 가능)
	* 그래도 어느 정도의 CSS
	* 상태 선택
	* 이미지 추가 -> 전체적 or item 마다 -> DB 수정도 필요
	* '기타' 추가 기능
	* 복사 기능
	**/

	
</script>
  

</html>