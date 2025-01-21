package action.board;

import action.Action;
import mybatis.dao.BoardDAO;
import mybatis.vo.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // 기본키 boardIdx값을 파라미터로 받기, bType , cPage, ....
        String boardIdx = request.getParameter("boardIdx");

        // 위의 기본키는 DB로부터 원하는 게시물을 검색하기 위해 받았다.
        BoardVO bo = BoardDAO.getBoard(boardIdx);

        request.setAttribute("board", bo);

        return "/jsp/user/notice/noticeView.jsp";
    }
}
