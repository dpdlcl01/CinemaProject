package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MovieVO;
import org.apache.ibatis.session.SqlSession;

public class MovieDAO {

    // 새로운 영화 정보를 API로 받아와서 DB에 저장하는 함수
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
