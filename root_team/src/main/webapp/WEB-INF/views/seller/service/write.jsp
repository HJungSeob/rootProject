<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/font.css">
    <link rel="stylesheet" href="../resources/css/icon.css">
    <link rel="stylesheet" href="../resources/css/global.css">
    <script src="../resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
        $(function () {

            function isImageFile(file) {
                var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
                if ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) {
                    alert("이미지 파일만 등록할 수 있습니다.")
                    return false;
                } else {
                    return true;
                }
            }

            function isOverSize(file) {
                var maxSize = 3 * 1024 * 1024; // 3MB로 제한 
                if (file.size > maxSize) {
                    alert("3MB 이하의 파일만 등록할 수 있습니다.")
                    return false;
                } else {
                    return true;
                }
            }

            var counter = $('.imgfile').length; // 이미 생성된 file 태그의 개수

            // 추가 버튼 클릭 시 이벤트 처리
            $("#btn-addItemImg").on("click", function () {
                if (counter < 5) {
                    var newInputId = "imageFile" + counter; // 새로 생성할 file 태그의 id
                    var newPreviewClass = "preview"; // 새로 생성할 미리보기 이미지의 클래스

                    // 새로운 파일 입력란 생성
                    var newInput = $('<input type="file" id="' + newInputId + '"name="i_img' +
                    	counter + '" class="imgfile">');
                    $(".wrap section form").append(newInput);

                    // 새로운 레이블과 미리보기 이미지 생성
                    var newLabel = $('<label for="' + newInputId + '"><img class="' + newPreviewClass +
                        '"></label>');
                    $(".wrap section .itemimgbox").append(newLabel);

                    // 새로운 버튼과 미리보기 이미지 생성
                    var newButton = $('<button class="' + newInputId + '"><img class="' +
                        newPreviewClass + '"></button>');
                    $(".buttonImg").append(newButton);

                    // 파일 입력란의 change 이벤트 처리
                    $("#" + newInputId).on("change", function (event) {
                        var file = event.target.files[0];
                        if (isImageFile(file) && isOverSize(file)) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $('label[for="' + newInputId + '"]').find('.preview').attr(
                                    "src", e.target.result);
                                $('button[class="' + newInputId + '"]').find('.preview')
                                    .attr(
                                        "src", e.target.result);
                            }
                            reader.readAsDataURL(file);
                        }
                    });
                    $(".itemimgbox").css("width", 600 * (counter + 1) + "px");
                    $('button[class="' + newInputId + '"]').trigger('click');
                    counter++; // 카운터 증가
                } else {
                    alert("상품 이미지는 최대 5개까지 등록할 수 있습니다.")
                }
            });

            $("#btn-removeItemImg").on("click", function () {
                if (counter > 0) {
                    var lastInputId = "imageFile" + (counter - 1);
                    $("#" + lastInputId).remove();
                    $('label[for="' + lastInputId + '"]').remove();
                    $('button[class="' + lastInputId + '"]').remove();
                    $(".itemimgbox").css("width", 600 * (counter - 1) + "px");
                    $('button[class="imageFile' + (counter - 2) + '"]').trigger('click');
                    counter--;
                } else {
                    alert("삭제할 이미지가 없습니다.");
                }
            });

            $(".buttonImg").on("click", "button", function () {
                var buttonClass = $(this).attr("class"); // 클릭한 버튼의 클래스 이름 가져오기
                var associatedInput = $('label[for="' + buttonClass + '"]'); // label 태그 찾기
                $(".buttonImg button").css({
                    'border': '2px solid #F2F2F2'
                });
                $(this).css({
                    'border': '2px solid black'
                });
                $("label").each(function () {
                    // label 안에 img 태그가 있는 경우에만 숨김
                    if ($(this).find('img').length > 0) {
                        $(this).hide();
                    }
                });
                associatedInput.show();
            });


            $('#largeCategory').change(function () {
                var largeCategorySelect = $('#largeCategory');
                var smallCategorySelect = $('#smallCategory');
                var hiddenInput = $('#categoryidx');
                hiddenInput.val('0');
                var a = ['휴대폰', '영상가전', 'PC', '음향가전', '생활가전'];
                var b = ['수납', '홈', '거실', '침구', '침실가구'];
                var c = ['농수산물', '가공식품', '제과제빵', '음료', '건강식품'];
                var d = ['상의', '하의', '아우터', '신발', '이너웨어'];
                var e = ['취미', '잡화', '주방', '사무', '공구'];

                var f;
                switch (largeCategorySelect.val()) {
                    case "a":
                        f = a;
                        break;
                    case "b":
                        f = b;
                        break;
                    case "c":
                        f = c;
                        break;
                    case "d":
                        f = d;
                        break;
                    case "e":
                        f = e;
                        break;
                    default:
                        f = [];
                }

                smallCategorySelect.empty();

                // "분류를 선택하세요" 옵션 추가
                var defaultOption = $(
                    "<option value='0' selected disabled hidden>===== 선택 =====</option>");
                smallCategorySelect.append(defaultOption);

                $.each(f, function (index, value) {
                    if (f === a) {
                        var opt = $("<option></option>").attr("value", index + 1).text(value);
                    } else if (f === b) {
                        var opt = $("<option></option>").attr("value", index + 6).text(value);
                    } else if (f === c) {
                        var opt = $("<option></option>").attr("value", index + 11).text(value);
                    } else if (f === d) {
                        var opt = $("<option></option>").attr("value", index + 16).text(value);
                    } else if (f === e) {
                        var opt = $("<option></option>").attr("value", index + 21).text(value);
                    }

                    smallCategorySelect.append(opt);
                });

                smallCategorySelect.change(function () {
                    var selectedValue = $(this).val();
                    hiddenInput.val(selectedValue); // hidden input의 값 설정
                });
            });

            var selectCount = 0; // 현재 생성된 itemoption의 개수
            var parentOptionCounts = [];
            // btn-addSelect 버튼 클릭 시 itemoption 추가
            $("#btn-addSelect").click(function () {
                if (selectCount < 5) {
                    if (!parentOptionCounts[selectCount]) {
                        parentOptionCounts[selectCount] = 2; // 해당 부모 요소의 optionCount가 없으면 초기화
                    }
                    var newOption = "<div class='itemoption" + selectCount + "'>" +
                        "<h4></h4>" +
                        "<select>" +
                        "<option value='0' selected disabled hidden>===== 선택 =====</option>" +
                        "<option class='thisitmeoption0'></option>" +
                        "<option class='thisitmeoption1'></option>" +
                        "</select>" +
                        "</div>";
                    var newButtons = "<div class='itemoption itemoption" + selectCount + "'>" +
                        "<div class='itemoptioninfo'>" +
                        "<input type='text' class='itemoptionname' id='itemoptionname" + selectCount +
                        "' placeholder='옵션명을 입력해 주세요.'>" +
                        "<input type='text' class='thisitmeoption0" +
                        "' placeholder='세부옵션을 입력해 주세요.'>" +
                        "<input type='text' class='thisitmeoption1" +
                        "' placeholder='세부옵션을 입력해 주세요.'>" +
                        "</div>" +
                        "<input type='button' class='btn-removeOption remove' value='-'>" +
                        "<input type='button' class='btn-addOption add' value='+'>" +
                        "</div>";
                    var newInput = $("<input type='hidden' id='itemoption" + selectCount +
                        "' name='i_option" +
                        selectCount + "'>");
                    $(".wrap section form").append(newInput);
                    $('.hiddenoptions').append(newOption);
                    $(".wrap section .itemoptionsinput").append(newButtons);
                    selectCount++;
                } else {
                    alert("옵션은 최대 5개까지 추가할 수 있습니다.")
                }
            });

            $("#btn-removeSelect").click(function () {
                if (selectCount > 0) {
                    var lastOptiontClass = "itemoption" + (selectCount - 1);
                    $("." + lastOptiontClass).remove();
                    $("#" + lastOptiontClass).remove();
                    if (parentOptionCounts[(selectCount - 1)]) {
                        parentOptionCounts[(selectCount - 1)] = 2;
                    }
                    selectCount--;
                } else {
                    alert("삭제할 옵션이 없습니다.");
                }
            });


            $(document).on("click", ".btn-addOption", function () {
                var parent = $(this).parent(); // 각 버튼의 부모 요소를 찾음
                var parentIndex = $('.itemoption').index(parent);
                var parentClass = 'itemoption' + parentIndex;
                // 해당 클래스명과 같은 클래스를 가지고 있는 hiddenoptions 내의 셀렉트 박스에 옵션 추가
                if (parentOptionCounts[parentIndex] < 5) {
                    $(".hiddenoptions ." + parentClass + " select").append(
                        "<option class='thisitmeoption" +
                        parentOptionCounts[parentIndex] + "'></option>");
                    $(this).parent().children(".itemoptioninfo").append(
                        "<input type='text' class='thisitmeoption" +
                        parentOptionCounts[parentIndex] + "' placeholder='세부옵션을 입력해 주세요.'>")
                    parentOptionCounts[parentIndex]++;
                } else {
                    alert("세부옵션은 최대 5개까지 추가할 수 있습니다.")
                }
            });

            $(document).on("click", ".btn-removeOption", function () {
                var parent = $(this).parent(); // 각 버튼의 부모 요소를 찾음
                var parentIndex = $('.itemoption').index(parent);
                var parentClass = 'itemoption' + parentIndex;
                if (parentOptionCounts[parentIndex] > 2) {
                    parentOptionCounts[parentIndex]--; // 해당 부모 요소의 optionCount를 감소                   
                    // 해당 클래스명을 가진 hiddenoptions 내의 셀렉트 박스에서 마지막 옵션을 제거
                    $(".hiddenoptions ." + parentClass + " select .thisitmeoption" + parentOptionCounts[
                        parentIndex]).remove();
                    // 해당 클래스명을 가진 itemoptioninfo 내의 텍스트 입력 필드를 제거
                    parent.children(".itemoptioninfo").children(".thisitmeoption" + parentOptionCounts[
                        parentIndex]).remove();
                } else {
                    alert("최소 2개의 세부옵션이 필요합니다.")
                }
            });

            $(document).on("input", ".itemoptionname", function () {
                var inputValue = $(this).val(); // 입력받은 값
                // 부모의 부모 div 요소의 클래스 리스트
                var parentDivClasses = $(this).parent().parent().attr('class').split(' ');
                // itemoption 클래스를 제외한 클래스명 가져오기
                var filteredClasses = parentDivClasses.filter(function (className) {
                    return className !== 'itemoption';
                });
                var parentDivClass = filteredClasses.join(' '); // 필터링된 클래스명
                // 클래스명이 같은 div 내의 h4 태그에 입력받은 값 삽입
                $("div." + parentDivClass + " h4").text(inputValue);

            });

            $(document).on("input", "input:not(.itemoptionname)", function () {
                var inputValue = $(this).val(); // 입력받은 값
                var parentDivClasses = $(this).parent().parent().attr('class').split(' ');
                // 부모의 부모 div 요소의 클래스 리스트

                // itemoption 클래스를 제외한 클래스명 가져오기
                var filteredClasses = parentDivClasses.filter(function (className) {
                    return className !== 'itemoption';
                });
                var parentDivClass = filteredClasses.join(' '); // 필터링된 클래스명

                // 부모의 부모 div와 같은 클래스명을 가진 div 내에서 현재 input 요소와 동일한 클래스명을 가진 option 태그를 찾아서 값 설정
                var option = $("div." + parentDivClass + " option." + $(this).attr('class'));
                option.val(inputValue); // option 태그의 값 변경
                option.text(inputValue); // option 태그의 텍스트 변경
            });


            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

            const editor = new toastui.Editor({
                el: document.querySelector('#editer_content'), // 에디터를 적용할 요소 (컨테이너)
                height: '1000px', // 에디터 영역의 높이 값 (OOOpx || auto)
                initialEditType: 'wysiwyg', // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
                initialValue: '', // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
                previewStyle: 'tab', // 마크다운 프리뷰 스타일 (tab || vertical)
                placeholder: '내용을 입력해 주세요.',
                /* start of hooks */
                hooks: {
                    async addImageBlobHook(blob, callback) { // 이미지 업로드 로직 커스텀
                        try {

                            const formData = new FormData();
                            formData.append('image', blob);

                            // 2. FileApiController - uploadEditorImage 메서드 호출
                            const response = await fetch(
                                '${pageContext.request.contextPath}/tui-editor/image-upload.do', {
                                    method: 'POST',
                                    body: formData,
                                });

                            // 3. 컨트롤러에서 전달받은 디스크에 저장된 파일명
                            const filename = await response.text();

                            // 4. addImageBlobHook의 callback 함수를 통해, 디스크에 저장된 이미지를 에디터에 렌더링
                            const imageUrl =
                                `${pageContext.request.contextPath}/tui-editor/image-print.do?filename=` +
                                filename;
                            callback(imageUrl, 'image alt attribute');

                        } catch (error) {
                            console.error('업로드 실패 : ', error);
                        }
                    }
                }
                /* end of hooks */
            });

            $('form').submit(function (event) {
                var editerHTML = editor.getHTML();
                $('.hiddenoptions div').each(function () {
                    var divId = $(this).attr('class');
                    $('#' + divId).val($(this).html());               
                });
                document.getElementById('itemexplain').value = editerHTML;
            });

        });
    </script>
    <style>
        section {
            box-sizing: border-box;
            width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #F2F2F2;
        }

        .itemcategory {
            box-sizing: border-box;
            width: 150px;
            font-size: 16px;
            margin-bottom: 10px;
            border: 0;
            padding: 5px;
            font-weight: bold;
        }

        option {
            font-weight: bold;
        }

        form input[type="text"] {
            display: block;
            margin-bottom: 10px;
            padding: 5px 10px;
            border: 0;
            font-weight: bold;
        }

        .itemtitle {
            box-sizing: border-box;
            width: 960px;
            font-size: 32px;
        }

        .itemprice {
            box-sizing: border-box;
            width: 400px;
            font-size: 16px;
        }

        .arrow_small {
            width: 18px;
            height: 18px;
            background-size: 18px;
            rotate: -90deg;
            vertical-align: middle;
            filter: invert(0%) sepia(1%) saturate(2514%) hue-rotate(223deg) brightness(0%) contrast(87%);
        }

        input[type="file"],
        input[type="submit"] {
            display: none;
        }

        .iteminfo {
            display: flex;
        }

        .itemimgbox label {
            box-sizing: border-box;
            display: inline-block;
            vertical-align: top;
            background-color: white;
            width: 600px;
            height: 600px;
            background-image: url(../resources/css/img/add-icon.png);
            background-position: center;
            background-size: 150px;
            background-repeat: no-repeat;
            cursor: pointer;
            transition: 0.5s;
        }

        .itemimgbox .preview {
            box-sizing: border-box;
            width: 600px;
            height: 600px;

        }

        .buttonImg button {
            box-sizing: content-box;
            width: 64px;
            height: 64px;
            border: 2px solid #F2F2F2;
            background-color: white;
            background-image: url(../resources/css/img/add-icon.png);
            background-position: center;
            background-size: 14px;
            background-repeat: no-repeat;
            cursor: pointer;
            margin: 0 5px;
        }


        .buttonImg .preview {
            box-sizing: border-box;
            width: 100%;
            height: 100%;
        }

        .imgbox {
            box-sizing: border-box;
            width: 600px;
            height: 600px;
            font-size: 0;
            overflow: hidden;
            background-color: white;
            background-image: url(../resources/css/img/noimg.png);
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
        }

        .itemimgbox {
            box-sizing: border-box;
            display: inline-block;
            vertical-align: top;
            height: 600px;
        }

        .itemImgButton {
            box-sizing: border-box;
            margin: 20px 0;
            display: inline-block;
            width: 600px;
            height: 64px;
            font-size: 0;
            display: flex;
            justify-content: center;
        }

        .itemImgButton input[type="button"] {
            box-sizing: border-box;
            margin: 0 5px;
            width: 64px;
            height: 64px;
            border: 0;
            font-size: 32px;
            font-weight: bold;
            background-color: white;
            cursor: pointer;
            transition: background-color 0.5s, color 0.2s;
        }

        input[type="button"].add:hover {
            color: white;
            background-color: #a1c2e2;
        }

        input[type="button"].remove:hover {
            color: white;
            background-color: #ffb1b1;
        }

        .itemoptions {
            box-sizing: border-box;
            width: 360px;
            height: 700px;
            padding-left: 10px;
            font-size: 0;
            overflow: hidden;
        }

        .itemoptionsbox {
            height: 662px;
            overflow-x: hidden;
            overflow-y: scroll;
        }

        .itemoptionsbox::-webkit-scrollbar {
            width: 10px;
        }

        .itemoptionsbox::-webkit-scrollbar-thumb {
            background-color: transparent;
            border-radius: 10px;
            background-clip: padding-box;
            border: 2px solid transparent;
        }

        .itemoptionsbox::-webkit-scrollbar-track {
            background-color: transparent;
            border-radius: 10px;
        }

        .itemoptions h4 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .itemOptionButton {
            width: 148px;
            margin: 0 auto;
        }

        .itemOptionButton>input[type="button"] {
            box-sizing: border-box;
            margin: 0 5px;
            width: 64px;
            height: 64px;
            border: 0;
            font-size: 32px;
            font-weight: bold;
            background-color: white;
            cursor: pointer;
            transition: background-color 0.5s, color 0.2s;
        }

        .hiddenoptions {
            display: none;
        }

        .itemoption {
            box-sizing: border-box;
            width: 350px;
            padding: 0 0 20px;
        }

        .itemoption>input[type="button"] {
            box-sizing: border-box;
            width: 175px;
            height: 20px;
            border: 0;
            font-weight: bold;
            background-color: white;
            cursor: pointer;
            transition: background-color 0.5s, color 0.2s;
        }


        .itemoptioninfo>input[type="text"] {
            box-sizing: border-box;
            width: 350px;
            font-size: 16px;
            border: 0;
            font-weight: bold;
            padding: 10px;
        }

        .itemoptioninfo>.itemoptionname {
            margin-bottom: 10px;
        }

        .editer_box {
            margin: 20px 0;
        }

        .editer_box h2 {
            margin-bottom: 10px;
        }

        .item_write_btns {
            float: right;
            height: 100px;
        }

        label[for="item_submit_btn"] span {
            box-sizing: border-box;
            display: inline-block;
            width: 100px;
            line-height: 50px;
            font-weight: bold;
            text-align: center;
            background-color: white;
            cursor: pointer;
            transition: background-color 0.5s, color 0.2s;
        }

        label[for="item_submit_btn"] span:hover {
            background-color: #0071E3;
            color: white;
        }

        #item_reset_btn,
        #item_cancel_btn {
            box-sizing: border-box;
            display: inline-block;
            width: 100px;
            line-height: 50px;
            font-weight: bold;
            text-align: center;
            background-color: #C3C3C3;
            cursor: pointer;
            transition: background-color 0.5s, color 0.2s;
        }

        #item_reset_btn:hover,
        #item_cancel_btn:hover {
            background-color: #444444;
            color: #C3C3C3;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="wrap">
        <%@include file="../common/header.jsp" %>
        <section>
            <select name="" id="largeCategory" class="itemcategory">
                <option value='0' selected disabled hidden>===== 선택 =====</option>
                <option value="a">디지털/가전</option>
                <option value="b">인테리어</option>
                <option value="c">식품</option>
                <option value="d">의류</option>
                <option value="e">생활</option>
            </select>
            <span class="arrow_small"></span>
            <select name="" id="smallCategory" class="itemcategory">
                <option value='0' selected disabled hidden>===== 선택 =====</option>
            </select>
            <span class="arrow_small"></span>

            <!-- --------------------------------------------------------------------------------------- -->
            <form method="post" action="writeProcess.do" enctype="multipart/form-data">
                <input type="hidden" name="c_idx" id="categoryidx">
                <input type="hidden" name="s_idx" id="categoryidx" value="${seller.s_idx}">
                <input type="hidden" name="i_explain" id="itemexplain">              
                <input type="text" name="i_name" class="itemtitle" placeholder="상품명을 입력해 주세요.">
                <input type="text" name="i_price" class="itemprice" placeholder="가격을 입력해 주세요.">
                <input type="text" name="i_count" class="itemprice" placeholder="상품 수량을 입력해 주세요.">
                <input type="submit" id="item_submit_btn">
            </form>
            <!-- --------------------------------------------------------------------------------------- -->
            <div class="iteminfo">
                <div>
                    <div class="imgbox">
                        <div class="itemimgbox">
                        </div>
                    </div>
                    <div class="itemImgButton">
                        <div class="buttonImg">
                        </div>
                        <input type="button" id="btn-removeItemImg" class="remove" value="-">
                        <input type="button" id="btn-addItemImg" class="add" value="+">
                    </div>
                </div>
                <div class="itemoptions">
                    <h4>옵션</h4>
                    <div class="itemoptionsbox">
                        <div class="hiddenoptions">
                        </div>
                        <div class="itemoptionsinput">
                        </div>
                        <div class="itemOptionButton">
                            <input type="button" id="btn-removeSelect" class="remove" value="-">
                            <input type="button" id="btn-addSelect" class="add" value="+">
                        </div>
                    </div>
                </div>
            </div>
            <div class="editer_box">
                <h2 style="text-align: center;">상품 상세 정보</h2>
                <div id="editer_content">
                </div>
            </div>
            <div class="item_write_btns">
                <label for="item_submit_btn">
                    <span>등록</span>
                </label>
                <a id="item_reset_btn" href="">초기화</a>
                <a id="item_cancel_btn" href="">취소</a>
            </div>
        </section>
    </div>
    <footer>
            <%@ include file="../../buyer/common/global_footer.jsp" %>
        </footer>

</body>

</html>
</body>

</html>