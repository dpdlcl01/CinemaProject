package action.admin;

import action.Action;
import mybatis.dao.AdminDAO;
import mybatis.vo.UserVO;
import util.Paging;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetAllUserAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String searchType = request.getParameter("searchType");
        String searchKeyword = request.getParameter("searchKeyword");

        if (searchType == null || searchType.isEmpty()) {
            searchType = "";
        }
        if (searchKeyword == null || searchKeyword.isEmpty()) {
            searchKeyword = "";
        }

        Paging paging = new Paging(10, 5);
        int totalCount = AdminDAO.getTotalUserCount(searchType, searchKeyword);
        System.out.println("totalCount entry.. : " + totalCount);
        paging.setTotalRecord(totalCount);

        String cPage = request.getParameter("cPage");
        System.out.println("cPage entry.. : " + cPage);
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

        List<UserVO> users = AdminDAO.getUsersByPage(begin, paging.getNumPerPage(), searchType, searchKeyword);
        System.out.println("user entry.. : "+ users );

        request.setAttribute("users", users);
        request.setAttribute("paging", paging);
        System.out.println("paging entry.. : " + paging);
        request.setAttribute("searchType", searchType);
        System.out.println("searchType entry.. : " + searchType);
        request.setAttribute("searchKeyword", searchKeyword);
        System.out.println("searchKeyword entry.. : " + searchKeyword);

        return "/jsp/admin/userList.jsp?type=userlist";
    }
}
