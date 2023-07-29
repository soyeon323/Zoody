<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/suggestion/list.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>
    
    <div id="wrap">

        <div id="suggestion">
            <a>건의사항</a>
        </div>

        <div id="back">
            <form action="${root}/suggestion/list" method="GET">
                <div id="firstDiv">
                    <a>전체게시글 ${map.suggestionListCnt}건</a>
                    <select name="searchType" id="department">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="name">작성자</option>
                    </select>
                    <input type="text" name="searchValue" placeholder="내용을 입력하세요.">
                    <input type="submit" value="검색">
                </div>
            </form>
            <div></div>
            <div id="newWrite">
                <img src="${root}/resources/img/icon/png/pencil.png" alt="글쓰기아이콘">
                <a href="${root}/suggestion/write">새글쓰기</a>
            </div>
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
                                <c:if test="${voList.boardLimit == '2'}">
                                    <td scope="col" class="suggestionNo">${voList.no}</td>
                                    <td scope="col">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="16" viewBox="0 0 14 16" fill="none">
                                            <path d="M11.6668 5.33333V4.66667C11.6668 3.42899 11.1752 2.242 10.3 1.36684C9.42482 0.491665 8.23784 0 7.00016 0C5.76249 0 4.5755 0.491665 3.70033 1.36684C2.82516 2.242 2.3335 3.42899 2.3335 4.66667V5.33333H0.333496V14C0.333496 14.5304 0.54421 15.0391 0.919283 15.4142C1.29436 15.7893 1.80306 16 2.3335 16H11.6668C12.1973 16 12.706 15.7893 13.081 15.4142C13.4561 15.0391 13.6668 14.5304 13.6668 14V5.33333H11.6668ZM3.66683 4.66667C3.66683 3.78261 4.01802 2.93477 4.64314 2.30964C5.26826 1.68452 6.11611 1.33333 7.00016 1.33333C7.88422 1.33333 8.73206 1.68452 9.35719 2.30964C9.98231 2.93477 10.3335 3.78261 10.3335 4.66667V5.33333H3.66683V4.66667ZM12.3335 14C12.3335 14.1768 12.2633 14.3464 12.1382 14.4714C12.0132 14.5964 11.8436 14.6667 11.6668 14.6667H2.3335C2.15669 14.6667 1.98712 14.5964 1.86209 14.4714C1.73707 14.3464 1.66683 14.1768 1.66683 14V6.66667H12.3335V14Z" fill="#374957"/>
                                            <path d="M7.66684 9.33301H6.3335V11.9997H7.66684V9.33301Z" fill="#374957"/>
                                        </svg>
                                        비밀글은 본인 및 관리자만 열람할 수 있습니다.
                                    </td>
                                    <td scope="col">${voList.name}</td>
                                    <td scope="col">${voList.enrollDate}</td>
                                    <td scope="col">${voList.hit}</td>
                                </c:if>
                                <c:if test="${voList.boardLimit == '1'}">
                                    <td scope="col" class="suggestionNo">${voList.no}</td>
                                    <td scope="col">${voList.title}</td>
                                    <td scope="col">${voList.name}</td>
                                    <td scope="col">${voList.enrollDate}</td>
                                    <td scope="col">${voList.hit}</td>
                                </c:if>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                  </table>
            </div>
            
        </div>
        
        <div id="page">
            <a href=""><img src="${root}/resources/img/icon/png/left.png" alt="왼쪽화살표"></a>
            <a href="">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href=""><img src="${root}/resources/img/icon/png/right.png" alt="오른쪽화살표"></a>
        </div>
    </div>

</body>
</html>
<script>
    //게시글 검색
    const searchValueTag = document.querySelector("input[name=searchValue]");
    searchValueTag.value = '${map.searchMap.searchValue}';

    const searchTypeArr = document.querySelectorAll("select[name=searchType] > option");
    const x = '${map.searchMap.searchType}';
    if(x == 'title'){
        searchTypeArr[0].selected = true;
    }else if(x == 'content'){
        searchTypeArr[1].selected = true;
    }else if(x == 'name'){
        searchTypeArr[2].selected = true;
    }

    //게시글 상세조회
    function detail(event){
        const clickedTd = event.target;
        const tr = clickedTd.parentElement;

        const noticeNo = tr.querySelector(".suggestionNo");

        const no = noticeNo.innerHTML;

        location.href = "${root}/suggestion/detail?no=" + no;
    }

</script>