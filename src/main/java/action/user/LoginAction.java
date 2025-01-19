package action.user;

import action.Action;
import dao.UserDAO;
import vo.userVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

            String userId = request.getParameter("userId");
            String userPassword = request.getParameter("userPassword");

            System.out.println("유저아이디: " + userId);
            System.out.println("비밀번호: " + userPassword);

            UserDAO userDAO = new UserDAO();
            boolean usercheck = userDAO.usercheck(userId, userPassword);

            if (usercheck) {
                userVO userVO = userDAO.getUserInfo(userId);

                if (userVO != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", userVO);
                }
                request.setAttribute("success", "1"); // 성공 메시지나 플래그 추가
//                request.setAttribute("message", "로그인 성공");
                return "/jsp/user/login/memberLoginModal.jsp"; // 올바른 JSP 경로를 반환

//                // 로그인 성공 후 리다이렉트
//                try {
//                    response.sendRedirect("/jsp/user/login/memberLoginModal.jsp?success=true");
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }

//                return null; // 리다이렉트 후 더 이상 추가 처리를 하지 않도록 null 반환
            } else {
                request.setAttribute("message", "로그인 실패! 아이디와 비밀번호를 확인하세요.");
                return "/jsp/user/login/memberLoginModal.jsp";
            }
        }

    }