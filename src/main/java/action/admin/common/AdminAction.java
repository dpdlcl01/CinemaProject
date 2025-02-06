package action.admin.common;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // main 화면 경로 반환
        return "./jsp/admin/common/adminLogin.jsp";
    }
}
