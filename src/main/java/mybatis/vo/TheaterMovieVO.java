package mybatis.vo;


public class TheaterMovieVO {
    private String screenType;

    public String getTimeTableIdx() {
        return timeTableIdx;
    }

    public void setTimeTableIdx(String timeTableIdx) {
        this.timeTableIdx = timeTableIdx;
    }

    private String timeTableIdx;

    public String getMovieIdx() {
        return movieIdx;
    }

    public void setMovieIdx(String movieIdx) {
        this.movieIdx = movieIdx;
    }

    private String movieIdx;

    public String getScreenIdx() {
        return screenIdx;
    }

    public void setScreenIdx(String screenIdx) {
        this.screenIdx = screenIdx;
    }

    private String screenIdx;

    public String getScreenType() {
        return screenType;
    }

    public void setScreenType(String screenType) {
        this.screenType = screenType;
    }

    private String screenName;
    private String movieTitle;
    private String movieGrade;
    private String screenSeatCount;
    private String startTime;

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getMovieTime() {
        return movieTime;
    }

    public void setMovieTime(String movieTime) {
        this.movieTime = movieTime;
    }

    private String movieTime;
    private String remainSeat;
    private String timetableStartTime;
    private String timetableEndTime;

    public String getMovieGrade() {
        return movieGrade;
    }

    public void setMovieGrade(String movieGrade) {
        this.movieGrade = movieGrade;
    }

    public String getScreenName() {
        return screenName;
    }

    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getScreenSeatCount() {
        return screenSeatCount;
    }

    public void setScreenSeatCount(String screenSeatCount) {
        this.screenSeatCount = screenSeatCount;
    }

    public String getRemainSeat() {
        return remainSeat;
    }

    public void setRemainSeat(String remainSeat) {
        this.remainSeat = remainSeat;
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
