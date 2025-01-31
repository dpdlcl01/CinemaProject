package action.user.reservation;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.EventDAO;
import mybatis.vo.EventVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ReservationPaymentAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {



    return "/jsp/user/reservation/payment.jsp";
  }
}
