package action.admin.timetable;

import action.Action;
import action.admin.movie.UpdateStatusAction;
import mybatis.dao.TimetableDAO;
import mybatis.vo.MovieVO;
import mybatis.vo.TimetableVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

        HttpSession session = request.getSession();
        UpdateStatusAction statusAction = new UpdateStatusAction();

        try {
            int scheduleDays = Integer.parseInt(request.getParameter("scheduleDays"));
            int schedulePeriod = Integer.parseInt(request.getParameter("schedulePeriod"));

            statusAction.updateStatusMessage(session, "상영 시간표 생성을 시작합니다...");

            List<MovieVO> remainingMovies = new ArrayList<>();

            statusAction.updateStatusMessage(session, "Top 5 영화 시간표를 생성 중입니다...");
            remainingMovies.addAll(createTop5Timetable(scheduleDays, schedulePeriod, session, statusAction));

            statusAction.updateStatusMessage(session, "Top 10 영화 시간표를 생성 중입니다...");
            remainingMovies.addAll(createTop10Timetable(scheduleDays, schedulePeriod, session, statusAction));

            statusAction.updateStatusMessage(session, "Top 20 영화 시간표를 생성 중입니다...");
            remainingMovies.addAll(createTop20Timetable(scheduleDays, schedulePeriod, session, statusAction));

            statusAction.updateStatusMessage(session, "기타 남은 영화 시간표를 생성 중입니다...");
            remainingMovies.addAll(createRemainingTimetable(scheduleDays, schedulePeriod, session, statusAction));

            if (!remainingMovies.isEmpty()) {
                statusAction.updateStatusMessage(session, "남은 영화 시간표를 배치 중입니다...");
                distributeRemainingMovies(remainingMovies, scheduleDays, schedulePeriod);
            }

            statusAction.updateStatusMessage(session, "상영 시간표 생성이 완료되었습니다.");
            out.write("{\"success\": true, \"message\": \"상영 시간표가 성공적으로 생성되었습니다.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            statusAction.updateStatusMessage(session, "상영 시간표 생성 중 오류가 발생했습니다.");
            out.write("{\"success\": false, \"message\": \"상영 시간표 생성 중 오류가 발생했습니다.\"}");
        }

        return null;
    }

    private List<MovieVO> createTop5Timetable(int startOffset, int daysToGenerate, HttpSession session, UpdateStatusAction statusAction) {
        List<MovieVO> mList = TimetableDAO.getMoviesByRange(5, 0);
        List<String> theaterIdxList = TimetableDAO.getAllTheaterIdx();
        String[] screenTypes = {"5", "4", "3", "2", "1"};
        statusAction.updateStatusMessage(session, "Top 5 영화 시간표 생성 중... 영화 배치 중입니다.");
        return generateTimetable(mList, theaterIdxList, screenTypes, startOffset, daysToGenerate, 6, true, session, statusAction);
    }

    private List<MovieVO> createTop10Timetable(int startOffset, int daysToGenerate, HttpSession session, UpdateStatusAction statusAction) {
        List<MovieVO> mList = TimetableDAO.getMoviesByRange(5, 5);
        String[] screenTypesA = {"7", "8", "10"};
        String[] screenTypesB = {"8", "10"};
        List<MovieVO> remainingMoviesA = generateTimetable(mList, getGroupTheaters("A"), screenTypesA, startOffset, daysToGenerate, 6, false, session, statusAction);
        List<MovieVO> remainingMoviesB = generateTimetable(mList, getGroupTheaters("B"), screenTypesB, startOffset, daysToGenerate, 6, false, session, statusAction);
        remainingMoviesA.addAll(remainingMoviesB);
        return remainingMoviesA;
    }

    private List<MovieVO> createTop20Timetable(int startOffset, int daysToGenerate, HttpSession session, UpdateStatusAction statusAction) {
        List<MovieVO> mList = TimetableDAO.getMoviesByRange(10, 10);
        String[] screenTypesA = {"6", "9"};
        String[] screenTypesB = {"6", "7", "9"};
        List<MovieVO> remainingMoviesA = generateTimetable(mList.subList(0, 5), getGroupTheaters("A"), screenTypesA, startOffset, daysToGenerate, 3, false, session, statusAction);
        List<MovieVO> remainingMoviesB = generateTimetable(mList.subList(5, mList.size()), getGroupTheaters("B"), screenTypesB, startOffset, daysToGenerate, 3, false, session, statusAction);
        remainingMoviesA.addAll(remainingMoviesB);
        return remainingMoviesA;
    }

    private List<MovieVO> createRemainingTimetable(int startOffset, int daysToGenerate, HttpSession session, UpdateStatusAction statusAction) {
        List<MovieVO> mList = TimetableDAO.getMoviesByRange(60, 20);
        String[] screenTypes = {"6", "7", "9"};
        statusAction.updateStatusMessage(session, "기타 영화 시간표 생성 중...");
        return generateTimetable(mList, TimetableDAO.getAllTheaterIdx(), screenTypes, startOffset, daysToGenerate, 1, false, session, statusAction);
    }

    private List<MovieVO> generateTimetable(List<MovieVO> movies, List<String> theaters, String[] screenTypes,
                                            int startOffset, int daysToGenerate, int timesPerDay, boolean isTop5,
                                            HttpSession session, UpdateStatusAction statusAction) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        List<MovieVO> remainingMovies = new ArrayList<>();

        if (isTop5) {
            for (int i = 0; i < movies.size(); i++) {
                MovieVO mvo = movies.get(i);
                String movieIdx = mvo.getMovieIdx();
                int movieDuration = Integer.parseInt(mvo.getMovieTime());

                boolean scheduled = false;

                for (String theaterIdx : theaters) {
                    String screenIdx = TimetableDAO.getScreenIdxByType(theaterIdx, screenTypes[i % screenTypes.length]);
                    if (screenIdx == null) continue;

                    scheduled = true;
                    createDailyTimetable(movieIdx, theaterIdx, screenIdx, startOffset, daysToGenerate, timesPerDay, movieDuration, formatter);
                }

                if (!scheduled) {
                    remainingMovies.add(mvo);
                }
            }
        } else {
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

                if (movieIndex >= movies.size()) break;
            }

            while (movieIndex < movies.size()) {
                remainingMovies.add(movies.get(movieIndex));
                movieIndex++;
            }
        }

        return remainingMovies;
    }

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

    private void distributeRemainingMovies(List<MovieVO> remainingMovies, int startOffset, int daysToGenerate) {
        List<String> theaters = TimetableDAO.getAllTheaterIdx();
        String[] screenTypes = {"1", "2", "3", "4", "5"};
        generateTimetable(remainingMovies, theaters, screenTypes, startOffset, daysToGenerate, 1, false, null, null);
    }

    private List<String> getGroupTheaters(String theaterType) {
        List<String> theaterIdxList = TimetableDAO.getAllTheaterIdx();
        List<String> groupA = new ArrayList<>();
        List<String> groupB = new ArrayList<>();

        for (String theaterIdx : theaterIdxList) {
            if (Integer.parseInt(theaterIdx) % 2 == 1) {
                groupA.add(theaterIdx);
            } else {
                groupB.add(theaterIdx);
            }
        }

        return theaterType.equals("A") ? groupA : groupB;
    }

    private LocalDateTime[] getStartTimes(int daysFromNow, int timesPerDay) {
        LocalDate date = LocalDate.now().plusDays(daysFromNow);

        if (timesPerDay == 6) {
            return new LocalDateTime[]{
                    date.atTime(9, 0),
                    date.atTime(11, 30),
                    date.atTime(14, 0),
                    date.atTime(16, 30),
                    date.atTime(19, 0),
                    date.atTime(21, 30)
            };
        } else if (timesPerDay == 3) {
            return new LocalDateTime[]{
                    date.atTime(16, 30),
                    date.atTime(19, 0),
                    date.atTime(21, 30)
            };
        } else {
            return new LocalDateTime[]{
                    date.atTime(9, 0),
                    date.atTime(11, 30),
                    date.atTime(14, 0)
            };
        }
    }
}
