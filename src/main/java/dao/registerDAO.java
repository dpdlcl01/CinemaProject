package dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;

public class registerDAO {
    public static int register(String userName, String userId, String userPassword, String userEmail,
                               String userPhone) {
        HashMap<String,String> map = new HashMap<>();
        map.put("userName", userName);
        map.put("userId", userId);
        map.put("userPassword", userPassword);
        map.put("userEmail", userEmail);
        map.put("userPhone", userPhone);

        SqlSession ss = FactoryService.getFactory().openSession();

        int cnt = ss.insert("register.reg_add", map);

        if(cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();
        return cnt;
    }
}
