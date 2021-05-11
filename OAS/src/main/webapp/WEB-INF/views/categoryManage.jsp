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
	.selectCategory, .button_div{
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


	<!-- 카테고리 관련 CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	<!-- select2 javascript cdn -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script> 
	
	<!-- main -->
    <main>
    <div id="headTitle"><h2>카테고리 관리</h2></div>
    
	<form action = "./category/save" method="post">
         
			<div class="wrap-input100  bg1 selectCategory" style="font-size: 15px;">
				<select class="form-control" id="category" style="width: 80%; border:none;" id="category" multiple="multiple"></select>
			    <p class="label-input100" style="margin-bottom:100px; margin-top: 5px;">필요한 카테고리 추가 및 필요없는 카테고리 삭제가 가능합니다.</p>
			</div>
			<input type="hidden" id="category_selected" name="category"/>
			<input type="hidden" id="category_ids" name="categoryIds"/>
			<input type="hidden" id="oricategory_ids" name="oricategory_ids"/>
			<input type="hidden" name="csrfToken" value="${sessionScope.CSRF_TOKEN}" />
			
		<div class="button_div" style="font-weight: 600;">
            <button style="border-color: #28a745; color: #28a745" type="submit">저장</button>
            <button type="button" style="border-color: black; color: black;" name="deleteB" onclick="location.href='./categoryPage'">초기화</button>
        </div>  
	</form>
		


    </main>


	<jsp:include page="/WEB-INF/views/basic/footer.jsp" />


</body>
<script type="text/javascript">
$( document ).ready(function() {
	var value = $("#category").val();
    var s = value.toString();
    $("#category_selected").val(s); 
    
    $("#oricategory_ids").val(s); 
    $(".form-control").select2({
    	tags : true
    });
});

var category_list = ${category_list};
for (var i = 0; i < category_list.length; i++) {
	var selectOption = $("<option id='"+category_list[i].categoryName+"' selected=\"selected\" value='"+category_list[i].categoryName+"'>"+ category_list[i].categoryName+ "</option>");
	$(".form-control").append(selectOption);
}

$('#category').on('select2:unselect', function(e) {
	 var id = e.params.data.id;
	    var value = $(this).val();
	    var s = value.toString();

	    $("#category_selected").val(s); 
 });
$('#category').on('select2:select', function(e) {
    var id = e.params.data.id;
    var value = $(this).val();
    var s = value.toString();

    $("#category_selected").val(s); 
});
 
</script>