package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MovieVO;
import mybatis.vo.ReviewVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ReviewDAO {

    // 영화 idx를 받아서 해당 영화의 리뷰들 반환
    public static ReviewVO[] getReviewByMovieIdx(String movieIdx) {
        ReviewVO[] reviewArray = null;
        SqlSession ss = FactoryService.getFactory().openSession();
        List<ReviewVO> rList = ss.selectList("review.getReviewByMovieIdx", movieIdx);
        if (rList != null && rList.size() > 0) {
            reviewArray = new ReviewVO[rList.size()];
            rList.toArray(reviewArray);
        }
        return reviewArray;
    }

    // 리뷰 작성
    public static int writeReview(String userIdx, String movieIdx, String reviewRating, String reviewContent){
        ReviewVO rvo = null;
        rvo.setUserIdx(userIdx);
        rvo.setMovieIdx(movieIdx);
        rvo.setReviewRating(reviewRating);
        rvo.setReviewContent(reviewContent);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("review.writeReview", rvo);
        if(cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();
        return cnt;
    }


}
