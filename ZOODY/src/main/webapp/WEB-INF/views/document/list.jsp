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


<script src="${root}/resources/js/document/list.js"></script>
<script>

    function documentUpload() {
        $("#upload-modal").css("display","grid");
    }
</script>