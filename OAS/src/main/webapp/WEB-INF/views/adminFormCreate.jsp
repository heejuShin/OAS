<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Additional CSS Files -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/fontawesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/owl.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/form.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" /> <!-- div 크기 조정 -->

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
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script><!-- div 크기 조정 -->

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

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="index.html"><h2>Sixteen <em>Clothing</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="index.html">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="products.html">Our Products</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">About Us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact Us</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>


<body>
    <div style="height: 100px;"></div>
    <!--body-->
      <form action="formCreate" method="post" modelAttribute = "form">
      <div id="form_div">

          <div id="menu-bar">+</div>

          <div class="form edit title">
              <input name="formName" placeholder="제목을 입력해주세요" value="지워라 나중에" required/>
              <input name="user_id" type="hidden" value="2"/> <!-- value session에서 가져와야함니당 -->
              <select id="category_select" name="category_id" required>
               	<!-- TODO : 카테고리 table에서 READ -->
                <option value="" selected disabled>카테고리 선택</option>
                <!-- value로 카테고리 Id를 넣어야해요! READ할 때 참고해주세욤 -->
                <option value="1">카테고리1</option>
                <option value="2">카테고리2</option>
                <option value="3">카테고리3</option>

              </select><br>
              <input name="startDate" type="date" value="2020-09-23" required/><input name="startTime" type="time" value="10:00" required/>
               ~ <input name="endDate" type="date" value="2020-09-30" required/><input name="endTime" type="time" value="23:00" required/>
              <textarea name="explanation" placeholder="설문지 설명"></textarea>
              <input name="plusPoint" type="hidden" value="0"/> <!-- type="number" -->
              <input name="minusPoint" type="hidden" value="0"/> <!-- type="number" -->
              <input type="hidden" id="count" name="count" value="0"/>
          </div>

          <div class="form edit state">
            상태 선택
          </div>

          <div id="list"></div>

          <div class="form edit button">
            <button type="submit" class="submit">확인</button> <!-- 나중에는 그냥 type button으로 바꾸고 모달창에서 submit 되게해야함니다 -->
          </div>

          <div class="form edit button" style="display: none;"><!--UPDATE시 사용 예정 -->
            <button type="button" class="edit">수정</button>
            <button type="button" class="cancle">취소</button>
          </div>

        </div>
      </form>

      <div class="add" id="field_add">
        <div class="form edit field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <input class="field_title" name="f_title?" placeholder="질문 제목"/>
          <input type=checkbox class="isEssential_fake" name="isEssential_fake">
                  <label for="필수질문">필수</label>
          </input>
          <input type="hidden" name="isEssential?" class="isEssential" value="0"/>
          <input type="hidden" class="index" value="0"/>
          <input type="hidden" class="count" id="count?" name="count?" value="0"/>

          <button type="button" class="remove">X</button><br>
          <select class="field_type" name="f_type?"> <!-- TODO required -->
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
          <div class="content"></div>
        </div>
      </div>

    <div class="add" id="radio_add">
      <div>
        <input class="radio_fake" type="radio" disabled><label class="item" for=""></label></input><button type="button" class="remove_item">X</button>
        <input class="radio_real" type="hidden" name="?content?" value=""/>
      </div>
    </div>

    <div class="add" id="chxbox_add">
      <div>
        <input class="checkbox_fake" type="checkbox" disabled><label class="item" for=""></label></input><button type="button" class="remove_item">X</button>
     	<input class="checkbox_real" type="hidden" name="?content?" value=""/>
      </div>
    </div>

   <div class="add" id="select_add">
        <option class="option_fake" value=""></option>
    </div>
    
    <div class="add" id="select_value_add">
    	<input class="option_real" type="hidden" name="?content?" value=""/>
    </div>

  </body>

    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="inner-content">
              <p>Copyright &copy; 2020 Sixteen Clothing Co., Ltd.

            - Design: <a rel="nofollow noopener" href="https://templatemo.com" target="_blank">TemplateMo</a></p>
            </div>
          </div>
        </div>
      </div>
    </footer>

</html>

<script>
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

/** TODO
* 자동으로 height 조정 (현재는 마우스로 크기조정 가능)
* 그래도 어느 정도의 CSS
* 상태 선택
* 이미지 추가 -> 전체적 or item 마다 -> DB 수정도 필요
* '기타' 추가 기능
* 복사 기능
**/

</script>
