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
              <input name="formName" placeholder="제목을 입력해주세요"/>
              <input name="user_id" type="hidden" value="3"/> <!-- value session에서 가져와야함니당 -->
              <select id="category_select" name="category_id">
               	<!-- TODO : 카테고리 table에서 READ -->
                <option value="" selected disabled>카테고리 선택</option>
                <!-- value로 카테고리 Id를 넣어야해요! READ할 때 참고해주세욤 -->
                <option value="1">카테고리1</option>
                <option value="2">카테고리2</option>
                <option value="3">카테고리3</option>

              </select><br>
              <input name="startDate" type="date"/> ~ <input name="endDate" type="date"/>
              <textarea name="explanation" placeholder="설문지 설명"></textarea>
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
          <input class="field_title" placeholder="질문 제목"/>
          <input type=checkbox name="isEssential" value="essential">
                  <label for="필수질문">필수</label>
          </input>
          <button type="button" class="remove">X</button><br>
          <select class="field_type">
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
        <input type="radio" id="" name="" disabled><label class="item" for=""></label></input><button type="button" class="remove_item">X</button>
      </div>
    </div>

    <div class="add" id="chxbox_add">
      <div>
        <input type="checkbox" id="" name="" disabled ><label class="item" for=""></label></input><button type="button" class="remove_item">X</button>
      </div>
    </div>

    <div class="add" id="select_add">
        <option value=""></option>
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
      content = "<select id=\"\" style=\"margin-bottom: 10px;\"><option disabled>추가된 옵션들</option></select><br><input value=\"\"/><button type=\"button\" class=\"btn_add_select\">옵션에 추가</button>";
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
  $("#field_add").find(".field").attr("id", "필드아이디"); //TODO
  //TODO checkbox 필수질문 id나 name
  $("#list").append($("#field_add").html());
});
//field 삭제
$("#list").on('click', ".remove", function(){
  $(this).parent().remove();
})
//객관식 아이템 추가
$("#list").on('click', ".btn_add_radio", function(){
  $("#radio_add").find("input").attr("name", "네임"); //TODO
  $("#radio_add").find("input").attr("id", "아이디"); //TODO
  $("#radio_add").find("label").attr("for", "input아이디"); //TODO
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
  $("#chxbox_add").find("input").attr("name", "네임"); //TODO
  $("#chxbox_add").find("input").attr("id", "아이디"); //TODO
  $("#chxbox_add").find("label").attr("for", "input아이디"); //TODO
  $("#chxbox_add").find("label").html($(this).siblings("input").val());
  $(this).siblings(".list_chxbox").append($("#chxbox_add").html());
  $(this).siblings("input").val("");
});
//드롭다운 아이템 추가
$("#list").on('click', ".btn_add_select", function(){
  $("#select_add").find("option").attr("value", $(this).siblings("input").val());
  $("#select_add").find("option").html($(this).siblings("input").val());
  $(this).siblings("select").attr("id", "아이디"); //TODO
  $(this).siblings("select").append($("#select_add").html());
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

/** TODO
* 추가되는 field id 다르게 처리
* 추가되는 item id 다르게 처리
* 추가되는 item name 필드 내에서는 같게, 필드끼리는 다르게 처리
* 자동으로 height 조정 (현재는 마우스로 크기조정 가능)
* 그래도 어느 정도의 CSS
* 상태 선택
* else(text, file, textarea, 날짜, 시간)등의 id랑 name도 바꾸기
* 이미지 추가 -> 전체적 or item 마다 -> DB 수정도 필요
* '기타' 추가 기능
* 복사 기능
**/

</script>
