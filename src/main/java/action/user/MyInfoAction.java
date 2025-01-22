package action.user;

import action.Action;
import mybatis.dao.MyInfoDAO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInfoAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        String idx = (String) session.getAttribute("idx");


        UserVO uvo = MyInfoDAO.getUser(id);
        String[] far=MyInfoDAO.getFavorite(idx);
        System.out.println(far.length);
        request.setAttribute("uvo", uvo);
        request.setAttribute("far", far);


        return "/jsp/user/myInfo/myInfoMain.jsp";
    }
}
