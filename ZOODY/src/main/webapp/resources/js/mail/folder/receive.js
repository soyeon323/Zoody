const checkLineBtnArray = document.querySelectorAll('.small-check-btn');

checkLineBtnArray.forEach(checkLineBtn => {
    checkLineBtn.addEventListener('click', (event) => selectLine(event));
});

function selectLine(event) {
    const line = event.currentTarget.parentNode.parentNode;
    line.classList.toggle('selected-table-data');
}