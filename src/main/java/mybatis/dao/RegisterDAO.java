package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.LogVO;
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
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            Integer count = ss.selectOne("register.useridcheck_search", userId);
            return count != null && count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean getEmailIfExists(String userEmail) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            Integer count = ss.selectOne("register.getEmailIfExists", userEmail);
            return count != null && count > 0;
        }
    }

    public boolean isUserValid(String userName, String userEmail) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("userName", userName);
            params.put("userEmail", userEmail);
            Integer count = ss.selectOne("register.checkUserValidation", params);
            return count != null && count > 0;
        }
    }

    public boolean validateUserForPasswordReset(String userName, String userEmail, String userId) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("userName", userName);
            params.put("userEmail", userEmail);
            params.put("userId", userId);
            Integer count = ss.selectOne("register.validateForPasswordReset", params);
            return count != null && count > 0;
        }
    }

    public boolean isPasswordValid(String email, String inputPassword) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            String storedHash = ss.selectOne("register.getPasswordHashByEmail", email);
            return storedHash != null && BCrypt.checkpw(inputPassword, storedHash); // BCrypt 검증
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
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



    public static int updatePassword(HashMap<String, String> params) {
        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            int result = ss.update("register.updateUserPassword", params);
            System.out.println("updatePassword Result : " + result);
            ss.commit();
            return result;
        } catch (Exception e) {
            ss.rollback();
            return 0;
        } finally {
            if (ss != null)
                ss.close();
        }
    }
}