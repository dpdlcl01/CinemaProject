package action.admin;

import action.Action;
import dao.AdminDAO;
import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import util.AdminPaging;
import vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetAllUserAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        AdminPaging page = new AdminPaging(10, 5);

        String searchType = request.getParameter("searchType");
        String searchKeyword = request.getParameter("searchKeyword");


        int totalCount = AdminDAO.getTotalUserCount(searchType, searchKeyword);
        page.setTotalRecord(totalCount);

        String cPage = request.getParameter("cPage");
        if (cPage == null || cPage.isEmpty()) {
            page.setNowPage(1);
        } else {
            try {
                page.setNowPage(Integer.parseInt(cPage));
            } catch (NumberFormatException e) {
                page.setNowPage(1);
            }
        }

        List<UserVO> users = AdminDAO.getUsersByPage(page.getBegin(), page.getNumPerPage(), searchType, searchKeyword);

        request.setAttribute("users", users);
        request.setAttribute("paging", page);
        request.setAttribute("searchType", searchType);
        request.setAttribute("searchKeyword", searchKeyword);

        return "/jsp/admin/userList.jsp";
    }
}
