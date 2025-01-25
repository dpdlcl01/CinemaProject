package action.user.myPage;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyAdmissionTicketAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


        return "./jsp/user/myPage/myAdmissionTicket.jsp";
    }
}
