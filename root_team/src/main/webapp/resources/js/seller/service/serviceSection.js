 // #region 체크박스 전체 선택
//  function checkbox() {
//      const selectAllCheckbox = document.getElementById('all');
//      const individualCheckboxes = document.querySelectorAll('.restCheckBox');

//      // 전체 선택 체크박스가 변경될 때 이벤트 처리
//      selectAllCheckbox.addEventListener('change', function () {
//          // 전체 선택 체크박스의 상태에 따라 개별 체크박스들의 상태 변경
//          individualCheckboxes.forEach(checkbox => {
//              checkbox.checked = selectAllCheckbox.checked;
//          });
//      });

//      // 개별 체크박스 중 하나라도 변경될 때 이벤트 처리
//      individualCheckboxes.forEach(checkbox => {
//          checkbox.addEventListener('change', function () {
//              // 개별 체크박스 중 하나라도 해제되면 전체 선택 체크박스도 해제
//              if (!checkbox.checked) {
//                  selectAllCheckbox.checked = false;
//              } else {
//                  // 모든 개별 체크박스가 선택되었을 때 전체 선택 체크박스도 선택
//                  const allChecked = Array.from(individualCheckboxes).every(checkbox => checkbox.checked);
//                  if (allChecked) {
//                      selectAllCheckbox.checked = true;
//                  }
//              }
//          });
//      });
//  }
 // #endregion

 // #region 카테고리 분류
 // 대분류 선택 시 실행되는 함수
 
function classification() {
    document.getElementById('largeCategory').addEventListener('change', function () {
        var largeCategorySelect = document.getElementById('largeCategory');
        var smallCategorySelect = document.getElementById('smallCategory');

        // 대분류에 따른 중분류 매핑
        var categoryMap = {
            "a": { "전체": 0, "휴대폰": 1, "영상가전": 2, "PC": 3, "음향가전": 4, "생활가전": 5 },
            "b": { "전체": 0, "수납": 6, "홈": 7, "거실": 8, "침구": 9, "침실가구": 10 },
            "c": { "전체": 0, "농수산물": 11, "가공식품": 12, "제과제빵": 13, "음료": 14, "건강식품": 15 },
            "d": { "전체": 0, "상의": 16, "하의": 17, "아우터": 18, "신발": 19, "이너웨어": 20 },
            "e": { "전체": 0, "취미": 21, "잡화": 22, "주방": 23, "사무": 24, "공구": 25 }
        };

        var selectedCategory = largeCategorySelect.value;
        var f = categoryMap[selectedCategory] || { "전체": 0 };

        smallCategorySelect.options.length = 0;

        // "분류를 선택하세요." 옵션 추가
        var defaultOption = document.createElement("option");
        defaultOption.value = "0";
        defaultOption.selected = true;
        defaultOption.disabled = true;
        defaultOption.hidden = true;
        defaultOption.innerHTML = "분류를 선택하세요.";
        smallCategorySelect.appendChild(defaultOption);

        for (var categoryName in f) {
            var categoryId = f[categoryName];
            var opt = document.createElement("option");
            opt.value = categoryId;
            opt.innerHTML = categoryName;
            smallCategorySelect.appendChild(opt);
        }
    });
}
 // #endregion