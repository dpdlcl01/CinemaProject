package action.user;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        session.setAttribute("id","아이디");
        session.setAttribute("idx","1");
        // main 화면 경로 반환
        return "./jsp/user/common/main.jsp";
    }
}
