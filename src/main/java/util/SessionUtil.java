package util;

import mybatis.vo.AdminVO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SessionUtil {

    // 세션에 저장된 유저인지 확인 후 uservo를 반환한다.
    public static UserVO getLoginUser(HttpServletRequest request)throws IOException {

        // 세션 얻기
        HttpSession session = request.getSession();

        // 세션이 null인 경우 null을 반환
        if (session == null) {
            return null;
        }

        // 세션이 null이 아니라면 세션으로부터 uservo를 얻는다.
        UserVO uservo = (UserVO) session.getAttribute("uservo");

       // uservo 반환
        return uservo;
    }

    // 관리자 계정의 로그인 정보를 가져옴
    public static AdminVO getLoginAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session == null) {
            return null;
        }
        AdminVO adminvo = (AdminVO) session.getAttribute("adminvo");
        return adminvo;
    }

}
