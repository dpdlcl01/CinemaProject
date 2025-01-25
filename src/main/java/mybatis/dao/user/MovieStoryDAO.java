package mybatis.dao.user;

import mybatis.service.FactoryService;
import mybatis.vo.FavoritemovieVO;
import mybatis.vo.ReviewVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class MovieStoryDAO {
    public static ReviewVO[] getReview(String id){
        SqlSession ss = FactoryService.getFactory().openSession();
        ReviewVO[] rvo = null;
        List<ReviewVO> list = ss.selectList("movieStory.review", id);
        rvo = list.toArray(new ReviewVO[list.size()]);
        ss.close();
        return rvo;
    }
    public static FavoritemovieVO[] getFavoritemovie(String id){
        SqlSession ss = FactoryService.getFactory().openSession();
        FavoritemovieVO[] fvo = null;
        List<FavoritemovieVO> list = ss.selectList("movieStory.favoritemovie", id);
        fvo = list.toArray(new FavoritemovieVO[list.size()]);
        ss.close();
        return fvo;
    }
}
