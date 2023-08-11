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


const addBookmarkBtnArr = document.querySelectorAll('.add-bookmark-btn');

addBookmarkBtnArr.forEach(element => {

    const target = element;
    
    element.addEventListener('click', (event)=>{

        if(target.value == 'X') {
            fetch(contextPath + '/mail/bookmark/add?no=' + target.id)
            .then((response)=>response.text())
            .then((data)=>{

                location.reload();

            })
            .catch( err => {})
        } 
        else if(target.value == 'O') {
            fetch(contextPath + '/mail/bookmark/remove?no=' + target.id)
            .then((response)=>response.text())
            .then((data)=>{

                location.reload();

            })
            .catch( err => {})
        }
    })
});



const allSelectBtn = document.querySelector('#select-all');

allSelectBtn.addEventListener('click', ()=>{

    const checkBoxArr = document.querySelectorAll('.small-check-btn');

    if(allSelectBtn.checked == true) {
        checkBoxArr.forEach(element=>{
            element.checked = true;
        }); 
    } else if(allSelectBtn.checked == false) {
        checkBoxArr.forEach(element=>{
            element.checked = false;
        });    
    }
    
});





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