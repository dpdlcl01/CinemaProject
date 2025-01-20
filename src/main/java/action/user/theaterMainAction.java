package action.user;

import action.Action;
import dao.UserDAO;
import vo.theaterVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class theaterMainAction implements Action {


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        theaterVO[] theaterVO = UserDAO.getTheaterInfo();

        if (theaterVO != null) {
            // request에 극장 정보 저장
            request.setAttribute("theater", theaterVO);
        }

        // 포워딩할 JSP 페이지 반환
        return "/jsp/user/theater/theaterMain.jsp";
    }

}
