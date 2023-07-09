<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL 태그 라이브러리  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<!-- context root set -->
<c:set var="root" value="${pageContext.request.contextPath}" />


<!-- css 기본 세팅 -->
<link rel="stylesheet" href="${root}/resources/css/common/setup.css">

