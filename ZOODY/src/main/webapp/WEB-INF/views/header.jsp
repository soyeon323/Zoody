<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    html, body, div, span, applet, object, iframe,
    h1, h2, h3, h4, h5, h6, p, blockquote, pre,
    a, abbr, acronym, address, big, cite, code,
    del, dfn, em, img, ins, kbd, q, s, samp,
    small, strike, strong, sub, sup, tt, var,
    b, u, i, center,
    dl, dt, dd, ol, ul, li,
    fieldset, form, label, legend,
    table, caption, tbody, tfoot, thead, tr, th, td,
    article, aside, canvas, details, embed, 
    figure, figcaption, footer, header, hgroup, 
    menu, nav, output, ruby, section, summary,
    time, mark, audio, video {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }
    body{
        font-family: 'Spoqa Han Sans Neo', 'sans-serif';
        background-color: #F4F7FD;
        width: 100%;
        height: 100%;
    }
    nav{
        width: 100%;
        height: 65px;
        background-color: white;
        border-bottom: 1px solid rgb(213, 213, 213);
    }
    #sidebar{
        width: 255px;
        height: 93vh;
        background-color: white;
        border-right: 1px solid rgb(213, 213, 213);
    }
    #logoImg>img{
        width: 125px;
        height: 40px;
    }
    #logoImg{
        width: 125px;
        height: 65px;
        display: flex;
        align-items: center;
        margin-left: 30px;
    }
    #storage{
        width: 269px;
        height: 45px;
        background-color: #4876EF;
        position: absolute;
        border-radius: 10px;
        bottom: 0px;
    }
    
/*--------------------------------------------------------------------*/
/* 노멀라이즈 시작 */
body, ul, li {
  margin: 0;
  padding: 0;
  list-style: none;   /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 */
}

a {
  color: inherit;   /* 부모 엘리먼트의 값을 물려받는다 */
  text-decoration: none;    /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
}
/* 노멀라이즈 끝 */

/* 커스텀 시작 */
.side-bar > ul ul {
  display: none;
}


/* 사이드바 시작 */

/* 사이드바의 너비와 높이를 변수를 통해 통제 */
:root {
  --side-bar-width: 270px;
  --side-bar-height: 90vh;
}

.side-bar {
  position: fixed;    /* 스크롤을 따라오도록 지정 */
  background-color: #779af3;
  width: var(--side-bar-width);
  min-height: var(--side-bar-height);   /* 사이드바의 높이를 전체 화면 높이의 90%로 지정 */
}

/* 아이콘 시작 */
.side-bar__icon-box {
  display: flex;
  justify-content: flex-end;
}

.side-bar__icon-1 {
  position: relative;
  width: 23px;
  height: 17px;
  margin: 15px;
  margin-top: 20px;
  transition: .5s;
}

:root {
  --side-bar__icon: .5s;
}

.side-bar__icon-1 > div {
  position: absolute;
  width: 100%;
  height: 20%;
  background-color:#4876EF;
  transition: all var(--side-bar__icon);
}

.side-bar__icon-1 > div:nth-of-type(1) {
  top: 0;
  width: auto;
  left: 0;
  right: 0;
  transition: all var(--side-bar__icon), left calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), right calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), height calc(var(--side-bar__icon) / 2) 0s;
}

.side-bar__icon-1 > div:nth-of-type(2) {
  top: 40%;
  transform-origin:bottom left;
}

.side-bar__icon-1 > div:nth-of-type(3) {
  top: 80%;
  left: auto;
  right: 0;
  transform-origin:bottom right;
}


.side-bar:hover .side-bar__icon-1 {
  transform: translate(-198px, 0);
}

.side-bar:hover .side-bar__icon-1 > div:nth-of-type(2) {
  transform:rotate(45deg);
  width: 70.5%;
  height: 25%;
}

.side-bar:hover .side-bar__icon-1 > div:nth-of-type(3) {
  top: 40%;
  transform:rotate(-45deg);
  width: 70.5%;
  height: 25%;
}

.side-bar:hover .side-bar__icon-1 > div:nth-of-type(1) {
  left: 41%;
  right: 41%;
  height: 100%;
  transition: all var(--side-bar__icon), left calc(var(--side-bar__icon) / 2) 0s, right calc(var(--side-bar__icon) / 2) 0s, height calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2);
}
/* 아이콘 끝 */

/* 모든 메뉴의 a에 속성값 부여 */
.side-bar ul > li > a {
  display: block;
  color: black;
  font-size: 1.0rem;
  font-weight: bold;
  padding-top: 20px;
  padding-bottom: 20px;
  padding-left: 50px;
  transition: .5s;
}

/* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
.side-bar > ul > li {
  position: relative;
}

/* 모든 메뉴가 마우스 인식 시 반응 */
.side-bar ul > li:hover > a {
  background-color: #4876EF;
  border-bottom: 1px solid #4876EF;
}

/* 1차 메뉴의 항목이 마우스 인식 시에 2차 메뉴 등장 */
.side-bar > ul > li:hover > ul {
  display: block;
  position: absolute;
  background-color: #4876EF;
  top: 0;         /* 2차 메뉴의 상단을 1차 메뉴의 상단에 고정 */
  left: 100%;     /* 2차 메뉴를 1차 메뉴의 너비만큼 이동 */
  width: 100%;    /* 1차 메뉴의 너비를 상속 */
}

/* 사이드바 너비의 80%만큼 왼쪽으로 이동 */
.side-bar {
  border-radius: 10px;
  transform: translate(calc(var(--side-bar-width) * -0.8), 0);
  transition: .5s;
}

/* 마우스 인식 시 원래의 위치로 이동 */
.side-bar:hover {
  transform: translate(-20px, 0);   /* 둥근 모서리의 너비만큼 숨겨주기 */
}
/* 사이드바 끝 */

/* 커스텀 끝 */
/*--------------------------------------------------------------------*/

</style>
</head>
<body>

    <nav>
        <div id="logoImg"><img src="/zoody/resources/img/logo/logo.svg" alt="로고이미지"></div>
    </nav>


    <!-- 근태 일정 인사 동물 전자결제 프로젝트 커뮤니티
    <div id="sidebar">
            <ul>
                <li>근태</li>
                <li>일정</li>
                <li>인사</li>
                <li>동물</li>
                <li>전자 결제</li>
                <li>프로젝트</li>
                <li>커뮤니티</li>
            </ul>
        <div id="storage"></div>
    </div> -->

    <aside class="side-bar">
        <section class="side-bar__icon-box">
          <section class="side-bar__icon-1">
            <div></div>
            <div></div>
            <div></div>
          </section>
        </section>
        <ul>
          <li>
            <a href="#"><i class="fa-solid fa-cat"></i> 근태 관리</a>
            <ul>
              <li><a href="#">text1</a></li>
              <li><a href="#">text2</a></li>
              <li><a href="#">text3</a></li>
              <li><a href="#">text4</a></li>
            </ul>
          </li>
          <li>
            <a href="#">menu2</a>
            <ul>
              <li><a href="#">text1</a></li>
              <li><a href="#">text2</a></li>
              <li><a href="#">text3</a></li>
              <li><a href="#">text4</a></li>
            </ul>
          </li>
          <li>
            <a href="#">menu3</a>
            <ul>
              <li><a href="#">text1</a></li>
              <li><a href="#">text2</a></li>
              <li><a href="#">text3</a></li>
              <li><a href="#">text4</a></li>
            </ul>
          </li>
          <li>
            <a href="#">menu4</a>
            <ul>
              <li><a href="#">text1</a></li>
              <li><a href="#">text2</a></li>
              <li><a href="#">text3</a></li>
              <li><a href="#">text4</a></li>
            </ul>
          </li>
        </ul>
        <div id="storage"></div>
    </aside>
</body>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
