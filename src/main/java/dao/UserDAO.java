package dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.Map;

public class UserDAO {

    public boolean usercheck(String userId, String userPassword) {
      SqlSession ss = FactoryService.getFactory().openSession();

            // 파라미터 설정
            Map<String, String> map = new HashMap<>();
            map.put("userId", userId);
            map.put("userPassword", userPassword);

            // 쿼리 실행
            int cnt = ss.selectOne("UserMapper.usercheck", map);
            System.out.println("count"+cnt);

            // 결과 반환
            return cnt > 0;
    }
}
