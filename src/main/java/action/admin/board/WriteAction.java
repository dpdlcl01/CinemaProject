package action.admin.board;

import action.Action;
import mybatis.dao.BoardDAO;
import mybatis.vo.AdminVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class WriteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        String adminIdx = adminvo.getAdminIdx();

        String actionType = request.getParameter("actionType");
        String[] selectedNotices = request.getParameterValues("selectedNotice");

        if ("end".equals(actionType) && selectedNotices != null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");

            try {
                List<Integer> boardIdxList = new ArrayList<>();
                for (String noticeId : selectedNotices) {
                    boardIdxList.add(Integer.parseInt(noticeId));
                }

                int result = BoardDAO.endNotices(boardIdxList);

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

        String boardTitle = request.getParameter("title");
        String theater = request.getParameter("theater");
        String boardType = request.getParameter("boardType");
        String boardStatus = request.getParameter("boardStatus");
        String boardContent = request.getParameter("content");
        String boardExpDate = request.getParameter("expDate");

        String theaterIdx = BoardDAO.getTheaterIdx(theater);

        if (boardTitle == null || boardTitle.isEmpty() || boardType == null || boardStatus == null || boardContent == null || boardContent.isEmpty()) {
            request.setAttribute("msg", "필수 항목을 입력하세요.");
            return "/jsp/admin/notice/adminNoticeWrite.jsp";
        }

        int result = BoardDAO.addNotice(adminIdx, theaterIdx, boardType, boardTitle, boardContent,
                boardExpDate, boardStatus);

        if (result > 0) {
            request.setAttribute("msg", "공지사항이 등록되었습니다.");
            return "/jsp/admin/notice/adminNoticeMain.jsp";
        } else {
            request.setAttribute("msg", "공지사항 등록에 실패했습니다.");
            return "/jsp/admin/notice/adminNoticeWrite.jsp";
        }

    }
}
