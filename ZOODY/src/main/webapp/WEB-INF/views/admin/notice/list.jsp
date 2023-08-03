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

            <form action="${root}/admin/notice/list" method="get">
            <div id="topArea">
                <div><a>전체게시글 ${map.noticeListCnt}건</a></div>
                <div>
                        <select name="searchType" id="department">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" name="searchValue" placeholder="내용을 입력하세요.">
                        <input type="submit" value="검색">
                    </div>
                </div>
            </form>

            <div id="iconArea">
                <div>
                    <img src="${root}/resources/img/icon/png/newPencil.png" alt="새글작성">
                    <a href="${root}/admin/notice/write">새글쓰기</a>
                </div>
                <div>
                    <img src="${root}/resources/img/icon/png/copy.png" alt="복사">
                    <button onclick="noticeCopy();">복사</button>
                </div>
                <div>
                    <img src="${root}/resources/img/icon/png/delete.png" alt="삭제">
                    <button onclick="noticeDelete();">삭제</button>
                </div>
                <div>
                    <img src="${root}/resources/img/icon/png/edit.png" alt="수정">
                    <button onclick="noticeEdit();">수정</button>
                </div>
            </div>

            <div id="tableArea">
                <table class="table">
                    <thead>
                    <tr>
                        <td scope="col">
                            <input type="checkbox" name="adminNoticeAll" id="checkAll">
                        </td>
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
                                    <td scope="col">
                                        <input type="checkbox" name="adminNotice">
                                    </td>
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
                <a href="${root}/admin/notice/list?page=${map.pv.currentPage - 1}">
                    <img src="${root}/resources/img/icon/png/left.png" alt="왼쪽화살표">
                </a>
            </c:if>
            
            <c:forEach begin="${map.pv.startPage}" end="${map.pv.endPage}" var="i">
                
                <c:choose>
                    <c:when test="${i == map.pv.currentPage}">
                        <button class="active">${i}</button>
                    </c:when>
                    <c:otherwise>
                        <a href="${root}/admin/notice/list?page=${i}">
                            <button class="nomalBtn">${i}</button>
                        </a>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
            
            <c:if test="${map.pv.currentPage < map.pv.maxPage}">
                <a href="${root}/admin/notice/list?page=${map.pv.currentPage + 1}">
                    <img src="${root}/resources/img/icon/png/right.png" alt="오른쪽화살표">
                </a>
            </c:if>
        </div>

    </div>
    <c:if test="${loginMember.id != 'admin'}">
        <script>
            alert("관리자 및 운영자만 접근 가능합니다.");
            location.href = '${root}/home';
        </script>
    </c:if>
</body>
</html>
<script>
    //체크박스 전체체크
    const allCheckbox = document.querySelector('#checkAll');
    const tbodyCheckbox = document.querySelectorAll('tbody input[name="adminNotice"]');

    allCheckbox.addEventListener('change', function () {
        const isChecked = allCheckbox.checked;
        tbodyCheckbox.forEach((checkbox) => {
            checkbox.checked = isChecked;
        });
    });
    
    //게시글 복사
    function noticeCopy() {
        var checkedBoxes = document.querySelectorAll('input[name="adminNotice"]:checked');

        if (checkedBoxes.length === 0) {
            alert("복사할 항목을 선택해주세요.");
            return;
        }

        const result = confirm("선택한 게시글을 복사하시겠습니까?");

        if(!result){
            return;
        }


        var no = [];

        for (var i = 0; i < checkedBoxes.length; i++) {
            var tr = checkedBoxes[i].closest('tr');
            var noticeNo = tr.querySelector('.noticeNo');
            var noticeNoValue = noticeNo.innerText;
            no.push(noticeNoValue);
        }

        $.ajax({
            url : '${root}/admin/notice/copy',
            type : 'POST',
            traditional: true,
            data : {
                no: no
            },
            success : function(){
                location.reload();
            },
            error : function(err){
                location.reload();
            }
        })
    };

    //게시글 삭제
    function noticeDelete() {
        var checkedBoxes = document.querySelectorAll('input[name="adminNotice"]:checked');

        if (checkedBoxes.length === 0) {
            alert("삭제할 항목을 선택해주세요.");
            return;
        }

        const result = confirm("선택한 게시글을 삭제하시겠습니까?");

        if(!result){
            return;
        }

        var no = [];

        for (var i = 0; i < checkedBoxes.length; i++) {
            var tr = checkedBoxes[i].closest('tr');
            var noticeNo = tr.querySelector('.noticeNo');
            var noticeNoValue = noticeNo.innerText;
            no.push(noticeNoValue);
        }

        $.ajax({
            url : '${root}/admin/notice/delete',
            type : 'POST',
            traditional: true,
            data : {
              no : no  
            },
            success : function(){
                location.reload();
            },
            error : function(err){
                location.reload();
            }
        })
    };

    //게시글 수정
    function noticeEdit(){
        var checkedBox = document.querySelectorAll('input[name="adminNotice"]:checked');
        
        if (checkedBox.length > 1) {
            alert("수정할 항목을 하나만 선택해주세요.");
            return;
        }
        if (checkedBox.length === 0) {
            alert("수정할 항목을 선택해주세요.");
            return;
        }
        var tr = checkedBox[0].closest('tr');
        var noticeNo = tr.querySelector('.noticeNo');
        var no = noticeNo.innerText;

        $.ajax({
            url : '${root}/admin/notice/edit',
            type : 'GET',
            data : {
              no : no  
            },
            success : function(){
                location.href = '${root}/admin/notice/edit?no=' + no;
            },
            error : function(err){
                location.href = '${root}/admin/notice/edit?no=' + no;
            }
        })
    };

    //게시글 상세조회
    function detail(event){
        const clickedTd = event.target;
        const tr = clickedTd.parentElement;

        const noticeNo = tr.querySelector(".noticeNo");

        const no = noticeNo.innerHTML;

        location.href = "${root}/admin/notice/detail?no=" + no;
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