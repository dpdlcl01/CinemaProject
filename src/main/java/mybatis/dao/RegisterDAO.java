package mybatis.dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import org.mindrot.jbcrypt.BCrypt;

import java.util.HashMap;
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

    public boolean emailCheck(String userEmail) {
        SqlSession ss = FactoryService.getFactory().openSession();

        int count = ss.selectOne("register.checkemail", userEmail);

        System.out.println("이메일 조회 결과 : " + count);

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

    public static boolean validateUserForPasswordReset(Map<String, String> params) {
        SqlSession ss = FactoryService.getFactory().openSession();
            int count = ss.selectOne("register.finduserid_email", params);
            System.out.println("검증결과 : " + count);
            ss.close();
            return count > 0;
    }

    public static int updatePassword(Map<String, String> params) {
            SqlSession ss = FactoryService.getFactory().openSession();
            int result = ss.update("register.updateUserPassword", params);
            System.out.println("비번 변경 결과 : " + result);
            ss.commit();
            return result;
        }
    }


