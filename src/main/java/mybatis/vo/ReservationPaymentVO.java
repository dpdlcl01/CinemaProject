package mybatis.vo;

public class ReservationPaymentVO {

  private String paymentIdx, userIdx, paymentType, reservationIdx, paymentMethod, paymentTotal, paymentDiscount, paymentFinal, paymentTransactionId, paymentDate, paymentCancelDate, paymentStatus;

  public String getPaymentIdx() {
    return paymentIdx;
  }

  public void setPaymentIdx(String paymentIdx) {
    this.paymentIdx = paymentIdx;
  }

  public String getUserIdx() {
    return userIdx;
  }

  public void setUserIdx(String userIdx) {
    this.userIdx = userIdx;
  }

  public String getPaymentType() {
    return paymentType;
  }

  public void setPaymentType(String paymentType) {
    this.paymentType = paymentType;
  }

  public String getReservationIdx() {
    return reservationIdx;
  }

  public void setReservationIdx(String reservationIdx) {
    this.reservationIdx = reservationIdx;
  }

  public String getPaymentMethod() {
    return paymentMethod;
  }

  public void setPaymentMethod(String paymentMethod) {
    this.paymentMethod = paymentMethod;
  }

  public String getPaymentTotal() {
    return paymentTotal;
  }

  public void setPaymentTotal(String paymentTotal) {
    this.paymentTotal = paymentTotal;
  }

  public String getPaymentDiscount() {
    return paymentDiscount;
  }

  public void setPaymentDiscount(String paymentDiscount) {
    this.paymentDiscount = (paymentDiscount == null || paymentDiscount.isEmpty() || "0".equals(paymentDiscount)) ? null : paymentDiscount;
  }

  public String getPaymentFinal() {
    return paymentFinal;
  }

  public void setPaymentFinal(String paymentFinal) {
    this.paymentFinal = paymentFinal;
  }

  public String getPaymentTransactionId() {
    return paymentTransactionId;
  }

  public void setPaymentTransactionId(String paymentTransactionId) {
    this.paymentTransactionId = paymentTransactionId;
  }

  public String getPaymentDate() {
    return paymentDate;
  }

  public void setPaymentDate(String paymentDate) {
    this.paymentDate = paymentDate;
  }

  public String getPaymentCancelDate() {
    return paymentCancelDate;
  }

  public void setPaymentCancelDate(String paymentCancelDate) {
    this.paymentCancelDate = paymentCancelDate;
  }

  public String getPaymentStatus() {
    return paymentStatus;
  }

  public void setPaymentStatus(String paymentStatus) {
    this.paymentStatus = paymentStatus;
  }
}
