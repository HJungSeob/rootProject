 // #region 막대그래프

 function barGraph () {
    const sellerMainContentsGraphBox = document.querySelector(".seller_main_contents_graph_box");
    const sellerMainMontentsGraphTitle = document.querySelector(
        ".seller_main_contents_graph_title>div");

    // 데이터는 db에서 받아올 예정
    const data = [10000, 20059, 15150, 30000, 25840, 18140, 12540, 26580, 23150, 19120, 21480, 32130,
        29700, 23400, 15530, 28330, 23320, 11650, 24510, 34220, 38411
    ];

    // 최대 데이터 값 계산
    const maxData = Math.max(...data);

    // 툴팁 엘리먼트 생성 및 스타일 적용
    // const tooltip = document.createElement("div");
    // tooltip.classList.add("tooltip");
    // sellerMainContentsGraphBox.appendChild(tooltip);

    // 그래프 그리기
    data.forEach((value, index) => {
        const bar = document.createElement("div");
        const heightPercentage = (value / maxData) * 100;

        bar.style.height = `${heightPercentage}%`;

        // 추가적인 스타일 및 클래스를 지정할 수 있습니다.
        bar.classList.add("bar");
        bar.setAttribute("name", `₩ ${value.toLocaleString()}`);

        sellerMainContentsGraphBox.appendChild(bar);
    });

};

// #endregion

// #region 그래프 날짜 업데이트
function graphDate() {
    const sellerMainContentsGraphDate = document.querySelector(".seller_main_contents_graph_date");

    // 자정에 날짜를 갱신하는 함수
    function midnightUpdate() {
        // 현재 시간 가져오기
        const currentTime = new Date();
        const currentHours = currentTime.getHours();
        const currentMinutes = currentTime.getMinutes();

        // 자정일 때만 날짜 갱신
        if (currentHours === 0 && currentMinutes === 0) {
            updateDates();
        }
    }

    // 주기적으로 자정 감지
    setInterval(midnightUpdate, 1000 * 60); // 1분마다 확인

    // 날짜 갱신 함수
    function updateDates() {
        // 오늘 날짜 가져오기
        const today = new Date();

        // 그래프에 표시할 날짜들 계산
        const dateArray = [];
        for (let i = 20; i >= 0; i--) {
            const currentDate = new Date(today);
            currentDate.setDate(today.getDate() - i);

            // 만약 오늘이 1일이고 i가 0이 아니라면 (오늘이면) 이전 달의 마지막 날로 설정
            if (today.getDate() === 1 && i !== 0) {
                const lastDayOfPrevMonth = new Date(today.getFullYear(), today.getMonth(), 0);
                currentDate.setDate(lastDayOfPrevMonth.getDate() - (20 - i));
            }

            const dateString = (i === 0) ? "오늘" : String(currentDate.getDate());
            dateArray.push(dateString);
        }

        // 그래프에 날짜 출력
        sellerMainContentsGraphDate.innerHTML = ""; // 기존 내용 지우기
        dateArray.forEach(date => {
            const dateElement = document.createElement("span");
            dateElement.textContent = date;
            sellerMainContentsGraphDate.appendChild(dateElement);
        });
    }

    // 초기 로드 시 날짜 표시 함수 호출
    updateDates();
}
// #endregion

 // #region 새로고침 날짜 및 시간
 function updateTimestamp() {
    const sellerMainContentsTime = document.querySelector(".seller_main_contents_time > span");

    const currentDate = new Date();
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, "0");
    const day = String(currentDate.getDate()).padStart(2, "0");
    const hours = String(currentDate.getHours()).padStart(2, "0");
    const minutes = String(currentDate.getMinutes()).padStart(2, "0");

    const formattedTimestamp = `${year}-${month}-${day} ${hours}:${minutes} 기준`;

    sellerMainContentsTime.textContent = formattedTimestamp;
}

updateTimestamp();

window.addEventListener("load", function () {
    updateTimestamp();
});
// #endregion