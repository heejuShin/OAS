

$( document ).ready(function() {

	var formInfo;
	var formDetail;
	
	var formID=$("input[name=formId]").val();
	
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
	
	$("#formName").attr("value",formInfo.formName);
	$("input[name=user_id]").attr("value",formInfo.user_id);
	
	
	$("#category_select option").attr('selected', false);
	$("#category_select option[value='+formInfo.category_id+']").attr('selected', true).change();
	$(".select2-selection__rendered").html(formInfo.categoryName);
	
	let startD=formInfo.startDate;
	let endD=formInfo.endDate;
	
	console.log(moment(startD).format('YYYY-MM-DD HH:mm'));

	$("input[name=startDate]").attr("value",moment(startD).format('YYYY-MM-DD'));
	$("input[name=endDate]").attr("value",moment(endD).format('YYYY-MM-DD'));
	$("input[name=startTime]").attr("value",moment(startD).format('HH:mm'));
	$("input[name=endTime]").attr("value",moment(endD).format('HH:mm'));
	
	$("textarea[name=explanation]").html(formInfo.explanation);
	$("input[name=plusPoint]").attr("value",formInfo.plusPoint);
	$("input[name=minusPoint]").attr("value",formInfo.minusPoint);
	

	
	//link 값 입력 (ReadOnly)
	$("#link").val(formInfo.url);
	$("#linkOri").val(formInfo.url);
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
	
	
	$(".fieldCount").attr("name", "fieldCount"+formInfo.id);
	$(".fieldCount").attr("value", formDetail.length);
	
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
	  $("#field_add").find(".isFieldOri").attr("name", "isFieldOri"+count);
	  $("#field_add").find(".isFieldOri").attr("value", "1");
	  $("#field_add").find(".isFieldDel").attr("name", "isFieldDel"+count);
	  $("#field_add").find(".index").attr("value", count);
	  
	  //field 유형 나타내기
	  $("#field_add").find(".field_type").attr("name", "f_type"+count);
	  $("#field_add").find('.field_type').attr('disabled', true);
	  $("#field_add").find('.field_type option').attr('selected', false);
	  $("#field_add").find('.field_type option[value='+formDetail[i].fieldType+']').attr('selected', true).change();
	  
	  
	  //content
	  var content;
	  if(formDetail[i].fieldType=="textarea"){
	    content = "<textarea class=\"textareaInput \" placeholder=\"장문형 작성칸\" disabled></textarea>";
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
	    	content = "<select id=\"\" style=\"display:none; margin-bottom: 10px;\"><option disabled>추가된 옵션들</option></select><br><input type='text' class=\"inputs \" placeholder=\"보기(옵션)을 작성해주세요. \" value=\"\"/><button type=\"button\" class=\"btn_add_select optionAddB\">옵션에 추가</button><div class=\"selectOption\" style=\"padding:2%;margin-top:2%;border:0.5px dashed black\"><p><드롭다운에 들어갈 옵션></p></div><div class=\"list_select\"></div>";
	  	    $("#field_add").find(".content").html(content);
	  	  	for(var j=0; j<item_list.length;j++){
	  	  		var o_cnt = parseInt($("#field_add").find(".count").val())+1;
		    	$("#field_add").find(".count").val(o_cnt);
		    	var idx=$("#field_add").find(".index").val();
		    	
		    	$("#select_value_add").find(".select_itemId").attr("name", idx+"itemId"+String(o_cnt));
			    $("#select_value_add").find(".select_itemId").attr("value",item_list[j].id);
			    
			    $("#select_value_add").find(".isItemOri").attr("name", idx+"isItemOri"+String(o_cnt));
			    $("#select_value_add").find(".isItemOri").attr("value", 1);
			    $("#select_value_add").find(".isItemOri").attr("id", "optionOri"+String(j+1));
			    $("#select_value_add").find(".isItemDel").attr("name", idx+"isItemDel"+String(o_cnt));
			    $("#select_value_add").find(".isItemDel").attr("id",  "option"+String(j+1));
		    	
		    	$("#select_value_add").find(".option_real").attr("name", idx+"content"+String(o_cnt));
			    $("#select_value_add").find(".option_real").attr("value",item_list[j].content);
			    $("#select_add").find("option").attr("value", item_list[j].content);
			    $("#select_add").find("option").html(item_list[j].content);
			    
			    $("#field_add").find(".content select").append($("#select_add").html());
	  			$("#field_add").find(".list_select").append($("#select_value_add").html());
	  			
	  			$("#selectBox_add").find("label").html(item_list[j].content);
		    	$("#selectBox_add").find("button").attr("id",String(j+1));
 			  	$("#field_add").find(".selectOption").append($("#selectBox_add").html());
		    }
	  	  }
	  	  
		  else if(formDetail[i].fieldType=="radio"){
		    content = "<input type='text' class=\"inputs \" placeholder=\"보기를 ,로 구별하여 작성해주세요. (예시 : 여자,남자) \" value=\"\"/><button type=\"button\" class=\"btn_add_radio optionAddB\">옵션에 추가</button><div class=\"list_radio\"></div>";
		    $("#field_add").find(".content").html(content);
		    for(var j=0; j<item_list.length;j++){
		    	var r_cnt = parseInt($("#field_add").find(".count").val())+1;
		    	$("#field_add").find(".count").val(r_cnt);
		    	var idx=$("#field_add").find(".index").val();
		    	
		    	$("#radio_add").find(".radio_itemId").attr("name", idx+"itemId"+String(r_cnt));
			    $("#radio_add").find(".radio_itemId").attr("value",item_list[j].id);
		    	
		    	$("#radio_add").find(".isItemDel").attr("name", idx+"isItemDel"+String(r_cnt));
		    	
		    	$("#radio_add").find(".radio_real").attr("name", idx+"content"+String(r_cnt));
			    $("#radio_add").find(".radio_real").attr("value",item_list[j].content);
			    
			    $("#radio_add").find(".isItemOri").attr("name", idx+"isItemOri"+String(r_cnt));
			    $("#radio_add").find(".isItemOri").attr("value","1");
			    
			    $("#radio_add").find("label").html(item_list[j].content);
			    
			    $("#field_add").find(".list_radio").append($("#radio_add").html());
		    }
		    
		  }
		  
		  else if(formDetail[i].fieldType=="checkbox"){
		    content = "<input type='text' class=\"inputs \" placeholder=\"보기(옵션)을 작성해주세요. \" value=\"\"/><button type=\"button\" class=\"btn_add_chxbox optionAddB\">옵션에 추가</button><div class=\"list_chxbox\"></div>";
		    $("#field_add").find(".content").html(content);
		  	for(var j=0; j<item_list.length;j++){
		    	var c_cnt = parseInt($("#field_add").find(".count").val())+1;
		    	$("#field_add").find(".count").val(c_cnt);
		    	var idx=$("#field_add").find(".index").val();
		    	
		    	$("#chxbox_add").find(".checkbox_itemId").attr("name", idx+"itemId"+String(c_cnt));
			    $("#chxbox_add").find(".checkbox_itemId").attr("value",item_list[j].id);
		    	
		    	$("#chxbox_add").find(".isItemDel").attr("name", idx+"isItemDel"+String(c_cnt));
		    	
		    	$("#chxbox_add").find(".isItemOri").attr("name", idx+"isItemOri"+String(c_cnt));
			    $("#chxbox_add").find(".isItemOri").attr("value","1");
		    	
		    	$("#chxbox_add").find(".checkbox_real").attr("name", idx+"content"+String(c_cnt));
	  			$("#chxbox_add").find(".checkbox_real").attr("value",item_list[j].content);
	  			$("#chxbox_add").find("label").html(item_list[j].content);
			    
			    $("#field_add").find(".list_chxbox").append($("#chxbox_add").html());
		    }
		  }
		  
	  }
	  else{
	    content = "<input type='text' class=\"inputs \" placeholder=\"단답형 작성칸\" type=\""+this.value+"\" disabled/>"; 
	    $("#field_add").find(".content").html(content);
	  }
	  
	  
	  $("#count").val(count);
	  $("#list").append($("#field_add").html());
	  
	  
	  //field_add 안의 값들 초기화
	  $("#field_add").find(".field").attr("id", "field?");
	  $("#field_add").find(".isEssential").attr("name", "isEssential?");
	  $("#field_add").find(".isFieldDel").attr("name", "isFieldDel?");
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
	  $("#field_add").find('.field_type').attr('disabled', false);
	  $("#field_add").find('.field_type option').attr('selected', false);
	  $("#field_add").find('.field_type option:eq(0)').attr('selected', true).change();
	  
	  $("#field_add").find(".count").attr("value", "0");
	  $("#field_add").find(".index").attr("value", "0");
	  
	}
	
	//수정 시, 수정했다고 표시
	$("#list").on('change', ".isEssential_fake", function(){
		$(this).parent().siblings(".isModified").val("1");
		if ($(this).is(":checked")) {
			$(this).parent().siblings(".isEssential").val("1");
		} else {
			$(this).parent().siblings(".isEssential").val("0");
		}
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
	
	//Field 삭제
	$("#list").on('click', ".removeField", function(){
		//기존의 field면 안보이게 하고, isDelete = 1 로 바꿈
		if($(this).siblings(".isFieldOri").val()=="1"){
			//var num=$("#field_add").find(".fieldCount").val()-1;
			//$("#field_add").find(".fieldCount").val(num);
			$(this).siblings(".isModified").val("1");
			$(this).siblings(".isFieldDel").val("1");
			$(this).parent().css("display","none");
		}
		//새로 추가했던 field면 그냥 삭제
		else{
			$("#count").val($("#count").val()-1);
			$(this).parent().remove();
		}
	});
	
	//아이템 삭제
	$("#list").on('click', ".remove_item_Update", function(){
	  //기존의 item이면 안보이게 하고, isDelete = 1 로 바꿈
		$(this).siblings(".isModified").val("1");
		if($(this).siblings(".isItemOri").val()=="1"){
			$(this).siblings(".isItemDel").val("1");
			$(this).parent().css("display","none");
			//field modified check
			$(this).parent().parent().parent().siblings(".isModified").val("1");
		}
		//새로 추가했던 item이면 그냥 삭제
		else{
			var num=$(this).parent().parent().parent().siblings(".count").val()-1;
			$(this).parent().parent().parent().siblings(".count").val(num);
			$(this).parent().remove();
		}
	  
	});
	//드롭다운아이템 삭제
	$("#list").on('click', ".remove_selectOption_Update", function(){
	  var option=$(this).siblings("label").text();
	  $(this).parent().parent().siblings("select").find("option[value='"+option+"']").remove();
	
	  	var xId=$(this).attr("id");
	  	console.log("xId:"+xId);
	  	//기존의 item, isDelete = 1 로 바꿈
		$(this).siblings(".isModified").val("1");
		if($(this).parent().parent().siblings(".list_select").find("#optionOri"+xId).val()=="1"){
			$(this).parent().parent().siblings(".list_select").find("#option"+xId).val("1");
			//field modified check
			console.log($(this).parent().parent().parent().siblings(".isModified").prop("tagName"));
			$(this).parent().parent().parent().siblings(".isModified").val("1");
		}
		else{//새로 추가했던 item이면 그냥 삭제
			var num=$(this).parent().parent().parent().siblings(".count").val()-1;
			$(this).parent().parent().parent().siblings(".count").val(num);
			var index=$(this).parent().parent().parent().siblings(".index").val();
	  		$(this).parent().parent().siblings(".list_select").find("input[id='optionOri"+xId+"']").remove();
	  		$(this).parent().parent().siblings(".list_select").find("input[value='"+option+"']").remove();
	  		$(this).parent().parent().siblings(".list_select").find("input[name='"+index+"itemId"+xId+"']").remove();
	  		$(this).parent().parent().siblings(".list_select").find("input[id='option"+xId+"']").remove();
		}
		$(this).parent().remove();
	});
	
	$("#list").on('change', ".field_type", function(){
		$(this).siblings(".isModified").val("1");
	});
	
	$("#list .field_title").on("propertychange change keyup paste input", function() {
	    $(this).siblings(".isModified").val("1");
	});
	
	$("#formName").on("propertychange change keyup paste input", function() {
	    $(this).parent().siblings("#isHeaderModified").val("1");
	});
	
	$(".bg1").on('change', "select[name='category_id']", function(){
		$(this).parent().siblings("#isHeaderModified").val("1");
	});
	
	$(".bg1 textarea").on("propertychange change keyup paste input", function() {
	    $(this).parent().siblings("#isHeaderModified").val("1");
	});
	
	$(".bg1").on('change', "#startDate", function(){
		$(this).parent().siblings("#isHeaderModified").val("1");
	});
	
	$(".bg1").on('change', "#endDate", function(){
		$(this).parent().siblings("#isHeaderModified").val("1");
	});
	$(".bg1").on('change', "#startTime", function(){
		$(this).parent().siblings("#isHeaderModified").val("1");
	});
	
	$(".bg1").on('change', "#endTime", function(){
		$(this).parent().siblings("#isHeaderModified").val("1");
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
	
	
$('#updatePreview').on('click', function() {
		var category_name=$("#category_select option:selected").val();
		var form_name= $("#formName").val();
		var startDate= $("#startDate").val();
		var startTime = $("#startTime").val();
	    var endDate = $("#endDate").val();
	    var endTime = $("#endTime").val();
		
		if(category_name == "")
			alert("카테고리를 선택해주세요 ");
		else if(form_name == "")
			alert("제목을 입력해주세요 ");
		else if(startDate > endDate)
			alert("마감일자를 다시 설정해주세요 ");
	    	else if(startDate == endDate && startTime > endTime)
	    		alert("마감 시간을 다시 설정해주세요 ");
		else{
		
		console.log("preview test");
		
		//formName,categoryName, explanation, plusPoint, isAvailable, isUerEdit, minusPoint, startDate, startTime, endDate,endTime
		var form_name= $("input[name=formName]").val();
		//var categoryName= $("input[name=categoryName]").val();
		var form_detail=$("textarea[name=explanation]").val();
		
		var form_startDate=startDate+" "+startTime;
		var form_endDate=endDate+" "+endTime;
		
		//f_cnt(field count), f_title, f_type, isEssential, 
		var f_cnt=$("input[name=count]").val();
		
		var field_len=f_cnt+1;
		var field_id = new Array(field_len);
		var field_name = new Array(field_len);
		var field_type= new Array(field_len);
		var field_star=new Array(field_len);
		var isFieldDel=new Array(field_len);
		var item_count=new Array(field_len);
		
		
		var item_len=0;
		for(var i=1; i<=f_cnt; i++){ 
			item_len+=$("input[name='count"+i+"']").val();
		}
		
		var content=new Array(item_len);
		var isDefault=new Array(item_len);
		var isItemDel=new Array(item_len);
		
		var i_cnt;
		var idx=0;
		for(var i=1; i<=f_cnt; i++){ 
			
			field_id[i]= i;
			
			field_name[i]= $("input[name='f_title"+i+"']").val();
			field_type[i]= $("select[name='f_type"+i+"']").val();
			field_star[i]= $("input[name='isEssential"+i+"']").val();
			isFieldDel[i]=$("input[name='isFieldDel"+i+"']").val();
			i_cnt=$("input[name='count"+i+"']").val();
			item_count[i]=i_cnt;
			if(field_type[i]=="select" || field_type[i]=="checkbox" || field_type[i]=="radio"){
				for(var j=1; j<=i_cnt; j++){ 
					idx++;
					
					content[idx]=$("input[name='"+i+"content"+j+"']").val();
					isDefault[idx]=0;
					isItemDel[idx]=$("input[name='"+i+"isItemDel"+j+"']").val();
				} 
			}
		}
		
		//i_cnt (item count), content, 
	    // 모달창 띄우기
	    
	    var sendData={"form_name":form_name,"form_detail":form_detail,"form_startDate":form_startDate,"form_endDate":form_endDate,"f_cnt":f_cnt,"field_id":field_id,"field_name":field_name,"field_type":field_type,"field_star":field_star,"isFieldDel":isFieldDel,"item_count":item_count,"content":content,"isDefault":isDefault,"isItemDel":isItemDel};
	    
	    console.log(sendData);
	    
	    $.ajax({
			url: "update/preview",
		 	type:'POST',
		   	traditional : true,
		   	data: sendData,
		  	success:function(result){
		    	$("#preview_modal").html(result);
		    	console.log("modal preview");
		     	modal('preview_modal');
		   	},
		   	error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
		          		
	    }//else 구문
	});
	

});

//모달창
	function modal(id) {
	    var zIndex = 9999;
	    var modal = $('#' + id);
	
	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = $('<div id="bg">')
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
				display:'block',
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
	        	$("#preview_modal").empty();
	            bg.remove();
	            modal.hide();
	        });
	}