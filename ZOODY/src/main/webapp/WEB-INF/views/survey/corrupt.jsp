<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<body style="overflow-x: hidden">
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <form method="get">
            여러분의 나이대를 골라보세요.
            <input type="radio" name="ages"  value="10">
            <label for="teen">10대</label>
            <input type="radio" name="ages" value="20">
            <label for="twenty">20대</label>
            <input type="radio" name="ages"  value="30">
            <label for="thirty">30대</label>
            <input type="radio" name="ages"  value="40">
            <label for="forty">40대 이상</label>
            <input type="submit">
        </form>
      
    </div>


    <script>
   
    </script>

</body>
</html>