package mybatis.vo;

public class ReservationVO {
    String reservationIdx, theaterIdx, screenIdx, timetableIdx, movieTitle, moviePosterUrl,reservationDate,theaterName,screenName,timetableStartTime;

    public String getTimetableStartTime() {
        return timetableStartTime;
    }

    public void setTimetableStartTime(String timetableStartTime) {
        this.timetableStartTime = timetableStartTime;
    }

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }

    public String getScreenName() {
        return screenName;
    }

    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }

    public String getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(String reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getReservationIdx() {
        return reservationIdx;
    }

    public void setReservationIdx(String reservationIdx) {
        this.reservationIdx = reservationIdx;
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

    public String getTimetableIdx() {
        return timetableIdx;
    }

    public void setTimetableIdx(String timetableIdx) {
        this.timetableIdx = timetableIdx;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getMoviePosterUrl() {
        return moviePosterUrl;
    }

    public void setMoviePosterUrl(String moviePosterUrl) {
        this.moviePosterUrl = moviePosterUrl;
    }
}
