package action.user.myInfo;

import action.Action;
import mybatis.dao.PointDAO;
import mybatis.vo.PointVO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyPointAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // 사용자 로그인 성공 시
        HttpSession session = request.getSession();
        UserVO user = new UserVO();

        // 로그인 정보를 세팅
        user.setUserIdx("1");
        user.setUserName("김철수");
        user.setUserId("1111");
        user.setUserEmail("kimcs@example.com");
        user.setUserGrade("Basic");

        // 세션에 저장
        session.setAttribute("loggedInUser", user);

        // 사용자 포인트 조회
        String userIdx = user.getUserIdx();
        PointVO[] pointList = PointDAO.getList(userIdx, 0, 10); // 첫 10개 포인트 조회

        // 포인트 계산
        int availablePoints = PointDAO.availablePoints(userIdx);
        int vipPoints = PointDAO.vipPoints(userIdx); // VIP 포인트 계산 로직 추가 필요 시 구현

        // 등급 계산 및 업데이트
        String newGrade = PointDAO.calculateGrade(vipPoints);
        user.setUserGrade(newGrade); // UserVO에서 등급 업데이트

        // 조회된 포인트 데이터를 request에 저장
        request.setAttribute("pointList", pointList);
        request.setAttribute("userPoints", availablePoints);
        request.setAttribute("userVIPPoints", vipPoints);


        // 포인트 상세 화면 경로 반환
        return "./jsp/user/myInfo/myPoint.jsp";
    }
}
