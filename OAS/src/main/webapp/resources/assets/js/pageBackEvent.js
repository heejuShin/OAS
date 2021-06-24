/**
 * 
 */
$(document).ready(function () {
    // Warning
    $(window).on('beforeunload', function(){
        //do something
        return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다!";
    });
    // Form Submit
    $(".submitB").click(function(event){
        // disable warning
       	 $(window).off("beforeunload");
    });
});