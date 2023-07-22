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
                <div><a>전체게시글 ${map.noticeListCnt}건</a></div>
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

            <div id="iconArea">
                <div>
                    <img src="${root}/resources/img/icon/png/newPencil.png" alt="새글작성">
                    <a href="${root}/admin/notice/write">새글쓰기</a>
                </div>
                <div>
                    <img src="${root}/resources/img/icon/png/copy.png" alt="복제">
                    <button onclick="noticeCopy();">복제</button>
                </div>
                <div>
                    <img src="${root}/resources/img/icon/png/delete.png" alt="삭제">
                    <a href="">삭제</a>
                </div>
                <div>
                    <img src="${root}/resources/img/icon/png/edit.png" alt="수정">
                    <a href="">수정</a>
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
                        <c:forEach items="${map.voList}" var="voList">
	                        <tr>
	                            <td scope="col">
	                                <input type="checkbox" name="adminNotice">
	                            </td>
	                            <td scope="col" id="employeeNo">${voList.no}</td>
	                            <td scope="col">${voList.title}</td>
	                            <td scope="col">admin</td>
	                            <td scope="col">${voList.enrollDate}</td>
	                            <td scope="col">${voList.hit}</td>
	                        </tr>
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
        const result = confirm("선택한 게시글을 복제하시겠습니까?");

        if(!result){
            return;
        }

        // 체크된 체크박스들을 가져옵니다.
        var checkedBoxes = document.querySelectorAll('input[name="adminNotice"]:checked');

        if (checkedBoxes.length === 0) {
            alert("복제할 항목을 선택해주세요.");
            return;
        }

        // 체크된 체크박스들의 '번호' 열 값을 저장할 배열을 생성합니다.
        var no = [];

        // 체크된 체크박스들을 순회하며 '번호' 열 값을 배열에 추가합니다.
        for (var i = 0; i < checkedBoxes.length; i++) {
            var tr = checkedBoxes[i].closest('tr');
            var employeeNoCell = tr.querySelector('#employeeNo');
            var employeeNoValue = employeeNoCell.innerText;
            no.push(employeeNoValue);
        }

        $.ajax({
            url : '${root}/admin/notice/list',
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
    }
</script>