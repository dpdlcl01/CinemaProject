package dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import vo.UserVO;

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

    public static List<UserVO> getUsersByPage(int begin, int pageSize, String searchType, String searchKeyword) {
        try (SqlSession ss = FactoryService.getFactory().openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("begin", begin);
            params.put("pageSize", pageSize);
            params.put("searchType", searchType);
            params.put("searchKeyword", searchKeyword);

            return ss.selectList("admin.getUsersByPage", params);
        }
    }
}