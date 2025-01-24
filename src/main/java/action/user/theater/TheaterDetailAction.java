package action.user.theater;

import action.Action;
import mybatis.dao.TheaterDAO;
import mybatis.vo.PriceVO;
import mybatis.vo.TheaterVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TheaterDetailAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String theaterIdx = request.getParameter("theaterIdx");

        TheaterVO theater = TheaterDAO.getTheaterById(theaterIdx);

        if (theater != null) {
            request.setAttribute("theater", theater);
        }

        /*극장가격*/
        PriceVO[] price = TheaterDAO.getPrice();

        if (price.length > 0) {
            request.setAttribute("price", price);
        }

        return "/jsp/user/theater/theaterDetail.jsp";
    }
}
