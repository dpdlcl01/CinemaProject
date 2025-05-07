package action.admin.userInfo;

import action.Action;
import mybatis.dao.AdminDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.UserVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetAllUserAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        // 페이징 처리를 위한 객체 생성
        Paging page = new Paging(10, 10);

        // 검색 조건 파라미터 수집
        String searchType = request.getParameter("searchType");       // 검색 대상 (이름, 아이디 등)
        String searchKeyword = request.getParameter("searchKeyword"); // 검색어
        String userJoinMonth = request.getParameter("userJoinMonth"); // 가입월
        String userStatus = request.getParameter("userStatus");       // 사용자 상태
        String userGrade = request.getParameter("userGrade");         // 회원 등급

        int totalCount = AdminDAO.getTotalUserCount(searchType, searchKeyword, userJoinMonth, userStatus, userGrade);

        // 페이징 객체에 총 사용자 수 설정
        page.setTotalRecord(totalCount);

        // 현재 페이지 값을 파라미터로 받아 설정
        String cPage = request.getParameter("cPage");
        if (cPage == null) {
            page.setNowPage(1);
        } else {
            int nowPage = Integer.parseInt(cPage);
            page.setNowPage(nowPage);
        }

        // DB에서 사용자 정보를 가져온다.
        UserVO[] userArray = AdminDAO.getUsersByPage(
                searchType, searchKeyword, userJoinMonth, userStatus, userGrade,
                page.getBegin(), page.getEnd()
        );

        // request에 필요한 데이터 저장
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("userArray", userArray);
        request.setAttribute("page", page);
        request.setAttribute("cPage", cPage);

        // JSP 페이지 경로 반환
        return "/jsp/admin/userInfo/userList.jsp";
    }
}
