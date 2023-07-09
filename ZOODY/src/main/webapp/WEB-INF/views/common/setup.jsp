<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<!-- JSTL 태그 라이브러리  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- context root 세팅 -->
<c:set var="root" value="${pageContext.request.contextPath}" />


<!-- css 기본값 -->
<link rel="stylesheet" href="${root}/static/css/common/setup.css">