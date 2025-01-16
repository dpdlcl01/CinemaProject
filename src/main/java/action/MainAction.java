package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {



    return "/jsp/user/main.jsp";
  }
}
