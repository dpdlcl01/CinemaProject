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

    // 전체 사용자 수 반환 (검색 조건에 따라)
    public static int getTotalUserCount(String searchType, String searchKeyword,
                                        String userJoinMonth, String userStatus, String userGrade) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchKeyword", searchKeyword);
        map.put("userJoinMonth", userJoinMonth);
        map.put("userStatus", userStatus);
        map.put("userGrade", userGrade);

        SqlSession ss = FactoryService.getFactory().openSession();
        int count = ss.selectOne("admin.getTotalUserCount", map);
        ss.close();

        return count;
    }

    // 사용자 목록 반환 (페이징 및 검색 조건 포함)
    public static UserVO[] getUsersByPage(String searchType, String searchKeyword,
                                          String userJoinMonth, String userStatus, String userGrade,
                                          int begin, int end) {
        UserVO[] userArray = null;

        HashMap<String, Object> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchKeyword", searchKeyword);
        map.put("userJoinMonth", userJoinMonth);
        map.put("userStatus", userStatus);
        map.put("userGrade", userGrade);
        map.put("begin", begin);
        map.put("end", end);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<UserVO> list = ss.selectList("admin.getUsersByPage", map);
        if (list != null && !list.isEmpty()) {
            userArray = new UserVO[list.size()];
            list.toArray(userArray);
        }
        ss.close();

        return userArray;
    }


    // 전체 사용자 수 반환 (검색 조건에 따라)
    public static int getTotalGuestCount(String searchType, String searchKeyword,
                                        String userJoinMonth) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchKeyword", searchKeyword);
        map.put("userJoinMonth", userJoinMonth);

        SqlSession ss = FactoryService.getFactory().openSession();
        int count = ss.selectOne("admin.getTotalGuestCount", map);
        ss.close();

        return count;
    }

    // 사용자 목록 반환 (페이징 및 검색 조건 포함)
    public static UserVO[] getGuestsByPage(String searchType, String searchKeyword,
                                          String userJoinMonth, int begin, int end) {
        UserVO[] userArray = null;

        HashMap<String, Object> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchKeyword", searchKeyword);
        map.put("userJoinMonth", userJoinMonth);
        map.put("begin", begin);
        map.put("end", end);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<UserVO> list = ss.selectList("admin.getGuestsByPage", map);
        if (list != null && !list.isEmpty()) {
            userArray = new UserVO[list.size()];
            list.toArray(userArray);
        }
        ss.close();

        return userArray;
    }





    public UserVO getUserById(String userIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        UserVO user = null;

        try {
            user = ss.selectOne("admin.getUserById", userIdx);
        } catch (Exception e) {
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

        return result > 0;
    }

}