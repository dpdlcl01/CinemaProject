package action.user.login;

import action.Action;
import mybatis.dao.RegisterDAO;
import util.LogUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class FindIdAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String type = request.getParameter("type");

        if(type.equals("movefindid")) {
            return "./jsp/user/login/findId.jsp";

        } else if (type.equals("findid")) {
            String userName = request.getParameter("userName");
            String emailpart1 = request.getParameter("emailPart1");
            String emailpart2 = request.getParameter("emailPart2");

            System.out.println("emailpart1 : " + emailpart1);
            System.out.println("emailpart2 : " + emailpart2);

            String userEmail = request.getParameter("userEmail");


            System.out.println("userName : " + userName);
            System.out.println("조합된 userEmail : " + userEmail);

            HashMap<String, String> params = new HashMap<>();
            params.put("userName", userName);
            params.put("userEmail", userEmail);

            try {
                String userId = RegisterDAO.UserIdFind(params);
                System.out.println("debug result : " + userId);

                if (userId != null && !userId.isEmpty()) {
                    String logType = "1";
                    System.out.println("LogUtil entry..");
                    LogUtil.logChanges(
                            logType,
                            null,
                            "userId : " + userId,
                            "아이디 찾기",
                            null,
                            null
                    );
                    System.out.println("LogUtil exit..");
                    request.setAttribute("userName", userName);
                    request.setAttribute("userId", userId);
                    return "./jsp/user/login/result/idFind_success.jsp";
                } else {
                    request.setAttribute("error", "사용자를 찾을 수 없습니다.");
                    return "./jsp/user/common/error.jsp";
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "오류가 발생하였습니다.");
                return "./jsp/user/common/error.jsp";
            }
        }
        return null;
    }
}
