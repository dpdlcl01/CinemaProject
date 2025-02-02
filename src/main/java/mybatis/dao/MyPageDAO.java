package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.*;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class MyPageDAO {

    public  static ReservationVO[] getCancel(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<ReservationVO> list = ss.selectList("myPage.cancel", idx);
        if(list==null || list.size()==0){
            return null;
        }
        ReservationVO[] reservation = new ReservationVO[list.size()];
        list.toArray(reservation);
        ss.close();

        return reservation;

    }

    public static int getTotalPoint(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        int total = ss.selectOne("myPage.getTotalPoint", idx);
        ss.close();
        return total;
    }


    public static ReservationVO[] getReservation(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<ReservationVO> list = ss.selectList("myPage.reservation", idx);
        if(list==null || list.size()==0){
            return null;
        }
        ReservationVO[] reservation = new ReservationVO[list.size()];
        list.toArray(reservation);
        ss.close();

        return reservation;

    }
    public static UserVO getUser(String id){

        SqlSession ss = FactoryService.getFactory().openSession();
        UserVO uvo = ss.selectOne("myPage.getUser", id);
        ss.close();

        return uvo;
    }
    public static String[] getFavorite(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<String> list = ss.selectList("myPage.favorite", idx);
        String[] favorite = new String[list.size()];
        list.toArray(favorite);
        ss.close();
        return favorite;
    }
    public static int reviewNum(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<ReviewVO> list = ss.selectList("myMovieStory.review", idx);
        if(list==null || list.size()==0){
            return 0;
        }
        int reviewNum = list.size();

        return reviewNum;
    }
    public static int favoriteNum(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<FavoritemovieVO> list = ss.selectList("myMovieStory.favoritemovie", idx);
        if(list==null || list.size()==0){
            return 0;
        }
        int favoriteNum = list.size();
        System.out.println(favoriteNum);
        return favoriteNum;
    }

    public static int watchMovieNum(String idx){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<ReservationVO> list = ss.selectList("myPage.reservation", idx);
        if(list==null || list.size()==0){
            return 0;
        }
        int watchMovieNum = list.size();
        return watchMovieNum;
    }


}
