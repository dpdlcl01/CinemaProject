package action.admin.board;

import action.Action;
import mybatis.dao.BoardDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.BoardVO;
import util.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class WriteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        String adminIdx = adminvo.getAdminIdx();

        String actionType = request.getParameter("actionType");
        String[] selectedNotices = request.getParameterValues("selectedNotice");

        if ("end".equals(actionType) || "start".equals(actionType) || "delete".equals(actionType) && selectedNotices != null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");

            try {
                List<Integer> boardIdxList = new ArrayList<>();
                for (String noticeId : selectedNotices) {
                    boardIdxList.add(Integer.parseInt(noticeId));
                }

                int result = 0;

                if("end".equals(actionType)) {
                   result = BoardDAO.endNotices(boardIdxList);
                } else if("start".equals(actionType)) {
                   result = BoardDAO.startNotices(boardIdxList);
                } else if("delete".equals(actionType)) {
                   result = BoardDAO.deleteNotices(boardIdxList);
                }
                response.getWriter().write("{\"success\": " + (result > 0) + "}");
                return null;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }

        if ("start".equals(actionType) && selectedNotices != null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");

            try {
                List<Integer> boardIdxList = new ArrayList<>();
                for (String noticeId : selectedNotices) {
                    boardIdxList.add(Integer.parseInt(noticeId));
                }

                int result = BoardDAO.startNotices(boardIdxList);

                response.getWriter().write("{\"success\": " + (result > 0) + "}");
                return null;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }

        String Type = request.getParameter("type");

        if ("adNewWrite".equals(Type)) {
            return "jsp/admin/notice/adminNoticeWrite.jsp"; // 글쓰기 페이지로 이동
        }

        if("adEdit".equals(Type)) {
            String boardIdx = request.getParameter("boardIdx");
            BoardVO board = BoardDAO.getBoard(boardIdx);
            request.setAttribute("board", board);
            return "jsp/admin/notice/adminNoticeWrite.jsp";
        }

        String boardIdx = request.getParameter("boardIdx");


        /*int boardIdx = 0;

        if (boardIdxStr != null && !boardIdxStr.trim().isEmpty()) { // null 및 빈 문자열 체크
            try {
                boardIdx = Integer.parseInt(boardIdxStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                boardIdx = 0;
            }
        }*/

        String boardTitle = request.getParameter("title");
        String theater = request.getParameter("theater");
        String boardType = request.getParameter("boardType");
        String boardStatus = request.getParameter("boardStatus");
        String boardContent = request.getParameter("content");
        String boardExpDate = request.getParameter("endDate");


        String theaterIdx = BoardDAO.getTheaterIdx(theater);

        int result = 0;
        if(boardIdx == null || boardIdx.isEmpty()) {
            result = BoardDAO.addNotice(adminIdx, theaterIdx, boardType, boardTitle, boardContent,
                    boardExpDate, boardStatus);
        } else {
            result = BoardDAO.updateNotice(boardIdx, theaterIdx, boardType, boardTitle, boardContent,
                    boardExpDate, boardStatus);
            request.getSession().setAttribute("loginAdmin", adminvo);
            request.getRequestDispatcher("/AdminController?type=adView&boardIdx=" + boardIdx).forward(request, response);
        }



        request.getSession().setAttribute("loginAdmin", adminvo);
        request.getSession().removeAttribute("region");
        request.getSession().removeAttribute("theater");
        request.getRequestDispatcher("/AdminController?type=adBoard").forward(request, response);
        return null;
    }
}
