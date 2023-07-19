$(document).ready(function() {
   
    // 10분 마다 날씨 정보 가져오기
    setInterval(() => {
        getWeatherInfo();
    }, 100000);



});

// 날씨 정보 가져오기
function getWeatherInfo() {
    $.ajax({
        url : root + "/api/weather",
        type : "get",
        dataType : "json",
        success : function(data) {
            
            console.log(data);

        },
        error : function(data) {
            alert("fail");
        }
    });
};

