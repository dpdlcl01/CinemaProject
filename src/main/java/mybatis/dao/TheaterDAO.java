package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.EventVO;
import org.apache.ibatis.session.SqlSession;
import mybatis.vo.PriceVO;
import mybatis.vo.TheaterVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TheaterDAO {

    public static TheaterVO[] getTheaterInfo() {
        SqlSession ss = FactoryService.getFactory().openSession();


        List<TheaterVO> list = ss.selectList("theater.getTheaterInfo");
        TheaterVO[] theaterVO = new TheaterVO[list.size()];
        list.toArray(theaterVO);
//        System.out.println(theaterVO.length);
        ss.close();

        return theaterVO;
    }

    // 극장 ID로 극장 정보를 조회하는 메서드 (HashMap 사용)
    public static TheaterVO getTheaterById(String theaterIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();

        // 파라미터를 담을 HashMap 생성
        Map<String, String> map = new HashMap<>();
        map.put("theaterIdx", theaterIdx);

        TheaterVO theaterVO = ss.selectOne("theater.getTheaterById", map);
        ss.close();

        return theaterVO;
    }

    /* 선호하는 극장 */
    public static List<Map<String, Object>> getFavorite(String userIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();

        Map<String, String> map = new HashMap<>();
        map.put("userIdx", userIdx);

        List<Map<String, Object>> favoriteTheaters = ss.selectList("theater.getFavorite", map);
        ss.close();

        return favoriteTheaters;
    }

    public static PriceVO[] getPrice() {
        SqlSession ss = FactoryService.getFactory().openSession();

        List<PriceVO> list = ss.selectList("theater.getPrice");


        PriceVO[] priceVO = new PriceVO[list.size()];
        list.toArray(priceVO);

        ss.close();

        return priceVO;
    }

    public static EventVO[] getEvent() {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<EventVO> list = ss.selectList("theater.getEvent");
        EventVO[] eventVO = new EventVO[list.size()];
        list.toArray(eventVO);
        ss.close();
        return eventVO;
    }
}
