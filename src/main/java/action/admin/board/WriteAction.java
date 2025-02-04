package action.admin.board;

import action.Action;
import mybatis.dao.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class WriteAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String[] selectedNotices = request.getParameterValues("selectedNotice");

        if (selectedNotices != null && selectedNotices.length > 0) {
            List<Integer> boardIdxList = new ArrayList<>();
            for (String noticeId : selectedNotices) {
                boardIdxList.add(Integer.parseInt(noticeId));  // 문자열을 정수로 변환
            }

            int result = BoardDAO.deleteMultipleBoards(boardIdxList);  // DAO 호출

            if (result > 0) {
                response.sendRedirect("AdminController?type=adBoard&msg=deleteSuccess");  // 삭제 성공 시 리다이렉트
            } else {
                response.sendRedirect("AdminController?type=adBoard&msg=deleteFail");  // 삭제 실패 시 리다이렉트
            }
        } else {
            response.sendRedirect("AdminController?type=adBoard&msg=noSelection");  // 선택된 항목이 없을 경우
        }

        return "/jsp/admin/notice/adminNoticeWrite.jsp";
    }
}
