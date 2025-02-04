package control;

import action.Action;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;


@WebServlet(
        urlPatterns = { "/UserController" },
        initParams = {
                @WebInitParam(name ="myParam", value ="/WEB-INF/user_action.properties")
        })
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 초기 파라미터로 전달된 user_action.properties 파일의 경로를 가지고
    // 그 파일의 내용(클래스의 경로)들을 가져와서 객체로 생성한 후 저장할 곳
    private Map<String, Action> actionMap;

    public UserController() {
        super();
        actionMap = new HashMap<>();
    }

   
    public void init() throws ServletException {
        // 생성자 다음에 수행하는 함수
        // 첫 요청자에 의해 단! 한번만 수행하는 곳!

        //현재 서블릿이 생성될 때 전달받은 초기 파라미터를 가져온다.
        String props_path = this.getInitParameter("myParam"); // "/WEB-INF/user_action.properties"

        // 받은 user_action.properties파일의 경로를 절대경로화 시킨다.
        // 하지만 jsp에서 마음대로 사용했던 내장객체인 application이 여기 서블릿에서는
        // 준비되어 있지 않다. 직접 구해야 한다.
        ServletContext application = this.getServletContext();

        String realPath = application.getRealPath(props_path);

        //절대경로화 시킨 이유는
        //해당 파일의 내용(클래스의 경로)을 스트림을 이용하여 읽어와서
        // Properties객체에 저장하기 위함이다.
        Properties props = new Properties();

        //Properties의 load함수를 이용하여 내용들을 읽기한다. 이때
        // 필요한 것이 InputStream이 필요하다.
        FileInputStream fis = null;
        try {
            // user_action.properties파일과 연결되는 스트림
            fis = new FileInputStream(realPath);

            props.load(fis);// user_action.properties파일의 내용들을 읽어서
            // 비어있던 Properties객체에 키와 값을 쌍으로 저장했다.
            // 예)  "date" ----> "ex3.DateAction"
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(fis != null)
                    fis.close();
            } catch (Exception e2) {
                // TODO: handle exception
            }
        }

        /*
        생성할 객체들의 경로가 모두~
        Properties객체로 저장되었다. 하지만
        현재 컨트롤러 입장에서는 생성할 객체가 몇개이며,
        어떤 객체인지 알지 못한다. Properties에 저장된
        키들을 모두 가져와서 반복자로 수행해야 한다.
        */

        Iterator<Object> it = props.keySet().iterator();
        // date, hi, data, ....

        //키들을 모두 얻었으니 키에 연결된 클래스 경로 값들을 하나씩
        // 얻어내어 객체를 생성한 후 actionMap에 저장한다.
        while(it.hasNext()) {
            //먼저 키를 하나 가져와서 문자열로 변환!
            String key = (String)it.next();

            // 위에서 얻어낸 키와 연결된 클래스경로 값을 얻자!
            String value = props.getProperty(key);// "ex3.DateAction"

            try {
                Object obj = Class.forName(value).newInstance();
                // 쉽게 말해서 Class를 통해 정확한 클래스의 경로가 있다면
                // 위와 같이 객체를 생성할 수 있다.

                Action action = (Action)obj;// 사용범위를 Object에서 Action이라는
                // 인터페이스까지 확장한다.

                //멤버변수인 actionMap에 저장
                actionMap.put(key, action);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }//while의 끝
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        request.setCharacterEncoding("utf-8");

        String acceptHeader = request.getHeader("Accept");
        boolean isJsonRequest = acceptHeader != null && acceptHeader.contains("application/json");

        if (isJsonRequest) {
            response.setContentType("application/json;charset=utf-8");
        } else {
            response.setContentType("text/html;charset=utf-8");
        }

        // type이라는 파라미터를 받기
        String type = request.getParameter("type");

        // 만약! type이 null이면 기본객체(MainAction)을 지정한다.
        if(type == null)
            type = "main";

        // type으로 받은 값이 actionMap의 key로 사용되고 있으며
        // actionMap으로부터 원하는 객체를 얻도록 한다.
        Action action = actionMap.get(type);

        String viewPath = action.execute(request, response);

      // 이동할 때마다 type, viewPath를 알기 위한 print
      System.out.println("type: " + type);
      System.out.println("viewPath: " + viewPath);

        // viewPath가 null이면 현재 컨트롤러를 sendRedirect로 다시 호출하도록 하자!
        if (viewPath == null) {
            if (!response.isCommitted()) {
                response.sendRedirect("UserController?type=main");
            }
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
        dispatcher.forward(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

    }

}
