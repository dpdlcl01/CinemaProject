package mybatis.vo;

public class FavoritemovieVO {
    String favoriteIdx, userIdx, movieIdx, addedDate, movieTitle, movieGenre, movieTime, moviePosterUrl;

    public String getFavoriteIdx() {
        return favoriteIdx;
    }

    public void setFavoriteIdx(String favoriteIdx) {
        this.favoriteIdx = favoriteIdx;
    }

    public String getUserIdx() {
        return userIdx;
    }

    public void setUserIdx(String userIdx) {
        this.userIdx = userIdx;
    }

    public String getMovieIdx() {
        return movieIdx;
    }

    public void setMovieIdx(String movieIdx) {
        this.movieIdx = movieIdx;
    }

    public String getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(String addedDate) {
        this.addedDate = addedDate;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public String getMovieGenre() {
        return movieGenre;
    }

    public void setMovieGenre(String movieGenre) {
        this.movieGenre = movieGenre;
    }

    public String getMovieTime() {
        return movieTime;
    }

    public void setMovieTime(String movieTime) {
        this.movieTime = movieTime;
    }

    public String getMoviePosterUrl() {
        return moviePosterUrl;
    }

    public void setMoviePosterUrl(String moviePosterUrl) {
        this.moviePosterUrl = moviePosterUrl;
    }
}
