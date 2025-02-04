package action.admin.board;

import action.Action;
import mybatis.dao.BoardDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.BoardVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }
        
        // 기본키 boardIdx값을 파라미터로 받기, bType , cPage, ....
        String boardIdx = request.getParameter("boardIdx");

        int currentBoardIdx = Integer.parseInt(boardIdx);

        String keyword = request.getParameter("keyword");
        String region = request.getParameter("region");
        String theater = request.getParameter("theater");

        // 위의 기본키는 DB로부터 원하는 게시물을 검색하기 위해 받았다.
        BoardVO bo = BoardDAO.getBoard(boardIdx);
        BoardVO pbo = BoardDAO.getPreviousBoard("notice", boardIdx, keyword, region, theater);
        BoardVO nbo = BoardDAO.getNextBoard("notice", boardIdx, keyword, region, theater);


        request.setAttribute("board", bo);
        request.setAttribute("pboard", pbo);
        request.setAttribute("nboard", nbo);

        return "/jsp/admin/notice/adminNoticeWrite.jsp";
    }
}
