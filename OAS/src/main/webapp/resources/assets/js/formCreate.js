$( document ).ready(function() {
	//keydown event 없애기 (enter 눌러도 전송안되게)
	document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
	//중복 체크 안하면 못 넘어가게
	var dup_check = false;
	function isValidForm(){
	    if(!dup_check){
	        alert("링크 중복 체크를 해주세요.");
	        $("#red_ck_link").focus();
	    	return false;
	    }
	    return true;
	}
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
	              $("#link_dup_txt").html("<span style='color:green; font-size:12px;'>사용가능</span>");
	              dup_check=true;
	            }
	            else{
	              $("#link").val("");
	              $("#link_dup_txt").html("<span style='color:red; font-size:12px;'>사용불가</span>");
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
		var name = $("#formName").val();
		if(name=="") name= "<span style=\"color:red\">내용없음</span>";
	    $("#confirm_title").html(name);
	    var select_category = $("#category_select option:selected").html();
		if ($("#category_select option:selected").val()=="") select_category = "<span style=\"color:red\">내용없음</span>";
	    $("#confirm_category").html(select_category);
	    $("#confirm_start").html($("#startDate").val()+ " " + $("#startTime").val());
	    $("#confirm_end").html($("#endDate").val()+ " " + $("#endTime").val());
	    // 모달창 띄우기
	    modal('confirm_modal');
	});

	//메뉴바 이동 코드
	var count = 0;
	
	$(window).scroll(function(){
	  var scrollTop = $(document).scrollTop();
	    $("#menu-bar").stop();
	    $("#menu-bar").animate( { "top" : scrollTop + 240 });
	  });
	
	//질문 유형 선택
	$("#list").on('change', ".field_type", function(){
	    $(this).parent(".field").css("height", "190px");
	    var content;
	    if(this.value=="textarea"){
	      content = "<textarea disabled></textarea>";
	      $(this).parent(".field").css("height", "140px");
	    }
	    else if(this.value=="select"){
	      content = "<select id=\"\" style=\"margin-bottom: 10px;\"><option disabled>추가된 옵션들</option></select><br><input value=\"\"/><button type=\"button\" class=\"btn_add_select\">옵션에 추가</button><div class=\"list_select\"></div>";
	      $(this).parent(".field").css("height", "170px");
	    }
	    else if(this.value=="radio"){
	      content = "<input value=\"\"/><button type=\"button\" class=\"btn_add_radio\">옵션에 추가</button><div class=\"list_radio\"></div>";
	    }
	    else if(this.value=="checkbox"){
	      content = "<input value=\"\"/><button type=\"button\" class=\"btn_add_chxbox\">옵션에 추가</button><div class=\"list_chxbox\"></div>";
	    }
	    else{
	      content = "<input type=\""+this.value+"\" disabled/>";
	      $(this).parent(".field").css("height", "140px");
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
	  var r_cnt = parseInt($(this).parent().siblings(".count").val())+1;
	  $(this).parent().siblings(".count").val(r_cnt);
	  var idx = $(this).parent().siblings(".index").val();
	  $("#radio_add").find(".radio_real").attr("name", idx+"content"+String(r_cnt));
	  $("#radio_add").find(".radio_real").attr("value",$(this).siblings("input").val());
	  $("#radio_add").find("label").html($(this).siblings("input").val());
	  $(this).siblings(".list_radio").append($("#radio_add").html());
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
	      minWidth: 500,
	      maxWidth: 500
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