package mybatis.vo;

import java.util.List;

public class ReservationDetailVO {

  private String reservationIdx, formattedReservationIdx, reservationDate, userName, timetableStartTime, timetableEndTime, movieTitle, moviePosterUrl, theaterName, screenName;
  private List<SeatDetailVO> seats; // 좌석 목록

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

  public String getFormattedReservationIdx() {
    return formattedReservationIdx;
  }

  public void setFormattedReservationIdx(String formattedReservationIdx) {
    this.formattedReservationIdx = formattedReservationIdx;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getMoviePosterUrl() {
    return moviePosterUrl;
  }

  public void setMoviePosterUrl(String moviePosterUrl) {
    this.moviePosterUrl = moviePosterUrl;
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

  public List<SeatDetailVO> getSeats() {
    return seats;
  }

  public void setSeats(List<SeatDetailVO> seats) {
    this.seats = seats;
  }
}