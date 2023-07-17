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
                <div class="document-enterprise">
                    문서
                    <div>1</div>
                    <div>2</div>
                    
                </div>
                <div class="document-frivate">개인 문서
                    <div>1</div>
                    <div>2</div>
                </div>
                <div>휴지통</div>
            </div>
    
            <div class="document-body">
                <div class="document-top">
                    <c:if test="${empty document.count}">
                        <div>전체 게시글 0 개</div>
                    </c:if>
                    <c:if test="${not empty document.count}">
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
                            <img src="${root}/resources/svg/icon/search.svg" alt="🔍">
                        </div>

                    </div>
                </div>


                <div class="document-meddle">2</div>
                <div class="document-bottom">
                    
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>카테고리</th>
                                <th>부서</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>부서</td>
                                <td>제목입니다</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            
                        </tbody>
                    </table>

                </div>

            </div>


            </div>

        </div>


    </div>
	
</body>
</html>