package mybatis.vo;

public class SeatVO {
    private String seatIdx, screenIdx, seatNumber, seatStatus, priceIdx, screenType, ageGroup, dayOfWeek, timeOfDay, seatPrice
            , timetableIdx;

    public String getTimetableIdx() { return timetableIdx; }

    public void setTimetableIdx(String timetableIdx) { this.timetableIdx = timetableIdx; }

    public String getSeatIdx() {
        return seatIdx;
    }

    public void setSeatIdx(String seatIdx) {
        this.seatIdx = seatIdx;
    }

    public String getScreenIdx() {
        return screenIdx;
    }

    public void setScreenIdx(String screenIdx) {
        this.screenIdx = screenIdx;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(String seatStatus) {
        this.seatStatus = seatStatus;
    }

    public String getPriceIdx() {
        return priceIdx;
    }

    public void setPriceIdx(String priceIdx) {
        this.priceIdx = priceIdx;
    }

    public String getScreenType() {
        return screenType;
    }

    public void setScreenType(String screenType) {
        this.screenType = screenType;
    }

    public String getAgeGroup() {
        return ageGroup;
    }

    public void setAgeGroup(String ageGroup) {
        this.ageGroup = ageGroup;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public String getTimeOfDay() {
        return timeOfDay;
    }

    public void setTimeOfDay(String timeOfDay) {
        this.timeOfDay = timeOfDay;
    }

    public String getSeatPrice() {
        return seatPrice;
    }

    public void setSeatPrice(String seatPrice) {
        this.seatPrice = seatPrice;
    }
}
