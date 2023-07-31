const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));


/* ========================================================================================================= */

const extendsBtns = document.querySelectorAll('.extends-list')

extendsBtns.forEach(extendsBtn => {
    extendsBtn.addEventListener('click', event => toggleExtendList(event) );
});


function toggleExtendList(event) {
    const currentTarget = event.currentTarget;

    const listBoxArea = currentTarget.nextElementSibling;

    listBoxArea.classList.toggle('list-box-area-extend');

    if(listBoxArea.classList.contains('list-box-area-extend')) {
        const btnIcon = currentTarget.firstElementChild;
        const iconImg = btnIcon.firstElementChild;
        iconImg.src = contextPath + '/resources/img/icon/svg/small-minus.svg';
    } else {
        const btnIcon = currentTarget.firstElementChild;
        const iconImg = btnIcon.firstElementChild;
        iconImg.src = contextPath + '/resources/img/icon/svg/small-plus.svg';
    }
    
}


/* ========================================================================================================= */

let previewArray = [];
let previewArrIdx = 0;

const userBriefInfoList = document.querySelectorAll('.name-rank');

userBriefInfoList.forEach(element => {
    element.addEventListener('click', event => {
        const currentTarget = event.currentTarget;
        const userNo = currentTarget.querySelector('.user-no');
        const userNoValue = userNo.innerText;

        let duplicationCheck = 0;

        previewArray.forEach(element => {
            if(element == userNoValue) {
                alert('같은 결재자를 두명 이상 선택할 수 없습니다.');
                duplicationCheck = 1;
            }
        });

        if(previewArrIdx < 4 && duplicationCheck == 0) {
            setPreview(event);
        } else if (previewArrIdx >= 4) {
            alert('결재자는 최대 4명까지만 설정 가능합니다.');
        }

    })
});

const priviewList = document.querySelector('.preview-list');

function setPreview(event) {
    const currentTarget = event.currentTarget;
    const userNo = currentTarget.querySelector('.user-no');
    const userNoValue = userNo.innerText;

    fetch(contextPath + "/addressbook/get/info/brief?no=" + userNoValue)
    .then( (response) => response.json() )
    .then( (data) => {
        previewArray[previewArrIdx] = data.no;
        previewArrIdx++;

        const approverMember = document.createElement('div');
        approverMember.classList.add('approver-memeber');

        const briefInfo = document.createElement('div');
        briefInfo.classList.add('name-mail');

        const aName = document.createElement('div');
        aName.classList.add('approver-name');
        aName.innerText = data.name;

        const aMail = document.createElement('div');
        aMail.classList.add('approver-mail');
        aMail.innerText = data.mail;

        briefInfo.append(aName);
        briefInfo.append(aMail);

        const deleteIcon = document.createElement('img');
        deleteIcon.src = contextPath + '/resources/img/icon/svg/small-cross.svg';
        deleteIcon.classList.add('delete-btn');

        approverMember.append(briefInfo);
        approverMember.append(deleteIcon);

        priviewList.append(approverMember);

        deleteIcon.addEventListener('click', () => {
            deleteIcon.parentNode.remove();
        });
    })
    .catch( err => {})

}


/* ========================================================================================================= */












