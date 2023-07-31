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
                <ul>문서
                    <li>전사</li>
                    <li>부서</li>
                </ul>

            </div>
    
            <div class="document-body">b</div>

        </div>


    </div>
	
</body>
</html>