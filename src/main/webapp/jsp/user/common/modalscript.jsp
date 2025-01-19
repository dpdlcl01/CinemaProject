<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 모달 오버레이 -->
<div id="modal-overlay" class="modal-overlay">
    <div class="modal-container">
        <iframe id="modal-iframe" src="" frameborder="0" style="width: 100%; height: 100%;"></iframe>
        <span class="modal-close" id="modal-close">X</span>
    </div>
</div>
<script>
  document.addEventListener("DOMContentLoaded", () => {
    const modalOverlay = document.getElementById("modal-overlay");
    const modalIframe = document.getElementById("modal-iframe");
    const closeModalBtn = document.getElementById("modal-close");
    const openModalBtn = document.getElementById("member-login-btn");
    const openModalBtn2 = document.getElementById("login-btn");
    const modalContainer = document.querySelector(".modal-container");


    // 회원로그인 모달 열기
    if (openModalBtn) {
      openModalBtn.addEventListener("click", (event) => {
        event.preventDefault(); // 기본 동작 방지
        modalContainer.style.height = "400px"; // 높이 설정
        modalOverlay.style.display = "block"; // 모달 열기
        modalIframe.src = "${pageContext.request.contextPath}/jsp/user/login/memberLoginModal.jsp";
      });
    }

    // 회원, 비회원 로그인 모달열기
    if (openModalBtn2) {
      openModalBtn2.addEventListener("click", (event) => {
        event.preventDefault(); // 기본 동작 방지
        modalContainer.style.height = "480px"; // 높이 설정
        modalOverlay.style.display = "block"; // 모달 열기
        modalIframe.src = "${pageContext.request.contextPath}/jsp/user/login/reservationLoginModal.jsp"
      });
    }


    // X 버튼 클릭 시 모달 닫기
    if (closeModalBtn) {
      closeModalBtn.addEventListener("click", () => {
        modalOverlay.style.display = "none"; // 모달 닫기
        modalIframe.src = "";
        // URL에서 # 제거
        history.pushState("", document.title, window.location.pathname);
        history.back();
      });
    }

    // 브라우저 뒤로가기 또는 히스토리 변경 시 모달 닫기
    window.addEventListener("popstate", () => {
      modalOverlay.style.display = "none";
      modalIframe.src = "";
    });

    // 모달 외부 클릭 방지
    modalOverlay.addEventListener("click", (event) => {
      if (event.target === modalOverlay) {
        // 아무 동작하지 않음 (외부 클릭 무시)
        event.stopPropagation();
      }
    });

      // // 페이지가 로드될 때 로그인 성공 시 모달을 자동으로 닫도록 처리
      // if (window.opener && window.opener.document.getElementById('modal-overlay')) {
      //     window.opener.document.getElementById('modal-overlay').style.display = 'none';
      //     window.opener.document.getElementById('modal-iframe').src = ''; // iframe 초기화
      //     window.opener.location.reload(); // 부모 페이지 새로 고침
      // }


  });
</script>