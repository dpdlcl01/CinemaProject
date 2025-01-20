package action.user;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.EventDAO;
import mybatis.vo.EventVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class EventAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    int offset = 0; // 기본값
    int pageSize = 5; // 기본값

    // offset과 pageSize를 요청에서 가져오기
    offset = Integer.parseInt(request.getParameter("offset"));
    pageSize = Integer.parseInt(request.getParameter("pageSize"));

    String type = request.getParameter("type");

    System.out.println("Offset: " + offset);
    System.out.println("PageSize: " + pageSize);

    if (type.equals("event")) {
      // 진행중인 이벤트 게시물의 수 반환
      int totalEventCount = EventDAO.getTotalEventCount();

      // 이벤트 목록 가져오기
      EventVO[] ar = EventDAO.getEventList(offset, pageSize);

      if (offset == 0) {
        // 첫 요청: 화면 경로 반환 및 데이터 설정
        request.setAttribute("totalEventCount", totalEventCount);
        request.setAttribute("ar", ar);
        return "./jsp/user/event/eventMain.jsp"; // event 화면 경로 반환

      } else {
        // 비동기 요청: JSON 데이터 반환
        response.setContentType("application/json;charset=utf-8");
        try {
          PrintWriter out = response.getWriter();

          ObjectMapper mapper = new ObjectMapper();
          mapper.writeValue(out, ar); // JSON으로 변환하여 응답
          return null;
        } catch (Exception e) {
          e.printStackTrace();
        }
      }

    } else if (type.equals("pastevent")) {
      // 진행중인 이벤트 게시물의 수 반환
      int totalPastEventCount = EventDAO.getTotalPastEventCount();

      // 이벤트 목록 가져오기
      EventVO[] ar = EventDAO.getPastEventList(offset, pageSize);

      if (offset == 0) {
        // 첫 요청: 화면 경로 반환 및 데이터 설정
        request.setAttribute("totalPastEventCount", totalPastEventCount);
        request.setAttribute("pastar", ar);

        System.out.println(ar);
        System.out.println(totalPastEventCount);
        return "./jsp/user/event/pastEvent.jsp";

      } else {
        // 비동기 요청: JSON 데이터 반환
        response.setContentType("application/json;charset=utf-8");
        try {
          PrintWriter out = response.getWriter();

          ObjectMapper mapper = new ObjectMapper();
          mapper.writeValue(out, ar); // JSON으로 변환하여 응답
          return null;
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    } else if (type.equals("searchpastevent")) {
      String keyword = request.getParameter("keyword");

      int totalSearchPastEventCount = EventDAO.getSearchTotalPastEventCount(keyword);
      EventVO[] ar = EventDAO.searchPastEvent(offset, pageSize, keyword);

      if (offset == 0) {
        request.setAttribute("totalSearchPastEventCount", totalSearchPastEventCount);
        request.setAttribute("ar", ar);

        return "./jsp/user/event/searchPastEvent.jsp";

      } else {
        // 비동기 요청: JSON 데이터 반환
        response.setContentType("application/json;charset=utf-8");
        try {
          PrintWriter out = response.getWriter();

          ObjectMapper mapper = new ObjectMapper();
          mapper.writeValue(out, ar); // JSON으로 변환하여 응답
          return null;
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    }

    return null;
  }
}