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
	//keydown event 없애기 (enter 눌러도 전송안되게)
	document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
	//중복 체크 안하면 못 넘어가게
	//링크 중복 체크 
	    $("#red_ck_link").click(function(){
	      if($("#link").val()==""){
	        $("#link").focus();
	        alert("링크를 입력해주세요.");
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
	              $("#link_dup_txt").html("<span style='color:green;' class='overlap_msg' >사용가능</span>");
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
	
	$('#confirm').on('click', function() {
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
	
	
	$('#preview').on('click', function() {
		console.log("preview test");
		
		//formName,categoryName, explanation, plusPoint, isAvailable, isUerEdit, minusPoint, startDate, startTime, endDate,endTime
		var form_name= $("input[name=formName]").val();
		//var categoryName= $("input[name=categoryNum]").val();
		var form_detail=$("textarea[name=explanation]").val();
		
		var form_startDate=$("input[name=startDate]").val();
		var form_endDate=$("input[name=endDate]").val();
		
		//f_cnt(field count), f_title, f_type, isEssential, 
		var f_cnt=$("input[name=count]").val();
		
		var field_id = new Array(f_cnt+1);
		var field_name = new Array(f_cnt+1);
		var field_type= new Array(f_cnt+1);
		var field_star=new Array(f_cnt+1);
		var item_count=new Array(f_cnt+1);
		
		var content=new Array(i_cnt+1);
		var isDefault=new Array(i_cnt+1);
		
		var i_cnt;
		for(var i=1; i<=f_cnt; i++){ 
			field_id[i]= i;
			
			field_name[i]= $("input[name='f_title"+i+"']").val();
			field_type[i]= $("input[name='f_type"+i+"']").val();
			field_star[i]= $("input[name='isEssential"+i+"']").val();
			i_cnt=$("input[name='count"+i+"']").val();
			item_count[i]=i_cnt;
			if(field_type[i]=="select" || field_type[i]=="checkbox" || field_type[i]=="radio"){
				for(var j=1; j<=i_cnt; j++){ 
					content[i]=$("input[name='"+i+"f_title"+j+"']").val();
					isDefault[i]=0;
				} 
			}
		}
		
		//i_cnt (item count), content, 
	    // 모달창 띄우기
	    
	    var sendData={"form_name":form_name,"form_detail":form_detail,"form_startDate":form_startDate,"form_endDate":form_endDate,"f_cnt":f_cnt,"field_id":field_id,"field_name":field_name,"field_type":field_type,"field_star":field_star,"item_count":item_count,"content":content,"isDefault":isDefault};
	    
	    console.log(sendData);
	    $.ajax({
			url: "/preview",
		 	type:'POST',
		   	traditional : true,
		   	data: sendData,
		  	success:function(result){
		    	$("#preview_modal").html(result);
		     	
		   	},
		   	error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
		          		
	    modal('preview_modal');
	});

	//메뉴바 이동 코드
	var count = $("div#list").children().length-1;
	
	if(count<0)
		count=0;
	
	$(window).scroll(function(){
	  var scrollTop = $(document).scrollTop();
	    $("#menu-bar").stop();
	    $("#menu-bar").animate( { "top" : scrollTop + 240 });
	  });
	
	//질문 유형 선택
	$("#list").on('change', ".field_type", function(){
	    var content;
	    if(this.value=="textarea"){
	      content = "<textarea class=\"textareaInput \" placeholder=\"장문형 작성칸\" disabled></textarea>";
	    }
	    else if(this.value=="select"){
	      content = "<select id=\"\" style=\"margin-bottom: 10px;\"><option disabled>추가된 옵션들</option></select><br><input class=\"inputs \" placeholder=\"보기(옵션)을 작성해주세요. \" value=\"\"/><button type=\"button\" class=\"btn_add_select optionAddB\">옵션에 추가</button><div class=\"list_select\"></div>";
	    }
	    else if(this.value=="radio"){
	      content = "<input class=\"inputs \" placeholder=\"보기를 ,로 구별하여 작성해주세요. (예시 : 여자,남자) \" value=\"\"/><button type=\"button\" class=\"btn_add_radio optionAddB\">옵션에 추가</button><div class=\"list_radio\"></div>";
	    }
	    else if(this.value=="checkbox"){
	      content = "<input class=\"inputs \" placeholder=\"보기(옵션)을 작성해주세요. \" value=\"\"/><button type=\"button\" class=\"btn_add_chxbox optionAddB\">옵션에 추가</button><div class=\"list_chxbox\"></div>";
	    }
	    else{
	      content = "<input class=\"inputs \" placeholder=\"단답형 작성칸\" type=\""+this.value+"\" disabled/>";
	    }
	    $(this).siblings(".content").html(content);
	});
	
	//field 추가
	$("#menu-bar").click(function(){
	  count++;
	  
	  $("#field_add").find(".field").attr("id", "field"+count);
	  $("#field_add").find(".isEssential").attr("name", "isEssential"+count);
	  $("#field_add").find(".field_title").attr("name", "f_title"+count);
	  $("#field_add").find(".field_type").attr("name", "f_type"+count);
	  $("#field_add").find(".count").attr("name", "count"+count);
	  $("#field_add").find(".index").attr("value", count);
	  $("#count").val(count);
	  $("#list").append($("#field_add").html());

	});
	
	//field 삭제
	$("#list").on('click', ".remove", function(){
	  $(this).parent().remove();
	})
	
	//객관식 아이템 추가
	$("#list").on('click', ".btn_add_radio", function(){
	
	  //문자열 처리 (, 기준)
		var inputs = $(this).siblings('input').val();
		var lastChar = inputs.charAt(inputs.length-1); 

		if(lastChar == ','){
			inputs = inputs.slice(0,-1); //마지막 문자 콤마(,) 지움 
		}
		
		inputs = inputs.split(",");
		
		for(var i = 0 ; i < inputs.length; i++){
			var r_cnt = parseInt($(this).parent().siblings(".count").val())+1;
			  $(this).parent().siblings(".count").val(r_cnt);
			  
			  var idx = $(this).parent().siblings(".index").val();
			  
			  $("#radio_add").find(".radio_real").attr("name", idx+"content"+String(r_cnt));
			  $("#radio_add").find(".radio_real").attr("value",inputs[i]);
			  $("#radio_add").find("label").html(inputs[i]);
			  $(this).siblings(".list_radio").append($("#radio_add").html());
			  
		}
		$(this).siblings("input").val("");
	});
	
	//아이템 삭제
	$("#list").on('click', ".remove_item", function(){
	  $(this).parent().remove();
	})
	//체크박스 아이템 추가
	$("#list").on('click', ".btn_add_chxbox", function(){
	  var c_cnt = parseInt($(this).parent().siblings(".count").val())+1;
	  $(this).parent().siblings(".count").val(c_cnt);
	  var idx = $(this).parent().siblings(".index").val();
	  $("#chxbox_add").find(".checkbox_real").attr("name", idx+"content"+String(c_cnt));
	  $("#chxbox_add").find(".checkbox_real").attr("value",$(this).siblings("input").val());
	  $("#chxbox_add").find("label").html($(this).siblings("input").val());
	  $(this).siblings(".list_chxbox").append($("#chxbox_add").html());
	  $(this).siblings("input").val("");
	});
	//드롭다운 아이템 추가
	$("#list").on('click', ".btn_add_select", function(){
	  var o_cnt = parseInt($(this).parent().siblings(".count").val())+1;
	  $(this).parent().siblings(".count").val(o_cnt);
	  var idx = $(this).parent().siblings(".index").val();
	  $("#select_value_add").find(".option_real").attr("name", idx+"content"+String(o_cnt));
	  $("#select_value_add").find(".option_real").attr("value",$(this).siblings("input").val());
	  $("#select_add").find("option").attr("value", $(this).siblings("input").val());
	  $("#select_add").find("option").html($(this).siblings("input").val());
	  $(this).siblings("select").append($("#select_add").html());
	  $(this).siblings(".list_select").append($("#select_value_add").html());
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
			$(this).siblings(".isEssential").val("1");
		} else {
			$(this).siblings(".isEssential").val("0");
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