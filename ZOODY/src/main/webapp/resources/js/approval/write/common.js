const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

/* ========================================================================================================= */

let modalType = "approver";

const modalWrap = document.querySelector('.modal-wrap');

const addBtn = document.querySelector('.add-btn');
addBtn.addEventListener('click', ()=>{
    const previewList = document.querySelector('.preview-list');
    previewList.replaceChildren();

    const previewHeader = document.querySelector(".preview-header");
    if(modalType === "approver") {
        previewHeader.innerText = "결재자";
    } else if (modalType === "CC") {
        previewHeader.innerText = "참조자";
    }
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

        const senderNo = document.querySelector('.sender-no');
        senderNo.value = data.no;

        const drafterName = document.querySelector('.drafter-name');
        drafterName.innerText = data.name;

        const drafterDepart = document.querySelector('.drafter-depart');
        drafterDepart.innerText = data.departmentName;

        const draftDate = document.querySelector('.draft-date');
        const today = new Date();
        const yy = today.getFullYear();
        const mm = ('0' + (today.getMonth() + 1)).slice(-2);
        const dd = ('0' + today.getDate()).slice(-2);
        draftDate.innerText = yy + '-' + mm + '-' + dd;



        const formInputArea = document.querySelector(".wrap-left-header");

        const drafter = document.createElement("input");
        drafter.name = "drafter";
        drafter.value = data.no;
        drafter.classList.add('invisible-input');

        const url = window.location.pathname;
        const categoryNo = document.createElement('input');
        categoryNo.value = url.substring(url.lastIndexOf('/')+1);
        categoryNo.name = 'categoryNo';
        categoryNo.classList.add('invisible-input');

        formInputArea.append(drafter);
        formInputArea.append(categoryNo);

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


let approverArray = [];
let approverArrIdx = 0;

let ccArray = [];
let ccArrIdx = 0;

const userBriefInfoList = document.querySelectorAll('.name-rank');

userBriefInfoList.forEach(element => {

    element.addEventListener('click', event => {
        const currentTarget = event.currentTarget;
        const userNo = currentTarget.querySelector('.user-no');
        const userNoValue = userNo.innerText;
        const userGrade = currentTarget.querySelector('.user-grade');
        const userGradeValue = userGrade.innerText;

        let ableCheck = 1;
        if(modalType === 'approver') {

            if(userGradeValue < toppestGrade) {
                toppestGrade = userGradeValue;
            } else {
                alert('이전 결재자보다 낮은 결재권한자를 추가 할 수 없습니다.');
                ableCheck = 0;
            }
    
            approverArray.forEach(element => {
                if(element.no == userNoValue) {
                    alert('같은 결재자를 두명 이상 선택할 수 없습니다.');
                    ableCheck = 0;
                }
            });
    
            if(approverArrIdx < 4 && ableCheck == 1) {
                setPreview(event);
            } else if (approverArrIdx >= 4) {
                alert('결재자는 최대 4명까지만 설정 가능합니다.');
            }
        } else if (modalType === "CC") {
            setPreview(event);
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

        if(modalType === "approver") {
            approverArray[approverArrIdx] = {
                'no' : data.no,
                'name' : data.name,
                'grade' : data.grade,
                'rank' : data.rankName,
                'profile' : data.profile,
                'department' : departmentInfo,
            }
            approverArrIdx++;
        } else if (modalType === "CC") {
            ccArray[ccArrIdx] = {
                'no' : data.no,
                'name' : data.name,
                'grade' : data.grade,
                'rank' : data.rankName,
                'profile' : data.profile,
                'department' : departmentInfo,
            }
            ccArrIdx++;
        }
        

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

            for(let i = 0; i < approverArrIdx; i++) {
                if(approverArray[i].no == deleteApproverNo) {
                    approverArray.splice(i,1);
                    
                    for(let j = i; j < approverArrIdx - 1; j++) {
                        approverArray[j] = approverArray[j + 1];
                    }

                    approverArray = approverArray.filter((item)=>{
                        return item !== null;
                    });

                    approverArrIdx--;
                }
            }

            toppestGrade = 10;

            for(let i = 0; i< approverArray.length; i++) {
                if(approverArray[i].grade < toppestGrade) {
                    toppestGrade = approverArray[i].grade
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

    if(modalType === "approver") {
        // 오른쪽 창에 추가
        const approverList = document.querySelector('.approver-list');
        approverArray.forEach(element => {

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

            approverList.append(approver);
        });


        // 문서에 추가
        approverArray.forEach(element=>{

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


            const formInputArea = document.querySelector(".wrap-left-header");

            const approver = document.createElement("input");
            approver.name = "approver";
            approver.value = element.no;
            approver.classList.add('invisible-input');

            formInputArea.append(approver);

        });
    } else if (modalType == "CC") {

        const ccList = document.querySelector('.cc-list');
        ccArray.forEach(element => {

            const cc = document.createElement('div');
            cc.classList.add('approver');

            const profileArea = document.createElement('div');
            profileArea.classList.add('profile-area');

            const profileImg = document.createElement('img');
            profileImg.classList.add('profile-img');
            profileImg.src = contextPath + '/resources/img/employee/' + element.profile;

            profileArea.append(profileImg);

            const infoArea = document.createElement('div');
            infoArea.classList.add('info-area');

            const ccNameRank = document.createElement('div');
            ccNameRank.classList.add('approver-name-rank');

            const ccName = document.createElement('div');
            ccName.classList.add('approver-name');
            ccName.innerText = element.name;

            const ccRank = document.createElement('div');
            ccRank.classList.add('approver-rank');
            ccRank.innerText = element.rank;

            ccNameRank.append(ccName);
            ccNameRank.append(ccRank);

            const department = document.createElement('div');
            department.classList.add('department');
            department.innerText = element.department;
            

            infoArea.append(ccNameRank);
            infoArea.append(department);

            cc.append(profileArea);
            cc.append(infoArea);

            ccList.append(cc);

            const formInputArea = document.querySelector(".wrap-left-header");

            const ccMember = document.createElement("input");
            ccMember.name = "cc";
            ccMember.value = element.no;
            ccMember.classList.add('invisible-input');

            formInputArea.append(ccMember);

        });
    }

});



/* ========================================================================================================= */

const previewSettingBtnArr = document.querySelectorAll('.preview-setting-btn');

previewSettingBtnArr.forEach(previewSettingBtn => {

    previewSettingBtn.addEventListener('click', (event)=>{

        if(event.currentTarget.classList.contains('unseleted-setting-btn')) {

            // 타겟버튼 unseleted 제거
            event.currentTarget.classList.remove('unseleted-setting-btn');

            // 다른 버튼 unselected
            previewSettingBtnArr.forEach(btn=>{
                if(btn != event.currentTarget) {
                    btn.classList.add('unseleted-setting-btn');
                }
            });

            // 프리뷰 화면 전환
            if(event.currentTarget.classList.contains('set-approver')) {
                document.querySelector('.approver-list').classList.toggle('unselected-preview');
                document.querySelector('.cc-list').classList.toggle('unselected-preview');
                modalType = "approver";
            } else {
                document.querySelector('.cc-list').classList.toggle('unselected-preview');
                document.querySelector('.approver-list').classList.toggle('unselected-preview');
                modalType = "CC";
            }

        }

    });
    

});


/* ========================================================================================================= */

/* ========================================================================================================= */

/* ========================================================================================================= */

const startDate = document.querySelector('input[name="startDate"]');
const endDate = document.querySelector('input[name="endDate"]');

startDate.addEventListener('change', ()=>{
    const sd = new Date(startDate.value);
    const ed = new Date(endDate.value);

    const diffDate = sd.getTime() - ed.getTime();
    const dd = Math.abs(diffDate/(1000*60*60*24)) + 1;

    if(!isNaN(dd)){
        document.querySelector(".date").value = dd;
    }
});

endDate.addEventListener('change', ()=>{
    const sd = new Date(startDate.value);
    const ed = new Date(endDate.value);

    const diffDate = sd.getTime() - ed.getTime();
    const dd = Math.abs(diffDate/(1000*60*60*24)) + 1;

    if(!isNaN(dd)){
        document.querySelector(".date").value = dd;
    }
});



/* ========================================================================================================= */

fetch(contextPath + "/approval/ltype")
.then(response => response.json())
.then(data => {

    const typeArr = data;
    const typeCategory = document.querySelector('.leave-category');
    const selectElem = document.createElement('select');
    selectElem.name = "leaveTypeNo";

    typeArr.forEach(element => {
        const optionElem = document.createElement('option');
        optionElem.value = element.no;
        optionElem.innerText = element.type;
        selectElem.append(optionElem);
    });

    typeCategory.append(selectElem);
})







