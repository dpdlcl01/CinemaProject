package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MovieVO;
import mybatis.vo.TheaterVO;
import mybatis.vo.TimetableVO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReservationDAO {

    public static int updateReservation(String ridx){
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt =ss.update("reservation.updateReservation", ridx);

        if(cnt>0){
            ss.commit();

        }else {
            ss.rollback();
        }
        ss.close();

        return cnt;
    }

    // 예매 가능한 영화 조회
    public static MovieVO[] movieList() {
        MovieVO[] ar = null;

        // 빈 HashMap 생성 (파라미터 없이 동작)
        HashMap<String, Object> map = new HashMap<>();

        SqlSession ss = FactoryService.getFactory().openSession();
        List<MovieVO> list = ss.selectList("reservation.movieList", map);
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

    // 영화 선택시 가능 상영관 조회
    public static List<TimetableVO> getAvailableTheaters(String movieIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();

        List<TimetableVO> list = ss.selectList("reservation.getAvailableTheaters", movieIdx);

        ss.close();
        return list;
    }

  // 특정 극장 및 날짜의 상영 시간표 조회
  public static TimetableVO[] allTimetable(String theaterIdx, String movieIdx, String targetDate) {
    TimetableVO[] ar = null;

    // MyBatis 파라미터 전달용 HashMap 생성
    HashMap<String, String> map = new HashMap<>();
    map.put("theaterIdx", theaterIdx);
    map.put("movieIdx", movieIdx);
    map.put("targetDate", targetDate);

    SqlSession ss = FactoryService.getFactory().openSession();
    try {
        List<TimetableVO> list = ss.selectList("reservation.allTimetable", map);
        System.out.println("입력된 theaterIdx: " + theaterIdx);
        System.out.println("입력된 movieIdx: " + movieIdx);
        System.out.println("입력된 targetDate: " + targetDate);
        System.out.println("DB에서 반환된 데이터 개수: " + list.size());

        for (TimetableVO t : list) {
            System.out.println("상영 시간표 ID: " + t.getTimetableIdx());
            System.out.println("스크린명: " + t.getScreenName());
            System.out.println("총 좌석 수: " + t.getScreenSeatCount());
            System.out.println("사용 가능한 좌석 수: " + t.getAvailableSeats()); // 수정된 부분
        }

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

  // 좌석 선택 후 영화 조회
  public static MovieVO movieDetailList(String movieIdx) {
    MovieVO vo = null;

    SqlSession ss = FactoryService.getFactory().openSession();
    vo = ss.selectOne("reservation.movieDetail", movieIdx);

    ss.close();
    return vo;
  }

  // 좌석 선택 후 상영 시간표 조회
  public static TimetableVO timetableDetailList(String timetableIdx) {
    TimetableVO vo = null;

    SqlSession ss = FactoryService.getFactory().openSession();
    vo = ss.selectOne("reservation.timetableDetail", timetableIdx);
    ss.close();
    return vo;
  }

    // 좌석 선택 후 극장 상세 정보 조회
    public static TheaterVO theaterDetailList(String theaterIdx) {
        TheaterVO vo = null;

        SqlSession ss = FactoryService.getFactory().openSession();
        vo = ss.selectOne("reservation.theaterDetail", theaterIdx);
        ss.close();
        return vo;
    }

}

}