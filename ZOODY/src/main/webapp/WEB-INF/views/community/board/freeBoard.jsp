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
                자유 게시판
            </div>
            
            <div class="boder-grid-body">
                
                <div class="boder-grid-body-top">
                    <c:if test="${empty board.count}">
                        <div>전체 게시글 0 개</div>
                    </c:if>
                    <c:if test="${not empty board.count}">
                        <div>전체 게시글 ${ board.count } 개</div>
                    </c:if>

                    <div class="search-area">

                        <select name="search-area-cat">
                            <option value="title" selected>제목
                            <option value="writer"> 작성자
                            <option value="???"> ???
                        </select>

                        <div class="search-area-search">
                            <input type="text">
                            <img src="${root}/resources/img/icon/svg/search-2.svg" alt="🔍">
                        </div>

                    </div>
                </div>
                <div class="boder-grid-body-meddle">
                    <div class="boder-grid-body-meddle-notice">
                        <div>
                            <img src="${root}/resources/img/icon/svg/notice.svg" alt="📢">
                            ${ notice.title }
                        </div>
                        <div>
                            <img src="${root}/resources/img/icon/svg/notice.svg" alt="📢">
                            ${ notice.title }
                        </div>
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
                            <c:forEach items="${ freeBoardList }" var="list">
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
                
                <div class="boder-grid-footer-page"></div>

            </div>

        </div>
    </div>

</body>


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