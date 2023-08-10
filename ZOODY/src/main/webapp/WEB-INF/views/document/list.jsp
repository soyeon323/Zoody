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
<style>
    .modal {
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: rgba(38, 38, 38, 0.47);
        z-index: 99999999;
        top: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        display: none;
    }

    .modal > div:nth-child(n+2) {
        background-color: #ffffffc7;
        max-height: 800;
        max-width: 800;
  
    }

    .modal-header {
        width: 100%;
        background-color: #385091f5;
        position: absolute;
        top: 0;
        height: 48;
        box-shadow: 0px 1px 3px rgba(100, 100, 100, 0.15);
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #fff;
    }

    .modal-header > div {
        padding: 10;
    }
    
    .modal-header-file-name-area > img {
        width: 15;
        height: 15;
        background-color: #fff;
        padding: 10;
        border-radius: 5px;
    }

    .modal-content {
        border-radius: 5px;
        position: relative;
        box-shadow: 0px 1px 3px rgba(100, 100, 100, 0.15);
    }
    .modal-content > img {
        padding: 20;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .modal-extension {
        position: absolute;
        width: 100%;
        height: 100;
        z-index: 999999;
        display: flex;
        top: 74%;
        justify-content: center;
        font-size: 90px;
        font-weight: 600;
        color: #fff;
    }

    .upload-modal-open-btn {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 63.5;
        justify-self: center;
        /* margin: auto; */
        margin-bottom: 20;
        margin-top: 20;
        background: #FFFFFF;
        box-shadow: 0px 0px 7px -2px rgba(0, 0, 0, 0.25);
        border-radius: 5px;
        font-weight: 600;
        font-size: 18;
        transition: all 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    }

    .upload-modal-open-btn:hover {

        background-color: #c2d2f3;
        cursor: pointer;

    }

    .upload-modal-open-btn > img {
        margin-left: 10;
        max-width: 15;
        max-height: 15;
    }

</style>

<body>
	<%@ include file="/WEB-INF/views/document/upload.jsp" %>
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <div class="modal">

        <div class="modal-header">
            <div class="modal-header-file-name-area"><img class="modal-close" src="" alt=""> 파일이름</div>
            <div class="modal-header-active-area">
                <input type="button" class="flie-down-load" value="다운로드">
                <input type="button" value="삭제">
            </div>
            <input type="text" class="file-no" value="" style="display: none;">
        </div>

        <div class="modal-content">
            <img src="${root}/resources/img/icon/svg/file.svg" alt="">
            <span class="modal-extension">dd</span>
        </div>

    </div>

   <script>
        $(".modal").on("click" , (e)=>{
            console.log(123);
            if ($(e.target).hasClass("flie-down-load")) {
                
                const fileNo =  $(".modal").find(".file-no").val();

                console.log("fileNo : "+fileNo);

                location.href = root+'/document/download?no='+fileNo;

                // $.ajax({
                //     url: root+"/document/download",
                //     method: "POST", 
                //     data: { 
                //         no : fileNo,
                //     }, // 필요한 경우 추가 데이터를 전송할 수 있음
                //     success: function (response) {
                //         console.log(response);
                        
                //     },
                //     error: function (xhr, status, error) {
                //         // AJAX 요청 실패 시 처리
                        
                //     },
                //     complete: function () {
                //         // AJAX 요청이 완료되면 "비활성화" 클래스를 제거하여 요소를 다시 활성화
                //         checkAndToggleAddButton();
                //     }
                // })

            }
        })


            
        


   </script>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/side.jsp" %>
        <div id="document-wrap">

            <div class="document-header">
                <c:if test="${scope eq 1}">전사 문서</c:if>
                <c:if test="${scope eq 2}">부서 문서</c:if>
                <c:if test="${scope eq 3}">개인 문서 ></c:if>
            </div>
    
            <div class="document-side">

                <div class="upload-modal-open-btn" onclick="documentUpload()">업로드 <img src="${root}/resources/img/icon/svg/up-load.svg" alt=""></div>

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
        
                                <li id="${ list.no }">
                                    <form action="" onsubmit="return false">
                                        <div onclick="goToUserDirectory('${ list.no }')">
                                            <input type="text" name="no" value="${list.no}" style="display: none;">
                                            <input class="private-document-item" type="text" value="${list.directoryName}" readonly>
                                            <span>
                                                <img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt="">
                                            </span>
                                        </div>
                                        <img class="hover_icon" src="${root}/resources/img/icon/svg/rename.svg"></img>
                                    </form>
                                </li>
        
                            </c:forEach>

                        </c:if>

                    

                    <li class="add-new-directory">새 폴더 추가 <span>+</span></li>
                </ul>
            </div>

            <div class="boder-grid-body">
                
                <div class="boder-grid-body-top">
                    <c:if test="${empty map.documentListCnt}">
                        <div>조회가능 문서 0 개</div>
                    </c:if>
                    <c:if test="${not empty map.documentListCnt}">
                        <div>전체 게시글 ${ map.documentListCnt } 개</div>
                    </c:if>

                <form action="${root}/document/list" method="get">
                        <!-- 검색 영역 -->
                        <input style="display: none;" name="scope" value="${scope}">
                        <div class="search-area">
                            <select name="searchType">
                                <option value="fileName" ${(map.searchMap.searchType == 'fileName') ? 'selected' : ''}>파일이름</option>
                                <option value="name" ${(map.searchMap.searchType == 'name') ? 'selected' : ''}>작성자</option>
                                <option value="extension" ${(map.searchMap.searchType == 'extension') ? 'selected' : ''}>파일 유형</option>
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
                                    <td style="display: none;">${ list.no }</td>
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


<script src="${root}/resources/js/document/list.js"></script>
<script>

    function documentUpload() {
        $("#upload-modal").css("display","grid");
    }
</script>