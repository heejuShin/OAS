<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
	<div style='height:100px;'></div>
  <form>
  <div id="form_div">

      <div class="form view title">
          <h5 style="font-style: italic; float: right">MAC 신청</h5>
          <h2 style="margin-top: 0px">설문조사</h2>
          <h5 style="background: white; padding: 5px 0px; width: 70%; border-radius: 2px; padding-left: 5px;">2021.01.13 ~ 2021.01.31</h5>
          <p>2021년 설문조사입니다. 여기는 신청폼에 대한 설명이들어갑니다. <br>이곳은 유저가 입력한 폼 내용을 확인할 수 있는 곳</p>
      </div>
 
      <div id="list">
        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>단답형<span class="essential"> * <span></h4>
          <div class="content">
            <input type="text" value="신희주" readonly>
          </div>
        </div>

        <div class="form view field" id="filed?" style="height: 120px;"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>장문형<span class="essential"> * <span></h4>
          <div class="content">
            <textarea readonly>캠프는 유익했으나 이러한 점이 아쉬웠습니다.</textarea>
          </div>
        </div>


        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>객관식</h4>
          <div class="content">
            <input type="radio" id="id" name="name" disabled checked><label class="item" for="id">선택된 답</label></input>
            <input type="radio" id="id" name="name" disabled><label class="item" for="id">객관식2</label></input>
            <input type="radio" id="id" name="name" disabled><label class="item" for="id">객관식3</label></input>
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>체크박스</h4>
          <div class="content">
            <input type="checkbox" id="id" name="name" disabled checked><label class="item" for="id">체크박스1</label></input>
            <input type="checkbox" id="id" name="name" disabled checked><label class="item" for="id">체크박스2</label></input>
            <input type="checkbox" id="id" name="name" disabled><label class="item" for="id">체크박스3</label></input>
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>드롭다운</h4>
          <div class="content">
            <select style="width: 300px;" disabled>
              <option value="옵션1" selected>선택된 옵션</option>
              <option value="옵션2">옵션2</option>
            </select>
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>파일업로드</h4>
          <div class="content">
            <!--<input type="file"/>-->
            선택된 파일 : filename
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>날짜</h4>
          <div class="content">
            <input style="height: 30px" type="date" value="2021-09-30" readonly/>
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>시간</h4>
          <div class="content">
            <input style="height: 30px" type="time" value="12:30:15" readonly/>
          </div>
        </div>

      </div>
      <div id="my_modal">
        <h4>설문지 작성이 완료되었습니다.</h4>
        제목: 설문지 제목<br>
        카테고리: Mac 신청<br>
        기간: 21.01.10 ~ 21.01.30 <br>
        링크: www.handong.edu <br>
        <a class="modal_close_btn">확인</a>
    </div>
    </div>

      <div class="form edit button">
        <button type="button" id="submit">확인</button>
      </div>
    </div>
  </form>
 
 <!-- Footer --> 
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
    
  <script>
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

$('#submit').on('click', function() {
    // 모달창 띄우기
    modal('my_modal');
});
</script>

    <script> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

</body>
</html>
