package mybatis.vo;

public class SeatDetailVO {
  private String seatNumber;  // 좌석 번호
  private int seatAgeGroup;   // 1: 성인, 2: 청소년
  private int seatPrice;

  public String getSeatNumber() {
    return seatNumber;
  }

  public void setSeatNumber(String seatNumber) {
    this.seatNumber = seatNumber;
  }

  public int getSeatAgeGroup() {
    return seatAgeGroup;
  }

  public void setSeatAgeGroup(int seatAgeGroup) {
    this.seatAgeGroup = seatAgeGroup;
  }

  // 성인/청소년을 String으로 변환
  public String getSeatAgeGroupText() {
    return seatAgeGroup == 1 ? "성인" : "청소년";
  }

  public int getSeatPrice() {
    return seatPrice;
  }

  public void setSeatPrice(int seatPrice) {
    this.seatPrice = seatPrice;
  }
}