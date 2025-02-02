package action.admin.board;

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

        int currentBoardIdx = Integer.parseInt(boardIdx);

        String keyword = request.getParameter("keyword");
        String region = request.getParameter("region");
        String theater = request.getParameter("theater");

        // 위의 기본키는 DB로부터 원하는 게시물을 검색하기 위해 받았다.
        BoardVO bo = BoardDAO.getBoard(boardIdx);
        BoardVO pbo = BoardDAO.getPreviousBoard("notice",boardIdx, keyword, region, theater);
        BoardVO nbo = BoardDAO.getNextBoard("notice",boardIdx, keyword, region, theater);


        request.setAttribute("board", bo);
        request.setAttribute("pboard", pbo);
        request.setAttribute("nboard", nbo);

        return "/jsp/admin/notice/adminNoticeView.jsp";
    }
}
