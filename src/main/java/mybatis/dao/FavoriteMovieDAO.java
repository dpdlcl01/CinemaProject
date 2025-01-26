package mybatis.dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.Map;

public class FavoriteMovieDAO {


    // 영화 찜하기 버튼 클릭시 이미 찜한 영화인지 확인
    public static boolean isFavorite(String movieIdx, String userIdx){
        boolean isFavorite = false;
        Map<String, String> map = new HashMap<String, String>();
        map.put("movieIdx", movieIdx);
        map.put("userIdx", userIdx);

        SqlSession ss = FactoryService.getFactory().openSession();
        int count = ss.selectOne("favoriteMovie.isFavorite", map);
        ss.close();

        if(count > 0)
            isFavorite = true;
        return isFavorite;
    }

    // 이미 찜한 경우 선호 영화에서 데이터 삭제
    public static void removeFavorite(String userIdx, String movieIdx) {

        Map<String, String> map = new HashMap<String, String>();
        map.put("userIdx", userIdx);
        map.put("movieIdx", movieIdx);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.delete("favoriteMovie.removeFavorite", map);
        if (cnt > 0) {
            ss.commit();
            System.out.println("삭제 성공: userIdx = " + userIdx + ", movieIdx = " + movieIdx);
        } else {
            System.out.println("삭제 실패: userIdx = " + userIdx + ", movieIdx = " + movieIdx);
            ss.rollback();
        }
        ss.close();
    }

    public static void addFavorite(String userIdx, String movieIdx) {

        Map<String, String> map = new HashMap<String, String>();
        map.put("userIdx", userIdx);
        map.put("movieIdx", movieIdx);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("favoriteMovie.addFavorite", map);
        if (cnt > 0)
            ss.commit();
        else
            ss.rollback();

        ss.close();
    }


    // 영화 찜하기 버튼 클릭시 선호영화 수 감소 업데이트
    public static void downMovieLikes(String movieIdx){

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.update("favoriteMovie.downMovieLikes", movieIdx);

        if(cnt > 0)
            ss.commit();
        else
            ss.rollback();

        ss.close();
    }

    // 영화 찜하기 버튼 클릭시 선호영화 수 증가 업데이트
    public static void upMovieLikes(String movieIdx){

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.update("favoriteMovie.upMovieLikes", movieIdx);

        if(cnt > 0)
            ss.commit();
        else
            ss.rollback();

        ss.close();
    }


    // 영화 좋아요 수 확인
    public static int getMovieLikes(String movieIdx){

        SqlSession ss = FactoryService.getFactory().openSession();
        int count = ss.selectOne("favoriteMovie.getMovieLikes", movieIdx);
        ss.close();
        return count;
    }

}
