// const hostIndex = location.href.indexOf( location.host ) + location.host.length;

const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

const userBriefInfoList = document.querySelectorAll('.name-rank');

userBriefInfoList.forEach(element => {
    element.addEventListener('click', event => getDetailInfo(event))
});

function getDetailInfo(event) {
    const currentTarget = event.currentTarget;
    const userNo = currentTarget.querySelector('.user-no');
    const userNoValue = userNo.innerText;

    fetch(contextPath + "/addressbook/detail?userNo=" + userNoValue)
    .then( (response) => response.json() )
    .then( (data) => {

        FillTable(data);

    })
    .catch( err => {})

}

function FillTable(data) {

    document.querySelector('.detail-profile-img').src = contextPath + '/resources/img/employee/' + data.profile;

    document.querySelector('.name-cell').innerText = data.name;
    
    
    let departmentInfo = '';
    if(data.dName1 != null) { departmentInfo += data.dName1 + ' > '; }
    if(data.dName2 != null) { departmentInfo += data.dName2 + ' > '; }
    if(data.dName3 != null) { departmentInfo += data.dName3 + ' > '; }
    departmentInfo += data.dName4;
    
    
    document.querySelector('.department-cell').innerText = departmentInfo;
    
    document.querySelector('.user-no-cell').innerText = data.no;
    
    document.querySelector('.phone-cell').innerText = data.phone;
    
    document.querySelector('.email-cell').innerText = data.mail;
    
    document.querySelector('.office-num-cell').innerText = data.officeNumber;
    
    document.querySelector('.position-cell').innerText = data.positionName;

    mailBtnSetting();

}


/*-------------------------------------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------------------------------------------------------------------------------------------------------- */

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

/*-------------------------------------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------------------------------------------------------------------------------------------------------- */


function mailBtnSetting() {
    const sendMailBtn = document.querySelector('.send-mail-shortcuts');

    sendMailBtn.addEventListener('click', ()=>{

        let mailAddress = document.querySelector('.email-cell').innerText;

        console.log(mailAddress);

        window.open(contextPath + '/mail/write?receiver=' + mailAddress, "_black");
    })
}


/*-------------------------------------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------------------------------------------------------------------------------------------------------- */
/*-------------------------------------------------------------------------------------------------------------------------------------------- */

const searchInput = document.querySelector('.search-input');
const searchIcon = document.querySelector('.search-btn-icon');
searchIcon.addEventListener('click', (event) => searchEmployee(event));

searchInput.addEventListener('keyup', (event) => {
    if(event.keyCode === 13){
        searchEmployee(event);
    }
});

function searchEmployee(event) {
    fetch(contextPath + "/addressbook/search?keyword=" + searchInput.value)
        .then( (response) => response.json() )
        .then( (data) => {

            console.log(data);

        })
        .catch( err => {})
}