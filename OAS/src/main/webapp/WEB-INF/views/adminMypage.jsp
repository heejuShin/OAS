<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Admin my page</title>

    <!-- Responsive Tables -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">

   
    <!-- Latest compiled and minified Bootstrap JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/rwd-table.js?v=5.3.1"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 아이콘 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    <!-- 필터링 -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <style type="text/css">
    html, body{height:100%;}
        	
    	.page-header{
    		display:block;
    		overflow: auto;
    		}
    		
    	.page-header div{
    		display:block;
    		float:left;
    	}
    	#profileImg{
    	width:70px;
    	height:70px;
    	
    	}
    	.filter_search{
    		clear:both;
    	
    	}
    	#welcomeMsg h1{
    		width:max-content;
    		margin:5% 0% 5% 5%;
    	}
    	
    	#settingsIcon{
    	width:35px;
    	height:35px;
    	}
    	
    </style>
    
    <script type="text/javascript">
      $(document).ready(function () {
/* 
    	//테이블 카테고리, 상태 select
	       var $grid = $('.tbodies').isotope({
	          itemSelector: '.form-item',
	          percentPosition: true,
	            masonry: {
	              columnWidth: ".form-item"
	            }
	        });
	        // bind filter on select change
	        $('.filter-category').on( 'change','option', function() {
	          // get filter value from option value
	          var filterValue = this.value;
	          $grid.isotope({ filter: filterValue });
	        });

	     // bind filter on select change
	        $('.filter-status').on( 'change','option', function() {
	          // get filter value from option value
	          var filterValue = this.value;
	          $grid.isotope({ filter: filterValue });
	        }); */
          
        //함수1. 체크박스 전체 선택 / 해제 함수
        $("#allCheck").click(function () {
          if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
            $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
          } else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
            $("input[type=checkbox]").prop("checked",false); 
          } 
        });
        //함수2. 'delete' 버튼 클릭시 함수
        $("button[name='deleteB']").click(function () {
		  
          var result_ids = new Array(); //checkbox의 value를 담는다.
          //체크된 박스의 라인에 존재하는 상태 값 변경
          $("input[name='result']:checked").each(function() { 
            var test = $(this).val();
            console.log(test);
            result_ids.push(test);
          });
          
          //컨트롤러로 정보 전송(ajax) result_id로 state_id update
           if(result_ids.length > 0){
             var sendData = {"resultIDarray": result_ids};
             
             $.ajax({
                     url:"<%=request.getContextPath()%>/admin/deleteForm",
                     type:'POST',
                     traditional : true,
                     data: sendData,
                     success:function(data){
                         console.log(" 선택한 폼 삭제 완료!");
                     },
                     error:function(request,status,error){
                  	   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                     }
             });
           }
          //check box 전체 해제
          $("input[type=checkbox]").prop("checked",false); 
        });
      });
        
    </script>
  </head>

  <body>

  <jsp:include page="/WEB-INF/views/basic/header.jsp" />



    <section id="demo">
    <div class="container">
      <div class="page-header" style="border-bottom: 1px solid black; margin : 3% 0%; padding-bottom: 2%">
              <div><img id="profileImg" src="<%=request.getContextPath()%>/resources/img/smile.png"></div>
		    	<div id="welcomeMsg"><h1 >안녕하세요 OOO 님 <span><img id="settingsIcon" alt="profileImg" src="<%=request.getContextPath()%>/resources/img/settings.png"></span></h1></div>
		    	<div></div>
          </div>
          <!--Start_Filter and Search part-->
          <nav class="filter_search" >
            <div class="dropdown">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown button
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </div>
            
            <form class="form-inline" name="searchForm" action="<%=request.getContextPath()%>/admin/mypage" method="GET" >
	  			<select name="searchType">
	  				<option value="all" <c:out value="${searchType =='all'? 'selected':'' }"/>>전체</option>
	  				<option value="writer" <c:out value="${searchType =='writer'? 'selected':'' }"/>>등록자</option>
	  				<option value="formName" <c:out value="${searchType =='formName'? 'selected':'' }"/>>제목</option>
	  				<option value="categoryName" <c:out value="${searchType =='categoryName'? 'selected':'' }"/>>카테고리</option>
	  			</select>
	  			<input type="text" class="form-control mr-sm-2" name="keyword" value="${keyword}" placeholder="검색" aria-label="검색">
	  			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  			</form>
            
          </nav>
          <!--End_Filter and Search part-->
          <div class="table-responsive" data-pattern="priority-columns">
              <table cellspacing="0" id="tech-companies-1" class="table table-small-font table-bordered table-striped">
                  <thead>
                      <tr>
                          <th>링크</th>
                          <th>
							<select name="filter-category">
			  					<option value="*">카테고리</option>
			  					<option value=".맥북신청">맥북신청</option>
			  					<option value=".특강신청">특강신청</option>
			  				</select>
						  </th>
                          <th data-priority="1">제목</th>
                          <th data-priority="2">신청 기간</th>
                          <th data-priority="2">등록 일자</th>
                          <th data-priority="2">등록자</th>
                          <th data-priority="1">
							<select name="filter-status">
			  					<option value="*">상태</option>
			  					<option value=".예약">예약</option>
			  					<option value=".신청중">신청중</option>
			  					<option value=".신청마감">신청마감</option>
			  				</select>
						  </th>
                          <th data-priority="1"></th>
                      </tr>
                  </thead>
                  
                  <tbody class="tbodies">
                  	   
                      
                  </tbody>
              </table>
          </div>      
          <ul class="pagination">
			    <c:if test="${pageMaker.prev}">
			    <li>
			        <a href='<%=request.getContextPath()%>/admin/mypage?page=${pageMaker.startPage-1}'>&laquo;</a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li>
			        <a href='<%=request.getContextPath()%>/admin/mypage?page=${idx}'>${idx}</a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    <li>
			        <a href='<%=request.getContextPath()%>/admin/mypage?page=${pageMaker.endPage+1}'>&raquo;</a>
			    </li>
			    </c:if>
		  </ul>
		  
          <div class="button_div">
            <button>create</button>
            <button name="deleteB">Delete</button>
          </div>    
      </div> <!-- end container -->
  </section> <!-- end section -->
     
    <jsp:include page="/WEB-INF/views/basic/footer.jsp" />

    <!--from here, the table things-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

        <!-- Latest compiled and minified Bootstrap JavaScript -->
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

        <script src="<%=request.getContextPath()%>/resources/assets/js/rwd-table.js?v=5.3.1"></script>

        <script>

							//표 동적 생성하는 부분
                            $(document).ready(function () {
	                            var adminList=${adminList};
	                            for(var i=0; i < adminList.length; i++){
	                                
	                    		    /*설문지 별 tr 만듦*/
	                    		    var divOne = $("<tr class='form-item"+i+" filter "+adminList[i].categoryName+"' ></tr>"); 
	                    		    //var divOne = $("<tr></tr>"); 
	                    		   	$(".tbodies").append(divOne);
	
	                    		   	/* tr의 안에 들어갈 td */
	                    		    var td1 = $("<td><input type='hidden'  id='url' value="+adminList[i].url+"/><a href='#' class='urlCopyBtn'><i class='fas fa-link'></i></a></td>"); 
	                    		    $($(".tbodies").children()[i]).append(td1);
	
	                    		    var th1 = $("<th>"+adminList[i].categoryName+"<span class='co-name'></span></th>"); 
	                    		    $($(".tbodies").children()[i]).append(th1);
	                    		    var td2 = $("<td>"+adminList[i].formName+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td2);
	                    		    var td3 = $("<td>"+moment(adminList[i].startDate).format('YYYY MM DD HH:mm:ss')+" ~ "+moment(adminList[i].endDate).format('YYYY MM DD HH:mm:ss')+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td3);
	                    		    var td4 = $("<td>"+moment(adminList[i].regDate).format('YYYY MM DD HH:mm:ss')+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td4);
	                    		    var td5 = $("<td>"+adminList[i].userName+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td5);

									//모집중(수정가능), 모집마감(삭제가능), 예약(수정가능)
									//예약
	                    			if(new Date(adminList[i].startDate) > new Date()){
	                    				var td6 = $("<td>예약</td>"); 
		                    		    $($(".tbodies").children()[i]).append(td6);
		                    		    
										var a=$("<td><a href='#' id='form_"+adminList[i].id+"' class='filled-button' onClick = 'openForm("+adminList[i].id+");'>수정</a></td>");
										$($(".tbodies").children()[i]).append(a);
										var form=$("<form id='form' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+adminList[i].id+"'/></form>");
										$($(".tbodies").children()[i]).append(form);

										/* $(".form-item"+i).addClass('예약'); */
	                    			}
	                    			//모집마감
	                    			else if(new Date()>new Date(adminList[i].endDate)){
	                    				var td6 = $("<td>신청마감</td>"); 
		                    		    $($(".tbodies").children()[i]).append(td6);
		                    			
	                    				var a=$("<td><a href='#' id='form_"+adminList[i].id+"' class='filled-button' onClick = 'openForm("+adminList[i].id+");'>삭제</a></td>");
										$($(".tbodies").children()[i]).append(a);
										var form=$("<form id='form' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+adminList[i].id+"'/></form>");
										$($(".tbodies").children()[i]).append(form);

										/* $(".form-item"+i).addClass('신청마감'); */
		                    		}
		                    		/* 중지할 경우 */
		                    		//모집중
		                    		else{
		                    			var td6 = $("<td>신청중</td>"); 
		                    		    $($(".tbodies").children()[i]).append(td6);
		                    		    
		                    			var a=$("<td><a href='#' id='form_"+adminList[i].id+"' class='filled-button' onClick = 'openForm("+adminList[i].id+");'>수정</a></td>");
										$($(".tbodies").children()[i]).append(a);
										var form=$("<form id='form' action='/form/vidw/{link}' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+adminList[i].id+"'/></form>");
										$($(".tbodies").children()[i]).append(form);

										/* $(".form-item"+i).addClass('신청중'); */
			                    	}
			                	}

	                            $('.urlCopyBtn').click(function(){
	                         
	                            	$(this).siblings("#url").attr("type","text");
	                                 
	                            	$(this).siblings("#url").select();
									document.execCommand('copy');

									$(this).siblings("#url").attr("type","hidden");
									//formUrl.blur();
									alert("신청폼의 URL이 복사되었습니다");
	                            });
                            });
                            function openForm(form_id){
                            	$("#form").submit();
                            }

                            
                      </script>
  </body>

</html>