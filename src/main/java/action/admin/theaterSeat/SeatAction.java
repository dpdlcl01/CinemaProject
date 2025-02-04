package action.admin.theaterSeat;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SeatAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response){
        return "/jsp/admin/theaterManagement/seatManage.jsp";
    }
}
