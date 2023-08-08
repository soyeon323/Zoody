const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));

const URLSearch = new URLSearchParams(location.search);

/* ==================================================================================== */

fetch(contextPath + '/approval/detail/drafter?no=' + URLSearch.get('no'))
.then(response=>response.json())
.then((data)=>{

    console.log(data);

})
.catch((data)=>{
    alert('상신인 정보 불러오기 실패..');
})


/* ==================================================================================== */








/* ==================================================================================== */






























