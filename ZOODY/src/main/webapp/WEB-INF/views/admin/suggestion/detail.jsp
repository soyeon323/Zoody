<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/admin/suggestion/detail.css">
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

        <div id="suggestion">
            <a>건의사항</a>
        </div>

        <div id="topArea">
            <div>
                <a>▶</a>
                <a>게시글 주소 : </a>
                <a>127.0.0.1:8888/zoody/admin/suggestion/detail?no=${vo.no}</a>
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
                <img src="${root}/resources/img/icon/png/copy.png" alt="복사아이콘">
                <button onclick="suggestionCopy('${vo.no}');">복사</button>
            </div>
            <div>
                <img src="${root}/resources/img/icon/png/delete.png" alt="삭제아이콘">
                <button onclick="suggestionDelete('${vo.no}');">삭제</button>
            </div>
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15" fill="none">
                    <g clip-path="url(#clip0_401_9570)">
                    <path d="M1.07313 9.1875L3.65625 15H5.19125C5.47764 14.9998 5.75946 14.9282 6.01113 14.7915C6.2628 14.6548 6.47636 14.4575 6.63243 14.2173C6.7885 13.9772 6.88214 13.7019 6.90486 13.4164C6.92757 13.1309 6.87864 12.8443 6.7625 12.5825L5.33687 9.375H6.875C7.7035 9.37599 8.49778 9.70555 9.08361 10.2914C9.66945 10.8772 9.99901 11.6715 10 12.5H11.25V0H10C9.99901 0.828497 9.66945 1.62278 9.08361 2.20861C8.49778 2.79445 7.7035 3.12401 6.875 3.125H1.875C1.37772 3.125 0.900805 3.32254 0.549175 3.67417C0.197544 4.02581 0 4.50272 0 5L0 7.5C0.00139437 7.85388 0.102908 8.20014 0.292807 8.49876C0.482705 8.79738 0.753235 9.03616 1.07313 9.1875ZM5.62 13.0894C5.65189 13.1609 5.6654 13.2392 5.6593 13.3172C5.6532 13.3952 5.62769 13.4705 5.58508 13.5362C5.54247 13.6018 5.48412 13.6558 5.41533 13.6931C5.34655 13.7305 5.26952 13.75 5.19125 13.75H4.46875L2.52437 9.375H3.96875L5.62 13.0894ZM1.25 5C1.25 4.83424 1.31585 4.67527 1.43306 4.55806C1.55027 4.44085 1.70924 4.375 1.875 4.375H6.875C7.45763 4.37514 8.03438 4.25845 8.57113 4.03183C9.10789 3.80521 9.59375 3.47327 10 3.05562V9.44438C9.59375 9.02673 9.10789 8.69479 8.57113 8.46817C8.03438 8.24155 7.45763 8.12486 6.875 8.125H1.875C1.70924 8.125 1.55027 8.05915 1.43306 7.94194C1.31585 7.82473 1.25 7.66576 1.25 7.5V5ZM13.9331 9.81687L12.5031 8.38688L13.3869 7.50313L14.8169 8.93313L13.9331 9.81687ZM13.4106 4.97312L12.5269 4.08938L13.9331 2.68313L14.8169 3.56687L13.4106 4.97312ZM13.125 5.625H15V6.875H13.125V5.625Z" fill="#374957"/>
                    </g>
                    <defs>
                    <clipPath id="clip0_401_9570">
                    <rect width="15" height="15" fill="white"/>
                    </clipPath>
                    </defs>
                </svg>
                <button onclick="noticeEnroll('${vo.no}');" type="button">공지로 등록</button>
            </div>
        </div>

        <div id="contentArea">
            <div id="title">
                <div>${vo.title}&nbsp&nbsp [${replyCnt}]</div>
            </div>
            <div id="info">
                <div>${vo.name}&nbsp ${vo.rankName}</div>
                <div>2023-07-01 14:27</div>
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
                       
                        <form action="${root}/admin/suggestion/detail" method="POST">
                            <input type="hidden" value="${vo.userNo}" name="userNo">
                            <input type="hidden" value="${vo.no}" name="suggestionNo">
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
                            <div id="deleteArea"><button onclick="deleteReply('${voList.no}', '${voList.suggestionNo}');">삭제</button></div>
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

</body>
</html>
<script>
    function goHome(){
        location.href = '${root}/admin/suggestion/list';
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

    //댓글 삭제
    function deleteReply(no, suggestionNo){
        if(confirm("댓글을 삭제하시겠습니까?")){
            $.ajax({
                url : "${root}/admin/suggestion/replyDelete",
                type : "POST",
                data : {
                    no : no,
                    suggestionNo : suggestionNo
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

    //게시글 복사
     function suggestionCopy(no) {
        const result = confirm("해당 게시글을 복사하시겠습니까?");

        if(!result){
            return;
        }
       
        $.ajax({
            url : '${root}/admin/suggestion/copy',
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
    function suggestionDelete(no) {
        const result = confirm("선택한 게시글을 삭제하시겠습니까?");

        if(!result){
            return;
        }

        $.ajax({
            url : '${root}/admin/suggestion/delete',
            type : 'POST',
            traditional: true,
            data : {
              no : no  
            },
            success : function(){
                alert("게시글이 삭제되었습니다.");
                location.href = '${root}/admin/suggestion/list'
            },
            error : function(err){
                alert("게시글이 삭제되었습니다.");
                location.href = '${root}/admin/suggestion/list'
            }
        })
    };

    //공지사항으로 등록
    function noticeEnroll(no){
        if(!confirm("해당 게시글을 공지사항으로 등록하시겠습니까?")){
            return;
        }

        $.ajax({
            url : '${root}/admin/suggestion/noticeEnroll',
            type : 'POST',
            traditional: true,
            data : {
              no : no  
            },
            success : function(){
                if(confirm("공지사항으로 등록되었습니다. 확인을 누르면 공지사항 목록으로 이동합니다.")){
                    location.href = "${root}/admin/notice/list"
                }else{
                    location.reload();
                }
            },
            error : function(err){
                if(confirm("공지사항으로 등록되었습니다. 확인을 누르면 공지사항 목록으로 이동합니다.")){
                    location.href = "${root}/admin/notice/list"
                }else{
                    location.reload();
                }
            }
        })
    }
</script>