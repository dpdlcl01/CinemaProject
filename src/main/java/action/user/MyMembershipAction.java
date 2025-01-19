package action.user;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyMembershipAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        //HttpSession에 "read_list"라는 이름으로 저장되어 있어야 한다.
        HttpSession session = request.getSession();
        //session에 "userVO"라는 이름으로 저장된 객체를 얻어내자
        Object obj = session.getAttribute("userVO");
        // user 정보가 없는 경우는 입장 금지 -> 메인 페이지로 반환

        // 포인트 상세 화면 경로 반환
        return "./jsp/user/myInfo/myPoint.jsp";
    }
}
