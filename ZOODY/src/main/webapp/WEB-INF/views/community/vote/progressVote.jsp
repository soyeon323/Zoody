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
        <%@ include file="/WEB-INF/views/community/vote/voteSide.jsp" %>

        <div id="grid-wrap">

            <div class="boder-grid-header">
                진행중인 투표
            </div>
            
            <div class="boder-grid-body">
                
                <div class="boder-grid-body-top">
                    <c:if test="${empty board.count}">
                        <div>전체 게시글 0 개</div>
                    </c:if>
                    <c:if test="${not empty board.count}">
                        <div>전체 게시글 ${ board.count } 개</div>
                    </c:if>

                    <div class="search-area">

                        <select name="search-area-cat">
                            <option value="title" selected>제목
                            <option value="writer"> 작성자
                            <option value="???"> ???
                        </select>

                        <div class="search-area-search">
                            <input type="text">
                            <img src="${root}/resources/svg/icon/search.svg" alt="🔍">
                        </div>

                    </div>
                </div>
                <div class="boder-grid-body-meddle">
                    <div class="boder-grid-body-meddle-notice">
                        <div>
                            <img src="" alt="📢">
                            ${ notice.title }
                        </div>
                        <div>
                            <img src="" alt="📢">
                            ${ notice.title }
                        </div>
                    </div>
                </div>
                <div class="boder-grid-body-bottom vote">
                    
                    <div class="list-div">

                        <div class="list-div-item">
                            <div class="list-div-item-img">
                                <img src="${root}/resources/img/logo/logo.svg" alt="투표 썸네일">
                            </div>
                            <div class="list-div-item-info">
                                <span>제목 : ${vote.title}</span>
                                <span>참여자</span><span>-> ${vote.voter}</span>
                                <span>마감일</span><span>-> ${vote.end}</span>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
            

            <div class="boder-grid-footer">
                
                <div class="boder-grid-footer-page"></div>

            </div>

        </div>
        
    </div>

    
    <%@ include file="/WEB-INF/views/common/modal.jsp" %>
        

        <div class="modal-body">
            <div class="modal-body-top">
                <div class="modal-body-top-title">투표제목 ${vote.title}</div>
                <div class="modal-body-top-info">
                    <div>이름 ${vote.witer}</div>
                    <div>부서 ${vote.department}</div>
                </div>
                <div class="modal-body-top-guide">안내 메세지 ${vote.guide}</div>
            </div >
            <div class="modal-body-bottom">
                d

            </div>
        </div>

    </div>
    

</body>

<script>
    // 투표 아이템 선택
    $(".list-div-item").on("click" , function(){
        
        openModal();

    })
    
    // 모달 닫기 
    $(".modal-close, .modal-header").on("click" , function (){
        
        closeModal()

    })

    
    // 모달 열기
    function openModal() {

        $(".modal").css("display" , "flex");

    }

    // 모달 닫기
    function closeModal() {
        $(".modal").css("display" , "none");
    }

</script>

