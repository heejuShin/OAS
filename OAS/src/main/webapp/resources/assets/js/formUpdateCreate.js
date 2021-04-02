 
var dup_check = false;
function isValidForm(){
    if(!dup_check){
        alert("링크 중복 체크를 해주세요.");
        $("#red_ck_link").focus();
    	return false;
    }
    else return true;
}


$( document ).ready(function() {

	//링크 값 변경 감지
	$("#link").on("change keyup paste", function(){
		dup_check = false;
		$("#link_dup_txt").html("");
		$("#link").css("background-color","#f4f1f1");
	});
	//keydown event 없애기 (enter 눌러도 전송안되게)
	$('input[type="text"]').keydown(function() {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	});
	
	$("#list").on('keydown', "input[type='text']", function(){
	 if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	});
	//중복 체크 안하면 못 넘어가게
	//링크 중복 체크 
	    $("#red_ck_link").click(function(){
	    	var whole_addr = $(location).attr('href');
	        var addr_slice = whole_addr.split('/');
	        var addr = addr_slice[0]+"/"+addr_slice[1]+"/"+addr_slice[2]+"/"+addr_slice[3];
	        
	        console.log(linkOri);
	      if($("#link").val()==""){
	        $("#link").focus();
	        alert("링크를 입력해주세요.");
	      }
	      else if($("#link").val()==$("#linkOri").val()){
	      		$("#link_dup_txt").html("<span style='color:green;' class='overlap_msg' >사용가능</span><input type='hidden' id='url'/><a href='#'class='urlCopyBtn'><i class='fas fa-link' style='margin-left: 5px'></i></a>");
	              $("#url").val(addr+"/form/"+$("#link").val());
	        	  $("#url").html(addr+"/form/"+$("#link").val());
	              $("#link").css("background-color","#e4eee4");
	              dup_check=true;
	      }
	      else{
	        $.ajax({
	          type: "post",
	          url: "link_finder",
	          data : {
	            "link" : $("#link").val()
	          },
	          dataType: 'text',
	          success : function(data){
	            if(data=="success"){
	              $("#link_dup_txt").html("<span style='color:green;' class='overlap_msg' >사용가능</span><input type='hidden' id='url'/><a href='#'class='urlCopyBtn'><i class='fas fa-link' style='margin-left: 5px'></i></a>");
	              $("#url").val(addr+"/form/"+$("#link").val());
	        	  $("#url").html(addr+"/form/"+$("#link").val());
	              $("#link").css("background-color","#e4eee4");
	              dup_check=true;
	            }
	            else{
	              $("#link").val("");
	              $("#link_dup_txt").html("<span style='color:red;' class='overlap_msg'>사용불가</span>");
	              $("#link").css("background-color","#eee6e4");
	              dup_check=false;
	            }
	          }, error:function(request, status, error){
	    		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          }
	        });
	      }
	    });
	    
	    $("#link_dup_txt").on('click', ".urlCopyBtn", function(){
     
        	$(this).siblings("#url").attr("type","text");
        	$(this).siblings("#url").select();
			document.execCommand('copy');
			$(this).siblings("#url").attr("type","hidden");
			//formUrl.blur();
			alert("신청폼의 URL이 복사되었습니다");
        });
	//모달창
	
	$('#confirm').on('click', function() {
		alert("hello");
		console.log("confirm click");
   		
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

	
	//메뉴바 이동 코드
	$(window).scroll(function(){
	  var scrollTop = $(document).scrollTop();
	    $("#menu-bar").stop();
	    $("#menu-bar").animate( { "top" : scrollTop + 240 });
	  });
	
	//질문 유형 선택
	$("#list").on('change', ".field_type", function(){
		$(this).siblings(".content").empty();
	    var content;
	    if(this.value=="textarea"){
	      content = "<textarea class=\"textareaInput \" placeholder=\"장문형 작성칸\" disabled></textarea>";
	    }
	    else if(this.value=="select"){
	      content = "<select id=\"\" style=\"display:inline-block; margin-bottom: 10px;\"><option disabled>추가된 옵션들</option></select><br><input type='text' class=\"inputs \" placeholder=\"보기(옵션)을 작성해주세요. \" value=\"\"/><button type=\"button\" class=\"btn_add_select optionAddB\">옵션에 추가</button><div class=\"selectOption\" style=\"margin-top:2%;padding:2%;border:0.5px dashed black\"><p><드롭다운에 들어갈 항목></p></div><div class=\"list_select\"></div>";
	    }
	    else if(this.value=="radio"){
	      content = "<input type='text' class=\"inputs \" placeholder=\"보기를 ,로 구별하여 작성해주세요. (예시 : 여자,남자) \" value=\"\"/><button type=\"button\" class=\"btn_add_radio optionAddB\">옵션에 추가</button><div class=\"list_radio\"></div>";
	    }
	    else if(this.value=="checkbox"){
	      content = "<input type='text' class=\"inputs \" placeholder=\"보기(옵션)을 작성해주세요. \" value=\"\"/><button type=\"button\" class=\"btn_add_chxbox optionAddB\">옵션에 추가</button><div class=\"list_chxbox\"></div>";
	    }
	    else{
	      content = "<input type='text' class=\"inputs \" placeholder=\"단답형 작성칸\" type=\""+this.value+"\" disabled/>";
	    }
	    $(this).siblings(".content").html(content);
	});
	
	//field 추가
	$("#menu-bar").click(function(){
	  var count = $("div#list").children().length+1;
	 console.log("count: "+count);
	  if(count<0)
		count=1;
	  $("#field_add").find(".field").attr("id", "field"+count);
	  $("#field_add").find(".isEssential").attr("name", "isEssential"+count);
	  $("#field_add").find(".isFieldDel").attr("name", "isFieldDel"+count);
	  $("#field_add").find(".field_title").attr("name", "f_title"+count);
	  $("#field_add").find(".field_type").attr("name", "f_type"+count);
	  $("#field_add").find(".count").attr("name", "count"+count);
	  $("#field_add").find(".count").attr("value", "0");
	  $("#field_add").find(".index").attr("value", count);
	  
	  $("#field_add").find(".isFieldOri").attr("name", "isFieldOri"+count);
	  $("#field_add").find(".isFieldOri").attr("value", "0");
	  $("#count").val(count);
	  $("#list").append($("#field_add").html());

	});
	
	
	//객관식 아이템 추가-버튼 클릭시
	$("#list").on('click', ".btn_add_radio", function(){
	
	  //문자열 처리 (, 기준)
		var inputs = $(this).siblings('input').val();
		var lastChar = inputs.charAt(inputs.length-1); 

		if(lastChar == ','){
			inputs = inputs.slice(0,-1); //마지막 문자 콤마(,) 지움 
		}
		
		inputs = inputs.split(",");
		
		for(var i = 0 ; i < inputs.length; i++){
			if(inputs[i]=="") continue;
			var r_cnt = parseInt($(this).parent().siblings(".count").val())+1;
			  $(this).parent().siblings(".count").val(r_cnt);
			  
			  var idx = $(this).parent().siblings(".index").val();
			  
			  $("#radio_add").find(".radio_real").attr("name", idx+"content"+String(r_cnt));
			  $("#radio_add").find(".radio_real").attr("value",inputs[i]);
			  $("#radio_add").find("label").html(inputs[i]);
			  
			  $("#radio_add").find(".radio_itemId").attr("name", idx+"itemId"+String(r_cnt));
			  $("#radio_add").find(".isItemDel").attr("name", idx+"isItemDel"+String(r_cnt));
			  $("#radio_add").find(".isItemDel").attr("value", "0");
			  $("#radio_add").find(".isItemOri").attr("name", idx+"isItemOri"+String(r_cnt));
			  $("#radio_add").find(".isItemOri").attr("id", "optionOri"+String(r_cnt));
			  $("#radio_add").find(".isItemOri").attr("value", "0");
			  $(this).siblings(".list_radio").append($("#radio_add").html());
			  
		}
		$(this).siblings("input").val("");
	});
	
	//객관식,체크박스,드롭다운 아이템 추가-엔터 입력시 
	$("#list").on('keydown', ".inputs", function(e){
		if (e.keyCode === 13) {
		  	//문자열 처리 (, 기준)
			var inputs = $(this).val();
			var lastChar = inputs.charAt(inputs.length-1);
			 
	
			if(lastChar == ','){
				inputs = inputs.slice(0,-1); //마지막 문자 콤마(,) 지움 
			}
			
			inputs = inputs.split(",");
			
			//객관식 
			var s_o = $(this).parent(".content").siblings(".field_type").val();
			
			
			if(s_o == "radio"){
				for(var i = 0 ; i < inputs.length; i++){
					if(inputs[i]=="") continue;
					var r_cnt = parseInt($(this).parent().siblings(".count").val())+1;
					  $(this).parent().siblings(".count").val(r_cnt);
					  
					  var idx = $(this).parent().siblings(".index").val();
					  
					  $("#radio_add").find(".radio_real").attr("name", idx+"content"+String(r_cnt));
					  $("#radio_add").find(".radio_real").attr("value",inputs[i]);
					  $("#radio_add").find("label").html(inputs[i]);
					  $("#radio_add").find(".radio_itemId").attr("name", idx+"itemId"+String(r_cnt));
					  $("#radio_add").find(".isItemDel").attr("name", idx+"isItemDel"+String(r_cnt));
					  $("#radio_add").find(".isItemDel").attr("value", "0");
					  $("#radio_add").find(".isItemOri").attr("name", idx+"isItemOri"+String(r_cnt));
					  $("#radio_add").find(".isItemOri").attr("value", "0");
					  $("#radio_add").find(".isItemOri").attr("id", "optionOri"+String(r_cnt));
					  $(this).siblings(".list_radio").append($("#radio_add").html());
					  
				}
			}
			
			//체크박스 
			if(s_o == "checkbox"){
				for(var i = 0 ; i < inputs.length; i++){
	 			if(inputs[i]=="") continue;
	 			var c_cnt = parseInt($(this).parent().siblings(".count").val())+1;
	 	 		  $(this).parent().siblings(".count").val(c_cnt);
	
	 	  		  var idx = $(this).parent().siblings(".index").val();
	
	 			  $("#chxbox_add").find(".checkbox_real").attr("name", idx+"content"+String(c_cnt));
	 			  $("#chxbox_add").find(".checkbox_real").attr("value",inputs[i]);
	 			  $("#chxbox_add").find(".checkbox_itemId").attr("name", idx+"itemId"+String(c_cnt));
	 			  $("#chxbox_add").find(".isItemDel").attr("name", idx+"isItemDel"+String(c_cnt));
	 			  $("#chxbox_add").find(".isItemDel").attr("value", "0");
	 			  $("#chxbox_add").find(".isItemOri").attr("name", idx+"isItemOri"+String(c_cnt));
	 			  $("#chxbox_add").find(".isItemOri").attr("value", "0");
	 			  $("#chxbox_add").find(".isItemOri").attr("id", "optionOri"+String(c_cnt));
	 			  $("#chxbox_add").find("label").html(inputs[i]);
	 			  $(this).siblings(".list_chxbox").append($("#chxbox_add").html());
	 			}
 			}
 			//드롭다운
 			if(s_o == "select"){ 
	 			for(var i = 0 ; i < inputs.length; i++){
		 			if(inputs[i]=="") continue;
		 	  		var o_cnt = parseInt($(this).parent().siblings(".count").val())+1;
		 	 		 $(this).parent().siblings(".count").val(o_cnt);
		
		 	  		 var idx = $(this).parent().siblings(".index").val();
		
		 			  $("#select_value_add").find(".option_real").attr("name", idx+"content"+String(o_cnt));
		 			  $("#select_value_add").find(".option_real").attr("value",inputs[i]);
		 			  $("#select_value_add").find(".isItemOri").attr("name", idx+"isItemOri"+String(o_cnt));
		 			  $("#select_value_add").find(".isItemOri").attr("value", "0");
		 			  $("#select_value_add").find(".isItemOri").attr("id", "optionOri"+String(o_cnt));
		 			  $("#select_value_add").find(".isItemDel").attr("name", idx+"isItemDel"+String(o_cnt));
		 			  $("#select_value_add").find(".isItemDel").attr("id", "option"+String(o_cnt));
		 			  $("#select_value_add").find(".isItemDel").attr("value", "0");
		 			  
		 			  $("#select_value_add").find(".select_itemId").attr("name", idx+"itemId"+String(o_cnt));
		 			  
		 			  $("#select_add").find("option").attr("value", inputs[i]);
		 			  $("#select_add").find("option").html(inputs[i]);
		 			  $(this).siblings("select").append($("#select_add").html());
		 			  $(this).siblings(".list_select").append($("#select_value_add").html());
		 			  
		 			  $("#selectBox_add").find("label").html(inputs[i]);
 			  		  $("#selectBox_add").find("button").attr("id",String(o_cnt));
 			 		  $(this).siblings(".selectOption").append($("#selectBox_add").html());
		 	  	}
			}
			$(this).val("");
			
		}
	});
	//체크박스 아이템 추가-버튼 클릭시
	$("#list").on('click', ".btn_add_chxbox", function(){

 	  //문자열 처리 (, 기준)
 		var inputs = $(this).siblings('input').val();
 		var lastChar = inputs.charAt(inputs.length-1); 

 		if(lastChar == ','){
 			inputs = inputs.slice(0,-1); //마지막 문자 콤마(,) 지움 
 		}

 		inputs = inputs.split(",");

 		for(var i = 0 ; i < inputs.length; i++){
 			if(inputs[i]=="") continue;
 			var c_cnt = parseInt($(this).parent().siblings(".count").val())+1;
 	 		  $(this).parent().siblings(".count").val(c_cnt);

 	  		  var idx = $(this).parent().siblings(".index").val();

 			  $("#chxbox_add").find(".checkbox_real").attr("name", idx+"content"+String(c_cnt));
 			  $("#chxbox_add").find(".checkbox_real").attr("value",inputs[i]);
 			  $("#chxbox_add").find(".checkbox_itemId").attr("name", idx+"itemId"+String(c_cnt));
 			  $("#chxbox_add").find(".isItemDel").attr("name", idx+"isItemDel"+String(c_cnt));
		 	  $("#chxbox_add").find(".isItemDel").attr("value", "0");
 			  $("#chxbox_add").find(".isItemOri").attr("name", idx+"isItemOri"+String(c_cnt));
 			  $("#chxbox_add").find(".isItemOri").attr("value", "0");
 			  $("#chxbox_add").find(".isItemOri").attr("id", "optionOri"+String(c_cnt));
 			  $("#chxbox_add").find("label").html(inputs[i]);
 			  $(this).siblings(".list_chxbox").append($("#chxbox_add").html());
 		}
 		$(this).siblings("input").val("");
 	});
 	//드롭다운 아이템 추가 - 버튼 
 	$("#list").on('click', ".btn_add_select", function(){

 	  //문자열 처리 (, 기준)
 		var inputs = $(this).siblings('input').val();
 		var lastChar = inputs.charAt(inputs.length-1); 

 		if(lastChar == ','){
 			inputs = inputs.slice(0,-1); //마지막 문자 콤마(,) 지움 
 		}

 		inputs = inputs.split(",");

 		for(var i = 0 ; i < inputs.length; i++){
 			if(inputs[i]=="") continue;
 	  		var o_cnt = parseInt($(this).parent().siblings(".count").val())+1;
 	 		 $(this).parent().siblings(".count").val(o_cnt);

 	  		 var idx = $(this).parent().siblings(".index").val();

 			  $("#select_value_add").find(".option_real").attr("name", idx+"content"+String(o_cnt));
 			  $("#select_value_add").find(".option_real").attr("value",inputs[i]);
 			  $("#select_value_add").find(".isItemOri").attr("name", idx+"isItemOri"+String(o_cnt));
 			  $("#select_value_add").find(".isItemOri").attr("value", "0");
 			  $("#select_value_add").find(".isItemOri").attr("id", "optionOri"+String(o_cnt));
		 	  $("#select_value_add").find(".isItemDel").attr("name", idx+"isItemDel"+String(o_cnt));
		 	  $("#select_value_add").find(".isItemDel").attr("id", "option"+String(o_cnt));
		 	  $("#select_value_add").find(".isItemDel").attr("value", "0");
		 	  $("#select_value_add").find(".select_itemId").attr("name", idx+"itemId"+String(o_cnt));
		 	  
 			  $("#select_add").find("option").attr("value", inputs[i]);
 			  $("#select_add").find("option").html(inputs[i]);
 			  $(this).siblings("select").append($("#select_add").html());
 			  $(this).siblings(".list_select").append($("#select_value_add").html());
 			  
 			  $("#selectBox_add").find("label").html(inputs[i]);
 			  $("#selectBox_add").find("button").attr("id",String(o_cnt));
 			  $(this).siblings(".selectOption").append($("#selectBox_add").html());
 	  }

	  $(this).siblings("input").val("");
	});
	
	//div 크기 조절 코드
	$(function(){
	  $("#list").on('mouseover', ".field", function(e){
	  //$(".field").mousemove(function(e){
	  var x = e.pageX-$(this).position().left;
	  var y = e.pageY-$(this).position().top;
	  var z = $(this).width();
	
	    $(this).css("cursor", "e-resize");
	    $(this).resizable({
	      minHeight:100,
	      maxHeight:1000,
	      minWidth: 700,
	      maxWidth: 700
	    });
	    }).mouseout(function(){
	    $(this).css("cursor", "default");
	  });
	});
	  
	//체크박스 값 전달
	$("#list").on('change', ".isEssential_fake", function(){
		if ($(this).is(":checked")) {
			$(this).parent().siblings(".isEssential").val("1");
		} else {
			$(this).parent().siblings(".isEssential").val("0");
		}
	});
	
	$("#list").on('change', ".isDefault_fake", function(){
		if ($(this).is(":checked")) {
			$(this).siblings(".isDefault").val("1");
		} else {
			$(this).siblings(".isDefault").val("0");
		}
	});
});
 