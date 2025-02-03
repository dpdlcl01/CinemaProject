package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.AdminVO;
import org.apache.ibatis.session.SqlSession;
import mybatis.vo.UserVO;

import java.util.HashMap;
import java.util.Map;

public class LoginDAO {

    // 로그인 검증
    public static boolean usercheck(String userId, String userPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();


        Map<String, String> map = new HashMap<>();
        map.put("userId", userId);
        map.put("userPassword", userPassword);


        int cnt = ss.selectOne("login.usercheck", map);
        ss.close();

        return cnt > 0;
    }

    // 유저 정보 가져오기
    public static UserVO getUserInfo(String userId) {
        SqlSession ss = FactoryService.getFactory().openSession();

        Map<String, String> map = new HashMap<>();
        map.put("userId", userId);

        UserVO userVO = ss.selectOne("login.getUserInfo", map);
        ss.close();

        return userVO;
    }

    // 관리자 로그인 검증
    public static boolean adminCheck(String adminId, String adminPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();


        Map<String, String> map = new HashMap<>();
        map.put("adminId", adminId);
        map.put("adminPassword", adminPassword);

        int cnt = ss.selectOne("login.adminCheck", map);
        ss.close();

        return cnt > 0;
    }
    
    // 관리자 정보 가져오기
    public static AdminVO getAdminInfo(String adminId) {
        SqlSession ss = FactoryService.getFactory().openSession();

        Map<String, String> map = new HashMap<>();
        map.put("adminId", adminId);

        AdminVO adminvo = ss.selectOne("login.getAdminInfo", map);
        ss.close();

        return adminvo;
    }

}
