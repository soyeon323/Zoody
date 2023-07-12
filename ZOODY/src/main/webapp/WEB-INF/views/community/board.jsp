<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/community/board.css">
</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/side.jsp" %>
        <%@ include file="/WEB-INF/views/community/communitySide.jsp" %>

        <div id="grid-wrap">

            <div class="boder-grid-header">
                자유 게시판
            </div>
            
            <div class="boder-grid-body">
                
                <div class="boder-grid-body-top">t

                </div>
                <div class="boder-grid-body-meddle">m

                </div>
                <div class="boder-grid-body-bottom">b
                    
                </div>

            </div>
            

            <div class="boder-grid-footer">
                아래
            </div>

        </div>
    </div>

</body>
