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

    <title>Admin my page</title>

    <!-- Responsive Tables -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">
    <!--  button css-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/buttonstyle.css?v=2">
	
   
    <!-- Latest compiled and minified Bootstrap JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/rwd-table.js?v=5.3.1"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 아이콘 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    <!-- 필터링 -->
    <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
    
  <link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/assets/css/mypage.css?ver=1">
    
    <script>
    $(document).ready( function() {
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
  
  <main>
  
  	<div id="headTitle">
		<div id="welcomeMsg"><img id="profileImg" src="<%=request.getContextPath()%>/resources/img/smile.png"><h2 >안녕하세요 ${name} 님 <span><img id="settingsIcon" alt="profileImg" src="<%=request.getContextPath()%>/resources/img/settings.png"></span></h2></div>
     </div>

    <section id="demo">
    <div class="container">

          <div class="table-responsive" data-pattern="priority-columns">
              <table cellspacing="0" id="tech-companies-1" class="table table-small-font table-bordered table-striped">
                  <thead>
                      <tr>
                          <th>링크</th>
                          <th>
							<select class="filters filter-category" id="categoryName" data-filter-group='category'>
			  					<option data-filter='' value="*">카테고리</option>
			  				</select>
						  </th>
                          <th data-priority="1">제목</th>
                          <th data-priority="2">신청 기간</th>
                          <th data-priority="2">등록 일자</th>
                          <th data-priority="2">등록자</th>
                          
                          <th data-priority="1">
							<select class="filters filter-status" id="status" data-filter-group='status'>
			  					<option data-filter='' value="*" selected>상태</option>
			  					<option data-filter='.예약' value="예약">예약</option>
			  					<option data-filter='.신청중' value="신청중">신청중</option>
			  					<option data-filter='.신청마감' value="신청마감">신청마감</option>
			  				</select>
						  </th>
                          <th data-priority="1">폼 관리</th>
                          <th data-priority="1">폼 신청</th>
                      </tr>
                  </thead>
                  
                  <tbody class="tbodies">
                  	   
                      
                  </tbody>
              </table>


          </div> 
          <div id="moreContent">  
	          <ul class="pagination">
			    <c:if test="${pageMaker.prev}">
			    <li>
			        <a href='<%=request.getContextPath()%>/admin/mypage?page=${pageMaker.startPage-1}&filterType=${cri.filterType}&searchType=${searchOption}&keyword=${keyword}'>&laquo;</a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li>
			        <a href='<%=request.getContextPath()%>/admin/mypage?page=${idx}&filterType=${cri.filterType}&searchType=${searchOption}&keyword=${keyword}'>${idx}</a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    <li>
			        <a href='<%=request.getContextPath()%>/admin/mypage?page=${pageMaker.endPage+1}&filterType=${cri.filterType}&searchType=${searchOption}&keyword=${keyword}'>&raquo;</a>
			    </li>
			    </c:if>
		  </ul>
		  </div>
		  
		  <!--Start_Filter and Search part-->
          <nav class="filter_search" >
           
            <form class="form-inline" name="searchForm" action="<%=request.getContextPath()%>/admin/mypage" method="GET" >
	  			<input type="hidden" name="searchType" value="all">
	  			<input type="text" class="form-control mr-sm-2" name="keyword" value="${keyword}" placeholder="검색" aria-label="검색">
	  			<button class="btn btn-outline-success my-2 my-sm-0 submitB" type="submit">Search</button>
  			</form>
            
          </nav>
		   <!--End_Filter and Search part-->  
	
		  
      </div> <!-- end container -->
  </section> <!-- end section -->
  </main>
     
    <jsp:include page="/WEB-INF/views/basic/footer.jsp" />

	<script src="<%=request.getContextPath()%>/resources/assets/js/isotope.js"></script>
        <script>

							//표 동적 생성하는 부분
                            $(document).ready(function () {

								var categoryList=${categoryList};
								for(var i=0; i < categoryList.length; i++){
									var option=$("<option data-filter='.category"+categoryList[i].id+"' value='"+categoryList[i].categoryName+"'>"+categoryList[i].categoryName+"</option>");
									$(".filter-category").append(option);
								}
                                
	                            var adminList=${adminList};
	                            for(var i=0; i < adminList.length; i++){
	                                
	                    		    /*설문지 별 tr 만듦*/
	                    		    var divOne = $("<tr class='form-item"+i+" item-row category"+adminList[i].category_id+"' data-category='category"+adminList[i].category_id+"' data-status='' ></tr>"); 
	                    		    //var divOne = $("<tr></tr>"); 
	                    		   	$(".tbodies").append(divOne);
	
	                    		   	/* tr의 안에 들어갈 td */
	                    		   	var whole_addr = $(location).attr('href');
	                    		   	var addr_slice = whole_addr.split('/');
	                    		   	var addr = addr_slice[0]+"/"+addr_slice[1]+"/"+addr_slice[2]+"/"+addr_slice[3];
	                    		    var td1 = $("<td><input type='hidden'  id='url' value="+addr+"/form/"+adminList[i].url+"/><a href='#' class='urlCopyBtn'><i class='fas fa-link'></i></a></td>"); 
	                    		    $($(".tbodies").children()[i]).append(td1);
	
	                    		    var th1 = $("<th>"+adminList[i].categoryName+"<span class='co-name'></span></th>"); 
	                    		    $($(".tbodies").children()[i]).append(th1);
	                    		    var td2 = $("<td>"+adminList[i].formName+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td2);
	                    		    var td3 = $("<td>"+moment(adminList[i].startDate).format('YYYY.MM.DD HH')+" ~ "+moment(adminList[i].endDate).format('YYYY.MM.DD HH')+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td3);
	                    		    var td4 = $("<td>"+moment(adminList[i].regDate).format('YYYY.MM.DD')+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td4);
	                    		    var td5 = $("<td>"+adminList[i].userName+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td5);

									//모집중(수정가능,결과보기), 모집마감(결과보기,신청자가 없으면 삭제 가능), 예약(수정가능,삭제가능)
									//예약(수정,삭제)
	                    			if(new Date(adminList[i].startDate) > new Date()){
	                    				var td6 = $("<td>예약</td>"); 
		                    		    $($(".tbodies").children()[i]).append(td6);
		                    		    

										var a=$("<td><button id='form_"+adminList[i].id+"' type='button' class='btn mb-md-0 mb-2 btn-outline iconButton' onClick = 'openForm(this);'><img class='iconImg' src='../resources/img/edit2.png'><span class='tooltiptext'>수정</span></button><button id='deleteForm_"+adminList[i].id+"' type='button' class='btn mb-md-0 mb-2 btn-outline iconButton' onClick = 'deleteForm(this);'><img class='iconImg' src='../resources/img/trash2.png'><span class='tooltiptext'>삭제</span></button></td>");

										$($(".tbodies").children()[i]).append(a);
										var form=$("<form id='form' action='<%=request.getContextPath()%>/admin/form/view/{link}' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+adminList[i].id+"'/></form>");
										$($(".tbodies").children()[i]).append(form);
										var form2=$("<form id='deleteForm' action='deleteForm' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+adminList[i].id+"'/></form>");
										$($(".tbodies").children()[i]).append(form2);

										$(".form-item"+i).addClass('예약');
										$(".form-item"+i).attr('data-status','예약');
	                    			}
	                    			//모집마감(결과보기, 신청자가 없으면 삭제 가능)
	                    			else if((new Date()>new Date(adminList[i].endDate)) || adminList[i].isUserEdit==1){

		                    			if(!(new Date()>new Date(adminList[i].endDate)) && adminList[i].isUserEdit==1)
	                    					var td6 = $("<td>신청중지</td>"); 
		                    			else
		                    				var td6 = $("<td>신청마감</td>"); 
		                    		    $($(".tbodies").children()[i]).append(td6);
		                    			

	                    				var a=$("<td><button id='resultForm_"+adminList[i].id+"' type='button' class='btn mb-md-0 mb-2 btn-outline iconButton' onClick = 'resultForm(this);'><img class='iconImg' src='../resources/img/form.png'><span class='tooltiptext'>응답지</span></button></td>");

										$($(".tbodies").children()[i]).append(a);
										var form=$("<form id='resultForm' action='resultForm' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+adminList[i].id+"'/></form>");
										$($(".tbodies").children()[i]).append(form);
										
										var resultCount;
										$.ajax({ //해당 form의 신청자 count가져오기
											url : "resultCount",
										  	type : "post",
										  	data:{"form_id":adminList[i].id},
										  	dataType : "json",
										  	async: false,
										  	success: function(data){
										  		resultCount = data;
										  	},
										  	error:function(request, status, error){

												alert("code:"+request.status+"\n"+"\n"+"error:"+error);

											}
										});

										if(resultCount==0){
											var plus_a=$("<a href='#' id='deleteForm_"+adminList[i].id+"' class='filled-button' onClick = 'deleteForm(this);'>삭제</a>");
											$($(".tbodies").children()[i]).find("#resultForm_"+adminList[i].id).parent().append(plus_a);
											var form2=$("<form id='deleteForm' action='deleteForm' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+adminList[i].id+"'/></form>");
											$($(".tbodies").children()[i]).append(form2);
										}

										$(".form-item"+i).addClass('신청마감');
										$(".form-item"+i).attr('data-status','신청마감');
		                    		}
		                    		
		                    		/* 중지할 경우 */
		                    		//모집중
		                    		else{
		                    			var td6 = $("<td>신청중</td>"); 
		                    		    $($(".tbodies").children()[i]).append(td6);
		                    		    

										var a=$("<td><button id='form_"+adminList[i].id+"'  type='button' class='btn mb-md-0 mb-2 btn-outline iconButton' onClick = 'openForm(this);'><img class='iconImg' src='../resources/img/edit2.png'><span class='tooltiptext'>수정</span></button><button id='resultForm_"+adminList[i].id+"' type='button' class='btn mb-md-0 mb-2 btn-outline iconButton' onClick = 'resultForm(this);'><img class='iconImg' src='../resources/img/form.png'><span class='tooltiptext'>응답지</span></button></td>");
										$($(".tbodies").children()[i]).append(a);
										var form=$("<form id='form' action='<%=request.getContextPath()%>/admin/form/view/{link}' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+adminList[i].id+"'/></form>");
										$($(".tbodies").children()[i]).append(form);
										var form2=$("<form id='resultForm' action='resultForm' method='POST'><input type='hidden' id='select_formID' name='select_formID' value='"+adminList[i].id+"'/></form>");
										$($(".tbodies").children()[i]).append(form2);


										$(".form-item"+i).addClass('신청중');
										$(".form-item"+i).attr('data-status','신청중');
			                    	}
	                    			var td7 = $("<td><button type='button' class='btn mb-2 mb-md-0 btn-round' style='border: 3px solid #ffd500;'>신청하기 </button></td>"); 
	                    		    $($(".tbodies").children()[i]).append(td7);
			                    	
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
                            function openForm(obj){
                           		$(obj).parent().siblings("#form").submit();
                            }
                            function deleteForm(obj){
                            	$(obj).parent().siblings("#deleteForm").submit();
                            }
                            function resultForm(obj){
                            	$(obj).parent().siblings("#resultForm").submit();
                            }

                          $(document).ready( function() {   
                    	        // select change,
                    	        $('.filters').on( 'change', function() {
                        	        console.log($(this).attr("id"));
                        	        console.log($(this).val());
									$("#searchType").val($(this).attr("id"));
									$("#keyword").val($(this).val());
									$(".form-inline").submit();
                    	        });

                          });
                            
                      </script>
  </body>

</html>