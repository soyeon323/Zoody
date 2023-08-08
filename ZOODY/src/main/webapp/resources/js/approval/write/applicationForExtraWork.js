fetch(contextPath + "/approval/wtype")
.then(response => response.json())
.then(data => {

    const typeArr = data;

    const td = document.querySelector('.extra-work-category');

    typeArr.forEach(element => {
        
        const radioElem = document.createElement('input');
        radioElem.type = "radio";
        radioElem.id = element.category;
        radioElem.name = "extraWorkCategoryNo";
        radioElem.value = element.no;

        const labelElem = document.createElement('label');
        labelElem.for = element.category;
        labelElem.innerText = element.category;

        td.append(radioElem);
        td.append(labelElem);

    });

})