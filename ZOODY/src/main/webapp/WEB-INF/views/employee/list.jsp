<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/employee/list.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<h1>${voList}</h1>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <div id="enroll">
            <a>인사목록</a>
        </div>

        <div id="back">
        
            <form action="${root}/employee/list" method="get">
                <div id="firstDiv">
                    <a>전체직원 3명</a>
                    <select name="searchType" id="department">
                        <option value="">부서</option>
                        <option value="">이름</option>
                        <option value="">사번</option>
                        <option value="">이메일</option>
                    </select>
                    <input type="text" name="searchValue" placeholder="내용을 입력하세요.">
                    <input type="submit" value="검색">
                </div>
            </form>

            <div id="newEmployee">
                <img src="${root}/resources/img/icon/png/employee.png" alt="직원아이콘">
                <a href="${root}/employee/enroll">인사등록</a>
            </div>
            <div>
                <table id="content">
                    <thead>
                        <tr>
                            <td>부서</td>
                            <td>사번</td>
                            <td>이름</td>
                            <td>직위</td>
                            <td>이메일</td>
                            <td>내선번호</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${voList}" var="vo">
                        	<tr>
	                            <td>${vo.departmentNo}</td>
	                            <td>${vo.id}</td>
	                            <td>${vo.name}</td>
	                            <td>${vo.rankNo}</td>
	                            <td>${vo.mail}</td>
	                            <td>${vo.officeNumber}</td>
                        	</tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
        </div>
        
        <div id="page">
            <a href=""><img src="${root}/resources/img/icon/png/left.png" alt="왼쪽화살표"></a>
            <a href="${root}/employee/list?page=1">1</a>
            <a href="${root}/employee/list?page=2">2</a>
            <a href="${root}/employee/list?page=3">3</a>
            <a href="${root}/employee/list?page=4">4</a>
            <a href="${root}/employee/list?page=5">5</a>
            <a href=""><img src="${root}/resources/img/icon/png/right.png" alt="오른쪽화살표"></a>
        </div>
    </div>

</body>
</html>
