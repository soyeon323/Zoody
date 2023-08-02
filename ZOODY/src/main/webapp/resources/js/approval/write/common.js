const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

/* ========================================================================================================= */

const modalWrap = document.querySelector('.modal-wrap');

const addBtn = document.querySelector('.add-btn');
addBtn.addEventListener('click', ()=>{
    modalWrap.classList.toggle('modal-wrap-active');
});

const closeBtn = document.querySelector('.modal-close-btn');
closeBtn.addEventListener('click', ()=>{
    modalWrap.classList.toggle('modal-wrap-active');
});


/* ========================================================================================================= */
let loginUserGrade = null;
let toppestGrade = null;

getLoginMemberInSession();
function getLoginMemberInSession() {
    
    fetch(contextPath + "/approval/loginmember")
    .then( (response) => response.json() )
    .then( (data) => {

        loginUserGrade = data.grade;
        toppestGrade = loginUserGrade;

        const senderRank = document.querySelector('.sender-rank');
        senderRank.innerText = data.rankName;

        const senderName = document.querySelector('.sender-name');
        senderName.innerText = data.name;

        const drafterName = document.querySelector('.drafter-name');
        drafterName.innerText = data.name;

        const drafterDepart = document.querySelector('.drafter-depart');
        drafterDepart.innerText = data.departmentName;
    })

}

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
        const userGrade = currentTarget.querySelector('.user-grade');
        const userGradeValue = userGrade.innerText;

        let ableCheck = 1;

        if(userGradeValue < toppestGrade) {
            toppestGrade = userGradeValue;
        } else {
            alert('이전 결재자보다 낮은 결재권한자를 추가 할 수 없습니다.');
            ableCheck = 0;
        }

        previewArray.forEach(element => {
            if(element.no == userNoValue) {
                alert('같은 결재자를 두명 이상 선택할 수 없습니다.');
                ableCheck = 0;
            }
        });

        if(previewArrIdx < 4 && ableCheck == 1) {
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

        let departmentInfo = '';
        if(data.dName1 != null) { departmentInfo += data.dName1 + ' > '; }
        if(data.dName2 != null) { departmentInfo += data.dName2 + ' > '; }
        if(data.dName3 != null) { departmentInfo += data.dName3 + ' > '; }
        departmentInfo += data.dName4;

        previewArray[previewArrIdx] = {
            'no' : data.no,
            'name' : data.name,
            'grade' : data.grade,
            'rank' : data.rankName,
            'profile' : data.profile,
            'department' : departmentInfo,
        }
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


        const userRank = document.createElement('div');
        userRank.innerText = data.grade;
        userRank.classList.add('user-rank-grade');

        const tempNo = document.createElement('div');
        tempNo.innerText = data.no;
        tempNo.classList.add('temp-no');

        approverMember.append(briefInfo);
        approverMember.append(deleteIcon);
        approverMember.append(userRank);
        approverMember.append(tempNo);


        priviewList.append(approverMember);

        deleteIcon.addEventListener('click', (event) => {


            const approverInfo = event.target.parentNode;
            const deleteApproverNo = approverInfo.querySelector('.temp-no').innerText;

            for(let i = 0; i < previewArrIdx; i++) {
                if(previewArray[i].no == deleteApproverNo) {
                    previewArray.splice(i,1);
                    
                    for(let j = i; j < previewArrIdx - 1; j++) {
                        previewArray[j] = previewArray[j + 1];
                    }

                    previewArray = previewArray.filter((item)=>{
                        return item !== null;
                    });

                    previewArrIdx--;
                }
            }

            toppestGrade = 10;

            for(let i = 0; i< previewArray.length; i++) {
                if(previewArray[i].grade < toppestGrade) {
                    toppestGrade = previewArray[i].grade
                }
            }

            deleteIcon.parentNode.remove();
        });
    })
    .catch( err => {})

}


/* ========================================================================================================= */


const addApproverBtn = document.querySelector('.add-approver');
addApproverBtn.addEventListener('click', ()=>{

    const modalWrap = document.querySelector('.modal-wrap');
    modalWrap.classList.toggle('modal-wrap-active')

    console.log(previewArray);

    // 오른쪽 창에 추가
    const previewArea = document.querySelector('.preview-area');
    previewArray.forEach(element => {

        const approver = document.createElement('div');
        approver.classList.add('approver');

        const profileArea = document.createElement('div');
        profileArea.classList.add('profile-area');

        const profileImg = document.createElement('img');
        profileImg.classList.add('profile-img');
        profileImg.src = contextPath + '/resources/img/employee/' + element.profile;

        profileArea.append(profileImg);

        const infoArea = document.createElement('div');
        infoArea.classList.add('info-area');

        const approverNameRank = document.createElement('div');
        approverNameRank.classList.add('approver-name-rank');

        const approverName = document.createElement('div');
        approverName.classList.add('approver-name');
        approverName.innerText = element.name;

        const approverNRank = document.createElement('div');
        approverNRank.classList.add('approver-rank');
        approverNRank.innerText = element.rank;

        approverNameRank.append(approverName);
        approverNameRank.append(approverNRank);

        const department = document.createElement('div');
        department.classList.add('department');
        department.innerText = element.department;
        

        infoArea.append(approverNameRank);
        infoArea.append(department);

        approver.append(profileArea);
        approver.append(infoArea);

        previewArea.append(approver);
    });


    // 문서에 추가
    previewArray.forEach(element=>{

        const tableHeaderRank = document.querySelector('.table-header-rank');

        const newHeader = document.createElement('th');
        newHeader.classList.add('table-rank');
        newHeader.innerText = element.rank;

        tableHeaderRank.append(newHeader);


        const tableBodyName = document.querySelector('.table-body-name');

        const newBodyName = document.createElement('td');
        newBodyName.classList.add('table-name');
        newBodyName.innerText = element.name;

        tableBodyName.append(newBodyName);

        const approvalResult = document.querySelector('.approval-result');

        const newTableBody = document.createElement('td');
        newTableBody.classList.add('table-approval');

        approvalResult.append(newTableBody);

        const tableDateArea = document.querySelector('.table-date-area');

        const newDateTd = document.createElement('td');
        newDateTd.classList.add('table-date');

        tableDateArea.append(newDateTd);

    });


});









