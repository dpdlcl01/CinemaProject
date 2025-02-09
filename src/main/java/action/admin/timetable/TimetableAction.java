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
import java.util.ArrayList;
import java.util.List;

public class TimetableAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            // 파라미터 값 가져오기
            int scheduleDays = Integer.parseInt(request.getParameter("scheduleDays"));
            int schedulePeriod = Integer.parseInt(request.getParameter("schedulePeriod"));

            // 각 순위 범위에 따라 상영 시간표 생성 (파라미터로 받은 값 사용)
            createTop5Timetable(scheduleDays, schedulePeriod);
/*            createTop10Timetable(scheduleDays, schedulePeriod);
            createTop20Timetable(scheduleDays, schedulePeriod);
            createRemainingTimetable(scheduleDays, schedulePeriod);*/

            out.write("{\"success\": true, \"message\": \"상영 시간표가 성공적으로 생성되었습니다.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"success\": false, \"message\": \"상영 시간표 생성 중 오류가 발생했습니다.\"}");
        }

        return null;
    }


    // 1~5위 영화 시간표 생성
    private void createTop5Timetable(int startOffset, int daysToGenerate) {
        List<MovieVO> mList = TimetableDAO.getMoviesByRange(5, 0);
        List<String> theaterIdxList = TimetableDAO.getAllTheaterIdx();

        String[] screenTypes = {"5", "4", "3", "2", "1"};
        generateTimetable(mList, theaterIdxList, screenTypes, startOffset, daysToGenerate, 6, true);
    }


    // 6~10위 영화 시간표 생성
    private void createTop10Timetable(int startOffset, int daysToGenerate) {
        List<MovieVO> mList = TimetableDAO.getMoviesByRange(5, 5);

        // 그룹 A 설정
        String[] screenTypesA = {"7", "8", "10"};  // 그룹 A 상영관 (6위, 8위, 10위 영화)

        // 그룹 B 설정
        String[] screenTypesB = {"8", "10"};  // 그룹 B 상영관 (7위, 9위 영화)

        // 그룹 A의 시간표 생성
        generateTimetable(mList, getGroupTheaters("A"), screenTypesA, startOffset, daysToGenerate, 6, false);

        // 그룹 B의 시간표 생성
        generateTimetable(mList, getGroupTheaters("B"), screenTypesB, startOffset, daysToGenerate, 6, false);
    }


    // 11~20위 영화 시간표 생성
    private void createTop20Timetable(int startOffset, int daysToGenerate) {
        List<MovieVO> mList = TimetableDAO.getMoviesByRange(10, 10);

        // 그룹 A 설정: 남은 상영관 6관, 9관
        String[] screenTypesA = {"6", "9"};
        generateTimetable(mList.subList(0, 5), getGroupTheaters("A"), screenTypesA, startOffset, daysToGenerate, 3, false);

        // 그룹 B 설정: 남은 상영관 6관, 7관, 9관
        String[] screenTypesB = {"6", "7", "9"};
        generateTimetable(mList.subList(5, mList.size()), getGroupTheaters("B"), screenTypesB, startOffset, daysToGenerate, 3, false);
    }


    // 나머지 순위 영화 시간표 생성
    private void createRemainingTimetable(int startOffset, int daysToGenerate) {
        List<MovieVO> mList = TimetableDAO.getMoviesByRange(60, 20);
        String[] screenTypes = {"6", "7", "9"};
        generateTimetable(mList, TimetableDAO.getAllTheaterIdx(), screenTypes, startOffset, daysToGenerate, 1, false);
    }



    // 공통 시간표 생성 메서드
    private void generateTimetable(List<MovieVO> movies, List<String> theaters, String[] screenTypes,
                                   int startOffset, int daysToGenerate, int timesPerDay, boolean isTop5) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        if (isTop5) {
            // 1~5위 영화 로직
            for (int i = 0; i < movies.size(); i++) {
                MovieVO mvo = movies.get(i);
                String movieIdx = mvo.getMovieIdx();
                int movieDuration = Integer.parseInt(mvo.getMovieTime());

                for (String theaterIdx : theaters) {
                    String screenIdx = TimetableDAO.getScreenIdxByType(theaterIdx, screenTypes[i % screenTypes.length]);
                    if (screenIdx == null) continue;

                    createDailyTimetable(movieIdx, theaterIdx, screenIdx, startOffset, daysToGenerate, timesPerDay, movieDuration, formatter);
                }
            }
        } else {
            // 6~10위 및 11~20위 영화 로직
            int movieIndex = 0;

            for (String theaterIdx : theaters) {
                for (String screenIdx : screenTypes) {
                    if (movieIndex >= movies.size()) break;

                    MovieVO mvo = movies.get(movieIndex);
                    String movieIdx = mvo.getMovieIdx();
                    int movieDuration = Integer.parseInt(mvo.getMovieTime());

                    createDailyTimetable(movieIdx, theaterIdx, screenIdx, startOffset, daysToGenerate, timesPerDay, movieDuration, formatter);
                    movieIndex++;
                }
            }
        }
    }


    // 일일 상영시간표 생성
    private void createDailyTimetable(String movieIdx, String theaterIdx, String screenIdx,
                                      int startOffset, int daysToGenerate, int timesPerDay, int movieDuration,
                                      DateTimeFormatter formatter) {
        for (int day = 0; day < daysToGenerate; day++) {
            int daysFromNow = startOffset + day;
            LocalDateTime[] startTimes = getStartTimes(daysFromNow, timesPerDay);

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


    // 극장별 그룹 A, B 지역별로 나눠서 사용
    private List<String> getGroupTheaters(String theaterType){
        List<String> theaterIdxList = TimetableDAO.getAllTheaterIdx();

        List<String> groupA = new ArrayList<>();
        List<String> groupB = new ArrayList<>();

        // 홀수는 그룹 A, 짝수는 그룹 B로 분리
        for (String theaterIdx : theaterIdxList) {
            if (Integer.parseInt(theaterIdx) % 2 == 1) {
                groupA.add(theaterIdx);
            } else {
                groupB.add(theaterIdx);
            }
        }

        // 그룹에 따라 반환
        switch (theaterType) {
            case "A":
                return groupA;
            case "B":
                return groupB;
            default:
                return null;  // 잘못된 타입인 경우 빈 리스트 반환
        }
    }


    // 날짜별 상영 시간대 생성 메서드
    private LocalDateTime[] getStartTimes(int daysFromNow, int timesPerDay) {
        LocalDate date = LocalDate.now().plusDays(daysFromNow);

        // 하루 6회 상영 시간대 설정
        if (timesPerDay == 6) {
            return new LocalDateTime[]{
                    date.atTime(9, 0),
                    date.atTime(11, 30),
                    date.atTime(14, 0),
                    date.atTime(16, 30),
                    date.atTime(19, 0),
                    date.atTime(21, 30)
            };
            // 하루 3회 상영 시간대 설정 (오후시간) - 11~20위권 영화
        } else if (timesPerDay == 3) {
            return new LocalDateTime[]{
                    date.atTime(16, 30),
                    date.atTime(19, 0),
                    date.atTime(21, 30)
            };
            // 하루 3회 상영 시간대 설정 (오전시간) - 21~80위권 영화
        } else {
            return new LocalDateTime[]{
                    date.atTime(9, 0),
                    date.atTime(11, 30),
                    date.atTime(14, 0)
            };
        }
    }
}
