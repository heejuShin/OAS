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
    
    <title>Sixteen Clothing HTML Template</title>
    
    <!-- Responsive Tables -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/rwd-table.min.css?v=5.3.1">
   

    <!-- Latest compiled and minified Bootstrap JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/rwd-table.js?v=5.3.1"></script>
    

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <script type="text/javascript">
      $(document).ready(function () {

        //함수1. 체크박스 전체 선택 / 해제 함수
        $("#allCheck").click(function () {

          if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
            $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
          } else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
            $("input[type=checkbox]").prop("checked",false); 
          } 

        });
/*
        //함수2. 'delete' 버튼 클릭시 함수
        $("button[name='deleteB']").click(function () {

          var result_ids = new Array(); //checkbox의 value를 담는다.

          //체크된 박스의 라인에 존재하는 상태 값 변경
          $("input:checkbox[name=formCheck]:checked").each(function() { 

            var test = $(this).val();
            result_ids.push(test);

          });
          //컨트롤러로 정보 전송(ajax) result_id로 state_id update
           if(result_ids.length > 0){
             var sendData = {"resultIDarray": result_ids};

             $.ajax({
                     url:"/admin/deleteForm",
                     type:'POST',
                     data: sendData,
                     success:function(data){
                         console.log(" 선택한 폼 삭제 완료!");
                     },
                     error:function(jqXHR, textStatus, errorThrown){
                         alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
                     }
             });
           }

          //check box 전체 해제
          $("input[type=checkbox]").prop("checked",false); 
        }); */

      });


        

  
    </script>
    
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
  </head>

  <body>

<<<<<<< HEAD
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
                <a class="nav-link" href="products.html">Our Product</a>
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
    <!-- Banner Starts Here -->
    <div class="banner header-text">
      <div class="owl-banner owl-carousel">
        <div class="" style="height: 150px;">
        </div>
      </div>
    </div>
    <!-- Banner Ends Here -->
=======
    <jsp:include page="/WEB-INF/views/basic/header.jsp" />
    
    
>>>>>>> branch 'master' of https://github.com/heejuShin/OAS.git


    <section id="demo">
	    
      <div class="container">
          <div class="page-header" style="border-bottom: 1px solid black; margin : 3% 0%; padding-bottom: 2%">
              <div><img id="profileImg" src="<%=request.getContextPath()%>/resources/img/smile.png"></div>
		    	<div id="welcomeMsg"><h1 >안녕하세요 김해린학부생 님 <span><img id="settingsIcon" alt="profileImg" src="<%=request.getContextPath()%>/resources/img/settings.png"></span></h1></div>
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
	  				<option value="all" <c:out value="${searchType =='all'? 'selected':'' }"/>>등록자+제목+카테고리</option>
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
                          <th><input type="checkbox" id="allCheck" /></th>
                          <th>카테고리</th>
                          <th data-priority="1">제목</th>
                          <th data-priority="2">신청 기간</th>
                          <th data-priority="2">등록 일자</th>
                          <th data-priority="2">등록자</th>
                          <th data-priority="1">상태</th>
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
		  
      </div> <!-- end container -->
  </section> <!-- end section -->
  
  <jsp:include page="/WEB-INF/views/basic/footer.jsp" />
     
    

 

    
        <script>
            $(function() {
                $('#bs-deps').on('hide.bs.collapse show.bs.collapse', function () {
                    $('#bs-deps-toggle').children('span').toggleClass('fa-chevron-down').toggleClass('fa-chevron-up');
                })
            });
        </script>
        <script>

                            /* 검색 버튼을 클릭했을  */
                            $(document).on('click', '#btnSearch', function(e){

                        		e.preventDefault();
                        		var url = "${pageContext.request.contextPath}/board/search";
                        		url = url + "?searchType=" + $('#searchType').val();
                        		url = url + "&keyword=" + $('#keyword').val();
                        		location.href = url;
                        		console.log(url);

                        	});	
                        	
							//표 동적 생성하는 부분
                            $(document).ready(function () {

	                            var userList=${userList};
	                            for(var i=0; i < userList.length; i++){
	                                
	                    		    /*설문지 별 tr 만듦*/
	                    		    var divOne = $("<tr></tr>"); 
	                    		   	$(".tbodies").append(divOne);
	
	                    		   	/* tr의 안에 들어갈 td */
	                    		    var td1 = $("<td><input type='checkbox' name='result' value='"+userList[i].id+"' /></td>"); 
	                    		    $($(".tbodies").children()[i]).append(td1);
	
	                    		    var th1 = $("<th>"+userList[i].categoryName+"<span class='co-name'></span></th>"); 
	                    		    $($(".tbodies").children()[i]).append(th1);

	                    		    var td2 = $("<td>"+userList[i].formName+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td2);

	                    		    var td3 = $("<td>"+userList[i].startDate+" ~ "+userList[i].endDate+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td3);

	                    		    var td4 = $("<td>"+userList[i].regDate+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td4);

	                    		    var td5 = $("<td>"+userList[i].userName+"</td>"); 
	                    		    $($(".tbodies").children()[i]).append(td5);
	                    			
									var a=$("<td><a href='#' id='form_"+userList[i].id+"' class='filled-button' onClick = 'openForm("+userList[i].id+");'>상 태(DB)</a></td>");
									$($(".tbodies").children()[i]).append(a);
	
									var form=$("<form id='form' action='form' method='POST'><input type='hidden' id='select_formID' name='select_formID' value=''/></form>");
									$($(".tbodies").children()[i]).append(form);
									
			                	}
                            });

                            function openForm(form_id){
                            	$('#select_formID').value = form_id;
                            	$("#form").submit();
                            }
                      </script>
                      
                      
  </body>

</html>
