package action.admin.movie;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class UpdateStatusAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> statusResponse = new HashMap<>();

        try {
            // 세션에서 상태 메시지 가져오기
            HttpSession session = request.getSession(false);
            String statusMessage = session != null ? (String) session.getAttribute("updateStatus") : "현재 상태 없음";

            // 상태 메시지를 응답에 포함
            statusResponse.put("statusMessage", statusMessage);

            // JSON 응답 전송
            mapper.writeValue(response.getWriter(), statusResponse);

        } catch (Exception e) {
            e.printStackTrace();
            statusResponse.put("statusMessage", "상태 메시지 응답 중 오류가 발생했습니다.");
            mapper.writeValue(response.getWriter(), statusResponse);
        }

        return null;  // 페이지 이동 없음
    }

    /**
     * 상태 메시지를 세션에 저장하는 메서드
     */
    public void updateStatusMessage(HttpSession session, String newStatus) {
        if (session != null) {
            session.setAttribute("updateStatus", newStatus);
        }
    }
}
