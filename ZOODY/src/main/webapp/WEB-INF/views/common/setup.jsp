<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL 태그 라이브러리  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- context root set -->
<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- css 기본 세팅 -->
<link rel="stylesheet" href="${root}/resources/css/common/setup.css">

<!-- summernote 세팅 css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- js 기본설정 -->
<script>
    // root 설정 || 사용 예제  url : root + "/api/weather"
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    var root = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
</script>