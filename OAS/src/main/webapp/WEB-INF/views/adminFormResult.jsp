<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

		.under_tab {
			list-style: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		/* Float the list items side by side */
		.under_tab li {
			float: left;
		}
		/* Style the links inside the list items */
		.under_tab li a{
			display: inline-block;
			color: black;
			text-align: center;
			text-decoration: none;
			padding: 18px 45px;
			font-size: 17px;
			transition:0.3s;
		}
		
		
		/* Style the tab content */
		.under_tabcontent {
			display: none;
            width: 100%;
			padding: 6px 12px;
		}
		ul.under_tab li.under_current{
			border-radius: 6px 6px 0px 0px;
			background-color: white;
			color: #222;
		}
		.under_tabcontent.under_current {
			display: block;
		}
</style>
</head>
<body>

	<ul class="under_tab">
		<li class="under_current" data-tab="under_tab1"><a href="#">상태체크</a></li>
		<li data-tab="under_tab2"><a href="#">개별보기</a></li>
	</ul>
	
	<div id="under_tab1" class="under_tabcontent">
		<jsp:include page="/WEB-INF/views/adminFormCheck.jsp" />
	</div>
	
	<div id="under_tab2" class="under_tabcontent under_current">
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
	</div>
    
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

/* 하위 탭 */
$(function() {
	$('ul.under_tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.under_tab li').removeClass('under_current');
		$('.under_tabcontent').removeClass('under_current');
		$(this).addClass('under_current');
		$('#' + activeTab).addClass('under_current');
	})
});
</script>

	

</body>
</html>
