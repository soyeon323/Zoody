function modalClose() {
    $(".modal").css("display", "none");
}

function profileEditModal() {
    const $emailInput = $("input[name='email']");
    const $phoneInput = $("input[name='phone']");
    const $birthDateInput = $("input[name='birthDate']");
    const $lineIntroInput = $("input[name='lineIntro']"); 

    const originalEmail = $emailInput.data("original-value");
    const originalPhone = $phoneInput.data("original-value");
    const originalBirthDate = $birthDateInput.data("original-value");
    const originalLineIntro = $lineIntroInput.data("original-value"); 


    $emailInput.val(originalEmail);
    $phoneInput.val(originalPhone);
    $birthDateInput.val(originalBirthDate);
    $lineIntroInput.val(originalLineIntro);

    $(".modal").css("display", "grid");
    console.log("Modal opened with original values");
}

$(".modal-edit-btn").on("click", (e) => {
    const $clickedButton = $(e.target);
    const $siblingInput = $clickedButton.siblings("input");

    $siblingInput.prop("readonly", false).focus();

    const originalValue = $siblingInput.val();
    console.log("Editing input value:", originalValue);

    $siblingInput.on("blur", () => {
        const newValue = $siblingInput.val();

        if (newValue === "" || newValue === originalValue) {
            $siblingInput.val(originalValue);
        }

        $siblingInput.prop("readonly", true);
    });
});

$(".modal-btn-area input[type='submit']").on("click", function (e) {
    e.preventDefault();

    const email = $("input[name='email']").val();
    const phone = $("input[name='phone']").val();
    const birthDate = $("input[name='birthDate']").val();
    const lineIntro = $("input[name='lineIntro']").val();

    const originalEmail = $("input[name='email']").data("original-value");
    const originalPhone = $("input[name='phone']").data("original-value");
    const originalBirthDate = $("input[name='birthDate']").data("original-value");
    const originalLineIntro = $("input[name='lineIntro']").data("original-value");

    console.log("Submitted values:");
    console.log("email:", email);
    console.log("phone:", phone);
    console.log("birthDate:", birthDate);
    console.log("lineIntro:", lineIntro);

    console.log("Original values:");
    console.log("originalEmail:", originalEmail);
    console.log("originalPhone:", originalPhone);
    console.log("originalBirthDate:", originalBirthDate);
    console.log("originalLineIntro:", originalLineIntro);

    if (lineIntro == originalLineIntro && email == originalEmail && phone == originalPhone && birthDate == originalBirthDate) {
        modalClose();
        console.log("No changes, modal closed");
    } else {
        $.ajax({
            url: root + "/updateUserInfo",
            method: "POST",
            data: {
                lineIntro: lineIntro,
                mail: email,
                phone: phone,
                birthDate: birthDate,
                no: headerGetLoginMemberNo,
            },
            success: function (response) {
                console.log("AJAX 요청 성공:", response);
        
                console.log(response);

                console.log("업데이트 성공");

                // 응답에서 원하는 값을 추출하여 변수에 저장
                const lineIntro = response.lineIntro;
                const phone = response.phone;
                const email = response.email;
                const birthDate = response.birthDate;

                // 프로필 정보 업데이트
                $(".profile-content").find(".profile-content-intro").text(lineIntro);

                // 모달 내 input 업데이트
                const $modalIntroInput = $(".modal-body-intro-input");
                $modalIntroInput.prop("readonly", false); // 잠시 readonly 해제
                $modalIntroInput.val(lineIntro);
                $modalIntroInput.attr("value", lineIntro);
                $modalIntroInput.attr("data-original-value", lineIntro);

                // 모달 내 이메일 input 업데이트
                const $modalEmailInput = $("input[name='email']");
                $modalEmailInput.prop("readonly", false); // 잠시 readonly 해제
                $modalEmailInput.val(email);
                $modalEmailInput.attr("data-original-value", email);

                // 모달 내 전화번호 input 업데이트
                const $modalPhoneInput = $("input[name='phone']");
                $modalPhoneInput.prop("readonly", false); // 잠시 readonly 해제
                $modalPhoneInput.val(phone);
                $modalPhoneInput.attr("data-original-value", phone);

                // 모달 내 생년월일 input 업데이트
                const $modalBirthDateInput = $("input[name='birthDate']");
                $modalBirthDateInput.prop("readonly", false); // 잠시 readonly 해제
                $modalBirthDateInput.val(birthDate);
                $modalBirthDateInput.attr("data-original-value", birthDate);

                // 잠시 후에 다시 readonly 설정
                setTimeout(() => {
                    $modalBirthDateInput.prop("readonly", true);
                    $modalIntroInput.prop("readonly", true);
                    $modalEmailInput.prop("readonly", true);
                    $modalPhoneInput.prop("readonly", true);
                }, 1000); // 2초 후에 readonly 설정

                modalClose();

            },
            error: function (error) {
                console.log("AJAX 요청 실패:", error);
            }
        });
        
    }
});








function goToNotice() {
    window.location.replace(root+"/notice/list");
}

function goToCalender() {
    window.location.replace(root+"/calendar/main");
}

function goToProject() {
    window.location.replace(root+"/project/progress");
}

function goToAttendance() {
    window.location.replace(root+"/attendance/main");
} 

function goToCommunity() {
    window.location.replace(root+"/community/board/list");
} 

$(".newpost").on("click",function(e){

    console.log(123);

    let boardNo = null;
    let listTarget = $(e.target).hasClass("community-list");

    if (!listTarget) {
        boardNo = $(e.target.parentNode).children(":last").text();
    }
    else {
        boardNo = $(e.target).children(':last').text();
    }


    window.location.replace(root+"/community/board/detail?no="+boardNo);

})

function goToNoticeDetail(no) {
    location.href = root+"/notice/detail?no=" + no;
}


const checkOutTime = $(".checkOutTime.not-null").text();
if (checkOutTime === null || checkOutTime === '00:00:00') {
        
    setInterval(()=> { officehoursCheck()},1000)

    $(".checkOutTime-icon").css("background-color", "#c9e5e0");
    $(".checkOutTime.not-null").text("--:--:--");
}
else {
    console.log(checkOutTime);

    const checkInTime = $(".checkInTime").text().trim();

    const enrolldate = $(".attendance-enrolldate").text()+"T";
    const checkInDate = new Date(enrolldate + checkInTime);
    const checkOutDate = new Date(enrolldate + checkOutTime);

    const timeDifferenceMs = checkOutDate - checkInDate;

    const hours = Math.floor(timeDifferenceMs / (1000 * 60 * 60));
    const minutes = Math.floor((timeDifferenceMs % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((timeDifferenceMs % (1000 * 60)) / 1000);

    // 결과 출력
    $(".officehours").text(hours + ":" + minutes + ":" + seconds);
}



function officehoursCheck() {
    const checkInTime = $(".checkInTime").text().trim();

    const enrolldate = $(".attendance-enrolldate").text()+"T";
    const checkInDate = new Date(enrolldate + checkInTime);

    // 현재 시간 가져오기
    const currentDate = new Date();

    // 밀리초로 시간 차이 계산
    const timeDifferenceMs = currentDate - checkInDate;

    const hours = Math.floor(timeDifferenceMs / (1000 * 60 * 60));
    const minutes = Math.floor((timeDifferenceMs % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((timeDifferenceMs % (1000 * 60)) / 1000);

    // 한 자리 숫자 앞에 0을 붙이는 함수
    function addLeadingZero(number) {
    return number < 10 ? "0" + number : number;
    }

    // 결과 출력
    const formattedTime = `${addLeadingZero(hours)}:${addLeadingZero(minutes)}:${addLeadingZero(seconds)}`;
    return $(".officehours").text(formattedTime);
}

