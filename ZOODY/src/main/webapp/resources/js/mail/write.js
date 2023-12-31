// const hostIndex = location.href.indexOf( location.host ) + location.host.length;
const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */

document.querySelector('.mail-send-form').addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
    };
  }, true);

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
// const sendMailBtn = document.querySelector('.send-mail-btn');
// sendMailBtn.addEventListener('click', () => {

//     // 받는 사람 목록
//     const receiverList = document.querySelectorAll('.reciver-elems');
//     receiverList.forEach(element => {
//         console.log(element.innerText);;
//     });

//     // 참조 목록
//     const ccList = document.querySelectorAll('.cc-elems');
//     ccList.forEach(element => {
//         console.log(element.innerText);;
//     });

//     // 숨은 참조 목록
//     const bccList = document.querySelectorAll('.bcc-elems');
//     bccList.forEach(element => {
//         console.log(element.innerText);;
//     });

//     // 제목
//     const titleInput = document.querySelector('.title-input-area');
//     console.log(titleInput.value);

//     // 첨부파일
//     const fileList = attachmentFileInput.files;
//     console.log(fileList);


// })

/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */

// 썸머노트

$(document).ready(function() {
	$('#summernote').summernote({
		  width: 1200,
		  height: 220,                 
		  minHeight: 220,             
		  maxHeight: 220,
		  lang: "ko-KR",
          callbacks: {
            onImageUpload: function(files, editor, welEditable) {
                for(let i = 0; i < files.length; i++) {
                    sendFile(files[i], this);
                }
            }
          }
	});
	
    const mailContent = document.querySelector('.note-editable');

    mailContent.addEventListener('keydown', (event)=>addBreak(event, mailContent));

});

function addBreak(event, mailContent) {
    if (event.keyCode === 13) {
        mailContent.innerHTML = mailContent.innerHTML.slice(0, mailContent.innerHTML.lastIndexOf('</p>'))
        + '<br><br>';
    };
}


function sendFile(file, el) {
    let url = contextPath + '/mail/img/upload';

    var form_data = new FormData();
    form_data.append('file', file);
    $.ajax({
        data: form_data,
        type: "POST",
        url: url,
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(img_name) {
            $(el).summernote('editor.insertImage', img_name);
        }
    });
}



/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------------- */

const folderAddbtn = document.querySelector('.folder-add-btn');

folderAddbtn.addEventListener('click', ()=>{

    const folderListArea = document.querySelector('.custom-folder-list');

    const customFolder = document.createElement('div');
    customFolder.classList.add('custom-folder');

    const folderImg = document.createElement('img');
    folderImg.src = contextPath + '/resources/img/icon/svg/folder.svg';


    const folderNameInput = document.createElement('input');


    const deleteFolderBtn = document.createElement('img');
    deleteFolderBtn.src = contextPath + '/resources/img/icon/svg/small-cross.svg';
    deleteFolderBtn.classList.add('folder-delete-btn');

    customFolder.append(folderImg);
    customFolder.append(folderNameInput);
    customFolder.append(deleteFolderBtn);

    folderListArea.append(customFolder);


    folderNameInput.addEventListener('focusout', (event)=>{

        const nameInput = event.currentTarget;

        fetch(contextPath + '/mail/folder/create?name=' + nameInput.value)
        .then(response=>response.text())
        .then((data)=>{

            if(data == 1) {
                location.reload();
            }

        })
        .catch(err=>{})

    })

});

const folderDeleteBtnArr = document.querySelectorAll('.folder-delete-btn');

folderDeleteBtnArr.forEach(element=>{

    element.addEventListener('click', ()=>{

        fetch(contextPath + '/mail/folder/delete?no=' + element.parentNode.id)
        .then(response=>response.text())
        .then((data)=>{

            console.log(data);

            if(data == 1) {
                location.reload();
            }

        })
        .catch(err=>{})

    })

});