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
    });
});