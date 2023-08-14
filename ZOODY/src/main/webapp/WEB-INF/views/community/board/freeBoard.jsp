<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/community/board.css">
</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/side.jsp" %>
        <%@ include file="/WEB-INF/views/community/communitySide.jsp" %>
        <div id="grid-wrap">

            <div class="boder-grid-header">
                <c:if test="${ catNo eq 2}">
                    전사 > 익명 게시판
                </c:if>
                <c:if test="${ catNo eq 3}">
                    부서 > 자유 게시판
                </c:if>
                <c:if test="${ catNo eq 4}">
                    부서 > 익명 게시판
                </c:if>
            </div>
            
            <div class="boder-grid-body">
                
                <div class="boder-grid-body-top">
                    <c:if test="${empty boardListCnt}">
                        <div>전체 게시글 0 개</div>
                    </c:if>
                    <c:if test="${not empty boardListCnt}">
                        <div>전체 게시글 ${ boardListCnt } 개</div>
                    </c:if>

            <form action="${root}/community/board/list" method="get">
                <!-- 검색 영역 -->
                    <div class="search-area">

                        <select name="searchType">
                            <option value="title" ${(map.searchMap.searchType == 'title') ? 'selected' : ''}>제목</option>
                            <option value="name" ${(map.searchMap.searchType == 'name') ? 'selected' : ''}>작성자</option>
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

                        <c:if test="${empty getNotice}">
                            <div>공지가 없습니다</div>
                        </c:if>


                        <c:if test="${not empty getNotice}">

                            <c:forEach items="${ getNotice }" var="list">
                                <div>
                                    <img src="${root}/resources/img/icon/svg/notice.svg" alt="📢">
                                    <div>${ list.title }</div>
                                </div>
                            </c:forEach>

                        </c:if>

                       
                    </div>
                </div>
                <div class="boder-grid-body-bottom">
                    
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>조회수</th>
                                <th>작성일</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${ map.freeBoardList }" var="list">
                            	<tr>
	                                <td>${ list.rownum }</td>
	                                <td>${ list.title }</td>
	                                <td>${ list.name }</td>
	                                <td>${ list.hit }</td>
	                                <td>${ list.enrollDate }</td>
                                    <td style="display: none;">${ list.boardNo }</td>
	                            </tr>
                            </c:forEach>
                            
                        </tbody>
                    </table>

                </div>

            </div>
            

            <div class="boder-grid-footer">
                
                <div id="page">
                    <c:if test="${map.pv.currentPage > 1}">
                        <a href="${root}/community/board/list?page=${map.pv.currentPage - 1}">
                            <img src="${root}/resources/img/icon/png/left.png" alt="왼쪽화살표">
                        </a>
                    </c:if>
                    
                    <c:forEach begin="${map.pv.startPage}" end="${map.pv.endPage}" var="i">
                        
                        <c:choose>
                            <c:when test="${i == map.pv.currentPage}">
                                <button class="active">${i}</button>
                            </c:when>
                            <c:otherwise>
                                <a href="${root}/community/board/list?page=${i}">
                                    <button class="nomalBtn">${i}</button>
                                </a>
                            </c:otherwise>
                        </c:choose>
        
                    </c:forEach>
                    
                    <c:if test="${map.pv.currentPage < map.pv.maxPage}">
                        <a href="${root}/community/board/list?page=${map.pv.currentPage + 1}">
                            <img src="${root}/resources/img/icon/png/right.png" alt="오른쪽화살표">
                        </a>
                    </c:if>
                </div>

            </div>

        </div>
    </div>

</body>

<style>
    * 페이징 */
#page{
    width: 250;
    display: flex;
    justify-content: space-around;
    align-items: center;
}

#page a{
    text-decoration: none;
    color: #4B4B4B;
    font-size: 18px;
}

#page>a img{
    width: 17px;
    height: 17px;
}

table tbody tr:hover{
    background-color: #4876EF;
    cursor: pointer;
}

#firstDiv>a{
    width: 965px;
    font-size: 18px;
    color: #4B4B4B;
}

.searchNoResult>td{
    font-size: 20px;
}

/* 페이징 */
button[class='active']{
    background-color: #4876EF;
    color: #fff;
    border-radius: 3px;
    border: none; 
    width: 25px;
    height: 25px;
    font-family: Spoqa Han Sans Neo;
    font-size: 14px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
}

button[class='nomalBtn']{
    border: none;
    color: #313131;
    font-family: Spoqa Han Sans Neo;
    font-size: 17px;
    font-style: normal;
    font-weight: 500;
    line-height: normal;
    width: 25px;
    height: 25px;
}
</style>


<script>

    
    $(".list-table > tbody > tr").on("click",function (e) {
        
        let boardNo = null;
        let listTarget = e.target.tagName;

        if (listTarget === "TD") {
            boardNo = $(e.target.parentNode).children(":last").text();
        }
        else if (listTarget === "TR"){
            boardNo = $(e.target).children(':last').text();
        }


        window.location.replace(root+"/community/board/detail?no="+boardNo);
        
    })

</script>