const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

/*-----------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------*/

const checkLineBtnArray = document.querySelectorAll('.small-check-btn');

checkLineBtnArray.forEach(checkLineBtn => {
    checkLineBtn.addEventListener('click', (event) => selectLine(event));
});

function selectLine(event) {
    const line = event.currentTarget.parentNode.parentNode;
    line.classList.toggle('selected-table-data');
}

/*-----------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------*/

const readCheckBtn = document.querySelector('.read-check-btn');
readCheckBtn.addEventListener('click', selectedMailRead);

function selectedMailRead() {

    const selectedMailArr = document.querySelectorAll('.selected-table-data');

    const selectedMailNoArr = [];
    let i = 0;

    selectedMailArr.forEach( selectedMail => {
        const selectMailLabel = selectedMail.querySelector('label');

        selectedMailNoArr[i] = selectMailLabel.id;
        i++;
    })

    const folder = new URLSearchParams(location.search).get('folder');

    fetch(contextPath + "/mail/selected/read", {
            method : "POST",
            headers : {
                "Content-Type" : "application/json",
            },
            body : JSON.stringify({
                'selectedMailNoArr' : selectedMailNoArr,
                'folder' : folder
            })
    })
    .then( (response) => response.json() )
    .then( (data) => {

        location.reload();

    })
    .catch( err => {})
}


const dumpBtn = document.querySelector('.dump-btn');
dumpBtn.addEventListener('click', selectedMailDump);

function selectedMailDump() {

    const selectedMailArr = document.querySelectorAll('.selected-table-data');

    const selectedMailNoArr = [];
    let i = 0;

    selectedMailArr.forEach( selectedMail => {
        const selectMailLabel = selectedMail.querySelector('label');

        selectedMailNoArr[i] = selectMailLabel.id;
        i++;
    })

    const folder = new URLSearchParams(location.search).get('folder');

    fetch(contextPath + "/mail/selected/dump", {
            method : "POST",
            headers : {
                "Content-Type" : "application/json",
            },
            body : JSON.stringify({
                'selectedMailNoArr' : selectedMailNoArr,
                'folder' : folder
            })
    })
    .then( (response) => response.json() )
    .then( (data) => {

        location.reload();

    })
    .catch( err => {})
}