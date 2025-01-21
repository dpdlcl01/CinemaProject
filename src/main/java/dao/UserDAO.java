package dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import vo.theaterVO;
import vo.userVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO {

    // 로그인 검증
    public boolean usercheck(String userId, String userPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();


        Map<String, String> map = new HashMap<>();
        map.put("userId", userId);
        map.put("userPassword", userPassword);


        int cnt = ss.selectOne("UserMapper.usercheck", map);
        System.out.println("count" + cnt);
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

    public static theaterVO[] getTheaterInfo() {
        SqlSession ss = FactoryService.getFactory().openSession();


        List<theaterVO> list = ss.selectList("UserMapper.getTheaterInfo");
        theaterVO[] theaterVO = new theaterVO[list.size()];
        list.toArray(theaterVO);
        System.out.println(theaterVO.length);
        ss.close();

        return theaterVO;
    }

    // 극장 ID로 극장 정보를 조회하는 메서드 (HashMap 사용)
    public static theaterVO getTheaterById(String theaterIdx) {
        // SqlSession 생성
        SqlSession ss = FactoryService.getFactory().openSession();

        // 파라미터를 담을 HashMap 생성
        Map<String, String> map = new HashMap<>();
        map.put("theaterIdx", theaterIdx);

        theaterVO theaterVO = ss.selectOne("UserMapper.getTheaterById", map);
        ss.close();

        return theaterVO;
    }

    /* 선호하는 극장 */
    public static List<Map<String, Object>> getFavorite(String userIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();

        Map<String, String> map = new HashMap<>();
        map.put("userIdx", userIdx);

        List<Map<String, Object>> favoriteTheaters = ss.selectList("UserMapper.getFavorite", map);
        ss.close();

        return favoriteTheaters;
    }
}
