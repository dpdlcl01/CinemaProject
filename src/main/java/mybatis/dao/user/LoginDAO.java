package mybatis.dao.user;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import mybatis.vo.UserVO;

import java.util.HashMap;
import java.util.Map;

public class LoginDAO {

    // 로그인 검증
    public boolean usercheck(String userId, String userPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();


        Map<String, String> map = new HashMap<>();
        map.put("userId", userId);
        map.put("userPassword", userPassword);


        int cnt = ss.selectOne("login.usercheck", map);
//        System.out.println("count" + cnt);
        ss.close();

        return cnt > 0;
    }

    // 유저 정보 가져오기
    public UserVO getUserInfo(String userId) {
        SqlSession ss = FactoryService.getFactory().openSession();

        Map<String, String> map = new HashMap<>();
        map.put("userId", userId);

        UserVO userVO = ss.selectOne("login.getUserInfo", map);
        ss.close();

        return userVO;
    }


//    // 극장 ID로 극장 정보를 조회하는 메서드 (HashMap 사용)
//    public static TheaterVO getTheaterById(String theaterIdx) {
//        // SqlSession 생성
//        SqlSession ss = FactoryService.getFactory().openSession();
//
//        // 파라미터를 담을 HashMap 생성
//        Map<String, String> map = new HashMap<>();
//        map.put("theaterIdx", theaterIdx);
//
//        TheaterVO theaterVO = ss.selectOne("theater.getTheaterById", map);
//        ss.close();
//
//        return theaterVO;
//    }
//
//    /* 선호하는 극장 */
//    public static List<Map<String, Object>> getFavorite(String userIdx) {
//        SqlSession ss = FactoryService.getFactory().openSession();
//
//        Map<String, String> map = new HashMap<>();
//        map.put("userIdx", userIdx);
//
//        List<Map<String, Object>> favoriteTheaters = ss.selectList("theater.getFavorite", map);
//        ss.close();
//
//        return favoriteTheaters;
//    }
//
//    public static PriceVO[] getPrice() {
//        SqlSession ss = FactoryService.getFactory().openSession();
//
//        List<PriceVO> list = ss.selectList("theater.getPrice");
//
//
//        PriceVO[] priceVO = new PriceVO[list.size()];
//        list.toArray(priceVO);
//
//        ss.close();
//
//        return priceVO;
//    }


}
