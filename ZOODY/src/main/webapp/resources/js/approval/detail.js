const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

const URLSearch = new URLSearchParams(location.search);

/* ==================================================================================== */

fetch(contextPath + '/approval/detail/drafter?no=' + URLSearch.get('no') )
.then(response=>response.json())
.then((data)=>{

    const senderRank = document.querySelector('.sender-rank');
    senderRank.innerText = data.rankName;

    const senderName = document.querySelector('.sender-name');
    senderName.innerText = data.name;

    const drafterName = document.querySelector('.drafter-name');
    drafterName.innerText = data.name;

    const drafterDept = document.querySelector('.drafter-depart');
    let departmentInfo = '';
    if(data.dName1 != null) { departmentInfo += data.dName1 + ' > '; }
    if(data.dName2 != null) { departmentInfo += data.dName2 + ' > '; }
    if(data.dName3 != null) { departmentInfo += data.dName3 + ' > '; }
    departmentInfo += data.dName4;
    drafterDept.innerText = departmentInfo;

    const draftDate = document.querySelector('.draft-date');
    draftDate.innerText = data.drafterDate;

    const documentNo = document.querySelector('.document-no');
    documentNo.innerText = data.eaNo;

})
.catch((data)=>{
    alert('상신인 정보 불러오는중 오류');
})


/* ==================================================================================== */

fetch(contextPath + '/approval/detail/category?no=' + URLSearch.get('no') )
.then(response => response.text())
.then((data)=>{

    const categoryNo = data;

    if(categoryNo == 1) {
        getLOA();

    } else if(categoryNo == 2) {
        getAFL();

    } else if(categoryNo == 3) {
        getAFE();

    } else if(categoryNo == 4) {
        getAFS();

    }

})
.catch((data)=>{
    alert('카테고리 번호 가져오는중 오류');
})


/* ==================================================================================== */


function getLOA() {
    fetch(contextPath + '/approval/detail/loa?no=' + URLSearch.get('no'))
    .then(response=>response.json())
    .then((data)=>{

        const title = document.querySelector('.title-input');
        title.readOnly = true;
        title.value = data.title;

        const content = document.querySelector('#approval-main-text');
        content.readOnly = true;
        content.value = data.content;


        if(data.instruction != null) {
            const instruction = document.querySelector('.instruction');
            instruction.value = data.instruction;
        }
    })
}

function getAFL() {
    fetch(contextPath + '/approval/detail/afl?no=' + URLSearch.get('no'))
    .then(response=>response.json())
    .then((data)=>{

        console.log(data);

    })
}

function getAFE() {
    fetch(contextPath + '/approval/detail/afe?no=' + URLSearch.get('no'))
    .then(response=>response.json())
    .then((data)=>{

        console.log(data);

    })
}

function getAFS() {
    fetch(contextPath + '/approval/detail/afs?no=' + URLSearch.get('no'))
    .then(response=>response.json())
    .then((data)=>{

        console.log(data);

    })
}



/* ==================================================================================== */
/* ==================================================================================== */

let approverArr = [];
let approverIdx = 0;

fetch(contextPath + '/approval/detail/approvers?no=' + URLSearch.get('no'))
.then(response=>response.json())
.then((data)=>{

    const approverArray = data;

    const approverList = document.querySelector('.approver-list');
    approverArray.forEach(element => {

        approverArr[approverIdx] = element.approverNo;
        approverIdx++;

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
        approverNRank.innerText = element.rankName;

        approverNameRank.append(approverName);
        approverNameRank.append(approverNRank);

        const department = document.createElement('div');
        department.classList.add('department');
        let departmentInfo = '';
        if(element.dName1 != null) { departmentInfo += element.dName1 + ' > '; }
        if(element.dName2 != null) { departmentInfo += element.dName2 + ' > '; }
        if(element.dName3 != null) { departmentInfo += element.dName3 + ' > '; }
        departmentInfo += element.dName4;
        department.innerText = departmentInfo;
        

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
        newHeader.innerText = element.rankName;

        tableHeaderRank.append(newHeader);


        const tableBodyName = document.querySelector('.table-body-name');

        const newBodyName = document.createElement('td');
        newBodyName.classList.add('table-name');
        newBodyName.innerText = element.name;

        tableBodyName.append(newBodyName);

        const approvalResult = document.querySelector('.approval-result');

        const newTableBody = document.createElement('td');
        newTableBody.classList.add('table-approval');
        newTableBody.id = element.approverNo;

        if(element.stateName == '승인') {
            const signImg = document.createElement('img');
            signImg.src = contextPath + '/resources/img/icon/svg/approve.svg';
            newTableBody.append(signImg);
        } else if(element.stateName == '반려') {
            const signImg = document.createElement('img');
            signImg.src = contextPath + '/resources/img/icon/svg/disapprove.svg';
            newTableBody.append(signImg);
        }

        approvalResult.append(newTableBody);

        const tableDateArea = document.querySelector('.table-date-area');

        const newDateTd = document.createElement('td');
        newDateTd.classList.add('table-date');

        tableDateArea.append(newDateTd);

    });

    addApproveClickEvent();

})
.catch((data)=>{
    alert('결재자 정보 불러오는중 오류')
})



/* ==================================================================================== */

fetch(contextPath + '/approval/detail/cc?no=' + URLSearch.get('no'))
.then(response=>response.json())
.then((data)=>{

    const ccArray = data;

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
        ccRank.innerText = element.rankName;

        ccNameRank.append(ccName);
        ccNameRank.append(ccRank);

        const department = document.createElement('div');
        department.classList.add('department');
        let departmentInfo = '';
        if(element.dName1 != null) { departmentInfo += element.dName1 + ' > '; }
        if(element.dName2 != null) { departmentInfo += element.dName2 + ' > '; }
        if(element.dName3 != null) { departmentInfo += element.dName3 + ' > '; }
        departmentInfo += element.dName4;
        department.innerText = departmentInfo;
        

        infoArea.append(ccNameRank);
        infoArea.append(department);

        cc.append(profileArea);
        cc.append(infoArea);

        ccList.append(cc);
    });
})
.catch((data)=>{
    alert('참조인 정보 불러오는중 오류')
})


/* ==================================================================================== */
/* ==================================================================================== */

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

/* ==================================================================================== */
let loginMemberNo;

getLoginMemberInSession();
function getLoginMemberInSession() {
    
    fetch(contextPath + "/approval/loginmember")
    .then( (response) => response.json() )
    .then( (data) => {

        loginMemberNo = data.no;

    })

}
/* ==================================================================================== */

let decision;

function addApproveClickEvent() {
    const approveAreaArr = document.querySelectorAll('.table-approval');

    approveAreaArr.forEach(element => {

        element.addEventListener('click', (event)=>{

            if(event.currentTarget.id == loginMemberNo) {

                const delTarget = document.querySelector('.approve-select-list');
                if(delTarget != null) {
                    delTarget.remove();
                }

                const approveSelectList = document.createElement('div');
                approveSelectList.classList.add('approve-select-list')
                approveSelectList.style.position = 'absolute';
                approveSelectList.style.left = event.x + 'px';
                approveSelectList.style.top = event.y + 'px';

                const approveBtn = document.createElement('div');
                approveBtn.classList.add('select-list-btn');
                approveBtn.classList.add('approve-btn');
                approveBtn.innerText = "승인";

                const disapproveBtn = document.createElement('div');
                disapproveBtn.classList.add('select-list-btn');
                disapproveBtn.classList.add('disapprove-btn');
                disapproveBtn.innerText = "반려";

                approveSelectList.append(approveBtn);
                approveSelectList.append(disapproveBtn);

                const cTarget = event.currentTarget;
                cTarget.append(approveSelectList);

                approveBtn.addEventListener('click', (event)=>{
                    event.stopPropagation();
                    const signImg = document.createElement('img');
                    signImg.src = contextPath + '/resources/img/icon/svg/approve.svg';
                    cTarget.replaceChildren();
                    cTarget.append(signImg);

                    decision = 'approve';
                });

                disapproveBtn.addEventListener('click', (event)=>{
                    event.stopPropagation();
                    const signImg = document.createElement('img');
                    signImg.src = contextPath + '/resources/img/icon/svg/disapprove.svg'
                    cTarget.replaceChildren();
                    cTarget.append(signImg);

                    decision = 'disapprove';
                });
            }
        });
    });
}


/* ==================================================================================== */
/* ==================================================================================== */
/* ==================================================================================== */

const appBtn = document.querySelector('.approve-send-btn');

appBtn.addEventListener('click', ()=>{

    const instruction = document.querySelector('.instruction');

    fetch(contextPath + '/approval/detail/approve', {
        method : 'post',
        headers : {
            "Content-Type" : "application/json",
        },
        body : JSON.stringify({
            "decision" : decision,
            "instruction" : instruction.value,
            "no" : URLSearch.get('no'),
        })
    })
    .then((response)=>response.json())
    .then((data)=>{

        console.log(data);

    })
    .catch((data)=>{

    });

});










