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

         var a = ['전체', '휴대폰', '영상가전', 'PC', '음향가전', '생활가전'];
         var b = ['전체', '수납', '홈', '거실', '침구', '침실가구'];
         var c = ['전체', '농수산물', '가공식품', '제과제빵', '음료', '건강식품'];
         var d = ['전체', '상의', '하의', '아우터', '신발', '이너웨어'];
         var e = ['전체', '취미', '잡화', '주방', '사무', '공구'];
         var z = ['전체'];

         if (largeCategorySelect.value == "a") var f = a;
         else if (largeCategorySelect.value == "b") var f = b;
         else if (largeCategorySelect.value == "c") var f = c;
         else if (largeCategorySelect.value == "d") var f = d;
         else if (largeCategorySelect.value == "e") var f = e;
         else if (largeCategorySelect.value == "z") var f = z;

         smallCategorySelect.options.length = 0;

         // "선택하세요" 옵션 추가
         var defaultOption = document.createElement("option");
         defaultOption.value = "0";
         defaultOption.selected = true;
         defaultOption.disabled = true;
         defaultOption.hidden = true;
         defaultOption.innerHTML = "분류를 선택하세요.";
         smallCategorySelect.appendChild(defaultOption);

         for (x in f) {
             var opt = document.createElement("option");
             opt.value = f[x];
             opt.innerHTML = f[x];
             smallCategorySelect.appendChild(opt);
         }
     });
     
 }
 // #endregion