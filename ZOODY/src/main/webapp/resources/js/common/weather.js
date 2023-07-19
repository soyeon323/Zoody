// 날씨 정보 가져오기
function getWeatherInfo() {
    $.ajax({
        url : root + "/api/weather",
        type : "get",
        dataType : "json",
        success : function(data) {
            
            alert(123);

        },
        error : function(data) {
            alert("fail");
        }
    });
}

// // 5 초마다 날씨 정보 가져오기
// setInterval(() => {
//     getWeatherInfo();
// }, 5000);