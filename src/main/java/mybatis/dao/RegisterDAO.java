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

    public boolean UserIdCheck(String userId) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int count = ss.selectOne("register.useridcheck_search", userId);
        return count > 0;
        }

    public static String UserIdFind(Map<String, String> params) {
        SqlSession ss = FactoryService.getFactory().openSession();
        String result = null;
        try {
            result = ss.selectOne("register.finduserid", params);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return result;
    }
}

