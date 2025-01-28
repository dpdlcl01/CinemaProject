package mybatis.dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import mybatis.vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class AdminDAO {
    public static int getTotalUserCount(String searchType, String searchKeyword) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("searchType", searchType);
            params.put("searchKeyword", searchKeyword);
            return ss.selectOne("admin.getTotalUserCount", params);
        }
    }

    public static List<UserVO> getUsersByPage(int begin, int numPerPage, String searchType, String searchKeyword) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("begin", begin); // 시작 행 번호
            params.put("numPerPage", numPerPage);
            params.put("searchType", searchType);
            params.put("searchKeyword", searchKeyword);

            return ss.selectList("admin.getUsersByPage", params);
        }
    }

    public UserVO getUserById(int userIdx) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            return ss.selectOne("admin.getUserById", userIdx);
        }
    }

    public boolean updateUser(UserVO user) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            int rowsAffected = ss.update("UserMapper.updateUser", user);
            ss.commit();
            return rowsAffected > 0;
        }
    }
}