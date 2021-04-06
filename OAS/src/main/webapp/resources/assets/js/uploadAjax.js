function showImage(fileCallPath) {
        $(".bigPictureWrapper").css("display","flex").show();  //화면 가운데 배치
        $(".bigPicture")
        .html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")  //<img>추가
        .animate({width:'100%', height:'100%'}, 1000);
    }
$(".bigPictureWrapper").on("click", function(e){
   $(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
   setTimeout(function(){
      $(".bigPictureWrapper").hide();
   }, 1000);
});
    
$(document).ready(function() {

			// 업로드 파일의 확장자와 크기 설정
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");  //정규식
			var maxSize = 5242880;  //5MB

			// 검사
			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				
				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			
			var uploadResult = $(".uploadResult ul");

	function showUploadedFile(uploadResultArr) {
	    var str = "";
	    $(uploadResultArr).each(function(i, obj) {
	        // image 파일이 아닌 경우
	        if (!obj.image) {
	            var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
	
	            // 추가
	            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	            str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"
	                + "<img src='/resources/img/attachment.png'>"+obj.fileName+"</a>"
	                + "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"
	                + "<div></li>"
	                    
	        } else {
	            var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
	            var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
	            originPath = originPath.replace(new RegExp(/\\/g),"/");
	
	            // 추가
	            str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"
	            + "<img src='/display?fileName="+fileCallPath+"'></a>"
	            + "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"
	            + "</li>";
	            //str += "<li><img src='/display?fileName="+fileCallPath+"'><li>";
	        }
	    });
	    
	    uploadResult.append(str);
	}
			

			var cloneObj = $(".uploadDiv").clone();

			$("#uploadBtn").on("click", function(e) {
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);

				for (var i = 0; i < files.length; i++) {

					//추가, 확장자와 파일크기 체크
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}

					formData.append("uploadFile", files[i]);
				}
				
				
				$.ajax({
					   url: '/uploadAjaxAction',
					   processData: false,
					   contentType: false,
					   data: formData,
					   type: 'POST',
					   dataType: 'json',  
					   success: function(result){
					      console.log(result); 
					      showUploadedFile(result);  //추가
					      $(".uploadDiv").html(cloneObj.html());
					   }
					});
				
			});
		});
		
		$(".uploadResult").on("click","span",function(e){
    var targetFile = $(this).data("file");
    var type = $(this).data("type");
    console.log(targetFile);
    
    $.ajax({
        url: '/deleteFile',
        data: {fileName: targetFile, type: type},
        dataType: 'text',
        type: 'POST',
        success: function(result) {
            alert(result);
        }
    });
});