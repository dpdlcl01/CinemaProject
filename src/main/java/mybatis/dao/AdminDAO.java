package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.LogVO;
import org.apache.ibatis.session.SqlSession;
import mybatis.vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminDAO {

    public static List<Map<String,String>> getTheaterList() {

        SqlSession ss = FactoryService.getFactory().openSession();

        List<Map<String,String>> ar = ss.selectList("admin.getTheaterList");

        ss.close();
        return ar;
    }

    public static int getTotalUserCount(String searchType, String searchKeyword, String userType) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("userType", userType);
            params.put("searchType", searchType);
            params.put("searchKeyword", searchKeyword);
            return ss.selectOne("admin.getTotalUserCount", params);
        } catch (Exception e) {
            System.out.println("getTotalUserCount 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }

    public static List<UserVO> getUsersByPage(int begin, int numPerPage, String searchType, String searchKeyword, String userType) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("begin", begin);
            params.put("numPerPage", numPerPage);
            params.put("userType", userType);
            params.put("searchType", searchType);
            params.put("searchKeyword", searchKeyword);
            return ss.selectList("admin.getUsersByPage", params);
        } catch (Exception e) {
            System.out.println("getUsersByPage 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }


    public UserVO getUserById(int userIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        UserVO user = null;

        try {
            user = ss.selectOne("admin.getUserById", userIdx);
            if (user == null) {
                System.out.println("DB에서 해당 userIdx(" + userIdx + ")를 찾을 수 없습니다.");
            } else {
                System.out.println("DB에서 가져온 사용자 정보: " + user.toString());
            }
        } catch (Exception e) {
            System.out.println("getUserById 오류 발생: " + e.getMessage());
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return user;
    }

    public boolean updateUser(UserVO user) {
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            int rowsAffected = ss.update("admin.updateuser", user);
            ss.commit();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("updateUser 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            ss.close();
        }
    }

    public boolean insertLog(LogVO log) {
        System.out.println("insertLog 실행됨: " + log);
        SqlSession ss = FactoryService.getFactory().openSession();

        int result = ss.insert("insertlog", log);

        if (result > 0) {
            ss.commit();
        }

        System.out.println("로그 INSERT 결과: " + result);
        return result > 0;
    }

}