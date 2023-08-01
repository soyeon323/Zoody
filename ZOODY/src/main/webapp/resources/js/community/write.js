$(document).ready(function() {
    $('#summernote').summernote({
    codeviewFilter: false,
    codeviewIframeFilter: false,
    disableXSSProtection: true,
    height: 500,
    minHeight: 400,
    maxHeight: 500,
    focus: true,
    lang: 'ko-KR',
    toolbar: [
        // 스타일 관련 기능
        ['style', ['style']],
        // 글자 크기 설정
        ['fontsize', ['fontsize']],
        // 글꼴 스타일
        ['font', ['bold', 'underline', 'clear']],
        // 글자 색상
        ['color', ['color']],
        // 테이블 삽입
        ['table', ['table']],
        // 문단 스타일
        ['para', ['paragraph']],
        // 에디터 높이 설정
        ['height', ['height']],
        // 이미지, 링크, 동영상 삽입
        ['insert', ['picture', 'link', 'video']],
        // 코드 보기, 전체화면, 도움말
        ['view', ['codeview', 'fullscreen', 'help']],
    ],
    fontSizes: [
        // 글자 크기 선택 옵션
        '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'
    ],
    callbacks:{
        onImageUpload : function(files){ 
            
            alert(files)

            uploadSummernoteImageFile(files[0],this);
        },
        onMediaDelete: function ($target, editor, $editable) {
            // 삭제된 이미지의 파일 이름을 알아내기 위해 split 활용
            if (confirm('이미지를 삭제하시겠습니까?')) {
                var deletedImageUrl = $target.attr('src').split('/').pop()

                // ajax 함수 호출
                deleteSummernoteImageFile(deletedImageUrl)
            }
        },
    },
    });
});

// 썸머노트 업로드 이미지 콜백
function uploadSummernoteImageFile(file,editor){ 
      

    data = new FormData(); 


    data.append("file",file); 


    $.ajax({ 

        data:data, 

        type:"POST", 

        url: root + "/summernote/uploadSummernoteImageFile", 

        dataType:"JSON", 

        contentType:false, 

        processData:false, 

        success:function(data){ 

        let imgPath = root+data.url;
        $(editor).summernote("insertImage",imgPath); 

        console.log(imgPath);
        console.log(data.originName);

        // $("#thumbnailPath").append("<option value="+"/zoody"+imgPath+">"+data.originName+"</option>"); 

        } 
    })
};


$("select[name=Big-Category]").on("change", function () {
    
    console.log($("select[name=Big-Category]").val());

})

$(".registration-btn").on("click" , function () {

    const title = $(".title").val();
    const summernoteCode = $('#summernote').summernote('code');
    const selectCategory = $("select[name=Big-Category]").val();

 

    console.log(title);
    
    if (title == null || title == '') {
        
        $(".title").css({
            "border": "2px solid #e95555",
            "background-color": "#fff6f6"
        });

        // 추가 3초 후에 스타일 원래대로 복원
        setTimeout(function () {
            $(".title").css({
                "border": "1px solid #D7D7D7",
                "background-color": "#f9f9f9"
            });
        }, 3000); // 3초
        alert("제목을 작성해주세요")
        return;
    }
    else if (summernoteCheck(summernoteCode)) {
        alert("내용을 입력하세요")
        return;
    }
    
    $.ajax({
        url : root + "/community/board/write",
        type : "post",
        data : {
            title : title ,
            file : "1.text" ,
            content : summernoteCode,
            catNo : 4 ,//임시 수정 해야됨
            userNo : 1 ,//임시 수정 해야됨
        },
        success : function(data) {
            
            alert("작성성공")

            window.location.replace(root+"/community/board/freeBoard/");

        },
        error : function(data) {

            alert("작성실패");

        },
    });

});



// 파일 업로드마다 변수 변경

let uploadFile;
$(".file").on("change" , function(e) {
    uploadFile = e.target.files[0];

    console.log(uploadFile);
});


// 썸머노트 공백 체크
function summernoteCheck(summernoteCode) {

    summernoteCode = summernoteCode.replace(/&nbsp;/gi,"");
    summernoteCode = summernoteCode.replace(/<br>/gi,"");
    summernoteCode = summernoteCode.replace(/gi/,"");

    if (summernoteCode == "<p><\/p>" || Text == "") {
        return true;
    }
    return false;
}