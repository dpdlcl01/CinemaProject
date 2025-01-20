package action.user;

import action.Action;
import mybatis.dao.EventDAO;
import mybatis.vo.EventVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventDetailAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));

    EventVO vo = EventDAO.searchBoardIdxEvent(boardIdx);

    request.setAttribute("vo", vo);

    System.out.println(vo.getBoardIdx());

    return "./jsp/user/event/eventDetail.jsp";

  }
}
