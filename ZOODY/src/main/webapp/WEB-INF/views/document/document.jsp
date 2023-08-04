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
	
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/side.jsp" %>
        <div id="document-wrap">

            <div class="document-header">${documentType}</div>
    
            <div class="document-side">

                <div onclick="documentUpload()">업로드</div>

                <ul>문서
                    <li>전사 <span><img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt=""></span></li>
                    <li>부서 <span><img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt=""></span></li>
                </ul>
                <ul>개인 문서
                    <li>새 폴더 <span><img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt=""></span></li>
                    <li>새새 폴더 <span><img class="home-icon" src="${root}/resources/img/icon/svg/folder-2.svg" alt=""></span></li>

                    <li>새 폴더 추가 <span>+</span></li>
                </ul>
            </div>
    



            <div class="boder-grid-body">
                
                <div class="boder-grid-body-top">
                    <c:if test="${empty board.count}">
                        <div>조회가능 문서 0 개</div>
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
                        폴더 영역
                    </div>
                </div>
                <div class="boder-grid-body-bottom">
                    
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>카테고리</th>
                                <th>구분</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${ freeBoardList }" var="list">
                            	<tr>
	                                <td>${ list.no }</td>
	                                <td>${ list.title }</td>
	                                <td>${ list.userNo }</td>
	                                <td>${ list.hit }</td>
	                                <td>${ list.enrollDate }</td>
	                            </tr>
                            </c:forEach>
                            
                            
                        </tbody>
                    </table>

                </div>

            </div>

        </div>

        <%@ include file="/WEB-INF/views/document/upload.jsp" %>


    </div>
    
	
</body>
</html>


<script>

    function documentUpload() {
        $("#upload-modal").css("display","grid");
    }
</script>