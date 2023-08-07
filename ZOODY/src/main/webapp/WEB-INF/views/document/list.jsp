<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/document/document.css">
</head>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/document/upload.jsp" %>
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/side.jsp" %>
        <div id="document-wrap">

            <div class="document-header">${documentType}</div>
    
            <div class="document-side">

                <div class="upload-modal-open-btn" onclick="documentUpload()">업로드</div>

                <ul>문서
                    <li onclick="goToDirectory(1)"><div>전사 <span><img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt=""></span></div></li>
                    <li onclick="goToDirectory(2)"><div>부서 <span><img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt=""></span></div></li>
                </ul>
                <ul class="private-document-list">
                    
                    
                 
                        개인 문서
                        <c:if test="${empty directoryList }">

                        </c:if>

                        <c:if test="${not empty directoryList }">
                            
                            <c:forEach items="${ directoryList }" var="list">
        
                                <li>
                                    <div onclick="goToUserDirectory('enterprise')">
                                        <input class="private-document-item" type="text" value="${list.directoryName} ">
                                        <span>
                                            <img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt="">
                                        </span>
                                    </div>
                                    <img class="hover_icon" src="${root}/resources/img/icon/svg/rename.svg"></img>
                                </li>
        
                            </c:forEach>

                        </c:if>

                    

                    <li class="add-new-directory">새 폴더 추가 <span>+</span></li>
                </ul>
            </div>
            
            <script>

                $(document).ready(function () {
                    $(".private-document-list > li").hover(
                        function () {
                        // 마우스 호버 상태에 진입했을 때
                        $(this).find(".hover_icon").css("display", "block");
                        }
                        ,
                        function () {
                        // 마우스 호버 상태에서 벗어났을 때
                        $(this).find(".hover_icon").css("display", "none");
                        }
                    );
                });

                $(document).ready(function () {
                    checkAndToggleAddButton();
                });

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



                $(".add-new-directory").on("click", function () {


                    

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
                                console.log("성공");
                                let newListItem = '<li>새 폴더<span><img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt=""></span></li>';
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



            </script>



            <div class="boder-grid-body">
                
                <div class="boder-grid-body-top">
                    <c:if test="${empty map.documentListCnt}">
                        <div>조회가능 문서 0 개</div>
                    </c:if>
                    <c:if test="${not empty map.documentListCnt}">
                        <div>전체 게시글 ${ map.documentListCnt } 개</div>
                    </c:if>

                <form action="${root}/document/list" method="get"></form>
                        <!-- 검색 영역 -->
                        <div class="search-area">
                            <select name="searchType">
                                <option value="title" ${(map.searchMap.searchType == 'title') ? 'selected' : ''}>제목</option>
                                <option value="writer" ${(map.searchMap.searchType == 'writer') ? 'selected' : ''}>작성자</option>
                                <!-- 다른 검색 기준이 필요한 경우에도 option을 추가하고, 해당 검색 기준에 따라 selected를 설정합니다. -->
                            </select>
                            <div class="search-area-search">
                                <input type="text" name="searchValue" value="${map.searchMap.searchValue}">
                                <button type="submit"><img src="${root}/resources/img/icon/svg/search-2.svg" alt="🔍"></button>
                            </div>
                        </div>
                    </div>
                </form>

                    
                
                <div class="boder-grid-body-meddle">
                    <div class="boder-grid-body-meddle-notice">
                        폴더 영역
                    </div>
                </div>
                <div class="boder-grid-body-bottom">
                    
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>유형</th>
                                <th>파일이름</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${ map.documentList }" var="list">
                            	<tr>
	                                <td>${ list.rownum }</td>
                                    <td>${ list.extension }</td>
                                    <td>${ list.fileName }</td>
	                                <td>${ list.name }</td>
	                                <td>${ list.enrollDate }</td>
	                            </tr>
                            </c:forEach>
                            
                            
                        </tbody>
                    </table>


                    <div id="page">
                        <c:if test="${map.pv.currentPage > 1}">
                            <a href="${root}/document/list?page=${map.pv.currentPage - 1}">
                                <img src="${root}/resources/img/icon/png/left.png" alt="왼쪽화살표">
                            </a>
                        </c:if>
                        
                        <c:forEach begin="${map.pv.startPage}" end="${map.pv.endPage}" var="i">
                            
                            <c:choose>
                                <c:when test="${i == map.pv.currentPage}">
                                    <button class="active">${i}</button>
                                </c:when>
                                <c:otherwise>
                                    <a href="${root}/document/list?page=${i}">
                                        <button class="nomalBtn">${i}</button>
                                    </a>
                                </c:otherwise>
                            </c:choose>
            
                        </c:forEach>
                        
                        <c:if test="${map.pv.currentPage < map.pv.maxPage}">
                            <a href="${root}/document/list?page=${map.pv.currentPage + 1}">
                                <img src="${root}/resources/img/icon/png/right.png" alt="오른쪽화살표">
                            </a>
                        </c:if>
                    </div>
                </div>

                


            </div>
            
            
            
        </div>

        
        
    
    
	
</body>
</html>


<script>

    function documentUpload() {
        $("#upload-modal").css("display","grid");
    }
</script>