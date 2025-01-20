package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MovieVO;
import mybatis.vo.TheaterVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReservationDAO {
    // 예매 가능한 영화 조회
    public static MovieVO[] movieList() {
        MovieVO[] ar = null;

        // 빈 HashMap 생성 (파라미터 없이 동작)
        HashMap<String, Object> map = new HashMap<>();

        SqlSession ss = FactoryService.getFactory().openSession();
        List<MovieVO> list = ss.selectList("movie.movieList", map);
        if (list != null && !list.isEmpty()) {
            ar = new MovieVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }

    // 전체 극장 조회
    public static Map<String, Integer> theaterRegion() {
        Map<String, Integer> ar = new HashMap<String, Integer>();

        SqlSession ss = FactoryService.getFactory().openSession();
        List<Map<String, Object>> list = ss.selectList("theater.getTheaterRegion");

        for (Map<String, Object> item : list) {
            String region = (String) item.get("region");
            Integer count = ((Number) item.get("count")).intValue();
            ar.put(region, count);
        }

        ss.close();
        return ar;
    }

    // 지역 > 극장 조회
    public static TheaterVO[] theaterName(String region) {
        TheaterVO[] ar = null;

        SqlSession ss = FactoryService.getFactory().openSession();
        List<TheaterVO> list = ss.selectList("theater.getTheaterName", region);

        if (list != null && !list.isEmpty()) {
            ar = new TheaterVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }

}
