const contextPath = location.href.substring( hostIndex, location.href.indexOf( '/', hostIndex + 1 ));


const mailNo = new URLSearchParams(location.search).get('no');

window.onload = () => {
    fetch(contextPath + "/mail/detail/read?no=" + mailNo)
    .then( (response) => response.json() )
    .then( (data) => {})
    .catch( err => {})
}