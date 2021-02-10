$( document ).ready(function() {

	var formInfo;
	var formDetail;
	
	var formID=$(".title").find("input[name=formId]").val();
	
	console.log("formID"+formID);
	
	$.ajax({ //해당 form의 정보가져오기
		url : "info",
	  	type : "post",
	  	data:{"form_id":formID},
	  	dataType : "json",
	  	async: false,
	  	success: function(data){
		  	formInfo = data;
		  	console.log("formInfo 불러오기 성공");
		  	console.log(formInfo); 	
		  					  		
	  	},
	  	error:function(request, status, error){

			alert("code:"+request.status+"\n"+"\n"+"error:"+error);

		}
	});
	
	$(".title").find("#formName").attr("value",formInfo.formName);
	$(".title").find("input[name=user_id]").attr("value",formInfo.user_id);
	
	
	$(".title").find("#category_select option").attr('selected', false);
	$(".title").find("#category_select option[value='+formInfo.category_id+']").attr('selected', true).change();
	$(".title").find(".select2-selection__rendered").html(formInfo.categoryName);
	
	
	$(".title").find("input[name=startDate]").attr("value",formInfo.startDate);
	$(".title").find("input[name=endDate]").attr("value",formInfo.endDate);
	$(".title").find("textarea[name=explanation]").html(formInfo.explanation);
	$(".title").find("input[name=plusPoint]").attr("value",formInfo.plusPoint);
	$(".title").find("input[name=minusPoint]").attr("value",formInfo.minusPoint);
	
	//link 값 입력 (ReadOnly)
	$("#link").val(formInfo.url);
	$("#link").attr("readonly",true);
	
	$.ajax({ //해당 폼의 field 가져오기
		url : 'field',
	  	type : "post",
	  	data:{form_id:formID},
	  	dataType : 'json',
	  	async: false,
	  	success: function(data){
		  	formDetail = data;
		  	console.log("formDetail 불러오기 성공");
		  	console.log(formDetail); 	
		  					  		
	  	},
	  	error:function(request, status, error){

			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

		}
	});
	
	
	$(".title").find(".fieldCount").attr("name", "fieldCount"+formInfo.id);
	$(".title").find(".fieldCount").attr("value", formDetail.length);
	
	var count=0;
	
	for(var i=0; i<formDetail.length;i++){
	  count++;
	  $("#field_add").find(".field").attr("id", "field"+count);
	  
	  //field id
	  $("#field_add").find(".fieldId").attr("value", formDetail[i].id);
	  
	  //field 제목
	  $("#field_add").find(".field_title").attr("name", "f_title"+count);
	  $("#field_add").find(".field_title").attr("value",formDetail[i].fieldName);
	  
	  //필수인지 아닌지 
	  $("#field_add").find(".isEssential").attr("name", "isEssential"+count);
	  if(formDetail[i].isEssential==0){
	  	$("#field_add").find(".isEssential_fake").attr("checked", false);
	  	$("#field_add").find(".isEssential").val("0");
	  }
	  else if(formDetail[i].isEssential==1){
	  	$("#field_add").find(".isEssential_fake").attr("checked", true);
	  	$("#field_add").find(".isEssential").val("1");
	  }
	  
	 
	  $("#field_add").find(".count").attr("name", "count"+count);
	  $("#field_add").find(".itemCount").attr("name", "itemCount"+count);
	  $("#field_add").find(".index").attr("value", count);
	  
	  //field 유형 나타내기
	  $("#field_add").find(".field_type").attr("name", "f_type"+count);
	  $("#field_add").find('.field_type option').attr('selected', false);
	  $("#field_add").find('.field_type option[value='+formDetail[i].fieldType+']').attr('selected', true).change();
	  
	  
	  //content
	  var content;
	  if(formDetail[i].fieldType=="textarea"){
	    content = "<textarea disabled></textarea>";
	    $("#field_add").find(".content").html(content);
	  }
	  else if(formDetail[i].fieldType=="select"||formDetail[i].fieldType=="radio"||formDetail[i].fieldType=="checkbox"){
	      //item list 가져오기
		  var item_list;
		  var field_count=count;
		  $.ajax({ //해당 field가 select라면 option 가져오기
	  			url : 'item',
	  			type : "post",
	  			data:{field_id:formDetail[i].id},
	  			dataType : 'json',
	  			async: false,
	  			success: function(data){
	  				item_list = data;
	  				console.log("item_list 불러오기 성공");
	  				console.log(item_list); 	
	  					  		
	  			},
			  	error:function(request, status, error){
		
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		
				}
	  	  });
	  	  
	  	  $("#field_add").find(".itemCount").val(item_list.length);
	  	  
	  	  if(formDetail[i].fieldType=="select"){
	    	content = "<select id=\"\" style=\"margin-bottom: 10px;\"><option disabled>추가된 옵션들</option></select><br><input value=\"\"/><button type=\"button\" class=\"btn_add_select\">옵션에 추가</button><div class=\"list_select\"></div>";
	  	    $("#field_add").find(".content").html(content);
	  	  	for(var j=0; j<item_list.length;j++){
	  	  		var o_cnt = parseInt($("#field_add").find(".count").val())+1;
		    	$("#field_add").find(".count").val(o_cnt);
		    	var idx=$("#field_add").find(".index").val();
		    	
		    	$("#select_value_add").find(".select_itemId").attr("name", idx+"itemId"+String(o_cnt));
			    $("#select_value_add").find(".select_itemId").attr("value",item_list[j].id);
		    	
		    	$("#select_value_add").find(".option_real").attr("name", idx+"content"+String(o_cnt));
			    $("#select_value_add").find(".option_real").attr("value",item_list[j].content);
			    $("#select_add").find("option").attr("value", item_list[j].content);
			    $("#select_add").find("option").html(item_list[j].content);
			    
			    $("#field_add").find(".content select").append($("#select_add").html());
	  			$("#field_add").find(".list_select").append($("#select_value_add").html());
		    }
	  	  }
	  	  
		  else if(formDetail[i].fieldType=="radio"){
		    content = "<input value=\"\"/><button type=\"button\" class=\"btn_add_radio\">옵션에 추가</button><div class=\"list_radio\"></div>";
		    $("#field_add").find(".content").html(content);
		    for(var j=0; j<item_list.length;j++){
		    	var r_cnt = parseInt($("#field_add").find(".count").val())+1;
		    	$("#field_add").find(".count").val(r_cnt);
		    	var idx=$("#field_add").find(".index").val();
		    	
		    	$("#radio_add").find(".radio_itemId").attr("name", idx+"itemId"+String(r_cnt));
			    $("#radio_add").find(".radio_itemId").attr("value",item_list[j].id);
		    	
		    	$("#radio_add").find(".radio_real").attr("name", idx+"content"+String(r_cnt));
			    $("#radio_add").find(".radio_real").attr("value",item_list[j].content);
			    $("#radio_add").find("label").html(item_list[j].content);
			    
			    $("#field_add").find(".list_radio").append($("#radio_add").html());
		    }
		    
		  }
		  
		  else if(formDetail[i].fieldType=="checkbox"){
		    content = "<input value=\"\"/><button type=\"button\" class=\"btn_add_chxbox\">옵션에 추가</button><div class=\"list_chxbox\"></div>";
		    $("#field_add").find(".content").html(content);
		  	for(var j=0; j<item_list.length;j++){
		    	var c_cnt = parseInt($("#field_add").find(".count").val())+1;
		    	$("#field_add").find(".count").val(c_cnt);
		    	var idx=$("#field_add").find(".index").val();
		    	
		    	$("#chxbox_add").find(".checkbox_itemId").attr("name", idx+"itemId"+String(c_cnt));
			    $("#chxbox_add").find(".checkbox_itemId").attr("value",item_list[j].id);
		    	
		    	$("#chxbox_add").find(".checkbox_real").attr("name", idx+"content"+String(c_cnt));
	  			$("#chxbox_add").find(".checkbox_real").attr("value",item_list[j].content);
	  			$("#chxbox_add").find("label").html(item_list[j].content);
			    
			    $("#field_add").find(".list_chxbox").append($("#chxbox_add").html());
		    }
		  }
		  
	  }
	  else{
	    content = "<input type=\""+this.value+"\" disabled/>"; 
	    $("#field_add").find(".content").html(content);
	  }
	  
	  
	  $("#count").val(count);
	  $("#list").append($("#field_add").html());
	  
	  
	  //field_add 안의 값들 초기화
	  $("#field_add").find(".field").attr("id", "field?");
	  $("#field_add").find(".isEssential").attr("name", "isEssential?");
	  $("#field_add").find(".field_title").attr("name", "f_title?");
	  $("#field_add").find(".field_type").attr("name", "f_type?");
	  $("#field_add").find(".count").attr("name", "count?");
	  $("#field_add").find(".content").children().remove();
	  //field 제목
	  $("#field_add").find(".field_title").attr("value","");
	  
	  //field id
	  $("#field_add").find(".fieldId").attr("value", "");
	  
	  //필수인지 아닌지 
	  $("#field_add").find(".isEssential_fake").attr("checked", false);
	  $("#field_add").find(".isEssential").val("0");
	  
	  //field 유형 나타내기
	  $("#field_add").find('.field_type option').attr('selected', false);
	  $("#field_add").find('.field_type option:eq(0)').attr('selected', true).change();
	  
	  $("#field_add").find(".count").attr("value", "0");
	  $("#field_add").find(".index").attr("value", "0");
	  
	}
	
	//수정 시, 수정했다고 표시
	$("#list").on('change', ".isEssential_fake", function(){
		$(this).siblings(".isModified").val("1");
	});
	
	$("#list").on('change', ".isDefault_fake", function(){
		$(this).siblings(".isModified").val("1");
	});
	
	$("#list").on('click', ".btn_add_select", function(){
		$(this).parent().siblings(".isModified").val("1");
	});
	
	$("#list").on('click', ".btn_add_chxbox", function(){
		$(this).parent().siblings(".isModified").val("1");
	});
	
	$("#list").on('click', ".btn_add_radio", function(){
		$(this).parent().siblings(".isModified").val("1");
		
	});
	
	$("#list").on('click', ".remove_item", function(){
		$(this).parent().parent().parent().siblings(".isModified").val("1");
	});
	
	$("#list").on('click', ".remove", function(){
		$(this).siblings(".isModified").val("1");
	});
	
	$("#list").on('change', ".field_type", function(){
		$(this).siblings(".isModified").val("1");
	});
	
	$("#list .field_title").on("propertychange change keyup paste input", function() {
	    $(this).siblings(".isModified").val("1");
	});
	
	$(".title #formName").on("propertychange change keyup paste input", function() {
	    $(this).siblings("#isHeaderModified").val("1");
	});
	
	$(".title").on('change', "#category_select", function(){
		$(this).siblings("#isHeaderModified").val("1");
	});
	
	$(".title textarea").on("propertychange change keyup paste input", function() {
	    $(this).siblings("#isHeaderModified").val("1");
	});
	
	$(".title").on('change', "#startDate", function(){
		$(this).siblings("#isHeaderModified").val("1");
	});
	
	$(".title").on('change', "#endDate", function(){
		$(this).siblings("#isHeaderModified").val("1");
	});
	
	
	$('#edit').on('click', function() {
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
	
	dup_check=true;

});

//모달창
	function modal(id) {
	    var zIndex = 9999;
	    var modal = $('#' + id);
	
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