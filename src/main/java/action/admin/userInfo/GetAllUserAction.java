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

        String userType = request.getParameter("userType");
        String searchType = request.getParameter("searchType");
        String searchKeyword = request.getParameter("searchKeyword");

        if (searchType == null || searchType.isEmpty()) {
            searchType = "";
        }
        if (searchKeyword == null || searchKeyword.isEmpty()) {
            searchKeyword = "";
        }
        if (userType == null || userType.isEmpty()) {
            userType = "all";
        }

        Paging paging = new Paging(10, 5);
        int totalCount = AdminDAO.getTotalUserCount(searchType, searchKeyword, userType);
        paging.setTotalRecord(totalCount);

        String cPage = request.getParameter("cPage");
        if (cPage == null || cPage.isEmpty()) {
            paging.setNowPage(1);
        } else {
            try {
                paging.setNowPage(Integer.parseInt(cPage));
            } catch (NumberFormatException e) {
                paging.setNowPage(1);
            }
        }

        int begin = (paging.getNowPage() - 1) * paging.getNumPerPage();
        if (begin < 0) begin = 0; // 음수 방지

        List<UserVO> users = AdminDAO.getUsersByPage(begin, paging.getNumPerPage(), searchType, searchKeyword, userType);


        request.setAttribute("users", users);
        request.setAttribute("paging", paging);
        request.setAttribute("searchType", searchType);
        request.setAttribute("searchKeyword", searchKeyword);
        request.setAttribute("userType", userType);

//        return "/jsp/admin/userList.jsp?type=userlist";
        return "/jsp/admin/userInfo/userList.jsp";
    }
}
