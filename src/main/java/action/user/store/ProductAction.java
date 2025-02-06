package action.user.store;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductAction implements Action {

        public String execute(HttpServletRequest request, HttpServletResponse response) {

            try {
                request.setCharacterEncoding("UTF-8");
            } catch (Exception e) {
                e.printStackTrace();
            }


            String pName = request.getParameter("pName");
            String pImg = request.getParameter("pImg");
            String category = request.getParameter("pCategory");
            String idx = request.getParameter("pIdx");
            String price = request.getParameter("pPrice");
            System.out.println(idx);


            if(category.equals("1")){
                category = "굿즈";
            }else if(category.equals("2")){
                category = "스낵";
            }else if(category == null){
                category = "";
            }

            request.setAttribute("pCategory", category);
            request.setAttribute("pName", pName);
            request.setAttribute("pImg", pImg);
            request.setAttribute("pIdx", idx);
            request.setAttribute("pPrice", price);

            return "/jsp/user/store/storeProduct.jsp";
        }
}
