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