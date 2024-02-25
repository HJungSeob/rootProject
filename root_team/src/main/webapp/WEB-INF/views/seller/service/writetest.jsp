<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <style>
        #content {
            width: 1000px;
            margin: 0 auto;
        }

        #btnDiv {
            text-align: center;
            margin-top: 20px;
        }

        .btns {
            display: inline-block;
            padding: 0 10px;
            height: 28px;
            line-height: 26px;
            text-align: center;
            vertical-align: middle;
            border-radius: 3px;
            border: 1px solid transparent;
            font-weight: 500;
        }

        .btns.save {
            background: #139dc8;
            color: #fff;
            cursor: pointer;
        }

        .btns.back {
            background: #fff;
            border: 1px solid #199bc4;
            color: #199bc4;
        }
    </style>
</head>

<body>
    <h2 style="text-align: center;">Hello, TOAST UI Editor!</h2>

    <!-- 에디터를 적용할 요소 (컨테이너) -->
    <div id="content">

    </div>

    <div id="btnDiv">
        <button type="button" class="btns save" onclick="savePost();">저장하기</button>
        <a href="/post/list.html" class="btns back">뒤로 가기</a>
    </div>
    <!-- TUI 에디터 JS CDN -->

    <script>
        const editor = new toastui.Editor({
            el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
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

        // 게시글 저장
        async function savePost() {
            // 1. 콘텐츠 입력 유효성 검사
            if (editor.getMarkdown().length < 1) {
                alert('에디터 내용을 입력해 주세요.');
                throw new Error('editor content is required!');
            }

            // 2. url, parameter 세팅
            const url = '${pageContext.request.contextPath}/item/writeProcess.do';
            const params = {
            	i_name: '1번 상품명',
                i_explain: editor.getHTML()
            }

            // 3. API 호출
            try {
                const response = await fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(params)
                });
                location.href = '${pageContext.request.contextPath}/index.do';
            } catch (error) {
                console.error('저장 실패 : ', error)
            }
        }
    </script>
</body>

</html>