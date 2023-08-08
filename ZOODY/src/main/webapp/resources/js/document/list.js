$("ul").on("click", ".add-new-directory" , function () {

    // "add-new-directory" 요소가 이미 비활성화되어 있는지 확인 (중복 클릭 방지)
    if ($(".add-new-directory").hasClass("disabled")) {
        return; // 이미 비활성화된 상태이면 아무 작업도 수행하지 않음
    }
    
    // "비활성화" 클래스를 추가하여 요소를 임시적으로 비활성화하여 중복 클릭 방지
    $(".add-new-directory").addClass("disabled");

    

    // AJAX 요청
    $.ajax({
        url: root+"/document/directory",
        method: "POST", 
        data: { 
            directoryName: "새 폴더",
            userNo : headerGetLoginMemberNo,
        }, // 필요한 경우 추가 데이터를 전송할 수 있음
        success: function (response) {
            console.log(response);
            const getNo = response.no;
            const getDirectoryName = response.directoryName;

            console.log(getNo+" || "+getDirectoryName);
            let newListItem = `
                <li id='${ getNo }'>
                    <form action="">
                        <div onclick="goToUserDirectory('enterprise')">
                            <input class="private-document-item" type="text" value='${ getDirectoryName }' readonly>
                            <span>
                                <img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt="">
                            </span>
                        </div>
                        <img class="hover_icon" src="${root}/resources/img/icon/svg/rename.svg"></img>
                    </form>
                </li>
            `;
            if ($(".add-new-directory").parent().children().length < 2) {
                $(".add-new-directory").before(newListItem);
                return;
            }
            $(".add-new-directory").parent().children().eq(-2).after(newListItem);
        },
        error: function (xhr, status, error) {
            // AJAX 요청 실패 시 처리
            console.log("AJAX 요청 실패:", error);
        },
        complete: function () {
            // AJAX 요청이 완료되면 "비활성화" 클래스를 제거하여 요소를 다시 활성화
            checkAndToggleAddButton();
            $(".add-new-directory").removeClass("disabled");
        }
    });
});