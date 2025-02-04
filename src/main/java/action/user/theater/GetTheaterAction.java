package action.user.theater;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.TheaterDAO;
import mybatis.vo.TheaterVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GetTheaterAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String cityName = request.getParameter("cityName").trim();
        System.out.println("cityName: " + cityName);

        // DB에서 극장 정보 가져오기
        TheaterVO[] tvo = TheaterDAO.getTheater(cityName);

        System.out.println("tvo: " + tvo.length);
        // 클라이언트에 필요한 데이터만 담을 리스트
        List<Map<String, String>> theaterList = new ArrayList<>();

        for (TheaterVO theater : tvo) {
            Map<String, String> theaterData = new HashMap<>();
            theaterData.put("theaterIdx", theater.getTheaterIdx());  // 극장 ID
            theaterData.put("theaterName", theater.getTheaterName());  // 극장 이름
            theaterList.add(theaterData);
        }

        // JSON 변환 및 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(theaterList);
            response.getWriter().write(json);
            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("tvo: " + tvo.length);
        return null;
    }
}
