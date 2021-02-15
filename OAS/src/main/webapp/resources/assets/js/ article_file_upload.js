// 파일 목록 : 게시글 조회, 수정페이지
function getFiles(articleNo) {
    $.getJSON("/article/file/list/" + articleNo, function (list) {
        if (list.length === 0) {
            $(".uploadedFileList").html("<span class='noAttach'>첨부파일이 없습니다.</span>");
        }
        $(list).each(function () {
            printFiles(this);
        })
    });
}

// 게시글 삭제 클릭 이벤트
$(".delBtn").on("click", function () {

    // 댓글이 달린 게시글 삭제처리 방지
    var replyCnt = $(".replyDiv").length;
    if (replyCnt > 0) {
        alert("댓글이 달린 게시글은 삭제할수 없습니다.");
        return;
    }

    // 첨부파일명들을 배열에 저장
    var arr = [];
    $(".uploadedFileList li").each(function () {
        arr.push($(this).attr("data-src"));
    });

    // 첨부파일 삭제요청
    if (arr.length > 0) {
        $.post("/article/file/deleteAll", {files: arr}, function () {

        });
    }

    // 삭제처리
    formObj.attr("action", "/article/paging/search/remove");
    formObj.submit();
});