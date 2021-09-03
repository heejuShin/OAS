<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/adminUserManage.css?ver=2">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" /> <!-- 상태 -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style>
		@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
		* {font-family: 'NanumSquare', sans-serif !important;}

	button{
		border: 1px solid;
		width: 100px !important;
		height: auto;
		background: transparent;
		border-radius: 4px !important;
		font-size: 15px !important;
		margin-right: 5px !important;
	}
	.selectState, .button_div{
		text-align: center;
	}
	.select2-selection__rendered{
	font-weight: 600;
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
	<jsp:include page="/WEB-INF/views/basic/header.jsp" />


	
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
	<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    
	<!-- 카테고리 관련 CDN -->
	<script	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<!-- select2 javascript cdn -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
	
	<!-- main -->
    <main>
    <div id="headTitle"><h2>상태 관리</h2></div>
    
	<form action = "./state/save" method="post">
         
			<div class="wrap-input100  bg1 selectState" style="font-size: 15px;">
				<select class="form-control" id="state" style="width: 80%; border:none;"  multiple="multiple"></select>
			    <p class="label-input100" style="margin-bottom:100px; margin-top: 5px;">신청폼에 기본으로 저장되는 상태입니다.</p>
			</div>
			<input type="hidden" id="state_selected" name="state" style="width: 1000px;"/>
			<input type="hidden" name="csrfToken" value="${sessionScope.CSRF_TOKEN}" />
			
		<div class="button_div" style="font-weight: 600;">
            <button style="border-color: #28a745; color: #28a745" type="submit">저장</button>
            <button type="button" style="border-color: black; color: black;" name="deleteB" onclick="location.href='./state'">초기화</button>
        </div>  
	</form>
		


    </main>


	<jsp:include page="/WEB-INF/views/basic/footer.jsp" />


</body>
<script type="text/javascript">
$( document ).ready(function() {
	var value = $("#state").val();
    var s = value.toString();
    $("#state_selected").val(s); 
    
    $(".form-control").select2({
    	tags : true
    });
});

var state_list = ${state_list};
for (var i = 0; i < state_list.length; i++) {
	var selectOption = $("<option id='"+state_list[i].stateName+"' selected=\"selected\" value='"+state_list[i].stateName+"'>"+ state_list[i].stateName+ "</option>");
	$(".form-control").append(selectOption);
}

$('#state').on('select2:select', function(e) {
    var id = e.params.data.id;
    var value = $(this).val();
    var s = value.toString();
    $("#state_selected").val(s); 
      });
$('#state').on('select2:unselect', function(e) {
    var id = e.params.data.id;
    if(id=="대기중"){
    	alert("'대기중' 옵션은 삭제할 수 없습니다.");
    	$("#대기중").remove();
    	$(".select2-selection__rendered").prepend('<li class="select2-selection__choice" title="대기중"><span class="select2-selection__choice__remove" role"presentation">x</span>대기중</li>');
    	$(".form-control").prepend("<option id='대기중' selected=\"selected\" value='대기중'>대기중</option>");
    	//$(location).attr('href', './state');
        //alert($(e).css("display"));
    	//alert($("#대기중").attr('selected'));
    	//var selectOption = $("<option selected=\"selected\" value='대기증'>대기증</option>");
    	//$(".form-control").append(selectOption);
    	//alert($(e.params.data).attr('selected'));
    	//$("#대기중").attr('selected', "selected");
    	//$(e.params.data).attr('selected', "true");
    	//alert($(e.params.data).attr('selected'));
    }
     var value = $(this).val();
     var s = value.toString();
     $("#state_selected").val(s); 
      });
      
  /*$("#state").select2({
      tags: true,
      tokenSeparators: [',', ' ']
  });*/
 
    </script>