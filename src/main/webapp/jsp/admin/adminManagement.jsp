<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 화면</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-4">
    <h1 class="text-center">관리자 화면</h1>
    <hr>

    <!-- 관리자 계정 관리 -->
    <section>
        <h2>관리자 계정 관리</h2>
        <form id="admin-form">
            <div class="mb-3">
                <label for="username" class="form-label">사용자 이름</label>
                <input type="text" class="form-control" id="username" placeholder="사용자 이름 입력">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" class="form-control" id="email" placeholder="이메일 입력">
            </div>
            <div class="mb-3">
                <label for="role" class="form-label">역할</label>
                <select class="form-select" id="role">
                    <option value="admin">관리자</option>
                    <option value="moderator">모더레이터</option>
                    <option value="viewer">조회 전용</option>
                </select>
            </div>
            <button type="button" class="btn btn-primary" onclick="addAdmin()">계정 생성</button>
            <button type="button" class="btn btn-warning" onclick="updateAdmin()">계정 수정</button>
            <button type="button" class="btn btn-danger" onclick="deleteAdmin()">계정 삭제</button>
        </form>
    </section>

    <hr>

    <!-- 관리자 역할 설정 -->
    <section>
        <h2>관리자 역할 설정</h2>
        <div id="role-management">
            <p>관리자 역할을 변경하려면 위의 폼을 이용하세요.</p>
        </div>
    </section>

    <hr>

    <!-- 로그 관리 -->
    <section>
        <h2>로그 관리</h2>
        <div id="log-management" class="mb-4">
            <button class="btn btn-secondary" onclick="fetchLogs()">로그 조회</button>
            <table class="table mt-3">
                <thead>
                <tr>
                    <th>로그 ID</th>
                    <th>메시지</th>
                    <th>타임스탬프</th>
                </tr>
                </thead>
                <tbody id="log-table-body">
                <tr>
                    <td colspan="3" class="text-center">로그가 없습니다.</td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>
</div>

<script>
  // 계정 생성
  function addAdmin() {
    const username = document.getElementById("username").value;
    const email = document.getElementById("email").value;
    const role = document.getElementById("role").value;

    if (username && email) {
      alert(`계정 생성: \n사용자 이름: ${username}, 이메일: ${email}, 역할: ${role}`);
      // 여기에 계정 생성 로직 추가
    } else {
      alert("사용자 이름과 이메일을 입력하세요.");
    }
  }

  // 계정 수정
  function updateAdmin() {
    alert("계정 수정 기능이 아직 구현되지 않았습니다.");
    // 여기에 계정 수정 로직 추가
  }

  // 계정 삭제
  function deleteAdmin() {
    alert("계정 삭제 기능이 아직 구현되지 않았습니다.");
    // 여기에 계정 삭제 로직 추가
  }

  // 로그 조회
  function fetchLogs() {
    const logs = [
      { id: 1, message: "관리자 로그인", timestamp: "2025-01-24 12:00:00" },
      { id: 2, message: "계정 생성: test_user", timestamp: "2025-01-24 12:05:00" }
    ];

    const logTableBody = document.getElementById("log-table-body");
    logTableBody.innerHTML = ""; // 초기화

    logs.forEach(log => {
      const row = `<tr>
                                <td>${log.id}</td>
                                <td>${log.message}</td>
                                <td>${log.timestamp}</td>
                             </tr>`;
      logTableBody.innerHTML += row;
    });
  }
</script>
</body>
</html>
