package action.user;

import action.Action;
import dao.UserDAO;
import vo.theaterVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class theaterDetailAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String theaterIdx = request.getParameter("theaterIdx");

        theaterVO theater = UserDAO.getTheaterById(theaterIdx);

        if (theater != null) {
            request.setAttribute("theater", theater);
        }

        return "/jsp/user/theater/theaterDetail.jsp";
    }
}
