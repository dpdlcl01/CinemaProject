package mybatis.vo;

import java.util.List;

public class ReservationDetailVO {

  private String reservationIdx, userName, timetableStartTime, timetableEndTime, movieTitle, theaterName, screenName;
  private List<String> seatNumber; // 좌석 번호 리스트

  public String getReservationIdx() {
    return reservationIdx;
  }

  public void setReservationIdx(String reservationIdx) {
    this.reservationIdx = reservationIdx;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
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

  public String getMovieTitle() {
    return movieTitle;
  }

  public void setMovieTitle(String movieTitle) {
    this.movieTitle = movieTitle;
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

  public List<String> getSeatNumber() {
    return seatNumber;
  }

  public void setSeatNumber(List<String> seatNumber) {
    this.seatNumber = seatNumber;
  }
}
