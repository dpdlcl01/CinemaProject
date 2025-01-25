package action.user.myPage;

import action.Action;
import mybatis.dao.PointDAO;
import mybatis.vo.PointVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyPointAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        // 사용자 포인트 조회
        String userIdx = uservo.getUserIdx();
        PointVO[] pointList = PointDAO.getList(userIdx, 0, 10); // 첫 10개 포인트 조회

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


        // 포인트 상세 화면 경로 반환
        return "./jsp/user/myPage/myPoint.jsp";
    }
}
