<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/project/progress.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>
    
    <div id="wrap">

        <div id="progress">
            <a>진행중인 프로젝트</a>
        </div>

        <div id="contentArea">
            <c:if test="${!empty map.no1List}">
                <div id="content-1">
                    <div>
                        <a>${map.no1List[0].title}</a>
                    </div>
                    <div>
                        <c:forEach items="${map.no1List}" var="no1List">
                            <a>${no1List.userName}</a>
                        </c:forEach>        
                    </div>
                    <div>
                        <a>${map.no1List[0].startDate} ~ ${map.no1List[0].endDate}</a>
                    </div>
                    <div>
                        <a href="">삭제</a>
                        <a href="">더보기 ></a>
                    </div>
                </div>
            </c:if>
            <c:if test="${!empty map.no2List}">
            <div id="content-2">
                    <div>
                        <a>${map.no2List[0].title}</a>
                    </div>
                    <div>
                        <c:forEach items="${map.no2List}" var="no2List">
                            <a>${no2List.userName}</a>
                        </c:forEach>        
                    </div>
                    <div>
                        <a>${map.no2List[0].startDate} ~ ${map.no2List[0].endDate}</a>
                    </div>
                    <div>
                        <a href="">삭제</a>
                        <a href="">더보기 ></a>
                    </div>
                </div>
            </c:if>
            <c:if test="${!empty map.no3List}">
            <div id="content-3">
                    <div>
                        <a>${map.no3List[0].title}</a>
                    </div>
                    <div>
                        <c:forEach items="${map.no3List}" var="no3List">
                            <a>${no3List.userName}</a>
                        </c:forEach>        
                    </div>
                    <div>
                        <a>${map.no3List[0].startDate} ~ ${map.no3List[0].endDate}</a>
                    </div>
                    <div>
                        <a href="">삭제</a>
                        <a href="">더보기 ></a>
                    </div>
                </div>
            </c:if>
            <div id="content-4">
                <div>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 50 50" fill="none">
                            <g clip-path="url(#clip0_424_8416)">
                                <path d="M50 22.9167H27.0833V0H22.9167V22.9167H0V27.0833H22.9167V50H27.0833V27.0833H50V22.9167Z" fill="#4876EF" fill-opacity="0.67"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_424_8416">
                                    <rect width="50" height="50" rx="20" fill="white"/>
                                </clipPath>
                            </defs>
                        </svg>
                    </button>
                </div>
                <div>
                    <a href="">새로운 프로젝트 생성하기</a>
                </div>
            </div>
        </div>
            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 생성</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <a>프로젝트명 : </a>
                                <input type="text" name="title" placeholder="프로젝트 명을 입력하세요.">
                            </div>
                            <div> 
                                <div>
                                <a>참가자 : </a>
                                <input type="text" name="user" placeholder="참가자를 입력하세요." list="user-options">
                                <datalist id="user-options">
                                    <c:forEach items="${voList}" var="voList">
                                        <option value="${voList.name}_${voList.rankName}" data-userNo="${voList.no}">
                                    </c:forEach>
                                </datalist>
                                  
                                <button onclick="addUser();" type="button">추가</button>
                            </div> 
                            <div id="userNameArea">
                                <input type="hidden" value="" name="no">
                                <div width="80" class="xNo"><a></a></div>
                                <button>
                                    
                                </button>
                            </div>
                        </div>
                        <div id="dateArea">
                            <a>프로젝트 기간 : </a>
                            <div>
                                <input type="date" name="startDate">
                            </div>
                            <a class="wave"> ~ </a>
                            <div>
                                <input type="date" name="endDate">
                            </div>
                        </div>
                        <div id="pjContent">
                            <input type="text" name="content" placeholder="내용을 입력하세요.">
                        </div>
                        <div id="pjTeamName">
                            <a>팀명 : </a>
                            <input type="text" name="teamName" placeholder="팀명을 입력하세요.">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" onclick="createPrj();">프로젝트생성</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
</div>

</body>
<script>
    function addUser() {
        var datalist = document.getElementById("user-options");
        var input = document.querySelector("input[name='user']");
        var selectedValue = input.value;

            if (selectedValue) {
                var userNameArea = document.querySelector("#userNameArea");
                var newUserName = document.createElement("a");
                newUserName.innerText = selectedValue;

                newUserName.style.fontWeight = "500";
                newUserName.style.color = "#4876EF";

                var removeButton = document.createElement("button");
                removeButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><g clip-path="url(#clip0_1067_8751)"><path d="M24 1.414L22.586 0L12 10.586L1.414 0L0 1.414L10.586 12L0 22.586L1.414 24L12 13.414L22.586 24L24 22.586L13.414 12L24 1.414Z" fill="#00CBA4"/></g><defs><clipPath id="clip0_1067_8751"><rect width="24" height="24" fill="white"/></clipPath></defs></svg>';

                removeButton.onclick = function() {
                    userNameArea.removeChild(newUserName);
                    userNameArea.removeChild(removeButton);

                    // 선택된 userNo도 함께 삭제
                    var inputNo = document.querySelector("input[name='no']");
                    var userNoToRemove = selectedOption.getAttribute("data-userNo");
                    var userNoArray = inputNo.value.split(",");

                    var updatedUserNoArray = userNoArray.filter(function(userNo) {
                        return userNo !== userNoToRemove;
                    });

                    inputNo.value = updatedUserNoArray.join(",");
                };

                userNameArea.appendChild(newUserName);
                userNameArea.appendChild(removeButton);
                input.value = "";

                // 추가된 부분: 선택된 값의 userNo 가져오기
                var selectedOption = datalist.querySelector("option[value='" + selectedValue + "']");
                var userNo = selectedOption.getAttribute("data-userNo");

                // userNo 리스트에 추가
                var inputNo = document.querySelector("input[name='no']");
                if (!inputNo.value) {
                    inputNo.value = userNo;
                } else {
                    inputNo.value += "," + userNo;
                }
            }
    }

    function createPrj(){
        const noNodes = document.querySelectorAll("#userNameArea>input")[0].value;
        const userNameNodes = document.querySelectorAll("#userNameArea>a");
        const title = document.querySelector("input[name='title']").value;
        const content = document.querySelector("input[name='content']").value;
        const startDate = document.querySelector("input[name='startDate']").value;
        const endDate = document.querySelector("input[name='endDate']").value;
        const teamName = document.querySelector("input[name='teamName']").value;

        let userNo = [];
        let userName = [];

        const arr = noNodes.split(",");

        for (let i = 0; i < userNameNodes.length; i++) {
            userName.push(userNameNodes[i].innerText);
        }

        const data = JSON.stringify({
            userNo: arr,
            userName: userName,
            title : title,
            content : content,
            startDate : startDate,
            endDate : endDate,
            teamName : teamName
        });

        $.ajax({
            url: "${root}/project/progress",
            type: "POST",
            data: data,
            contentType: "application/json", 
            dataType: "json",
            success: (x) => {
                console.log(x);
                alert("프로젝트 생성이 완료되었습니다.");
                location.reload(true);
            },
            error: (err) => {
                console.log(err);
            }
        });
    }

    function removeTextNode(node) {
        if (node && node.parentNode) {
            node.parentNode.removeChild(node);
        }
    }

    
</script>