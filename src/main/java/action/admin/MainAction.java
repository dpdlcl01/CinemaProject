package action.admin;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // main 화면 경로 반환
        return "./jsp/admin/common/main.jsp";
    }
}
