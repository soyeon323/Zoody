<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/project/progress.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <div id="progress">
            <a>진행중인 프로젝트</a>
        </div>

        <div id="contentArea">
            <div id="content-1">
                <div>
                    <a>판다 개체보존 프로젝트</a>
                </div>
                <div>
                    <a>김철수님 외 3명</a>
                </div>
                <div>
                    <a>2023-07-07 ~ 2023-07-20</a>
                </div>
                <div>
                    <a href="">더보기 ></a>
                </div>
            </div>
            <div id="content-2">
                <div>
                    <a>판다 개체보존 프로젝트</a>
                </div>
                <div>
                    <a>김철수님 외 3명</a>
                </div>
                <div>
                    <a>2023-07-07 ~ 2023-07-20</a>
                </div>
                <div>
                    <a href="">더보기 ></a>
                </div>
            </div>
            <div id="content-3">
                <div>
                    <a>판다 개체보존 프로젝트</a>
                </div>
                <div>
                    <a>김철수님 외 3명</a>
                </div>
                <div>
                    <a>2023-07-07 ~ 2023-07-20</a>
                </div>
                <div>
                    <a href="">더보기 ></a>
                </div>
            </div>
            <div id="content-4">
                <div>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 50 50" fill="none">
                            <g clip-path="url(#clip0_424_8416)">
                            <path d="M50 22.9167H27.0833V0H22.9167V22.9167H0V27.0833H22.9167V50H27.0833V27.0833H50V22.9167Z" fill="#4876EF" fill-opacity="0.67"/>
                            </g>
                            <defs>
                            <clipPath id="clip0_424_8416">
                            <rect width="50" height="50" rx="20" fill="white"/>
                            </clipPath>
                            </defs>
                        </svg>
                    </button>
                </div>
                <div>
                    <a href="">새로운 프로젝트 생성하기</a>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">프로젝트 생성</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">프로젝트생성</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
            </div>
        </div>

    </div>

</body>