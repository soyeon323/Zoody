<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/notice/list.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body style="overflow-x: hidden">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <div id="notice">
            <a>공지사항</a>
        </div>

        <div id="back">
            <form action="${root}/notice/list" method="get">
                <div id="firstDiv">
                    <a>전체게시글 ${map.noticeListCnt}건</a>
                    <select name="searchType" id="department">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchValue" placeholder="내용을 입력하세요.">
                    <input type="submit" value="검색">
                </div>
            </form>

            <div id="tableArea">
                <table class="table">
                    <thead>
                      <tr>
                        <td scope="col">번호</td>
                        <td scope="col">제목</td>
                        <td scope="col">작성자</td>
                        <td scope="col">작성일</td>
                        <td scope="col">조회수</td>
                      </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty map.voList}">
                            <tr class="searchNoResult">
                                <td colspan="6">조회된 결과가 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${map.voList}" var="voList">
                            <c:if test="${!empty map.voList}">
                                <tr onclick="detail(event);">
                                    <td scope="col" class="noticeNo">${voList.no}</td>
                                    <td scope="col">${voList.title}</td>
                                    <td scope="col">관리자</td>
                                    <td scope="col">${voList.enrollDate}</td>
                                    <td scope="col">${voList.hit}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                  </table>
            </div>

        </div>
        
        <div id="page">
            <c:if test="${map.pv.currentPage > 1}">
                <a href="${root}/notice/list?page=${map.pv.currentPage - 1}">
                    <img src="${root}/resources/img/icon/png/left.png" alt="왼쪽화살표">
                </a>
            </c:if>
            
            <c:forEach begin="${map.pv.startPage}" end="${map.pv.endPage}" var="i">
                
                <c:choose>
                    <c:when test="${i == map.pv.currentPage}">
                        <button class="active">${i}</button>
                    </c:when>
                    <c:otherwise>
                        <a href="${root}/notice/list?page=${i}">
                            <button class="nomalBtn">${i}</button>
                        </a>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
            
            <c:if test="${map.pv.currentPage < map.pv.maxPage}">
                <a href="${root}/notice/list?page=${map.pv.currentPage + 1}">
                    <img src="${root}/resources/img/icon/png/right.png" alt="오른쪽화살표">
                </a>
            </c:if>
        </div>
    </div>

</body>
</html>
<script>

    //게시글 상세조회
    function detail(event){
        const clickedTd = event.target;
        const tr = clickedTd.parentElement;

        const noticeNo = tr.querySelector(".noticeNo");

        const no = noticeNo.innerHTML;

        location.href = "${root}/notice/detail?no=" + no;
    }

    //게시글 검색
    const searchValueTag = document.querySelector("input[name=searchValue]");
    searchValueTag.value = '${map.searchMap.searchValue}';

    const searchTypeArr = document.querySelectorAll("select[name=searchType] > option");
    const x = '${map.searchMap.searchType}';
    if(x == 'title'){
        searchTypeArr[0].selected = true;
    }else if(x == 'content'){
        searchTypeArr[1].selected = true;
    }

    
</script>