<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 모달 오버레이 -->
<div id="modal-overlay" class="modal-overlay">
    <div class="modal-container">
        <iframe src="login.jsp" frameborder="0" style="width: 100%; height: 400px;"></iframe>
        <span class="modal-close" id="modal-close">X</span>
    </div>
</div>
<script>
  document.addEventListener("DOMContentLoaded", () => {
    const modalOverlay = document.getElementById("modal-overlay");
    const closeModalBtn = document.getElementById("modal-close");
    const openModalBtn = document.getElementById("open-modal-btn");

    // 모달 열기
    if (openModalBtn) {
      openModalBtn.addEventListener("click", (event) => {
        event.preventDefault(); // 기본 동작 방지
        modalOverlay.style.display = "block"; // 모달 열기
      });
    }

    // X 버튼 클릭 시 모달 닫기
    if (closeModalBtn) {
      closeModalBtn.addEventListener("click", () => {
        modalOverlay.style.display = "none"; // 모달 닫기
        // URL에서 # 제거
        history.pushState("", document.title, window.location.pathname);
      });
    }

    // 모달 외부 클릭 방지
    modalOverlay.addEventListener("click", (event) => {
      if (event.target === modalOverlay) {
        // 아무 동작하지 않음 (외부 클릭 무시)
        event.stopPropagation();
      }
    });
  });
</script>