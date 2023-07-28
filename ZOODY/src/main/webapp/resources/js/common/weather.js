// $(document).ready(function() {
   
//     // 1시간 마다 날씨 정보 가져오기
//     setInterval(() => {
//         getPosition();
//     }, 360000);

// });

// $(document).ready(function() {
   
//     // 6촌 마다 날씨 정보 가져오기
//     setInterval(() => {
//         getPosition();
//     }, 6000);

// });

// 5초마다 getPosition 함수 호출
let updayeWeatherInfo = setInterval(getPosition, 1000000); // 5000 밀리초 = 5초


let result = null;


// 날씨 정보 가져오기
function getPosition() {
    navigator.geolocation.getCurrentPosition(function(pos) {
        
            console.log(pos);
            var latitude = pos.coords.latitude;
            var longitude = pos.coords.longitude;

            if (latitude === null || longitude === null ) {
                    
                alert("위치 정보를 가져올 수 없습니다.");
                
                return;
            }

            console.log("현재 위치는 : " + latitude + ", "+ longitude);
            // 위도와 경도를 LCC DFS 좌표로 변환 (toXY)
            var result = dfs_xy_conv("toXY", latitude, longitude);

            console.log("위도:", latitude);
            console.log("경도:", longitude);

            console.log("LCC DFS 좌표 X:", result.x);
            console.log("LCC DFS 좌표 Y:", result.y);

            // 여기서 날씨 정보를 사용하여 날씨를 가져올 수 있습니다.
            $.ajax({
                url: root + "/api/weather",
                type: "post",
                dataType: "json",
                data : {
                    nx : result.x,
                    ny : result.y,
                },
                success: function(data) {
                    console.log(data);

                    let updayeWeatherInfo = 
                    `
                    <div class="temperatures">기온 {}</div>
                    <div class="weather-icon">
                        <img src="${root}/resources/img/icon/png/weather-cloud.png" alt="">
                    </div>
                    <div class="weather-conditions">날씨 00</div>
                    `

                },
                error: function(data) {
                    alert("fail");
                }
            });
        },
        function(error) {
        $('div').text("조회 실패 ==> " + error.code);
        }
    );
}





// function getPosition() {
//     navigator.geolocation.getCurrentPosition(function(pos) {

//             console.log(123);
//             console.log(position);
//             console.log(456);

//             var latitude = pos.coords.latitude;
//             var longitude = pos.coords.longitude;
//             if (latitude === null || longitude === null ) {
                
//                 alert("위치 정보를 가져올 수 없습니다.");
                
//                 return;
//             }
//             console.log(latitude);
//             console.log(longitude);


//             // 위도와 경도를 LCC DFS 좌표로 변환 (toXY)
//             var result = dfs_xy_conv("toXY", latitude, longitude);

//             console.log("위도:", latitude);
//             console.log("경도:", longitude);

//             console.log("LCC DFS 좌표 X:", result.x);
//             console.log("LCC DFS 좌표 Y:", result.y);

//             // 여기서 날씨 정보를 사용하여 날씨를 가져올 수 있습니다.
//             $.ajax({
//                 url: root + "/api/weather",
//                 type: "post",
//                 dataType: "json",
//                 data : {
//                     nx : result.x,
//                     ny : result.y,
//                 },
//                 success: function(data) {
//                     console.log(data);
//                 },
//                 error: function(data) {
//                     alert("fail");
//                 }
//             });
//         },
//         function(error) {
//             $('div').text("조회 실패 ==> " + error.code);
//         }
//     );
// }

// LCC DFS 좌표변환을 위한 기초 자료

var RE = 6371.00877; // 지구 반경(km)
var GRID = 5.0; // 격자 간격(km)
var SLAT1 = 30.0; // 투영 위도1(degree)
var SLAT2 = 60.0; // 투영 위도2(degree)
var OLON = 126.0; // 기준점 경도(degree)
var OLAT = 38.0; // 기준점 위도(degree)
var XO = 43; // 기준점 X좌표(GRID)
var YO = 136; // 기1준점 Y좌표(GRID)

// LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )

// LCC DFS 좌표 변환 함수
function dfs_xy_conv(code, v1, v2) {
    var DEGRAD = Math.PI / 180.0;
    var RADDEG = 180.0 / Math.PI;

    // 위도, 경도를 LCC DFS 좌표로 변환하는 경우
    if (code == "toXY") {
        // 필요한 변수들 설정
        var re = RE / GRID;
        var slat1 = SLAT1 * DEGRAD;
        var slat2 = SLAT2 * DEGRAD;
        var olon = OLON * DEGRAD;
        var olat = OLAT * DEGRAD;

        // 여러 계수들 계산
        var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
        sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
        var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
        sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
        var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
        ro = re * sf / Math.pow(ro, sn);

        // 입력된 위도, 경도를 기준점과의 상대적인 위치로 변환하여 X, Y 좌표값 계산
        var rs = {};
        rs['lat'] = v1;
        rs['lng'] = v2;
        var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
        ra = re * sf / Math.pow(ra, sn);
        var theta = v2 * DEGRAD - olon;
        if (theta > Math.PI) theta -= 2.0 * Math.PI;
        if (theta < -Math.PI) theta += 2.0 * Math.PI;
        theta *= sn;
        rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
        rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);

        // 변환된 X, Y 좌표값을 반환
        return rs;
    }

    // LCC DFS 좌표를 위도와 경도로 변환하는 경우
    else {
        // 필요한 변수들 설정
        var re = RE / GRID;
        var slat1 = SLAT1 * DEGRAD;
        var slat2 = SLAT2 * DEGRAD;
        var olon = OLON * DEGRAD;
        var olat = OLAT * DEGRAD;

        // 입력된 X, Y 좌표를 기준점과의 상대적인 위치로 변환
        var xn = v1 - XO;
        var yn = ro - v2 + YO;
        ra = Math.sqrt(xn * xn + yn * yn);
        if (sn < 0.0) - ra;

        // LCC DFS 좌표를 위도와 경도로 변환하는데 필요한 계수들 계산
        var alat = Math.pow((re * sf / ra), (1.0 / sn));
        alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;

        var theta;
        if (Math.abs(xn) <= 0.0) {
            theta = 0.0;
        } else {
            if (Math.abs(yn) <= 0.0) {
                theta = Math.PI * 0.5;
                if (xn < 0.0) - theta;
            } else theta = Math.atan2(xn, yn);
        }
        var alon = theta / sn + olon;

        // 변환된 위도와 경도를 반환
        var rs = {};
        rs['x'] = v1;
        rs['y'] = v2;
        rs['lat'] = alat * RADDEG;
        rs['lng'] = alon * RADDEG;
        return rs;
    }
}
