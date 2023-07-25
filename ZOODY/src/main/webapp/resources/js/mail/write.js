// const hostIndex = location.href.indexOf( location.host ) + location.host.length;
const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */

// document.addEventListener('keydown', function(event) {
//     if (event.keyCode === 13) {
//       event.preventDefault();
//     };
//   }, true);

/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */

// URL에 받는사람을 가져오면 자동으로 추가
const receiver = new URLSearchParams(location.search).get('receiver');
if(receiver != null) {
	addElementInputArea(receiver, '.reciver-elems');
}

/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */


// 이메일 형식 완성되면 감싸기
function addElementInputArea(email, areaClassName) {

    const emailElem = document.createElement('div');
    emailElem.innerText = email;
    
    const emailData = document.createElement('input');
    emailData.value = email;
    emailData.readOnly = true;
    emailData.classList.add('email-data');

    let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    if(regex.test(email)){
        if(areaClassName == '.reciver-elems') {
            emailData.name = 'receiverEmailAddress'
        } else if(areaClassName == '.cc-elems') {
            emailData.name = 'ccEmailAddress'
        } else if(areaClassName == '.bcc-elems') {
            emailData.name = 'bccEmailAddress'
        }

        emailElem.classList.add('complete-email-box');
    } else {
        emailElem.classList.add('wrong-email-address');
    }


    const deleteBtn = document.createElement('img');
    deleteBtn.src = contextPath + '/resources/img/icon/svg/small-cross.svg';
    deleteBtn.classList.add('elem-delete-btn');

    emailElem.append(emailData);
    emailElem.append(deleteBtn);

    const area = document.querySelector(areaClassName);
    area.append(emailElem);

    deleteBtn.addEventListener('click', () => {
        deleteBtn.parentNode.remove();
    });
}

// 받는 사람 이메일 완성시 감싸기
const receiverInputArea = document.querySelector('.receiver-input-area');
receiverInputArea.addEventListener('keyup', (event) => {
    if(event.keyCode === 13 || event.keyCode === 32){
        const receiver = receiverInputArea.value;
        if(receiver != '') {
        	receiverInputArea.value = '';
        	addElementInputArea(receiver, '.reciver-elems');
    	}
    }
})
receiverInputArea.addEventListener('focusout', (event) => {
    const receiver = receiverInputArea.value;
    if(receiver != '') {
    	receiverInputArea.value = '';
    	addElementInputArea(receiver, '.reciver-elems');
	}
})

// 참조 이메일 완성시 감싸기
const ccInputArea = document.querySelector('.cc-input-area');
ccInputArea.addEventListener('keyup', (event) => {
    if(event.keyCode === 13 || event.keyCode === 32){
        const receiver = ccInputArea.value;
        if(receiver != '') {
        	ccInputArea.value = '';
        	addElementInputArea(receiver, '.cc-elems');
    	}
    }
})
ccInputArea.addEventListener('focusout', (event) => {
    const receiver = ccInputArea.value;
    if(receiver != '') {
    	ccInputArea.value = '';
    	addElementInputArea(receiver, '.cc-elems');
	}
})

// 숨은 참조 이메일 완성시 감싸기
const bccInputArea = document.querySelector('.bcc-input-area');
bccInputArea.addEventListener('keyup', (event) => {
    if(event.keyCode === 13 || event.keyCode === 32){
        const receiver = bccInputArea.value;
        if(receiver != '') {
            bccInputArea.value = '';
            addElementInputArea(receiver, '.bcc-elems');
        }
    }
})
bccInputArea.addEventListener('focusout', (event) => {
    const receiver = bccInputArea.value;
    if(receiver != '') {
        bccInputArea.value = '';
        addElementInputArea(receiver, '.bcc-elems');
    }
})

/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */

// 첨부파일

$("#file").on('change',function(){
    var fileName = $("#file").val();
    $(".upload-name").val(fileName);
  });

const attachmentFileInput = document.querySelector('.add-attachment-input');
attachmentFileInput.addEventListener('change', (event) => {

    const attachmentListArea = document.querySelector('.attachment-list-area');

    const fileList = attachmentFileInput.files;

    for(let i = 0; i < fileList.length; i++) {

        const attachmentElem = document.createElement('div');
        attachmentElem.classList.add('attachment-elem');

        const attachmentInfo = document.createElement('div');
        attachmentInfo.innerText = fileList[i].name;
        attachmentInfo.classList.add('attachment-name');

        const deleteBtn = document.createElement('img');
        deleteBtn.src = contextPath + '/resources/img/icon/svg/small-cross.svg';
        deleteBtn.classList.add('elem-delete-btn');

        attachmentElem.append(attachmentInfo);
        attachmentElem.append(deleteBtn);

        attachmentListArea.append(attachmentElem);

        deleteBtn.addEventListener('click', () => {
            deleteBtn.parentNode.remove();
        });
    }

});

/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */

// 메일 보내기 버튼 클릭했을때
const sendMailBtn = document.querySelector('.send-mail-btn');
sendMailBtn.addEventListener('click', () => {

    // 받는 사람 목록
    const receiverList = document.querySelectorAll('.reciver-elems');
    receiverList.forEach(element => {
        console.log(element.innerText);;
    });

    // 참조 목록
    const ccList = document.querySelectorAll('.cc-elems');
    ccList.forEach(element => {
        console.log(element.innerText);;
    });

    // 숨은 참조 목록
    const bccList = document.querySelectorAll('.bcc-elems');
    bccList.forEach(element => {
        console.log(element.innerText);;
    });

    // 제목
    const titleInput = document.querySelector('.title-input-area');
    console.log(titleInput.value);

    // 첨부파일
    const fileList = attachmentFileInput.files;
    console.log(fileList);


})

/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */

$(document).ready(function() {
    $('#summernote').summernote({
    enterToBr: true,
    codeviewFilter: true,
    codeviewIframeFilter: true,
    disableXSSProtection: true,
    width: 1200,
    height: 240,
    minHeight: 240,
    maxHeight: 240,
    focus: false,
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