package action.user;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 마이 페이지 화면 경로 반환
        return "./jsp/user/myInfo/myInfoMain.jsp";
    }
}
