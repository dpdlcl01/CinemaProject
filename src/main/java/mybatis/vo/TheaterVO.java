package mybatis.vo;

import java.util.List;

public class TheaterVO {
    private String theaterIdx, theaterName, theaterRegion, theaterAddress,
            theaterInfo, theaterImageUrl, theaterScreenCount, theaterRegDate, theaterStatus;

    private List<ScreenVO> screenList;  // 극장에 속한 상영관 리스트

    public List<ScreenVO> getScreenList() {
        return screenList;
    }

    public void setScreenList(List<ScreenVO> screenList) {
        this.screenList = screenList;
    }

    public String getTheaterIdx() {
        return theaterIdx;
    }

    public void setTheaterIdx(String theaterIdx) {
        this.theaterIdx = theaterIdx;
    }

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }

    public String getTheaterRegion() {
        return theaterRegion;
    }

    public void setTheaterRegion(String theaterRegion) {
        this.theaterRegion = theaterRegion;
    }

    public String getTheaterAddress() {
        return theaterAddress;
    }

    public void setTheaterAddress(String theaterAddress) {
        this.theaterAddress = theaterAddress;
    }

    public String getTheaterInfo() {
        return theaterInfo;
    }

    public void setTheaterInfo(String theaterInfo) {
        this.theaterInfo = theaterInfo;
    }

    public String getTheaterImageUrl() {
        return theaterImageUrl;
    }

    public void setTheaterImageUrl(String theaterImageUrl) {
        this.theaterImageUrl = theaterImageUrl;
    }

    public String getTheaterScreenCount() {
        return theaterScreenCount;
    }

    public void setTheaterScreenCount(String theaterScreenCount) {
        this.theaterScreenCount = theaterScreenCount;
    }

    public String getTheaterRegDate() {
        return theaterRegDate;
    }

    public void setTheaterRegDate(String theaterRegDate) {
        this.theaterRegDate = theaterRegDate;
    }

    public String getTheaterStatus() {
        return theaterStatus;
    }

    public void setTheaterStatus(String theaterStatus) {
        this.theaterStatus = theaterStatus;
    }
}
