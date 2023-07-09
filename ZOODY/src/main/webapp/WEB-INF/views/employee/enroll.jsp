<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #wrap{
        width: 1663px;
        height: 93vh;
        border: 1px solid black;
        position: absolute;
        top: 65px;
        left: 255px;
    }
    
</style>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <div id="wrap">

      <h3>인사등록</h3>

    </div>

</body>
</html>