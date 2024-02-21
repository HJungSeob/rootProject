<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>list</title>
    <link rel="stylesheet" href="../resources/css/font.css">
    <link rel="stylesheet" href="../resources/css/icon.css">
    <link rel="stylesheet" href="../resources/css/global.css">
    <script src="../resources/js/globalNavigation.js"></script>
    <script src="../resources/js/m_list.js"></script>
    <style>
        /* #region ------------ start of header ---------------------- */

        header {
            width: 100%;
            height: 143px;
            z-index: 20;
            background-color: #f9f9f9;
        }

        /* #region start of nav */

        nav {
            position: relative;
            backdrop-filter: blur(10px);
            top: 0px;
            width: 100%;
            background-color: #f9f9f9;
            transition: 0.3s;
            z-index: 20;
            font: 0;
        }

        .global_nav_bar {
            margin: 0 auto;
            display: flex;
            min-width: 1000px;
            width: 100%;
            max-width: 1200px;
            font-size: 0;
            z-index: 20;
            height: 48px;
        }

        .global_nav_bar a {
            vertical-align: top;
        }

        .global_nav_bar a span {
            display: inline-block;
            padding: 15px 20px;
            height: 18px;
            width: 18px;
            background-size: 18px;
        }

        .global_nav_btns {
            flex: 1;
            display: flex;
            justify-content: space-between;
        }

        .global_nav_btns button {
            height: 48px;
            padding: 17px 0;
            margin: 0 20px;
            font-size: 12px;
            font-weight: bold;
            cursor: pointer;
            background-color: transparent;
            border: 0;
        }

        .global_nav_keywords {
            flex: 1;
        }

        .global_nav_keywords ul {
            width: 200px;
            height: 48px;
            padding: 0;
            margin: 0;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            padding: 0;
            float: right;
        }

        .global_nav_keywords li {
            box-sizing: border-box;
            width: 200px;
            font-size: 12px;
            font-weight: bold;
            position: absolute;
            padding: 17px;
            margin: 0;
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .global_nav_keywords .arrow {
            display: inline-block;
            width: 8px;
            height: 8px;
            vertical-align: 1px;
            margin-right: 10px;
            background-size: 8px;
        }

        .global_nav_keywords li.active {
            opacity: 1;
        }

        .global_nav_serviceBtn {
            height: 48px;
            padding: 15px 20px;
            cursor: pointer;
            background-color: transparent;
            border: 0;
        }

        .global_nav_serviceBtn span {
            display: inline-block;
            height: 16px;
            width: 16px;
        }

        .global_nav_lists {
            position: absolute;
            width: 100%;
            height: 0;
            overflow: hidden;
            z-index: 11;
            background-color: white;
            transition: 0.5s;
            opacity: 0;
        }

        .global_nav_listBox {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .global_nav_list {
            box-sizing: border-box;
            position: absolute;
            width: 100%;
            display: flex;
            opacity: 0;
            padding: 40px 20px;
            transition: 0.3s;
        }

        .global_nav_categories {
            width: 200px;
        }

        .global_nav_categories span {
            color: #848484;
            font-size: 12px;
        }

        .global_nav_categories ul {
            margin-top: 10px;
        }

        .global_nav_categories li {
            padding: 10px 0;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .global_nav_categorieImg img {
            position: absolute;
            display: block;
            opacity: 0;
            width: 960px;
            height: 280px;
            transition: opacity 0.5s;
        }

        .global_nav_categorieImg img.active {
            opacity: 1;
        }

        .global_nav_searchField {
            box-sizing: border-box;
            width: 1200px;
        }

        .global_nav_searchField input[type="submit"] {
            display: none;

        }

        .global_nav_searchField .search {
            display: inline-block;
            width: 20px;
            height: 20px;
            background-size: 20px;
        }

        .global_nav_searchField span {
            display: inline-block;
            color: #848484;
            font-size: 12px;

        }

        .global_nav_searchBox {
            box-sizing: border-box;
            border: 0;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .global_nav_list_keywords {
            width: 800px;
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .global_nav_list_keywords ul {
            margin-right: 10px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }

        .global_nav_list_keywords li {
            font-size: 12px;
            font-weight: bold;
            width: 250px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .global_nav_list_keywords .arrow {
            display: inline-block;
            width: 8px;
            height: 8px;
            vertical-align: 1px;
            margin-right: 10px;
            background-size: 8px;
        }

        .global_nav_cart {
            flex: 1;
            font-size: 0;
            display: flex;
        }

        .global_nav_cartList {
            flex: 1;
        }

        .global_nav_cartList h1 {
            font-size: 24px;
        }

        .global_nav_cartItem {
            margin-top: 20px;
        }

        .global_nav_cartItem a {
            display: block;
            width: 590px;
        }

        .global_nav_cartItem img {
            display: inline-block;
            width: 64px;
            height: 64px;
        }

        .global_nav_cartItem span {
            width: 500px;
            display: inline-block;
            font-size: 12px;
            vertical-align: top;
            margin: 25px 0 0 20px;
            font-weight: bold;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .global_nav_cartView a {
            font-size: 16px;
            font-weight: bold;
            color: white;
            padding: 9px;
            border: 1px solid black;
            border-radius: 26px;
            background-color: black;
        }

        .global_nav_itemCount {
            display: block;
            height: 50px;
            position: absolute;
            bottom: 0px;
            right: 20px;
            font-size: 12px;
            float: right;
            color: #848484;
        }

        nav.fixed {
            position: fixed;
            background-color: #ffffff99;
        }

        nav.active {
            background-color: white;
        }

        nav.active .global_nav_lists {
            height: 360px;
            opacity: 1;
            box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.1);

        }

        .global_nav_list.active {
            opacity: 1;
            z-index: 12;
        }

        /* #endregion ------------ end of header ---------------------- */

        /* #region ------------ start of section ---------------------- */

        section {
            transition: filter 0.5s, opacity 0.5s;
        }

        section.blur {
            filter: blur(10px);
            -webkit-filter: blur(10px);
            opacity: 0.8;
        }

        .m_list_search {
            box-sizing: border-box;
            width: 100%;
            border-bottom: 1px solid lightgray;
        }

        .m_list_search_box {
            width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;

        }

        .m_list_search_box input[type="submit"] {
            display: none;
        }

        .m_list_search_box .search {
            width: 24px;
            height: 24px;
            background-size: 24px;
            padding-right: 10px;
        }

        .m_list_search_box input[type="text"] {
            box-sizing: border-box;
            height: 79px;
            width: 500px;
            font-size: 24px;
            font-weight: bold;
            border: 0;
        }

        .m_list_search_box select {
            font-size: 14px;
            margin: 30px 0 30px 40px;
            border: 0;
            font-weight: bold;
        }

        .m_list_search_list {
            width: 1200px;
            margin: 0 auto;
            display: flex;
        }

        .m_list_categoris {
            box-sizing: border-box;
            min-width: 200px;
            border-right: 1px solid lightgray;
            padding: 20px 20px 0;
        }

        .m_list_categoris h4 .arrow_small {
            vertical-align: top;
            float: right;
            transition: rotate 0.5s;
            filter: invert(83%) sepia(0%) saturate(1%) hue-rotate(332deg) brightness(96%) contrast(90%);
        }

        .m_list_categoris h4.active .arrow_small {
            rotate: 180deg;
        }

        .m_list_categoris>h2 {
            box-sizing: border-box;
            font-size: 20px;
            padding: 10px;
            border-bottom: 2px solid lightgray;
        }

        .m_list_categoris>ul {
            transition: height 0.5s;
        }

        .m_list_categori>h4 {
            box-sizing: border-box;
            font-size: 14px;
            padding: 10px 10px;
        }

        .m_list_categori>h4 .arrow_small {
            width: 14px;
            height: 14px;
            background-size: 14px;
        }

        .m_list_categori>ul {
            height: 0px;
            overflow: hidden;
            transition: height 0.5s;
        }

        .m_list_categori>ul>li {
            box-sizing: border-box;
            font-size: 14px;
            padding: 7px 10px;
        }

        .m_list_items {
            box-sizing: border-box;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .m_list_item {
            box-sizing: border-box;
            border-radius: 20px;
            padding: 20px;
            width: 320px;
            height: 430px;
            margin: 5px;
            box-shadow: 2px 4px 12px rgba(0, 0, 0, .08);
            transition: box-shadow 0.5s;
        }

        .m_list_item:hover{
            box-shadow: 2px 4px 12px rgba(0, 0, 0, .3);
        }

        .m_list_star_box {
            width: 89px;
            height: 17px;
            font-size: 0;
            margin-bottom: 5px;
        }

        .m_list_item_info img {
            display: block;
            width: 280px;
            height: 280px;
            margin-bottom: 10px;
            border-radius: 10px;
        }

        .m_list_star {
            position: relative;
            display: inline-block;
            height: 17px;
            background-repeat: no-repeat;
        }

        .m_list_star.full {
            bottom: 17px;
            width: 50%;
            background-image: url(../resources/css/img/star.png);
            background-position: 0 -245px;
        }

        .m_list_star.empty {
            width: 100%;
            background-image: url(../resources/css/img/star.png);
            background-position: 0 -270px;
        }

        .m_list_item_info h4 {
            margin-bottom: 5px;
        }

        .m_list_item_info h5 {
            margin-bottom: 5px;
        }

        /* #endregion ------------ end of section ---------------------- */

        /* #region ------------ start of footer ---------------------- */
        /* #endregion ------------ end of footer ---------------------- */
    </style>
</head>

<body>
    <header>
        <nav>
            <div class="global_nav_bar">

                <a href="../main/main.html" class="global_nav_mainBtn logo">
                    <span></span>
                </a>

                <div class="global_nav_btns">
                    <div>
                        <button>
                            <span>디지털/가전</span>
                        </button>
                        <button>
                            <span>인테리어</span>
                        </button>
                        <button>
                            <span>식품</span>
                        </button>
                        <button>
                            <span>의류</span>
                        </button>
                        <button>
                            <span>생활</span>
                        </button>
                    </div>

                    <div class="global_nav_keywords"></div>

                    <div>
                        <button class="global_nav_serviceBtn search">
                            <span></span>
                        </button>
                        <button class="global_nav_serviceBtn cart">
                            <span></span>
                        </button>
                    </div>
                </div>

                <a href="" class="global_nav_infoBtn info">
                    <span></span>
                </a>

            </div>
            <div class="global_nav_lists">
                <div class="global_nav_listBox">
                    <div class="global_nav_list">
                        <div class="global_nav_categories">
                            <span>디지털/가전 살펴보기</span>
                            <ul>
                                <li><a href="">휴대폰</a></li>
                                <li><a href="">영상가전</a></li>
                                <li><a href="">PC/게임</a></li>
                                <li><a href="">음향가전</a></li>
                                <li><a href="">생활가전</a></li>
                            </ul>
                        </div>
                        <div class="global_nav_categorieImg">
                            <img src="../resources/css/img/phone.jpg" alt="">
                            <img src="../resources/css/img/camera.jpg" alt="">
                            <img src="../resources/css/img/desktop.jpg" alt="">
                            <img src="../resources/css/img/microphone.jpg" alt="">
                            <img src="../resources/css/img/refrigerator.jpg" alt="">
                        </div>
                    </div>
                    <div class="global_nav_list">
                        <div class="global_nav_categories">
                            <span>인테리어 살펴보기</span>
                            <ul>
                                <li><a href="">수납</a></li>
                                <li><a href="">홈</a></li>
                                <li><a href="">거실</a></li>
                                <li><a href="">침구</a></li>
                                <li><a href="">침실가구</a></li>
                            </ul>
                        </div>
                        <div class="global_nav_categorieImg">
                            <img src="../resources/css/img/drawer.jpg" alt="">
                            <img src="../resources/css/img/home.jpg" alt="">
                            <img src="../resources/css/img/sofa.jpg" alt="">
                            <img src="../resources/css/img/linen.jpg" alt="">
                            <img src="../resources/css/img/bed.jpg" alt="">
                        </div>
                    </div>
                    <div class="global_nav_list">
                        <div class="global_nav_categories">
                            <span>식품 살펴보기</span>
                            <ul>
                                <li><a href="">농수산물</a></li>
                                <li><a href="">가공식품</a></li>
                                <li><a href="">제과제빵</a></li>
                                <li><a href="">음료</a></li>
                                <li><a href="">건강식품</a></li>
                            </ul>
                        </div>
                        <div class="global_nav_categorieImg">
                            <img src="../resources/css/img/fresh.jpg" alt="">
                            <img src="../resources/css/img/snack.jpg" alt="">
                            <img src="../resources/css/img/macaroon.jpg" alt="">
                            <img src="../resources/css/img/drink.jpg" alt="">
                            <img src="../resources/css/img/aid.jpg" alt="">
                        </div>
                    </div>
                    <div class="global_nav_list">
                        <div class="global_nav_categories">
                            <span>의류 살펴보기</span>
                            <ul>
                                <li><a href="">상의</a></li>
                                <li><a href="">하의</a></li>
                                <li><a href="">아우터</a></li>
                                <li><a href="">신발</a></li>
                                <li><a href="">이너웨어</a></li>
                            </ul>
                        </div>
                        <div class="global_nav_categorieImg">
                            <img src="../resources/css/img/sweater.jpg" alt="">
                            <img src="../resources/css/img/jeans.jpg" alt="">
                            <img src="../resources/css/img/outer.jpg" alt="">
                            <img src="../resources/css/img/shoes.jpg" alt="">
                            <img src="../resources/css/img/inner_wear.jpg" alt="">
                        </div>
                    </div>
                    <div class="global_nav_list">
                        <div class="global_nav_categories">
                            <span>생활 살펴보기</span>
                            <ul>
                                <li><a href="">취미</a></li>
                                <li><a href="">잡화</a></li>
                                <li><a href="">주방</a></li>
                                <li><a href="">사무</a></li>
                                <li><a href="">공구</a></li>
                            </ul>
                        </div>
                        <div class="global_nav_categorieImg">
                            <img src="../resources/css/img/life.jpg" alt="">
                            <img src="../resources/css/img/goods.jpg" alt="">
                            <img src="../resources/css/img/kitchen_tools.jpg" alt="">
                            <img src="../resources/css/img/office.jpg" alt="">
                            <img src="../resources/css/img/tools.jpg" alt="">
                        </div>
                    </div>
                    <div class="global_nav_list">
                        <div class="global_nav_searchField">
                            <form action="">
                                <label class="search">
                                    <input type="submit">
                                </label>
                                <input type="text" class="global_nav_searchBox" placeholder="root.com 검색하기">
                            </form>
                            <span>실시간 쇼핑 키워드</span>
                            <div class="global_nav_list_keywords">
                                <ul>
                                    <li class="active"><span class="arrow"></span><a href="">키워드 입니다</a></li>
                                    <li><span class="arrow"></span><a href="">대충 컴퓨터 부품 중 존나 긴 일므 가진애</a></li>
                                    <li><span class="arrow"></span><a href="">주방용품중에 준내 긴이름 가진놈</a></li>
                                    <li><span class="arrow"></span><a href="">티비에 나오던 음식 재료</a></li>
                                    <li><span class="arrow"></span><a href="">몸에좋은 영양 간식</a></li>
                                    <li><span class="arrow"></span><a href="">키워드 입니다</a></li>
                                    <li><span class="arrow"></span><a href="">개비싼 강아지 사료</a></li>
                                    <li><span class="arrow"></span><a href="">마우스마우스마우스마우스마우스</a></li>
                                    <li><span class="arrow"></span><a href="">키보드키보드</a></li>
                                    <li><span class="arrow"></span><a href="">스피커커피스</a></li>
                                    <li><span class="arrow"></span><a href="">준내게 긴 키워드 입니다아아아아아아</a></li>
                                    <li><span class="arrow"></span><a href="">아아아아아아아아아아아아</a></li>
                                    <li><span class="arrow"></span><a href="">플레이스테이션5</a></li>
                                    <li><span class="arrow"></span><a href="">대충 기다란 문구</a></li>
                                    <li><span class="arrow"></span><a href="">키워드 적을게 없다</a></li>
                                    <li><span class="arrow"></span><a href="">키워드 입니다</a></li>
                                    <li><span class="arrow"></span><a href="">엄</a></li>
                                    <li><span class="arrow"></span><a href="">준</a></li>
                                    <li><span class="arrow"></span><a href="">식</a></li>
                                    <li><span class="arrow"></span><a href="">엄준식은 살아있다</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="global_nav_list global_nav_cartBox">
                        <div class="global_nav_cart">
                            <div class="global_nav_cartList">
                                <h1>장바구니</h1>
                                <div class="global_nav_cartItem">
                                    <a href="">
                                        <img src="" alt="">
                                        <span>i5 4670 GTX1060 3G 본체 27인치 모니터포함 게임용 블랙 조립컴퓨터 풀세트 PC</span>
                                    </a>
                                </div>
                                <div class="global_nav_cartItem">
                                    <a href="">
                                        <img src="" alt="">
                                        <span>미니컴퓨터 AMD Ryzen 데스크탑 게임용 컴퓨터 7 5800H 5700U 5500U 윈도우 11 미니 PC DDR4
                                            16GB 512GB SS</span>
                                    </a>
                                </div>
                                <div class="global_nav_cartItem">
                                    <a href="">
                                        <img src="" alt="">
                                        <span>i5-10400F 16GB RTX 3060 Ti 게이밍컴퓨터 조립PC</span>
                                    </a>
                                </div>
                            </div>
                            <div class="global_nav_cartView">
                                <a href=""><span>장바구니 확인</span></a>
                                <span class="global_nav_itemCount">123개의 상품이 더 있습니다</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <section>
        <div>
            <h1></h1>
        </div>      
        <form action="">
            <div class="m_list_search">
                <div class="m_list_search_box">
                    <div>
                        <label class="search">
                            <input type="submit">
                        </label>
                        <input type="text" name="search_word" placeholder="root.com 검색하기">
                    </div>
                    <div>
                        <select name="" id="">
                            <option value="">인기상품순</option>
                            <option value="">정확도순</option>
                        </select>
                        <select name="" id="">
                            <option value="">10개</option>
                            <option value="">30개</option>
                            <option value="">50개</option>
                        </select>
                    </div>
                </div>
            </div>
        </form>
        <div class="m_list_search_list">
            <div class="m_list_categoris">
                
                <h2>디지털/가전</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>모바일<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>PC<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>영상가전<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>음향가전<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>생활가전<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                </ul>

                <h2>인테리어</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>수납<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>홈<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>거실<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>침실<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>침실가구<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                </ul>

                <h2>식품</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>농수산물<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>가공식품<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>제과제빵<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>음료<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>건강식품<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                </ul>

                <h2>의류</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>상의<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>하의<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>아우터<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>신발<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>이너웨어<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                </ul>

                <h2>생활</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>취미<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>잡화<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>주방<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>사무<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                    <li class="m_list_categori">
                        <h4>공구<span class="arrow_small"></span></h4>
                        <ul>
                            <li><span>기기</span></li>
                            <li><span>액세서리</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                            <li><span>주변기기</span></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="m_list_items">
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
                <div class="m_list_item">
                    <div class="m_list_item_info">
                        <img src="../resources/css/img/test/28209617_1.png" alt="">
                        <div class="m_list_star_box">
                            <span class="m_list_star empty"></span>
                            <span class="m_list_star full"></span>
                        </div>
                        <h4>APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)</h4>
                        <h5>₩ 2,374,990</h5>
                        <h6>등록일 : 2023.09 | 판매몰 : 142</h6>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>
    </footer>

    <script>
        const mListSubcateH4 = document.querySelectorAll('.m_list_categori>h4');
        mListSubcateH4.forEach(sch4 => {
            sch4.addEventListener('click', () => {
                if (sch4.classList.contains('active')) {
                    sch4.classList.remove('active');
                    ulOpen(sch4)
                } else {
                    sch4.classList.add('active');
                    ulOpen(sch4)

                }
            })
        })

        function ulOpen(h4) {
            let ch4Li = h4.nextElementSibling.querySelectorAll(':scope>li');

            if (h4.classList.contains('active')) {
                let allHeight = 0;
                for (let i = 0; i < ch4Li.length; i++) {
                    allHeight += parseInt(window.getComputedStyle(ch4Li[i]).getPropertyValue('height'));
                }
                h4.nextElementSibling.style.height = `${allHeight}px`;
            } else {
                h4.nextElementSibling.style.height = '0px';
            }
        }
    </script>
</body>

</html>