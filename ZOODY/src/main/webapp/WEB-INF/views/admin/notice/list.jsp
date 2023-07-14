<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/admin/notice/list.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/admin/tempside.jsp" %>

    <div id="wrap">

        <div id="notice">
            <a>공지사항</a>
        </div>

        <div id="back">

            <div id="topArea">
                <div><a>전체게시글 3건</a></div>
                <div>
                    <select name="searchType" id="department">
                        <option value="">제목</option>
                        <option value="">내용</option>
                        <option value="">작성자</option>
                    </select>
                    <input type="text" name="searchValue" placeholder="내용을 입력하세요.">
                    <input type="submit" value="검색">
                </div>
            </div>

            <div id="alertArea">
                <div>
                    <div><img src="${root}/resources/img/alert.png" alt="확성기이미지"></div>
                    <div>공지사항 임시 제목입니다111</div>
                </div>
                <div>
                    <div><img src="${root}/resources/img/alert.png" alt="확성기이미지"></div>
                    <div>공지사항 임시 제목입니다222</div>
                </div>
            </div>

            <div id="iconArea">
                <div>
                    <img src="${root}/resources/img/newPencil.png" alt="새글작성">
                    <a href="">새글쓰기</a>
                </div>
                <div>
                    <img src="${root}/resources/img/copy.png" alt="복제">
                    <a href="">복제</a>
                </div>
                <div>
                    <img src="${root}/resources/img/delete.png" alt="삭제">
                    <a href="">삭제</a>
                </div>
                <div>
                    <img src="${root}/resources/img/edit.png" alt="수정">
                    <a href="">수정</a>
                </div>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15" fill="none">
                        <g clip-path="url(#clip0_401_9570)">
                        <path d="M1.07313 9.1875L3.65625 15H5.19125C5.47764 14.9998 5.75946 14.9282 6.01113 14.7915C6.2628 14.6548 6.47636 14.4575 6.63243 14.2173C6.7885 13.9772 6.88214 13.7019 6.90486 13.4164C6.92757 13.1309 6.87864 12.8443 6.7625 12.5825L5.33687 9.375H6.875C7.7035 9.37599 8.49778 9.70555 9.08361 10.2914C9.66945 10.8772 9.99901 11.6715 10 12.5H11.25V0H10C9.99901 0.828497 9.66945 1.62278 9.08361 2.20861C8.49778 2.79445 7.7035 3.12401 6.875 3.125H1.875C1.37772 3.125 0.900805 3.32254 0.549175 3.67417C0.197544 4.02581 0 4.50272 0 5L0 7.5C0.00139437 7.85388 0.102908 8.20014 0.292807 8.49876C0.482705 8.79738 0.753235 9.03616 1.07313 9.1875ZM5.62 13.0894C5.65189 13.1609 5.6654 13.2392 5.6593 13.3172C5.6532 13.3952 5.62769 13.4705 5.58508 13.5362C5.54247 13.6018 5.48412 13.6558 5.41533 13.6931C5.34655 13.7305 5.26952 13.75 5.19125 13.75H4.46875L2.52437 9.375H3.96875L5.62 13.0894ZM1.25 5C1.25 4.83424 1.31585 4.67527 1.43306 4.55806C1.55027 4.44085 1.70924 4.375 1.875 4.375H6.875C7.45763 4.37514 8.03438 4.25845 8.57113 4.03183C9.10789 3.80521 9.59375 3.47327 10 3.05562V9.44438C9.59375 9.02673 9.10789 8.69479 8.57113 8.46817C8.03438 8.24155 7.45763 8.12486 6.875 8.125H1.875C1.70924 8.125 1.55027 8.05915 1.43306 7.94194C1.31585 7.82473 1.25 7.66576 1.25 7.5V5ZM13.9331 9.81687L12.5031 8.38688L13.3869 7.50313L14.8169 8.93313L13.9331 9.81687ZM13.4106 4.97312L12.5269 4.08938L13.9331 2.68313L14.8169 3.56687L13.4106 4.97312ZM13.125 5.625H15V6.875H13.125V5.625Z" fill="#374957"/>
                        </g>
                        <defs>
                        <clipPath id="clip0_401_9570">
                        <rect width="15" height="15" fill="white"/>
                        </clipPath>
                        </defs>
                    </svg>
                    <a href="">공지로 등록</a>
                </div>
            </div>

            <div id="tableArea">
                <table class="table">
                    <thead>
                      <tr>
                        <td scope="col">
                            <input type="checkbox" name="adminNotice">
                        </td>
                        <td scope="col">번호</td>
                        <td scope="col">제목</td>
                        <td scope="col">작성자</td>
                        <td scope="col">작성일</td>
                        <td scope="col">조회수</td>
                      </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td scope="col">
                                <input type="checkbox" name="adminNotice">
                            </td>
                            <td scope="col">1</td>
                            <td scope="col">공지사항제목111</td>
                            <td scope="col">admin</td>
                            <td scope="col">2023-07-01</td>
                            <td scope="col">1</td>
                        </tr>
                        <tr>
                            <td scope="col">
                                <input type="checkbox" name="adminNotice">
                            </td>
                            <td scope="col">1</td>
                            <td scope="col">공지사항제목111</td>
                            <td scope="col">admin</td>
                            <td scope="col">2023-07-01</td>
                            <td scope="col">1</td>
                        </tr>
                        <tr>
                            <td scope="col">
                                <input type="checkbox" name="adminNotice">
                            </td>
                            <td scope="col">1</td>
                            <td scope="col">공지사항제목111</td>
                            <td scope="col">admin</td>
                            <td scope="col">2023-07-01</td>
                            <td scope="col">1</td>
                        </tr>
                        <tr>
                            <td scope="col">
                                <input type="checkbox" name="adminNotice">
                            </td>
                            <td scope="col">1</td>
                            <td scope="col">공지사항제목111</td>
                            <td scope="col">admin</td>
                            <td scope="col">2023-07-01</td>
                            <td scope="col">1</td>
                        </tr>
                        <tr>
                            <td scope="col">
                                <input type="checkbox" name="adminNotice">
                            </td>
                            <td scope="col">1</td>
                            <td scope="col">공지사항제목111</td>
                            <td scope="col">admin</td>
                            <td scope="col">2023-07-01</td>
                            <td scope="col">1</td>
                        </tr>
                    </tbody>
                  </table>
            </div>
        </div>
        
        <div id="page">
            <a href=""><img src="${root}/resources/img/left.png" alt="왼쪽화살표"></a>
            <a href="">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href=""><img src="${root}/resources/img/right.png" alt="오른쪽화살표"></a>
        </div>
    </div>

</body>
</html>
