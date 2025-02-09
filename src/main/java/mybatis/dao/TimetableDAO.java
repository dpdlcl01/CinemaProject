package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MovieVO;
import mybatis.vo.TimetableVO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TimetableDAO {

    // 관리자 페이지 상영 시간표 개수 조회
    public static int countTimetables(String screeningDate, String theaterIdx, String screenIdx, String searchValue) {
        HashMap<String, String> map = new HashMap<>();
        map.put("screeningDate", screeningDate);
        map.put("theaterIdx", theaterIdx);
        map.put("screenIdx", screenIdx);
        map.put("movieTitle", searchValue);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("adminTimetable.countTimetables", map);
        ss.close();
        return cnt;
    }

    // 상영 시간표 목록 조회
    public static TimetableVO[] getTimetableList(String screeningDate, String theaterIdx, String screenIdx,
                                                 String searchValue, int begin, int end) {
        TimetableVO[] timetableArray = null;

        HashMap<String, Object> map = new HashMap<>();
        map.put("screeningDate", screeningDate);
        map.put("theaterIdx", theaterIdx);
        map.put("screenIdx", screenIdx);
        map.put("movieTitle", searchValue);
        map.put("begin", begin);
        map.put("end", end);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<TimetableVO> tList = ss.selectList("adminTimetable.getTimetableList", map);
        if (tList != null && !tList.isEmpty()) {
            timetableArray = new TimetableVO[tList.size()];
            tList.toArray(timetableArray);
        }

        return timetableArray;
    }

    // 극장과 상영관 정보 조회 메서드
    public static List<Map<String, Object>> getTheatersWithScreens() {
        SqlSession ss = FactoryService.getFactory().openSession();

        // 쿼리 실행 - 극장과 상영관 정보 조인
        List<Map<String, Object>> theatersWithScreens = ss.selectList("adminTimetable.getTheatersWithScreens");

        ss.close();
        return theatersWithScreens;
    }




/*    // 전체 상영 시간표 수 가져오기
    public static int getTimetableCount() {
        SqlSession ss = FactoryService.getFactory().openSession();
        int count = ss.selectOne("adminTimetable.getTimetableCount");
        ss.close();
        return count;
    }

    // 상영 시간표 목록 가져오기
    public static TimetableVO[] getTimetableList(int begin, int end) {
        TimetableVO[] timetableArray = null;

        Map<String, Integer> map = new HashMap<>();
        map.put("begin", begin);
        map.put("end", end);
        SqlSession ss = FactoryService.getFactory().openSession();
        List<TimetableVO> tList = ss.selectList("adminTimetable.getTimetableList", map);
        if(tList != null && !tList.isEmpty()) {
            timetableArray = new TimetableVO[tList.size()];
            tList.toArray(timetableArray);
        }
        ss.close();
        return timetableArray;
    }

    // 특정 극장의 상영 시간표 목록 가져오기
    public static TimetableVO[] getTimetableListByTheater(String theaterIdx, int begin, int end) {
        TimetableVO[] timetableArray = null;

        Map<String, Object> map = new HashMap<>();
        map.put("theaterIdx", theaterIdx);
        map.put("begin", begin);
        map.put("end", end);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<TimetableVO> tList = ss.selectList("adminTimetable.getTimetableListByTheater", map);
        if(tList != null && !tList.isEmpty()) {
            timetableArray = new TimetableVO[tList.size()];
            tList.toArray(timetableArray);
        }
        ss.close();
        return timetableArray;
    }*/





    // 특정 개수의 예매율 상위 영화 가져오기
    public static List<MovieVO> getMoviesByRange(int limit, int offset){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("limit", limit);
        map.put("offset", offset);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<MovieVO> mList = ss.selectList("adminTimetable.getMoviesByRange", map);
        ss.close();
        return mList;
    }

    // 시간표 삽입 메서드
    public static boolean insertTimetable(TimetableVO tvo) {
        boolean result = false;
        SqlSession ss = FactoryService.getFactory().openSession();

        int cnt = ss.insert("adminTimetable.insertTimetable", tvo);
        if (cnt > 0) {
            ss.commit();
            result = true;
        } else {
            ss.rollback();
        }
        ss.close();
        return result;
    }

    // 상영관 ID 조회 메서드
    public static String getScreenIdxByType(String theaterIdx, String screenType) {

        TimetableVO tvo = new TimetableVO();
        tvo.setTheaterIdx(theaterIdx);
        tvo.setScreenType(screenType);

        SqlSession ss = FactoryService.getFactory().openSession();
        String screenIdx = ss.selectOne("adminTimetable.getScreenIdxByType", tvo);
        ss.close();
        return screenIdx;
    }

    // 모든 극장 ID 조회 메서드
    public static List<String> getAllTheaterIdx() {
        List<String> theaterIdxList = new ArrayList<>();

        SqlSession ss = FactoryService.getFactory().openSession();
        theaterIdxList = ss.selectList("adminTimetable.getAllTheaterIdx");
        ss.close();
        return theaterIdxList;
    }

}
