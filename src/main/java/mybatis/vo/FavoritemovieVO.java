package mybatis.vo;

public class FavoritemovieVO {
    String favoriteMovieIdx;
    String userIdx;
    String movieIdx;
    String addedDate;
    String movieTitle;
    String movieGenre;
    String movieTime;
    String moviePosterUrl;
    String movieGrade;

    public String getMovieGrade() {
        return movieGrade;
    }

    public void setMovieGrade(String movieGrade) {
        this.movieGrade = movieGrade;
    }

    public String getMovieLikes() {
        return movieLikes;
    }

    public void setMovieLikes(String movieLikes) {
        this.movieLikes = movieLikes;
    }

    String movieLikes;

    public String getFavoriteMovieIdx() {
        return favoriteMovieIdx;
    }

    public void setFavoriteMovieIdx(String favoriteMovieIdx) {
        this.favoriteMovieIdx = favoriteMovieIdx;
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
