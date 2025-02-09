//package action.user.myPage;
//
//import action.Action;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import mybatis.dao.PointDAO;
//import mybatis.vo.PointVO;
//import mybatis.vo.UserVO;
//import util.Paging;
//import util.SessionUtil;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//public class MyPointAction implements Action {
//    @Override
//    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
//
//        // 로그인 여부 확인 및 사용자 정보 가져오기
//        UserVO uservo = SessionUtil.getLoginUser(request);
//        if (uservo == null) {
//            return "UserController?type=main";
//        }
//        request.setAttribute("loggedInUser", uservo);
//
//        String userIdx = uservo.getUserIdx();
//        String cPageParam = request.getParameter("cPage");
//        int cPage = (cPageParam == null || cPageParam.isEmpty()) ? 1 : Integer.parseInt(cPageParam);
//
//        // 필터링 값 가져오기
//        String startDate = request.getParameter("startDate");
//        String endDate = request.getParameter("endDate");
//
//        // 페이징 설정 (한 페이지당 10개, 5개씩 페이지 네비게이션)
//        Paging page = new Paging(10, 5);
//
//        // 필터링 여부에 따라 `totalCount` 설정
//        int totalCount;
//        if (startDate != null && !startDate.isEmpty()) {
//            totalCount = PointDAO.getFilteredCount(userIdx, startDate, endDate);
//        } else {
//            totalCount = PointDAO.getTotalCount(userIdx);
//        }
//
//        // ✅ 필터링 후 totalCount 재설정
//        page.setTotalRecord(totalCount);
//        page.setNowPage(cPage);
//
//        // ✅ 필터링 후 totalPage 재설정 (totalPage = (totalCount / numPerPage) 반영)
//        if (totalCount <= page.getNumPerPage()) {
//            page.setTotalPage(1);  // 필터링된 데이터 개수가 적다면, 페이지를 1로 설정
//        }
//        // 페이징을 고려한 데이터 조회
//        int startIdx = (page.getNowPage() - 1) * page.getNumPerPage();
//        PointVO[] pointList = PointDAO.getList(userIdx, startIdx, page.getNumPerPage());
//
//        // 포인트 계산
//        int availablePoints = PointDAO.availablePoints(userIdx);
//        int vipPoints = PointDAO.vipPoints(userIdx);
//        String newGrade = PointDAO.calculateGrade(vipPoints);
//        uservo.setUserGrade(newGrade);
//
//        // 조회된 데이터를 request에 저장
//        request.setAttribute("pointList", pointList);
//        request.setAttribute("page", page);
//        request.setAttribute("cPage", cPage);
//        request.setAttribute("userPoints", availablePoints);
//        request.setAttribute("userVIPPoints", vipPoints);
//        request.setAttribute("pointData", PointDAO.getUserPointBySource(userIdx));
//
//        // AJAX 요청이면 JSON 응답
//        String type = request.getParameter("type");
//        if ("pointFilter".equals(type)) {
//            response.setContentType("application/json;charset=UTF-8");
//            PrintWriter out = response.getWriter();
//
//            PointVO[] vo = (startDate == null || startDate.trim().isEmpty())
//                    ? PointDAO.getAllPoints(userIdx)
//                    : PointDAO.getListWithDateRange(userIdx, startDate, endDate);
//
//            ObjectMapper mapper = new ObjectMapper();
//            out.write(mapper.writeValueAsString(vo));
//            out.flush();
//            return null;
//        }
//
//        return "./jsp/user/myPage/myPoint.jsp";
//    }
//}

package action.user.myPage;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.PointDAO;
import mybatis.vo.PointVO;
import mybatis.vo.UserVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class MyPointAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }
        request.setAttribute("loggedInUser", uservo);

        String userIdx = uservo.getUserIdx();
        String cPageParam = request.getParameter("cPage");
        int cPage = (cPageParam == null || cPageParam.isEmpty()) ? 1 : Integer.parseInt(cPageParam);

        // 필터링 값 가져오기
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        // 페이징 설정 (한 페이지당 10개, 네비게이션 5개)
        Paging page = new Paging(10, 5);
        int totalCount = 0;
        PointVO[] pointList = null;
        int startIdx = (cPage - 1) * page.getNumPerPage();

        // 필터링이 적용된 경우와 그렇지 않은 경우 구분
        if (startDate != null && !startDate.trim().isEmpty()) {
            // 필터링된 전체 개수 조회
            totalCount = PointDAO.getFilteredCount(userIdx, startDate, endDate);
            page.setTotalRecord(totalCount);
            page.setNowPage(cPage);
            if (totalCount <= page.getNumPerPage()) {
                page.setTotalPage(1);
            }
            // 필터링된 목록 조회 (페이징 적용)
            pointList = PointDAO.getListWithDateRange(userIdx, startDate, endDate, startIdx, page.getNumPerPage());
        } else {
            // 전체 개수 및 목록 조회
            totalCount = PointDAO.getTotalCount(userIdx);
            page.setTotalRecord(totalCount);
            page.setNowPage(cPage);
            if (totalCount <= page.getNumPerPage()) {
                page.setTotalPage(1);
            }
            pointList = PointDAO.getList(userIdx, startIdx, page.getNumPerPage());
        }

        // 포인트 계산
        int availablePoints = PointDAO.availablePoints(userIdx);
        int vipPoints = PointDAO.vipPoints(userIdx);
        String newGrade = PointDAO.calculateGrade(vipPoints);
        uservo.setUserGrade(newGrade);

        // 조회된 데이터를 request에 저장
        request.setAttribute("pointList", pointList);
        request.setAttribute("page", page);
        request.setAttribute("cPage", cPage);
        request.setAttribute("userPoints", availablePoints);
        request.setAttribute("userVIPPoints", vipPoints);
        request.setAttribute("pointData", PointDAO.getUserPointBySource(userIdx));

        // AJAX 요청이면 JSON 응답 (필터링시에는 전체 목록이 아닌 페이지네이션이 필요하다면 추가 수정 필요)
        String type = request.getParameter("type");
        if ("pointFilter".equals(type)) {
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter out = response.getWriter();

            // AJAX 요청 시 필터링된 전체 목록을 반환 (페이징 없이 모두 전달)
            PointVO[] vo = (startDate == null || startDate.trim().isEmpty())
                    ? PointDAO.getAllPoints(userIdx)
                    : PointDAO.getListWithDateRange(userIdx, startDate, endDate);

            ObjectMapper mapper = new ObjectMapper();
            out.write(mapper.writeValueAsString(vo));
            out.flush();
            return null;
        }

        return "./jsp/user/myPage/myPoint.jsp";
    }
}

