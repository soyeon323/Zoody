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
                <a>전체공개</a>
            </div>
        </div>

        <div id="iconArea">
            <div>
                <img src="${root}/resources/img/icon/png/newPencil.png" alt="글쓰기아이콘">
                <a href="${root}/admin/notice/write">새글쓰기</a>
            </div>
            <div>
                <img src="${root}/resources/img/icon/png/copy.png" alt="복사아이콘">
                <button onclick="noticeCopy('${vo.no}');">복사</button>
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
                <div>${vo.title}&nbsp&nbsp [${replyCnt}]</div>
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
                        <a>댓글 ${replyCnt}개</a>
                    </div>
                    <div>|</div>
                    <div>조회&nbsp ${vo.hit}</div>
                </div>
            </div>
            <div id="comment">
                <c:if test="${vo.commentYn == 'N'}">
                    <div id="noComment">
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="24" viewBox="0 0 20 24" fill="none">
                                <path d="M17 8V7C17 5.14348 16.2625 3.36301 14.9497 2.05025C13.637 0.737498 11.8565 0 10 0C8.14348 0 6.36301 0.737498 5.05025 2.05025C3.7375 3.36301 3 5.14348 3 7V8H0V21C0 21.7956 0.316071 22.5587 0.87868 23.1213C1.44129 23.6839 2.20435 24 3 24H17C17.7956 24 18.5587 23.6839 19.1213 23.1213C19.6839 22.5587 20 21.7956 20 21V8H17ZM5 7C5 5.67392 5.52678 4.40215 6.46447 3.46447C7.40215 2.52678 8.67392 2 10 2C11.3261 2 12.5979 2.52678 13.5355 3.46447C14.4732 4.40215 15 5.67392 15 7V8H5V7ZM18 21C18 21.2652 17.8946 21.5196 17.7071 21.7071C17.5196 21.8946 17.2652 22 17 22H3C2.73478 22 2.48043 21.8946 2.29289 21.7071C2.10536 21.5196 2 21.2652 2 21V10H18V21Z" fill="#374957"/>
                                <path d="M11 14H9V18H11V14Z" fill="#374957"/>
                            </svg>
                            <a>댓글기능이 비활성화 되었습니다.</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${vo.commentYn == 'Y'}">
                    <div id="commentArea">
                        <img src="${root}/resources/img/employee/${loginMember.profile}" alt="프로필사진">
                       
                        <form action="${root}/admin/notice/detail" method="POST">
                            <input type="hidden" value="${vo.no}" name="noticeNo">
                            <div id="commentZone">
                                <div><input type="text" placeholder="댓글을 남겨보세요." name="content"></div>
                                <div><input type="submit" value="등록"></div>
                            </div>
                        </form>
                    </div>
                    <div id="commentOk">
                        <c:forEach items="${voList}" var="voList">
                            <div><img src="${root}/resources/img/employee/${loginMember.profile}" alt="프로필사진" width="28px" height="28px"></div>
                            <div id="userName">
                                <a id="userNameLink">${loginMember.name}</a>
                                <a>&nbsp ${loginMember.rankName}</a>
                            </div>
                            <div id="reply"><a id="replyContent" class="new-reply">${voList.content}</a></div>
                            <div id="date"><a>${voList.enrollDate}</a></div>

                            <c:if test="${loginMember.no == voList.userNo}">
                                <div id="deleteArea"><button onclick="deleteReply('${voList.no}', '${voList.noticeNo}');">삭제</button></div>
                            </c:if>
                        </c:forEach>
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

    <c:if test="${loginMember.id != 'admin'}">
        <script>
            alert("관리자 및 운영자만 접근할 수 있습니다.");
            location.href = '${root}/home';
        </script>
    </c:if>
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

    //댓글 삭제
    function deleteReply(no, noticeNo){
        if(confirm("댓글을 삭제하시겠습니까?")){
            $.ajax({
                url : "${root}/admin/notice/replyDelete",
                type : "POST",
                data : {
                    no : no,
                    noticeNo : noticeNo
                },
                success : function(){
                    location.reload();
                },
                error : function(){
                    location.reload();
                }
            })
        }
        return;
    }

    //댓글 태그기능
    document.addEventListener('DOMContentLoaded', function () {
        var userNameLinks = document.querySelectorAll('#userNameLink');
        var inputField = document.querySelector('input[name="content"]');

        userNameLinks.forEach(function (userNameLink) {
            userNameLink.addEventListener('click', function () {
                inputField.value += '@' + userNameLink.innerHTML;
            });
        });
    });
    
    //댓글태그 기능달면 글씨 굵게
    document.addEventListener('DOMContentLoaded', function () {
        highlightMentions();

        function highlightMentions() {
            var replyContents = document.querySelectorAll('.new-reply');
            var pattern = /@[^\s]+/g;

            replyContents.forEach(function(replyContent) {
                var matchedText = replyContent.innerHTML.match(pattern);

                if (matchedText) {
                    for (var i = 0; i < matchedText.length; i++) {
                        var boldText = matchedText[i].substring(1);
                        var originalText = replyContent.innerHTML;
                        var updatedText = originalText.replace(new RegExp("@" + boldText, "g"), '<span style="font-weight: 600; color: #5189FA;">@' + boldText + '</span>');
                        replyContent.innerHTML = updatedText;
                    }
                }
            });
        }

        function onReplyRegistered() {
            highlightMentions();
        }

        function handleReplySubmit() {
            onReplyRegistered();
        }

    });
</script>
