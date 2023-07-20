const hostIndex = location.href.indexOf( location.host ) + location.host.length;

const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

const userBriefInfoList = document.querySelectorAll('.name-rank');

userBriefInfoList.forEach(element => {
    element.addEventListener('click', event => getDetailInfo(event))
});

function getDetailInfo(event) {
    const currentTarget = event.currentTarget;
    const userNo = currentTarget.querySelector('.user-no');
    const userNoValue = userNo.innerText;

    fetch(contextPath + "/addressbook/detailUserInfo?userNo=" + userNoValue)
    .then( (response) => response.json() )
    .then( (data) => {

        FillTable(data);

    })
    .catch( err => {})

}

function FillTable(data) {

    document.querySelector('.detail-profile-img').src = contextPath + '/resources/png/profile/' + data.profile;

    document.querySelector('.name-cell').innerText = data.name;
    
    document.querySelector('.department-cell').innerText = data.departmentName;
    
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
        iconImg.src = contextPath + '/resources/svg/icon/small-minus.svg';
    } else {
        const btnIcon = currentTarget.firstElementChild;
        const iconImg = btnIcon.firstElementChild;
        iconImg.src = contextPath + '/resources/svg/icon/small-plus.svg';
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

