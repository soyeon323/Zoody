<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/admin/suggestion/detail.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/admin/longside.jsp" %>

    <div id="wrap">

        <div id="suggestion">
            <a>건의사항</a>
        </div>

        <div id="topArea">
            <div>
                <a>▶</a>
                <a>게시글 주소 : </a>
                <a>http://www.naver.com/1123555498</a>
            </div>
            <div>
                <a>▶</a>
                <a>게시글 공개 설정 : </a>
                <a>전체공개</a>
            </div>
        </div>

        <div id="iconArea">
            <div>
                <img src="${root}/resources/img/icon/png/newPencil.png" alt="글쓰기아이콘">
                <a href="">새글쓰기</a>
            </div>
            <div>
                <img src="${root}/resources/img/icon/png/copy.png" alt="복사아이콘">
                <a href="">복사</a>
            </div>
            <div>
                <img src="${root}/resources/img/icon/png/delete.png" alt="삭제아이콘">
                <a href="">삭제</a>
            </div>
            <div>
                <img src="${root}/resources/img/icon/png/edit.png" alt="수정아이콘">
                <a href="">수정</a>
            </div>
        </div>

        <div id="contentArea">
            <div id="title">
                <div>건의사항입니다&nbsp&nbsp [1]</div>
            </div>
            <div id="info">
                <div>김철수&nbsp대리</div>
                <div>2023-07-01 14:27</div>
            </div>
            <div id="content">
                <div><a>건의사항 알려드립니다.</a></div>
                <div id="contentDetail">
                    <div>
                        <img src="${root}/resources/img/icon/png/comment.png" alt="댓글아이콘">
                        <a>댓글 1개</a>
                    </div>
                    <div>|</div>
                    <div>조회&nbsp 3</div>
                </div>
            </div>
            <div id="comment">
                <div id="commentArea">
                    <img src="${root}/resources/img/icon/png/profileImg.png" alt="프로필사진">
                   
                    <form action="${root}/admin/suggestion/detail" method="post">
                        <div id="commentZone">
                            <div><input type="text" placeholder="댓글을 남겨보세요."></div>
                            <div><input type="submit" value="등록"></div>
                        </div>
                    </form>
                </div>
                <div id="commentOk">
                    <div><img src="${root}/resources/img/icon/png/profileImg.png" alt="프로필사진"></div>
                    <div><a>@김영희 대리</a></div>
                    <div><a>확인해주세요</a></div>
                    <div><a>23-07-01</a></div>
                    <div><a href="">삭제</a></div>
                </div>
            </div>
        </div>

        <div id="btnArea">
            <div id="btn02">
                <button>목록</button>
            </div>
        </div>
    </div>

</body>
</html>
