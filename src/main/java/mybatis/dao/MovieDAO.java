package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.BoardVO;
import mybatis.vo.MovieVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MovieDAO {

    // 예매율 상위 4개 영화 정보 가져오기 (사용자 메인)
    public static MovieVO[] getTopMovie(){
        MovieVO[] movieArray = null;
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MovieVO> mList = ss.selectList("movie.getTopMovie");
        movieArray = new MovieVO[mList.size()];
        mList.toArray(movieArray);
        ss.close();
        return movieArray;
    }

    // [박스오피스] 전체 영화 개수 반환
    public static int getTotalMovieCount() {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("movie.totalMovieCount");
        ss.close();

        return cnt;
    }

    // [박스오피스] 전체 영화 목록
    public static MovieVO[] getMovieList(int offset, int pageSize){
        MovieVO[] movieArray = null;

        HashMap<String, String> map = new HashMap<>();
        map.put("offset", String.valueOf(offset));
        map.put("pageSize", String.valueOf(pageSize));

        SqlSession ss = FactoryService.getFactory().openSession();
        List<MovieVO> mList = ss.selectList("movie.getMovieList", map);

        if(mList != null && !mList.isEmpty()){
            movieArray = new MovieVO[mList.size()];
            mList.toArray(movieArray);
        }
        ss.close();

        return movieArray;
    }


/*    // 전체 영화 정보 가져오기 (사용자 영화 메인)
    public static MovieVO[] getTotalMovie(){
        MovieVO[] movieArray = null;
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MovieVO> mList = ss.selectList("movie.getTotalMovie");
        if(mList != null && mList.size() > 0){
            movieArray = new MovieVO[mList.size()];
            mList.toArray(movieArray);
        }
        ss.close();
        return movieArray;
    }*/

    // 영화 idx를 받아서 해당 영화 상세 정보 가져오기 (사용자 영화 상세)
    public static MovieVO getMovieByIdx(String movieIdx){
        MovieVO mvo = null;
        SqlSession ss = FactoryService.getFactory().openSession();
        mvo = ss.selectOne("movie.getMovieByIdx", movieIdx);
        ss.close();
        return mvo;
    }

    // 영화별 예매율 순위를 계산하는 함수
    public static int calculateRank(String movieIdx){
        SqlSession ss = FactoryService.getFactory().openSession();
        int rank = ss.selectOne("movie.calculateRank", movieIdx);
        ss.close();
        return rank;
    }

    // ----------------------------------------------------- 관리자 ----------------------------------------------

    // 새로운 영화 정보를 API로 받아와서 DB에 저장하는 함수 (관리자)
    public static int addNewMovie(MovieVO mvo){
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("movie.addNewMovie", mvo);
        if(cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();
        return cnt;
    }

    // 목록
    public static MovieVO[] getList(int begin, int end) {
        MovieVO[] movieArray = null;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("begin", begin);// String.valueOf(begin)
        map.put("end", end);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<MovieVO> list = ss.selectList("movie.adminMovieList", map);
        if (list != null && !list.isEmpty()) {
            movieArray = new MovieVO[list.size()];
            list.toArray(movieArray);
        }
        ss.close();
        return movieArray;
    }

    // 검색 결과 개수 반환
    public static int searchMovieCount(String movieTitle){
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("movie.searchMovieCount", movieTitle);
        ss.close();
        return cnt;
    }

    // 검색 결과 배열 반환
    public static MovieVO[] searchMovieList(String movieTitle, int offset, int pageSize){
        MovieVO[] movieArray = null;

        HashMap<String, String> map = new HashMap<>();
        map.put("movieTitle", movieTitle);
        map.put("offset", String.valueOf(offset));
        map.put("pageSize", String.valueOf(pageSize));

        SqlSession ss = FactoryService.getFactory().openSession();
        List<MovieVO> list = ss.selectList("movie.searchMovieList", map);
        if (list != null && !list.isEmpty()) {
            movieArray = new MovieVO[list.size()];
            list.toArray(movieArray);
        }
        ss.close();
        return movieArray;
    }


}
