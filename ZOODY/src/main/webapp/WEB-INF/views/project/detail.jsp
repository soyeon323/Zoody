<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/project/detail.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/project/side.jsp" %>

    <div id="wrap">

        <div id="projectName">
            <a>판다 개체보존 프로젝트</a>
        </div>

        <div id="back">
            <div>
                <div id="todo">
                    <div>
                        <a>Todo+</a>
                    </div>
                    <div>
                        <div id="todoList">
                            <div>
                                <input type="checkbox" name="todoList">
                                <a>판다 교배시키기</a>
                                <h3>판다 교배시키기</h3>
                                <button>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                        <g clip-path="url(#clip0_458_8737)">
                                          <path d="M18.3346 3.33333H14.168V1.66667C14.168 1.22464 13.9924 0.800716 13.6798 0.488155C13.3673 0.175595 12.9433 0 12.5013 0L7.5013 0C7.05927 0 6.63535 0.175595 6.32279 0.488155C6.01023 0.800716 5.83464 1.22464 5.83464 1.66667V3.33333H1.66797V5H3.33464V17.5C3.33464 18.163 3.59803 18.7989 4.06687 19.2678C4.53571 19.7366 5.17159 20 5.83464 20H14.168C14.831 20 15.4669 19.7366 15.9357 19.2678C16.4046 18.7989 16.668 18.163 16.668 17.5V5H18.3346V3.33333ZM7.5013 1.66667H12.5013V3.33333H7.5013V1.66667ZM15.0013 17.5C15.0013 17.721 14.9135 17.933 14.7572 18.0893C14.6009 18.2455 14.389 18.3333 14.168 18.3333H5.83464C5.61362 18.3333 5.40166 18.2455 5.24538 18.0893C5.0891 17.933 5.0013 17.721 5.0013 17.5V5H15.0013V17.5Z" fill="#888A8C"/>
                                          <path d="M9.16666 8.33203H7.5V14.9987H9.16666V8.33203Z" fill="#888A8C"/>
                                          <path d="M12.5026 8.33203H10.8359V14.9987H12.5026V8.33203Z" fill="#888A8C"/>
                                        </g>
                                        <defs>
                                          <clipPath id="clip0_458_8737">
                                            <rect width="20" height="20" fill="white"/>
                                          </clipPath>
                                        </defs>
                                    </svg>
                                </button>
                            </div>
                            <div>
                                <input type="checkbox" name="todoList">
                            </div>
                            <div>
                                <input type="checkbox" name="todoList">
                            </div>
                            <div>
                                <input type="checkbox" name="todoList">
                            </div>
                            <div>
                                <input type="checkbox" name="todoList">
                            </div>
                            <div></div>
                        </div>
                        <div id="prjProgress">
                            <div>프로젝트 진행도</div>
                            <div></div>
                        </div>
                    </div>
                </div>
                <div></div>
            </div>
            <div></div>
            <div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>

</body>
</html>
<script>


</script>