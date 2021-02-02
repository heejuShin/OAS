<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" /> <!-- div 크기 조정 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> <!-- 카테고리 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/form.css?a">

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
<script src="<%=request.getContextPath()%>/resources/assets/js/formCreate.js?adf"></script>
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
          		<h2 id="form_title" style="margin-top: 0px"></h2>
			<h5 id="form_date" style="background: white; padding: 5px 0px; width: 70%; border-radius: 2px; padding-left: 5px;"><span id="startDate"></span>~<span id="endDate"></span></h5>
			<p id="form_explation"></p>
      		    </div>
		 
		      <div id="list">
		        <c:forEach items="${read_list}" var="u" varStatus="status">
		       <!-- ${status.count}
		       ${u.id}-->
			<div class="form view field" id="field${u.id}" style="height: 120px;"> <!--?에는 나중에 fieldId나 Index 들어감-->
			  <h4>${u.fieldName}
			  <c:if test="${u.isEssential eq 1 }">
			  <span class="essential">*</span>
			  </c:if>
			  </h4>
			  <c:if test='${u.fieldType eq "text"}'>
			  <div class="content">        
			    <input type="text" value="${u.content}" readonly>
			  </div>
			  </c:if>
			  <c:if test="${u.fieldType eq 'textarea'}">
			  <div class="content">   
				<textarea readonly>${u.content}</textarea>
			  </div>
			  </c:if>
			  <c:if test="${u.fieldType eq 'date'}">
			  <div class="content">   
				<input style="height: 30px" type="date" value="${u.content}" readonly/>
			  </div>
			  </c:if>
			  <c:if test="${u.fieldType eq 'radio'}">
			  <div class="content">   
				<input type="radio" id="id" disabled checked/><label for="id">${u.content}</label>
			  </div>
			  </c:if>
			  <c:if test="${u.fieldType eq 'select'}">
			  <div class="content">   
				<select style="width: 300px;" disabled>
			      <option value="옵션1" selected>${u.content}</option>
			    </select>
			  </div>
			  </c:if>
			  <c:if test="${u.fieldType eq 'checkbox'}">
			  <div class="content">   
				<input type="checkbox" id="id" disabled checked/><label for="id">${u.content}</label>
			  </div>
			  </c:if>
			  <c:if test="${u.fieldType eq 'file'}">
			  <div class="content">   
				<input type="file" id="id" readonly/>선택된 파일 : ${u.content}
			  </div>
			  </c:if>
			  <c:if test="${u.fieldType eq 'time'}">
			  <div class="content">   
				<input type="time" id="id" value="${u.content}" readonly/>
			  </div>
			  </c:if>
			  <!-- 
			  <div class="content">        
			    <input type="text" value="${u.content}" readonly>
			  </div>
			   -->
			</div>
		      	</c:forEach>		
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
<script type="text/javascript">
	$(document).ready(function () {
		var formInfo = ${form_info};
		//alert(formInfo[0].form_name +"  "+ formInfo[0].form_detail +"  "+ formInfo[0].form_startDate + "~~~"+ formInfo[0].form_endDate);
		//form title & explation 만들기 
		$('#form_title').text(formInfo[0].form_name);
		$('#form_explation').text(formInfo[0].form_detail);
		$('#startDate').text(formInfo[0].form_startDate);
		$('#endDate').text(formInfo[0].form_endDate);
	});//document ready
</script>
	

</body>
</html>
