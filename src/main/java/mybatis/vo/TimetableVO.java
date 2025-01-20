package mybatis.vo;

public class TimetableVO {
    private String timetableIdx, movieIdx, theaterIdx, screenIdx, timetableStartTime, timetableEndTime;

    public String getTimetableIdx() {
        return timetableIdx;
    }

    public void setTimetableIdx(String timetableIdx) {
        this.timetableIdx = timetableIdx;
    }

    public String getMovieIdx() {
        return movieIdx;
    }

    public void setMovieIdx(String movieIdx) {
        this.movieIdx = movieIdx;
    }

    public String getTheaterIdx() {
        return theaterIdx;
    }

    public void setTheaterIdx(String theaterIdx) {
        this.theaterIdx = theaterIdx;
    }

    public String getScreenIdx() {
        return screenIdx;
    }

    public void setScreenIdx(String screenIdx) {
        this.screenIdx = screenIdx;
    }

    public String getTimetableStartTime() {
        return timetableStartTime;
    }

    public void setTimetableStartTime(String timetableStartTime) {
        this.timetableStartTime = timetableStartTime;
    }

    public String getTimetableEndTime() {
        return timetableEndTime;
    }

    public void setTimetableEndTime(String timetableEndTime) {
        this.timetableEndTime = timetableEndTime;
    }
}
