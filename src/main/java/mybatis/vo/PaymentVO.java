package mybatis.vo;

public class PaymentVO {
    private String paymentIdx, userIdx, paymentType, reservationIdx, productIdx,
            paymentMethod, paymentTotal, paymentDiscount, paymentFinal, paymentCancelDate,
            paymentTransactionId, paymentDate, paymentQuantity, paymentStatus, productName, userId;

    // 결제 조회를 위한 영화 섹션 정보
    private String movieTitle, theaterName, screenName, showTime, seatNumbers;

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

    public String getShowTime() {
        return showTime;
    }

    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }

    public String getSeatNumbers() {
        return seatNumbers;
    }

    public void setSeatNumbers(String seatNumbers) {
        this.seatNumbers = seatNumbers;
    }

    public String getPaymentCancelDate() {
        return paymentCancelDate;
    }

    public void setPaymentCancelDate(String paymentCancelDate) {
        this.paymentCancelDate = paymentCancelDate;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPaymentQuantity() {
        return paymentQuantity;
    }

    public void setPaymentQuantity(String paymentQuantity) {
        this.paymentQuantity = paymentQuantity;
    }

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

    public String getProductIdx() {
        return productIdx;
    }

    public void setProductIdx(String productIdx) {
        this.productIdx = productIdx;
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
        this.paymentDiscount = paymentDiscount;
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

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
}
