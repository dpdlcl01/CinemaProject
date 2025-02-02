package action.admin.timetable;

import action.Action;
import mybatis.dao.TimetableDAO;
import mybatis.vo.MovieVO;
import mybatis.vo.TimetableVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class TimetableAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            // 각 순위 범위별 상영 시간표 생성
            createTimetableForRange(5, 0);   // 상위 5개 영화
//            createTimetableForRange(10, 10); // 11~20위 영화
//            createTimetableForRange(60, 20); // 21~80위 영화

            out.write("{\"success\": true, \"message\": \"상영 시간표가 성공적으로 생성되었습니다.\"}");

        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"success\": false, \"message\": \"상영 시간표 생성 중 오류가 발생했습니다.\"}");
        }

        return null;
    }

    private void createTimetableForRange(int limit, int offset) {
        // 특정 범위의 영화 목록 가져오기
        List<MovieVO> mList = TimetableDAO.getMoviesByRange(limit, offset);

        // 극장 목록 가져오기
        List<String> theaterIdxList = TimetableDAO.getAllTheaterIdx();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        String[] screenTypes = {"5", "4", "3", "2", "1"}; // screenType 문자열 - 예매율 1위부터 5위까지 영화가 들어갈 상영관번호

        for (int i = 0; i < mList.size(); i++) {
            MovieVO mvo = mList.get(i);
            String movieIdx = mvo.getMovieIdx();
            int movieDuration = Integer.parseInt(mvo.getMovieTime());

            for (String theaterIdx : theaterIdxList) {
                String screenIdx = TimetableDAO.getScreenIdxByType(theaterIdx, screenTypes[i % screenTypes.length]);
                if (screenIdx == null) continue;

                int daysOffset = 7;  // 오늘로부터 7일 후의 날짜
                int daysToGenerate = 2;  // 2일치 생성

                for (int day = 0; day < daysToGenerate; day++) {
                    int daysFromNow = daysOffset + day;  // 각 날짜 계산
                    LocalDateTime[] startTimes = getStartTimes(daysFromNow);

                    // 상영시간표 생성
                    for (LocalDateTime startTime : startTimes) {
                        TimetableVO timetable = new TimetableVO();
                        timetable.setMovieIdx(movieIdx);
                        timetable.setTheaterIdx(theaterIdx);
                        timetable.setScreenIdx(screenIdx);
                        timetable.setTimetableStartTime(startTime.format(formatter));
                        timetable.setTimetableEndTime(startTime.plusMinutes(movieDuration).format(formatter));

                        TimetableDAO.insertTimetable(timetable);
                    }
                }
            }
        }
    }


    // 날짜별 시간대 가져오는 메서드
    private LocalDateTime[] getStartTimes(int daysFromNow) {
        // 하루 6회 상영 시간대 설정
        return new LocalDateTime[]{
                LocalDate.now().plusDays(daysFromNow).atTime(9, 0),
                LocalDate.now().plusDays(daysFromNow).atTime(11, 30),
                LocalDate.now().plusDays(daysFromNow).atTime(14, 0),
                LocalDate.now().plusDays(daysFromNow).atTime(16, 30),
                LocalDate.now().plusDays(daysFromNow).atTime(19, 0),
                LocalDate.now().plusDays(daysFromNow).atTime(21, 30)
        };
    }



}
