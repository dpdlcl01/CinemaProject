package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.ReviewVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewDAO {

    // 총 리뷰 개수 반환
    public static int getTotalCount(String movieIdx){
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("review.getTotalCount", movieIdx);
        ss.close();
        return cnt;
    }

    // 영화 idx를 받아서 목록 반환
    public static ReviewVO[] getAllList(String movieIdx, int begin, int end) {
        ReviewVO[] reviewArray = null;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("movieIdx", movieIdx);
        map.put("begin", begin);// String.valueOf(begin)
        map.put("end", end);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<ReviewVO> rList = ss.selectList("review.getAllList", map);
        if(rList != null && !rList.isEmpty()) {
            reviewArray = new ReviewVO[rList.size()];
            rList.toArray(reviewArray);
        }
        ss.close();
        return reviewArray;
    }


    // 리뷰창 띄우기 전 해당 영화 관람 여부 확인
    public static boolean checkWatchedMovie(String userIdx, String movieIdx){
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("userIdx", userIdx);
        map.put("movieIdx", movieIdx);
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("review.checkWatchedMovie", map);
        ss.close();
        return cnt > 0;
    }


    // 이미 작성한 리뷰인지 확인
    public static boolean checkReviewWritten(String userIdx, String movieIdx){
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("userIdx", userIdx);
        map.put("movieIdx", movieIdx);
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("review.checkReviewWritten", map);
        ss.close();
        return cnt > 0;
    }


    // 리뷰 작성
    public static boolean writeReview(String userIdx, String movieIdx, String reviewRating, String reviewContent){
        boolean isSaved = false;

        ReviewVO rvo = new ReviewVO();
        rvo.setUserIdx(userIdx);
        rvo.setMovieIdx(movieIdx);
        rvo.setReviewRating(reviewRating);
        rvo.setReviewContent(reviewContent);

        System.out.println(rvo.getUserIdx());

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("review.writeReview", rvo);
        if(cnt > 0){
            ss.commit();
            isSaved = true;
        } else
            ss.rollback();
        ss.close();
        return isSaved;
    }


    // 리뷰 작성 완료시 100포인트 적립
    public static boolean plusPointByReview(String userIdx, String reviewIdx){
        boolean result = false;
        Map<String, String> map = new HashMap<String, String>();
        map.put("userIdx", userIdx);
        map.put("reviewIdx", reviewIdx);
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("review.plusPointByReview", map);
        if (cnt > 0) {
            ss.commit();
            result = true;
        } else
            ss.rollback();
        ss.close();
        return result;
    }

}
