package mybatis.dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;

import java.util.Map;

public class RegisterDAO {

    public static int userInsert(Map<String, Object> map) {
        SqlSession ss = FactoryService.getFactory().openSession();

        int cnt = 0;
        try {
            cnt = ss.insert("register.reg_add", map);

            if (cnt > 0) {
                ss.commit();
            } else {
                ss.rollback();
            }
        } catch (Exception e) {
            ss.rollback();
            throw e;
        } finally {
            ss.close();
        }
        return cnt;
    }

    public static int UserIdCheck(String userId) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            int cnt = ss.selectOne("register.useridcheck_search", userId);
            return cnt;
        }
    }
}
