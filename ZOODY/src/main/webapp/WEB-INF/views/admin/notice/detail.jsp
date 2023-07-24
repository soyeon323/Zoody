<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/admin/notice/detail.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/admin/longside.jsp" %>
    <c:if test="${vo.rightclickYn == 'N'}">
        <script>
            function handleContextMenu(event) {
                event.preventDefault();
    
                alert("우클릭을 사용할 수 없습니다.");
            }
            document.addEventListener('contextmenu', handleContextMenu);
        </script>
    </c:if>
    
    <div id="wrap">

        <div id="notice">
            <a>공지사항</a>
        </div>

        <div id="topArea">
            <div>
                <a>▶</a>
                <a>게시글 주소 : </a>
                <a>127.0.0.1:8888/zoody/admin/notice/detail?no=${vo.no}</a>
            </div>
            <div>
                <a>▶</a>
                <a>게시글 공개 설정 : </a>
                <c:if test="${vo.boardLimit == 0}">
                    <a>전체공개</a>
                </c:if>
                <c:if test="${vo.boardLimit == 1}">
                    <a>관리자공개</a>
                </c:if>
                <c:if test="${vo.boardLimit == 2}">
                    <a>비공개</a>
                </c:if>
            </div>
        </div>

        <div id="iconArea">
            <div>
                <img src="${root}/resources/img/icon/png/newPencil.png" alt="글쓰기아이콘">
                <a href="${root}/admin/notice/write">새글쓰기</a>
            </div>
            <div>
                <img src="${root}/resources/img/icon/png/copy.png" alt="복사아이콘">
                <button onclick="noticeCopy('${vo.no}');">복사</ㅍ>
            </div>
            <div>
                <img src="${root}/resources/img/icon/png/delete.png" alt="삭제아이콘">
                <button onclick="noticeDelete('${vo.no}');">삭제</button>
            </div>
            <div>
                <img src="${root}/resources/img/icon/png/edit.png" alt="수정아이콘">
                <button onclick="noticeEdit('${vo.no}');">수정</button>
            </div>
        </div>

        <div id="contentArea">
            <div id="title">
                <div>${vo.title}&nbsp&nbsp [1]</div>
            </div>
            <div id="info">
                <div>관리자</div>
                <div>${vo.enrollDate}</div>
            </div>
            <div id="content">
                <div>
                    <a>${vo.content}</a>
                    <c:if test="${!empty vo.changeName}">
                        <div id="imageArea"><img src="${root}/resources/img/notice/${vo.changeName}" alt="" width="200px" height="200px"></div>
                    </c:if>
                </div>
                <div id="contentDetail">
                    <div>
                        <img src="${root}/resources/img/icon/png/comment.png" alt="댓글아이콘">
                        <a>댓글 1개</a>
                    </div>
                    <div>|</div>
                    <div>조회&nbsp ${vo.hit}</div>
                </div>
            </div>
            <div id="comment">
                <c:if test="${vo.commentYn == 'N'}">
                    <div id="noComment">
                        <div><a>댓글기능이 비활성화 되었습니다.</a></div>
                    </div>
                </c:if>
                <c:if test="${vo.commentYn == 'Y'}">
                    <div id="commentArea">
                        <img src="${root}/resources/img/icon/png/profileImg.png" alt="프로필사진">
                       
                        <form action="${root}/admin/notice/detail" method="post">
                            <div id="commentZone">
                                <div><input type="text" placeholder="댓글을 남겨보세요."></div>
                                <div><input type="submit" value="등록"></div>
                            </div>
                        </form>
                    </div>
                    <div id="commentOk">
                        <div><img src="${root}/resources/img/icon/png/profileImg.png" alt="프로필사진"></div>
                        <div><a>@김영희 대리</a></div>
                        <div><a>확인해주세요</a></div>
                        <div><a>23-07-01</a></div>
                        <div><a href="">삭제</a></div>
                    </div>
                </c:if>
            </div>
        </div>

        <div id="btnArea">
            <div id="btn02">
                <button onclick="goHome();">목록</button>
            </div>
        </div>
    </div>

</body>
</html>
<script>
    function goHome(){
        location.href = '${root}/admin/notice/list';
    }

    //게시글 복사
    function noticeCopy(no) {
        const result = confirm("해당 게시글을 복사하시겠습니까?");

        if(!result){
            return;
        }
       
        $.ajax({
            url : '${root}/admin/notice/copy',
            type : 'POST',
            traditional: true,
            data : {
                no: no
            },
            success : function(){
                alert("게시글이 복사되었습니다. 목록에서 확인하세요.");
            },
            error : function(err){
                alert("게시글이 복사되었습니다. 목록에서 확인하세요.");
            }
        })
    };

    //게시글 삭제
    function noticeDelete(no) {
        const result = confirm("선택한 게시글을 삭제하시겠습니까?");

        if(!result){
            return;
        }

        $.ajax({
            url : '${root}/admin/notice/delete',
            type : 'POST',
            traditional: true,
            data : {
              no : no  
            },
            success : function(){
                alert("게시글이 삭제되었습니다.");
                location.href = '${root}/admin/notice/list'
            },
            error : function(err){
                alert("게시글이 삭제되었습니다.");
                location.href = '${root}/admin/notice/list'
            }
        })
    };

    //게시글 수정
    function noticeEdit(no){
        $.ajax({
            url : '${root}/admin/notice/edit',
            type : 'GET',
            data : {
              no : no  
            },
            success : function(){
                location.href = '${root}/admin/notice/edit?no=' + no;
            },
            error : function(err){
                location.href = '${root}/admin/notice/edit?no=' + no;
            }
        })
    };
</script>
