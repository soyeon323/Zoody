const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

const URLSearch = new URLSearchParams(location.search);



/* =================================================================================================================== */

const mailNo = new URLSearchParams(location.search).get('no');

window.onload = () => {
    fetch(contextPath + "/mail/detail/read?no=" + mailNo)
    .then( (response) => response.json() )
    .then( (data) => {})
    .catch( err => {})
}


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





const unreadBtn = document.querySelector('.unread-btn');
unreadBtn.addEventListener('click', ()=>{

    const selectedMailNoArr = [URLSearch.get('no')];

    const folder = new URLSearchParams(location.search).get('folder');

    fetch(contextPath + "/mail/selected/unread", {
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

        alert('처리되었습니다.')

    })
    .catch( err => {})

})


const deleteBtn = document.querySelector('.delete-btn');
deleteBtn.addEventListener('click', ()=>{

    const selectedMailNoArr = [URLSearch.get('no')];

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

        window.location.href = contextPath + '/mail/list?folder=dump';

    })
    .catch( err => {})

})





const folderListOpenBtn = document.querySelector('.move-btn');
const listArea = document.querySelector('.list-area');
folderListOpenBtn.addEventListener('click', ()=>{

    listArea.classList.toggle('list-area-active');

})

const folerSelectBtnArr = document.querySelectorAll('.folder-select');

folerSelectBtnArr.forEach(element => {

    const selectedMailNoArr = [URLSearch.get('no')];
    
    element.addEventListener('click', ()=>{

        fetch(contextPath + "/mail/selected/move", {
            method : "POST",
            headers : {
                "Content-Type" : "application/json",
            },
            body : JSON.stringify({
                'selectedMailNoArr' : selectedMailNoArr,
                'folder' : element.id,
            })
    })
        .then(response=>response.jsoin)
        .then((data)=>{

            window.location.href = contextPath + '/mail/list?folder=' + element.id;

        })
        .catch((err)=>{ })

    });

});





const addBookmarkBtnArr = document.querySelectorAll('.bookmark-btn');

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








