<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="${root}/resources/css/attendance/objection.css">
<title>Document</title>
<style>
  textarea {
    resize: none;
    width: 100%;
    border-color: gainsboro;
    color: #5e5e5e;
    padding-left: 5px;
    padding-top: 5px;
}

.btn-primary {
    padding: revert;
    font-size: 13px;
}

#bt3{
  padding: revert;
  width: 45px;
}


</style>
</head>
<body>
  
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="att_wrap">
        <div>
            <%@ include file="/WEB-INF/views/side.jsp" %>
        </div>
        <div id="obj_main">
            <!-- 맨 윗 줄 -->
            <div class="obj_count">
              <button type="button" class="btn btn-secondary" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" data-bs-content="${objectionCnt} 건">
                이의신청 건수
              </button>
            </div>
            <form action="${root}/attendance/admin/objection">
            <div class="obj_search">
                <div class="search-area">
                    <p>날짜</p>
                    <input type="date" name="enrolldateOne" id="">
                    <p>~</p>
                    <input type="date" name="enrolldateTwo" id="">
                    <input class="btn btn-primary" type="submit" value="검색" style="
                  font-size: 13px;
                  background-color: #cdcdcd;
                  border: none;
              ">
                  <input class="btn btn-primary" type="reset" value="취소" style="
                  font-size: 13px;
                  background-color: #cdcdcd;
                  border: none;
              ">
                </div>
                <div></div>
                  <div class="search-flex">
                      <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="searchType">
                        <option value="d.name">부서</option>
                        <option value="u.name">사원명</option>
                      </select>
                      <div class="search-input">
                        <input type="text" placeholder="내용을 입력하세요." name="searchValue">
                        <button type="submit">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                            <g clip-path="url(#clip0_409_10089)">
                              <path d="M15.9999 15.0579L11.8252 10.8833C12.9096 9.55698 13.4428 7.86465 13.3144 6.15629C13.1861 4.44794 12.406 2.85427 11.1356 1.70493C9.86516 0.555594 8.20158 -0.0614848 6.48895 -0.0186636C4.77632 0.0241577 3.14566 0.723603 1.93426 1.935C0.72287 3.14639 0.0234252 4.77705 -0.019396 6.48968C-0.0622172 8.20232 0.554862 9.86589 1.7042 11.1363C2.85354 12.4067 4.44721 13.1868 6.15556 13.3152C7.86392 13.4435 9.55625 12.9103 10.8825 11.8259L15.0572 16.0006L15.9999 15.0579ZM6.66652 12.0006C5.61169 12.0006 4.58054 11.6878 3.70348 11.1018C2.82642 10.5157 2.14283 9.68277 1.73916 8.70823C1.3355 7.73369 1.22988 6.66134 1.43567 5.62677C1.64145 4.59221 2.14941 3.6419 2.89529 2.89602C3.64117 2.15014 4.59147 1.64219 5.62604 1.4364C6.6606 1.23061 7.73296 1.33623 8.7075 1.7399C9.68204 2.14356 10.515 2.82715 11.101 3.70421C11.6871 4.58127 11.9999 5.61242 11.9999 6.66725C11.9983 8.08125 11.4359 9.43689 10.436 10.4367C9.43615 11.4366 8.08052 11.999 6.66652 12.0006Z" fill="#A4A4A4"/>
                            </g>
                            <defs>
                              <clipPath id="clip0_409_10089">
                                <rect width="16" height="16" fill="white"/>
                              </clipPath>
                            </defs>
                          </svg>
                        </button>
                      </div>
                  </div>
                </div> 
              </form>
            <div class="obj_table">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">날짜</th>
                    <th scope="col">부서</th>
                    <th scope="col">사원명</th>
                    <th scope="col">출근시간</th>
                    <th scope="col">퇴근시간</th>
                    <th scope="col">초과근무시간</th>
                    <th scope="col">상태</th>
                    <th scope="col">이의신청</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${objVoList}" var="obj">
	                  <tr>
	                    <th scope="row">${obj.no}</th>
	                    <td>${obj.enrolldate}</td>
	                    <td>${obj.departmentName}</td>
	                    <td>${obj.name} ${obj.rankName}</td>
	                    <td>${obj.checkInTime}</td>
	                    <td>${obj.checkOutTime}</td>
	                    <c:choose> 
							<c:when test="${obj.plusWorkTime eq '시간 분 초'}">
		                        <td>-</td>
							</c:when>
							<c:when test="${obj.plusWorkTime eq '0시간 0분 0초'}">
		                        <td>-</td>
							</c:when>
							<c:otherwise>
		                        <td>${obj.plusWorkTime}</td>
							</c:otherwise> 
						</c:choose>
	                    <td>${obj.type}</td>
	                    <c:choose> 
							<c:when test="${obj.approvalStatus == 0}">
                      <td>
                        <button type="button" class="btn btn-primary toggle-button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-obj-objectionReason="${obj.objectionReason}"  data-obj-currentNo="${obj.currentNo}">
                          확인하기
                        </button>
                        
                        
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">이의신청 사유</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                <textarea name="" id="recipient-name" cols="30" rows="10"></textarea>
                                <!-- <p>${obj.objectionReason}</p> -->
                                
                                <div class="choiceOption">
                                  <select class="form-select" aria-label="Default select example" id="currentNo" name="currentNo">
                                    <!-- <option selected>승인 시 상태 변경해 주세요.</option> -->
                                    <option value="0">결근</option>
                                    <option value="1">정상출근</option>
                                    <option value="2">휴가</option>
                                    <option value="3">출장</option>
                                    <option value="4">외근</option>
                                    <option value="5">업무</option>
                                    <option value="6">지각</option>
                                  </select>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" id="bt3" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button type="submit" name="approvalStatus" class="btn btn-primary btn-approve" value="1" data-obj-no="${obj.no}">승인</button>
                                <button type="submit" name="approvalStatus" value="2" style="background-color: rgb(135, 33, 33); border-color: rgb(135, 33, 33);" class="btn btn-primary btn-reject" data-obj-no="${obj.no}">반려</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </td>
							</c:when>
							<c:when test="${obj.approvalStatus == 1}">
		                        <td style="color: #5189FA">승인</td>
							</c:when>
							<c:otherwise>
		                        <td style="color: #F85F57;">반려</td>
							</c:otherwise> 
						</c:choose>
	                  </tr>
                	</c:forEach>
                </tbody>
              </table>
              <div class="list-page">
                <c:if test="${objPv.currentPage > 1}">
	                <a href="${root}/attendance/admin/objection?page=${objPv.currentPage-1}">
	                  <button style="border: none; background-color: #fff;">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
	                      <path d="M7.9499 9.53261C7.8796 9.46288 7.8238 9.37993 7.78573 9.28854C7.74765 9.19714 7.72805 9.09912 7.72805 9.00011C7.72805 8.9011 7.74765 8.80307 7.78573 8.71167C7.8238 8.62028 7.8796 8.53733 7.9499 8.46761L11.3924 5.03261C11.4627 4.96288 11.5185 4.87993 11.5566 4.78854C11.5946 4.69714 11.6142 4.59912 11.6142 4.50011C11.6142 4.4011 11.5946 4.30307 11.5566 4.21167C11.5185 4.12028 11.4627 4.03733 11.3924 3.96761C11.2519 3.82792 11.0618 3.74951 10.8636 3.74951C10.6655 3.74951 10.4754 3.82792 10.3349 3.96761L6.89239 7.41011C6.47104 7.83198 6.23438 8.40385 6.23438 9.00011C6.23438 9.59636 6.47104 10.1682 6.89239 10.5901L10.3349 14.0326C10.4746 14.1712 10.6631 14.2493 10.8599 14.2501C10.9586 14.2507 11.0564 14.2318 11.1478 14.1944C11.2392 14.1571 11.3223 14.1021 11.3924 14.0326C11.4627 13.9629 11.5185 13.8799 11.5566 13.7885C11.5946 13.6971 11.6142 13.5991 11.6142 13.5001C11.6142 13.4011 11.5946 13.3031 11.5566 13.2117C11.5185 13.1203 11.4627 13.0373 11.3924 12.9676L7.9499 9.53261Z" fill="#5B5B5B"/>
	                    </svg>
	                  </button>
	                </a>
                </c:if>
                <c:forEach var="pageNum" begin="${objPv.startPage}" end="${objPv.endPage}">
                  <c:choose>
                      <c:when test="${pageNum == objPv.currentPage}">
                          <button class="active">${pageNum}</button>
                      </c:when>
                      <c:otherwise>
                          <a href="${root}/attendance/admin/objection?page=${pageNum}">
                              <button class="nomalBtn">${pageNum}</button>
                          </a>
                      </c:otherwise>
                  </c:choose>
              </c:forEach>
              <c:if test="${objPv.currentPage < objPv.maxPage}">
                  <a href="${root}/attendance/admin/objection?page=${objPv.currentPage+1}">
                    <button style="border: none; background-color: #fff;">
                      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                        <path d="M11.55 7.41011L8.10747 3.96761C7.96695 3.82792 7.77686 3.74951 7.57872 3.74951C7.38058 3.74951 7.1905 3.82792 7.04997 3.96761C6.97968 4.03733 6.92388 4.12028 6.88581 4.21167C6.84773 4.30307 6.82812 4.4011 6.82812 4.50011C6.82812 4.59912 6.84773 4.69714 6.88581 4.78854C6.92388 4.87993 6.97968 4.96288 7.04997 5.03261L10.5 8.46761C10.5703 8.53733 10.6261 8.62028 10.6641 8.71167C10.7022 8.80307 10.7218 8.9011 10.7218 9.00011C10.7218 9.09912 10.7022 9.19714 10.6641 9.28854C10.6261 9.37993 10.5703 9.46288 10.5 9.53261L7.04997 12.9676C6.90875 13.1078 6.82901 13.2984 6.82831 13.4975C6.8276 13.6965 6.90599 13.8876 7.04622 14.0289C7.18646 14.1701 7.37705 14.2498 7.57607 14.2505C7.7751 14.2512 7.96625 14.1728 8.10747 14.0326L11.55 10.5901C11.9713 10.1682 12.208 9.59636 12.208 9.00011C12.208 8.40385 11.9713 7.83198 11.55 7.41011Z" fill="#5B5B5B"/>
                      </svg>
                    </button>
                  </a>
              </c:if>
              </div>
            </div>
        </div>
    </div>

    <script>
      $(document).ready(function() {
        $('[data-bs-toggle="popover"]').popover({container: "body"});
      });
    </script>

    <script>
      const searchValueTag = document.querySelector("input[name=searchValue]");
      searchValueTag.value = '${paramMap.searchValue}';

      const searchTypeTagArr = document.querySelectorAll("select[name=searchType] > option");

      const x = '${paramMap.searchType}';
      if (x == 'd.name') {
        searchTypeTagArr[0].selected = true;
      }else if(x == 'u.name') {
        searchTypeTagArr[1].selected = true;
      }

      const y = '${paramMap.enrolldateOne}';
      const z = '${paramMap.enrolldateTwo}';

      const searchDateTagOne = document.querySelector("input[name=enrolldateOne]");
      searchDateTagOne.value = y;
      const searchDateTagTwo = document.querySelector("input[name=enrolldateTwo]");
      searchDateTagTwo.value = z;
    </script>

    <script>
      document.addEventListener("DOMContentLoaded", function() {
      const toggleButtons = document.querySelectorAll(".toggle-button");

      toggleButtons.forEach(button => {
        button.addEventListener("click", function() {
          // 이벤트 리스너에서 모달 요소를 가져옴.
          const modal = document.getElementById("staticBackdrop");
          const objectionReason = this.getAttribute("data-obj-objectionReason");
          const currentType = this.getAttribute("data-obj-currentNo");

          const textareaField = document.querySelector("#recipient-name");
          textareaField.value = objectionReason;

          // const currentNo = document.querySelector("#form-select");
          // currentNo.value = currentNo;

          const currentNo = document.querySelector("#currentNo");
          currentNo.value = currentType;

          textareaField.setAttribute("readonly", "readonly");
        });
      });
    });
    </script>

    <script>
      // 승인 버튼 눌렀을 때
      $(".btn-approve").click(function() {
        var no = $(this).attr("data-obj-no");
        var currentNo = $('#currentNo').val();

        var objParams = {
          approvalStatus: 1,
          no: no,
          currentNo : currentNo
        };
        sendApprovalStatus(objParams);
      });

      // 반려 버튼 눌렀을 때
      $(".btn-reject").click(function() {
        var no = $(this).attr("data-obj-no");
        var currentNo = $('#currentNo').val();

        var objParams = {
          approvalStatus: 2,
          no: no,
          currentNo : currentNo
        };
        sendApprovalStatus(objParams);
      });

      //서버로 보냄
      function sendApprovalStatus(objParams) {
        $.ajax({
          type: "POST",
          url: "${root}/attendance/admin/objection",
          data: objParams,
          success: function(response) {
            location.reload();
          },
          error: function(xhr, status, error) {
            console.error("요청 실패:", error);
          }
        });
      }
    </script>

</body>
</html>