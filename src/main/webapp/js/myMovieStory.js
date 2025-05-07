document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll('.tab');
    const contents = document.querySelectorAll('.content');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            // 모든 탭에서 active 제거
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');

            // 모든 콘텐츠 숨김
            contents.forEach(content => content.classList.remove('active'));

            // 클릭한 탭에 해당하는 콘텐츠 활성화
            const target = tab.getAttribute('data-target');
            const targetContent = document.getElementById(target);
            if (targetContent) {
                targetContent.classList.add('active');
            }

            console.log(`Active tab: ${target}`); // 디버깅 로그
        });
    });
});


const tabButtons = document.querySelectorAll('.YearTab');
const tabPanels = document.querySelectorAll('.YearContent');
const prevButton = document.querySelector('.arrow.prev');
const nextButton = document.querySelector('.arrow.next');
let currentIndex = 0;

// 탭 및 화살표 전환
function activateTab(index) {
    tabButtons[currentIndex].classList.remove('active');
    tabPanels[currentIndex].classList.remove('active');
    tabButtons[index].classList.add('active');
    tabPanels[index].classList.add('active');
    currentIndex = index;
    console.log("click");

    // 화살표 상태 업데이트
    prevButton.disabled = index === 0;
    nextButton.disabled = index === tabButtons.length - 1;
    prevButton.style.opacity = prevButton.disabled ? '0.5' : '1';
    nextButton.style.opacity = nextButton.disabled ? '0.5' : '1';
}

// 탭 클릭 이벤트
tabButtons.forEach((button, index) =>
    button.addEventListener('click', () => activateTab(index))

);

// 화살표 클릭 이벤트
prevButton.addEventListener('click', () => activateTab(currentIndex - 1));
nextButton.addEventListener('click', () => activateTab(currentIndex + 1));

// // 초기 상태
activateTab(3);