package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.UserVO;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpSession;
import java.util.List;

public class MyInfoDAO {
    public static UserVO getUser(String id){

        SqlSession ss = FactoryService.getFactory().openSession();
        UserVO uvo = ss.selectOne("myInfo.getUser", id);
        ss.close();

        return uvo;
    }
    public static String[] getFavorite(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<String> list = ss.selectList("myInfo.favorite", idx);
        String[] favorite = new String[list.size()];

        list.toArray(favorite);
        System.out.println(favorite[0]);
        ss.close();
        return favorite;
    }
}
