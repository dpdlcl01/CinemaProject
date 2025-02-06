package mybatis.vo;

public class WatchedMovieVO {

  private String watchedIdx, userIdx, movieIdx, reservationIdx, screenIdx, watchedDate;

  public String getWatchedIdx() {
    return watchedIdx;
  }

  public void setWatchedIdx(String watchedIdx) {
    this.watchedIdx = watchedIdx;
  }

  public String getUserIdx() {
    return userIdx;
  }

  public void setUserIdx(String userIdx) {
    this.userIdx = userIdx;
  }

  public String getMovieIdx() {
    return movieIdx;
  }

  public void setMovieIdx(String movieIdx) {
    this.movieIdx = movieIdx;
  }

  public String getReservationIdx() {
    return reservationIdx;
  }

  public void setReservationIdx(String reservationIdx) {
    this.reservationIdx = reservationIdx;
  }

  public String getScreenIdx() {
    return screenIdx;
  }

  public void setScreenIdx(String screenIdx) {
    this.screenIdx = screenIdx;
  }

  public String getWatchedDate() {
    return watchedDate;
  }

  public void setWatchedDate(String watchedDate) {
    this.watchedDate = watchedDate;
  }
}
