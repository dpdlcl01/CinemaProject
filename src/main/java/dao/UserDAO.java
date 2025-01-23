package dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class UserDAO {
    public String getPasswordById(String userId) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            return ss.selectOne("user.getUserById", userId); // MyBatis 매퍼 호출
        }
    }

    public boolean updateUserStatus(String userId) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            int rows = ss.update("user.updateUserStatus", userId);
            ss.commit(); // 변경사항 반영
            return rows > 0;
        }
    }
}
