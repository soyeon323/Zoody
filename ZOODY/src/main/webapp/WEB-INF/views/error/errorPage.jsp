<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404error</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
    *{
        font-family: 'Poppins', sans-serif;
        /* text-align: center; */
    }

    /* .img-error{
        width: 30%;
        margin-top: 50px;
    } */

    .clearfix:before,
    .clearfix:after {
        display: table;

        content: ' ';
    }
    .clearfix:after {
        clear: both;
    }
    body {
        background: #f0f0f0 !important;
    }
    .page-404 .outer {
        position: absolute;
        top: 0;

        display: table;

        width: 100%;
        height: 100%;
    }
    .page-404 .outer .middle {
        display: table-cell;

        vertical-align: middle;
    }
    .page-404 .outer .middle .inner {
        width: 300px;
        margin-right: auto;
        margin-left: auto;
    }
    .page-404 .outer .middle .inner .inner-circle {
        height: 300px;

        border-radius: 50%;
        background-color: #ffffff;
    }
    .page-404 .outer .middle .inner .inner-circle:hover i {
        color: #39bbdb!important;
        background-color: #f5f5f5;
        box-shadow: 0 0 0 15px #39bbdb;
    }
    .page-404 .outer .middle .inner .inner-circle:hover span {
        color: #39bbdb;
    }
    .page-404 .outer .middle .inner .inner-circle i {
        font-size: 5em;
        line-height: 1em;

        float: right;

        width: 1.6em;
        height: 1.6em;
        margin-top: -.7em;
        margin-right: -.5em;
        padding: 20px;

        -webkit-transition: all .4s;
                transition: all .4s;
        text-align: center;

        color: #f5f5f5!important;
        border-radius: 50%;
        background-color: #39bbdb;
        box-shadow: 0 0 0 15px #f0f0f0;
    }
    .page-404 .outer .middle .inner .inner-circle span {
        font-size: 110px;
        font-weight: 700;
        line-height: 1.2em;

        display: block;

        -webkit-transition: all .4s;
                transition: all .4s;
        text-align: center;

        color: #e0e0e0;
    }
    .page-404 .outer .middle .inner .inner-status {
        font-size: 20px;

        display: block;

        margin-top: 20px;
        margin-bottom: 5px;

        text-align: center;

        color: #39bbdb;
    }
    .page-404 .outer .middle .inner .inner-detail {
        line-height: 1.4em;

        display: block;

        margin-bottom: 10px;

        text-align: center;

        color: #999999;
    }
    
</style>
</head>
<body>

    <div class="page-404">
        <div class="outer">
            <div class="middle">
                <div class="inner">
                    <!-- <div class="inner-circle"><i class="fa fa-cogs"></i><span>500</span></div> -->
                    <div class="inner-circle"><i><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 64 512"><style>svg{fill:#ffffff}</style><path d="M64 64c0-17.7-14.3-32-32-32S0 46.3 0 64V320c0 17.7 14.3 32 32 32s32-14.3 32-32V64zM32 480a40 40 0 1 0 0-80 40 40 0 1 0 0 80z"/></svg></i><span>Error</span></div>
                    <span class="inner-status" style="font-weight: 700;">오류 발생</span>
                    <!-- <span class="inner-detail">오류가 발생했습니다.</span> -->
                    <a href="${root}/home" class="btn btn-info mtl" style="margin-bottom: 10px;margin-left: 100px;margin-top: 25px; color: #ffffff;"><i class="fa fa-home"></i>&nbsp;
                        돌아가기
                    </a> 
                </div>
            </div>
        </div>
    </div>

</body>
</html>