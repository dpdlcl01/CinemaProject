package mybatis.vo;

public class EventVO {

    private String boardIdx;
    private String adminIdx;
    private String theaterIdx;
    private String boardType;
    private String boardTitle;
    private String boardContent;
    private String boardRegDate;
    private String boardExpDate;
    private String boardStatus;
    private String theaterRegion;
    private String theaterName;

    public String getTheaterRegion() {
        return theaterRegion;
    }

    public void setTheaterRegion(String theaterRegion) {
        this.theaterRegion = theaterRegion;
    }

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }



    public String getBoardIdx() {
        return boardIdx;
    }

    public void setBoardIdx(String boardIdx) {
        this.boardIdx = boardIdx;
    }

    public String getAdminIdx() {
        return adminIdx;
    }

    public void setAdminIdx(String adminIdx) {
        this.adminIdx = adminIdx;
    }

    public String getTheaterIdx() {
        return theaterIdx;
    }

    public void setTheaterIdx(String theaterIdx) {
        this.theaterIdx = theaterIdx;
    }

    public String getBoardType() {
        return boardType;
    }

    public void setBoardType(String boardType) {
        this.boardType = boardType;
    }

    public String getBoardTitle() {
        return boardTitle;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public String getBoardContent() {
        return boardContent;
    }

    public void setBoardContent(String boardContent) {
        this.boardContent = boardContent;
    }

    public String getBoardRegDate() {
        return boardRegDate;
    }

    public void setBoardRegDate(String boardRegDate) {
        this.boardRegDate = boardRegDate;
    }

    public String getBoardExpDate() {
        return boardExpDate;
    }

    public void setBoardExpDate(String boardExpDate) {
        this.boardExpDate = boardExpDate;
    }

    public String getBoardStatus() {
        return boardStatus;
    }

    public void setBoardStatus(String boardStatus) {
        this.boardStatus = boardStatus;
    }
}