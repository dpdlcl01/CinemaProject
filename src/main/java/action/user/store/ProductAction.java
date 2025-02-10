package action.user.store;

import action.Action;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProductAction implements Action {

        public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

            try {
                request.setCharacterEncoding("UTF-8");
            } catch (Exception e) {
                e.printStackTrace();
            }

            UserVO uvo = SessionUtil.getLoginUser(request);

            String uidx=null;
            if(uvo == null){
                uidx="0";
            }else{
               uidx = uvo.getUserIdx();
            }



            String pName = request.getParameter("pName");
            String pImg = request.getParameter("pImg");
            String category = request.getParameter("pCategory");
            String idx = request.getParameter("pIdx");
            String price = request.getParameter("pPrice");
            String productStock = request.getParameter("productStock");
            System.out.println(idx);


            if(category.equals("1")){
                category = "굿즈";
            }else if(category.equals("2")){
                category = "스낵";
            }else if(category == null){
                category = "";
            }

            request.setAttribute("pCategory", category);
            request.setAttribute("productStock", productStock);
            request.setAttribute("pName", pName);
            request.setAttribute("pImg", pImg);
            request.setAttribute("pIdx", idx);
            request.setAttribute("pPrice", price);
            request.setAttribute("uidx", uidx);

            return "/jsp/user/store/storeProduct.jsp";
        }
}
