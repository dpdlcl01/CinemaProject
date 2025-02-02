package action.user.myPage;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.MyPageDAO;
import mybatis.vo.FavoriteTheaterVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class AddFavoriteTheaterAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }
        // 이후 로그인된 사용자 정보 활용
        String id = uservo.getUserId();
        String idx = uservo.getUserIdx();
        String theaterId = request.getParameter("theaterId");


        int cnt = MyPageDAO.insertFavoriteTheater(idx,theaterId);
        FavoriteTheaterVO[] fvo= MyPageDAO.getFavoriteTheater(idx);


        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");


        Map<String, Object> jsonResponse = new HashMap<>();
        jsonResponse.put("success", cnt > 0);
        jsonResponse.put("message", cnt > 0 ? "극장 등록 성공" : "이미 등록된 극장입니다.");
        jsonResponse.put("favoriteTheaters", fvo); // 리스트 반환

        // JSON 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new ObjectMapper().writeValueAsString(jsonResponse));
        response.flushBuffer();
        return null; // View 이동 없음 (비동기 처리)
    }


    }

