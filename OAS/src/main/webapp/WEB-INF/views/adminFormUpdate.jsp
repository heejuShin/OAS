<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FormUpdate</title>

</head>
<body>
    
<form>
  <div id="form_div">

      <div class="form view title">
          <h5 style="font-style: italic; float: right">MAC 신청</h5>
          <h2 style="margin-top: 0px">설문조사</h2>
          <h5 style="background: white; padding: 5px 0px; width: 70%; border-radius: 2px; padding-left: 5px;">2021.01.13 ~ 2021.01.31</h5>
          <p>2021년 설문조사입니다. 여기는 신청폼에 대한 설명이들어갑니다. <br>현재는 view 페이지입니다.</p>
      </div>
 
      <div id="list">
        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>단답형<span class="essential"> * <span></h4>
          <div class="content">
            <input type="text">
          </div>
        </div>

        <div class="form view field" id="filed?" style="height: 120px;"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>장문형<span class="essential"> * <span></h4>
          <div class="content">
            <textarea></textarea>
          </div>
        </div>


        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>객관식</h4>
          <div class="content">
            <input type="radio" id="id" name="name"><label class="item" for="id">객관식1</label></input>
            <input type="radio" id="id" name="name"><label class="item" for="id">객관식2</label></input>
            <input type="radio" id="id" name="name"><label class="item" for="id">객관식3</label></input>
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>체크박스</h4>
          <div class="content">
            <input type="checkbox" id="id" name="name"><label class="item" for="id">체크박스1</label></input>
            <input type="checkbox" id="id" name="name"><label class="item" for="id">체크박스2</label></input>
            <input type="checkbox" id="id" name="name"><label class="item" for="id">체크박스3</label></input>
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>드롭다운</h4>
          <div class="content">
            <select style="width: 300px;">
              <option value="옵션1">옵션1</option>
              <option value="옵션2">옵션2</option>
            </select>
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>파일업로드</h4>
          <div class="content">
            <input type="file"/>
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>날짜</h4>
          <div class="content">
            <input style="height: 30px" type="date"/>
          </div>
        </div>

        <div class="form view field" id="filed?"> <!--?에는 나중에 fieldId나 Index 들어감-->
          <h4>시간</h4>
          <div class="content">
            <input style="height: 30px" type="time"/>
          </div>
        </div>

      </div>

      <div class="form edit button">
        <button type="button" class="submit">제출</button>
      </div>
    </div>
  </form>


</body>
</html>
