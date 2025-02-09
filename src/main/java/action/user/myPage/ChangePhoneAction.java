package action.user.myPage;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

<<<<<<<< HEAD:src/main/java/action/user/myPage/ChangePhoneAction.java
public class ChangePhoneAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "";
========
public class IdPwFindAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "/jsp/user/login/findIdPw_tab.jsp";
>>>>>>>> seonjong11:src/main/java/action/user/login/IdPwFindAction.java
    }
}
