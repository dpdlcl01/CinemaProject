package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MovieVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

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

    // 전체 영화 정보 가져오기 (사용자 영화 메인)
    public static MovieVO[] getTotalMovie(){
        MovieVO[] movieArray = null;
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MovieVO> mList = ss.selectList("movie.getTotalMovie");
        movieArray = new MovieVO[mList.size()];
        mList.toArray(movieArray);
        ss.close();
        return movieArray;
    }

    // 영화 idx를 받아서 해당 영화 상세 정보 가져오기 (사용자 영화 상세)
    public static MovieVO getMovieByIdx(String movidIdx){
        MovieVO mvo = null;
        SqlSession ss = FactoryService.getFactory().openSession();
        mvo = ss.selectOne("movie.getMovieByIdx", movidIdx);
        ss.close();
        return mvo;
    }


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




}
