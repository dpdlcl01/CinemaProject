package dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import vo.userVO;

import java.util.HashMap;
import java.util.Map;

public class UserDAO {

    // 로그인 검증
    public boolean usercheck(String userId, String userPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();


        Map<String, String> map = new HashMap<>();
        map.put("userId", userId);
        map.put("userPassword", userPassword);


        int cnt = ss.selectOne("UserMapper.usercheck", map);
        System.out.println("count"+cnt);
        ss.close();

        return cnt > 0;
    }

    // 유저 정보 가져오기
    public userVO getUserInfo(String userId) {
        SqlSession ss = FactoryService.getFactory().openSession();

        Map<String, String> map = new HashMap<>();
        map.put("userId", userId);

        userVO userVO = ss.selectOne("UserMapper.getUserInfo", map);
        ss.close();

        return userVO;
    }
}