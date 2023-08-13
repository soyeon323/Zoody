const URLSearch = new URLSearchParams(location.search);

const category = URLSearch.get('category');

if(category == 1) {
    const categoryBox = document.querySelector('.my-approvl');
    categoryBox.classList.add('my-approvl-active')

} else if(category == 2) {
    const categoryBox = document.querySelector('.standby-approval');
    categoryBox.classList.add('standby-approval-active')

} else if(category == 3) {
    const categoryBox = document.querySelector('.unread-cc');
    categoryBox.classList.add('unread-cc-active')

} else if(category == 4) {
    const categoryBox = document.querySelector('.my-upvote');
    categoryBox.classList.add('my-upvote-active')

} 









