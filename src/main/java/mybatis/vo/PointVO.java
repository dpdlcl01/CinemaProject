package mybatis.vo;

public class PointVO {
    private String pointIdx, userIdx, pointType, pointSource, pointValue, pointDate, pointStatus;
    private String paymentTotal, storeTotal, reviewTotal, totalPoints;

    public String getPaymentTotal() {
        return paymentTotal;
    }

    public void setPaymentTotal(String paymentTotal) {
        this.paymentTotal = paymentTotal;
    }

    public String getStoreTotal() {
        return storeTotal;
    }

    public void setStoreTotal(String storeTotal) {
        this.storeTotal = storeTotal;
    }

    public String getReviewTotal() {
        return reviewTotal;
    }

    public void setReviewTotal(String reviewTotal) {
        this.reviewTotal = reviewTotal;
    }

    public String getTotalPoints() {
        return totalPoints;
    }

    public void setTotalPoints(String totalPoints) {
        this.totalPoints = totalPoints;
    }

    public String getPointIdx() { return pointIdx; }

    public void setPointIdx(String pointIdx) {
        this.pointIdx = pointIdx;
    }

    public String getUserIdx() {
        return userIdx;
    }

    public void setUserIdx(String userIdx) {
        this.userIdx = userIdx;
    }

    public String getPointType() {
        return pointType;
    }

    public void setPointType(String pointType) {
        this.pointType = pointType;
    }

    public String getPointSource() {
        return pointSource;
    }

    public void setPointSource(String pointSource) {
        this.pointSource = pointSource;
    }

    public String getPointValue() {
        return pointValue;
    }

    public void setPointValue(String pointValue) {
        this.pointValue = pointValue;
    }

    public String getPointDate() {
        return pointDate;
    }

    public void setPointDate(String pointDate) {
        this.pointDate = pointDate;
    }

    public String getPointStatus() {
        return pointStatus;
    }

    public void setPointStatus(String pointStatus) {
        this.pointStatus = pointStatus;
    }
}
