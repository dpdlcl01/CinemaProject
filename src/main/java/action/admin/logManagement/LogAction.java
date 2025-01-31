package action.admin.logManagement;

import action.Action;
import mybatis.dao.LogDAO;
import mybatis.vo.LogVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class LogAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    List<LogVO> allLogList = LogDAO.getLogList();

    request.setAttribute("allLogList", allLogList);

    return "/jsp/admin/systemManagement/logManagement.jsp";
  }
}