package mybatis.vo;

public class ReservationSeatMappingVO {

  private String reservationSeatIdx, reservationIdx, priceIdx, seatStatusIdx;

  public String getReservationSeatIdx() {
    return reservationSeatIdx;
  }

  public void setReservationSeatIdx(String reservationSeatIdx) {
    this.reservationSeatIdx = reservationSeatIdx;
  }

  public String getReservationIdx() {
    return reservationIdx;
  }

  public void setReservationIdx(String reservationIdx) {
    this.reservationIdx = reservationIdx;
  }

  public String getPriceIdx() {
    return priceIdx;
  }

  public void setPriceIdx(String priceIdx) {
    this.priceIdx = priceIdx;
  }

  public String getSeatStatusIdx() {
    return seatStatusIdx;
  }

  public void setSeatStatusIdx(String seatStatusIdx) {
    this.seatStatusIdx = seatStatusIdx;
  }
}
