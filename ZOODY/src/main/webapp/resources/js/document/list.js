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
                        <div onclick="goToUserDirectory(${ getNo })">
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



let focusCheckFlag = false;

// 호버 시 수정 버튼
$(".private-document-list").on("mouseenter", "li", function() {
    if (focusCheckFlag) {
        return;
    }
    $(this).find(".hover_icon").css("display", "block");
}).on("mouseleave", "li", function () {
    if (focusCheckFlag) {
        return;
    }
    $(this).find(".hover_icon").css("display", "none");
});

$(document).ready(function () {
    checkAndToggleAddButton();
});


let oldValue;
let liId;
$(".private-document-list").on("click", ".hover_icon", function() {
    if ($(this).parent().find(".hover_icon").hasClass("rename_upload")) {
        var newName = $(".private-document-list li#"+liId).find(".private-document-item").val();
        if (newName === '' || newName === null) {
            alert("빈 값은 넣을 수 없습니다");
            return;
        }

        console.log("변경될 디렉토리 이름: " + newName);
        renameUpload(newName);
        return;
    }

    console.log("pass");

    const ancestor = $(this).closest("li");
    liId = ancestor.attr("id");

    $(this).find(".hover_icon").css("display", "block");

    focusCheckFlag = true;

    var inputElement = ancestor.find(".private-document-item");

    // 기존 값 저장
    oldValue = inputElement.val(); // 전역 변수 oldValue에 저장
    $(this).data("oldValue", oldValue);

    // 이미지 태그 찾기
    var imgElement = ancestor.find(".hover_icon");

    var newImgSrc = root + "/resources/img/icon/svg/rename-check.svg"; // 새로운 이미지 경로 설정

    imgElement.addClass("rename_upload"); // id 추가로 업로드 버튼으로 변경

    imgElement.attr("src", newImgSrc);

    inputElement.prop('readonly', false);
    inputElement.val('').focus(); // 입력 상자로 포커스 이동하고 값 초기화
});

$(document).on("click", function(event) {
    if (!$(event.target).closest(".private-document-list").length) {
        if (focusCheckFlag) {

            var x = $(".private-document-list li#"+liId);

            let savedOldValue = oldValue; // 전역 변수 oldValue 사용

            x.find(".hover_icon").css("display", "none");
            x.find(".private-document-item").prop('readonly', true);

            x.find(".private-document-item").val(oldValue);

            var originalImgSrc = root + "/resources/img/icon/svg/rename.svg";
            x.find(".hover_icon").prop("src", originalImgSrc);

            x.find(".hover_icon").removeClass("rename_upload"); // class 제거
            focusCheckFlag = false;
        }
    }
});

function renameUpload(newName) {
    console.log("두번째 클릭");



    $.ajax({
            url: root+"/directory/rename",
            method: "POST", 
            data: { 
                directoryName : newName,
                directoryNo : liId,
                userNo : headerGetLoginMemberNo,
            }, // 필요한 경우 추가 데이터를 전송할 수 있음
            success: function (response) {
                console.log(response);

                const directoryNo =  response.directoryNo;
                const directoryName =  response.directoryName;

                console.log(directoryNo);
                console.log(directoryName);

                $("li#"+liId).html(`
                        <form action="" onsubmit="return false">
                            <div onclick="goToUserDirectory(${ directoryNo })">
                                <input class="private-document-item" type="text" value="${ directoryName }" readonly>
                                <span>
                                    <img class="home-icon" src="${ root }/resources/img/icon/svg/folder-2.svg" alt="">
                                </span>
                            </div>
                            <img class="hover_icon" src="${ root }/resources/img/icon/svg/rename.svg"></img>
                        </form>
                `);

                focusCheckFlag = false;
            },
            error: function (xhr, status, error) {
                // AJAX 요청 실패 시 처리
                console.log("AJAX 요청 실패:", error);
                
            },
            complete: function () {
                // AJAX 요청이 완료되면 "비활성화" 클래스를 제거하여 요소를 다시 활성화
            }
        });

}




function checkAndToggleAddButton() {
    var childCount = $(".private-document-list li").length;
    var addButton = $(".add-new-directory");

    if (childCount > 5) {
        addButton.hide(); // 5개 이상인 경우 숨기기
    } else {
        addButton.show(); // 5개 미만인 경우 보이기
    }
}

function goToDirectory(path) {
    location.href = root+'/document/list?scope='+path;
};




// detail
$(".modal").on("click" , (e)=>{
    console.log(123);
    if ($(e.target).hasClass("modal-close")) {
        $(".modal").css("display" , "none");
    }
})


$(".list-table").on("click",function (e) {

                    
    let boardNo = null;
    let listTarget = e.target.tagName;

    if (listTarget === "TD") {
        boardNo = $(e.target.parentNode).children(":last").text();
    }
    else if (listTarget === "TR"){
        boardNo = $(e.target).children(':last').text();
    }

    console.log(boardNo);
    
    $.ajax({
        url: root+"/document/detail",
        method: "POST", 
        data: { 
            no : boardNo,
        }, // 필요한 경우 추가 데이터를 전송할 수 있음
        success: function (response) {
            console.log(response);

            const fileName =  response.fileName;
            const extension =  response.extension;
            const no =  response.no;

            console.log(fileName);
            console.log(extension);
            
            const fullName = fileName + extension;

            console.log(fullName);

            $(".modal").html(`
                <div class="modal-header">
                    <div class="modal-header-file-name-area">
                        <img class="modal-close" src="" alt=""> ${ fullName }
                        </div>
                    <div class="modal-header-active-area">
                    <input type="button" class="flie-down-load" value="다운로드">
                    <input type="button" value="삭제">
                    </div>
                    <input type="text" class="file-no" value="${ no }" style="display: none;">
                </div>

                <div class="modal-content">
                    <img src="${root}/resources/img/icon/svg/file.svg" alt="">
                    <span class="modal-extension">${ extension }</span>
                </div>

            `);

            $(".modal").css("display" , "flex");
        },
        error: function (xhr, status, error) {
            // AJAX 요청 실패 시 처리
            console.log("AJAX 요청 실패:", error);
            
        },
        complete: function () {
            // AJAX 요청이 완료되면 "비활성화" 클래스를 제거하여 요소를 다시 활성화
        }
    });
    
})