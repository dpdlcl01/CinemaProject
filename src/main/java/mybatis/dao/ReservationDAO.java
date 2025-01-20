package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MovieVO;
import mybatis.vo.TheaterVO;
import mybatis.vo.TimetableVO;
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

    // 특정 극장 및 날짜의 상영 시간표 조회
    public static TimetableVO[] allTimetable(String theaterIdx, String movieIdx) {
        TimetableVO[] ar = null;

        // MyBatis 파라미터 전달용 HashMap 생성
        HashMap<String, String> map = new HashMap<>();
        map.put("theaterIdx", theaterIdx);
        map.put("movieIdx", movieIdx);

        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            List<TimetableVO> list = ss.selectList("timetable.allTimetable", map);
            System.out.println("입력된 theaterIdx: " + theaterIdx);
            System.out.println("입력된 movieIdx: " + movieIdx);
            System.out.println("DB에서 반환된 데이터: " + list);

            if (list != null && !list.isEmpty()) {
                ar = new TimetableVO[list.size()];
                list.toArray(ar);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return ar;
    }
}
