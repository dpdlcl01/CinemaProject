package mybatis.vo;

public class TimetableVO {
  private String timetableIdx, movieIdx, theaterIdx, screenIdx,
      timetableStartTime, timetableEndTime, screenName, screenType, screenSeatCount, seatStatus, availableSeats;

  public String getAvailableSeats() { return availableSeats; }

  public void setAvailableSeats(String availableSeats) { this.availableSeats = availableSeats; }

  public String getScreenSeatCount() {
    return screenSeatCount;
  }

  public void setScreenSeatCount(String screenSeatCount) {
    this.screenSeatCount = screenSeatCount;
  }

  public String getSeatStatus() {
    return seatStatus;
  }

  public void setSeatStatus(String seatStatus) {
    this.seatStatus = seatStatus;
  }

  public String getScreenName() { return screenName; }

  public void setScreenName(String screenName) { this.screenName = screenName; }

  public String getScreenType() { return screenType; }

  public void setScreenType(String screenType) { this.screenType = screenType; }

  public String getTimetableIdx() { return timetableIdx; }

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