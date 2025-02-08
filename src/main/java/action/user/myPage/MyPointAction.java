package action.user.myPage;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.PointDAO;
import mybatis.vo.PointVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class MyPointAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }
        request.setAttribute("loggedInUser", uservo);

        // 사용자 포인트 조회
        String userIdx = uservo.getUserIdx();
        PointVO[] pointList = PointDAO.getList(userIdx, 0, 10); // 첫 10개 포인트 조회
        PointVO pointData = PointDAO.getUserPointBySource(userIdx);

        // 포인트 계산
        int availablePoints = PointDAO.availablePoints(userIdx);
        int vipPoints = PointDAO.vipPoints(userIdx); // VIP 포인트 계산 로직 추가 필요 시 구현

        // 등급 계산 및 업데이트
        String newGrade = PointDAO.calculateGrade(vipPoints);
        uservo.setUserGrade(newGrade); // UserVO에서 등급 업데이트

        // 조회된 포인트 데이터를 request에 저장
        request.setAttribute("pointList", pointList);
        request.setAttribute("userPoints", availablePoints);
        request.setAttribute("userVIPPoints", vipPoints);
        request.setAttribute("pointData", pointData);

        String type = request.getParameter("type");
        System.out.println("MyPointAction 호출됨: type=" + type);

        // AJAX 요청이면 JSON 응답
        if ("pointFilter".equals(type)) {
            response.setContentType("application/json;charset=UTF-8");

            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");

            // startDate와 endDate 기본값 처리
            if (startDate == null || startDate.trim().isEmpty()) {
                startDate = "2025-01-01"; // 기본 시작일 (예시)
            }
            if (endDate == null || endDate.trim().isEmpty()) {
                endDate = "2100-12-31"; // 기본 종료일 (예시)
            }

            // DAO에서 기간 필터링된 포인트 내역 가져오기
            PointVO[] vo = PointDAO.getListWithDate(userIdx, startDate, endDate);

            // JSON 변환 후 반환
            ObjectMapper mapper = new ObjectMapper();
            PrintWriter out = response.getWriter();
            out.write(mapper.writeValueAsString(vo));
            out.flush();
            return null;
        }


        // 포인트 상세 화면 경로 반환
        return "./jsp/user/myPage/myPoint.jsp";
    }
}
