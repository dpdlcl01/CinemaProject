package mybatis.vo;

public class FavoriteTheaterVO {
    String favoriteTheaterIdx, userIdx, theaterIdx,theaterName;

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }

    public String getFavoriteTheaterIdx() {
        return favoriteTheaterIdx;
    }

    public void setFavoriteTheaterIdx(String favoriteTheaterIdx) {
        this.favoriteTheaterIdx = favoriteTheaterIdx;
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
}
