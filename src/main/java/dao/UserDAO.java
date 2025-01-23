package dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import vo.UserVO;

import java.util.HashMap;
import java.util.Map;

public class UserDAO {
    public boolean checkPassword(String userId, String userPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            Map<String, String> params = new HashMap<>();
            params.put("userId", userId);
            params.put("userPassword", userPassword);

            System.out.println("DAO: userId = " + userId);
            System.out.println("DAO: userPassword = " + userPassword);

            int count = ss.selectOne("user.checkPassword", params);

            System.out.println("DAO: SQL Result Count = " + count);

            return count == 1;
        } finally {
            ss.close();
        }
    }

    public boolean updateUserStatus(String userId) {
        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            int result = ss.update("user.updateUserStatus", userId);
            ss.commit();
            return result > 0;
        } finally {
            ss.close();
        }
    }

    public UserVO getUserById(String userId) {
        SqlSession ss = FactoryService.getFactory().openSession(); // SqlSession 열기
        try {

            return ss.selectOne("user.getUserById", userId);
        } finally {
            ss.close();
        }
    }
}
