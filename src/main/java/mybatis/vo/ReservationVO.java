package mybatis.vo;

public class ReservationVO {
    private String reservationIdx, userIdx, theaterIdx, screenIdx, timetableIdx, reservationDate, reservationStatus, reservationSeatIdx, seatIdx, priceIdx;

    public String getReservationIdx() {
        return reservationIdx;
    }

    public void setReservationIdx(String reservationIdx) {
        this.reservationIdx = reservationIdx;
    }

    public String getSeatIdx() {
        return seatIdx;
    }

    public void setSeatIdx(String seatIdx) {
        this.seatIdx = seatIdx;
    }

    public String getPriceIdx() {
        return priceIdx;
    }

    public void setPriceIdx(String priceIdx) {
        this.priceIdx = priceIdx;
    }

    public String getUserIdx() {
        return userIdx;
    }

    public void setUserIdx(String userIdx) {
        this.userIdx = userIdx;
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

    public String getTimetableIdx() {
        return timetableIdx;
    }

    public void setTimetableIdx(String timetableIdx) {
        this.timetableIdx = timetableIdx;
    }

    public String getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(String reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getReservationStatus() {
        return reservationStatus;
    }

    public void setReservationStatus(String reservationStatus) {
        this.reservationStatus = reservationStatus;
    }

    public String getReservationSeatIdx() {
        return reservationSeatIdx;
    }

    public void setReservationSeatIdx(String reservationSeatIdx) {
        this.reservationSeatIdx = reservationSeatIdx;
    }
}
