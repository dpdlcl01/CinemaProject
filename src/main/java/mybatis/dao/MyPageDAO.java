package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.mindrot.jbcrypt.BCrypt;
import util.Paging;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MyPageDAO {

    public static int getTotalPoint(String idx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        Integer total = ss.selectOne("myPage.getTotalPoint", idx);
        ss.close();
        return (total != null) ? total : 0;
    }


    public static ReservationVO[] getReservation(String idx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<ReservationVO> list = ss.selectList("myPage.reservation", idx);
        if (list == null || list.size() == 0) {
            return null;
        }
        ReservationVO[] reservation = new ReservationVO[list.size()];
        list.toArray(reservation);
        ss.close();

        return reservation;

    }

    public static UserVO getUser(String id) {

        SqlSession ss = FactoryService.getFactory().openSession();
        UserVO uvo = ss.selectOne("myPage.getUser2", id);
        ss.close();

        return uvo;
    }

    public static String[] getFavorite(String idx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<String> list = ss.selectList("myPage.favorite", idx);
        String[] favorite = new String[list.size()];
        list.toArray(favorite);
        ss.close();
        return favorite;
    }

    public static int reviewNum(String idx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<ReviewVO> list = ss.selectList("myMovieStory.review", idx);
        if (list == null || list.size() == 0) {
            return 0;
        }
        int reviewNum = list.size();

        return reviewNum;
    }

    public static int favoriteNum(String idx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<FavoritemovieVO> list = ss.selectList("myMovieStory.favoritemovie", idx);
        if (list == null || list.size() == 0) {
            return 0;
        }
        int favoriteNum = list.size();
        System.out.println(favoriteNum);
        return favoriteNum;
    }

    public static int watchMovieNum(String idx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<ReservationVO> list = ss.selectList("myPage.reservation", idx);
        if (list == null || list.size() == 0) {
            return 0;
        }
        int watchMovieNum = list.size();
        return watchMovieNum;
    }


    public static boolean updatePassword(String userId, String newPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();
        Map<String, String> params = new HashMap<>();
        params.put("userId", userId);
        params.put("newPassword", newPassword);

        try {
            int result = ss.update("myPage.updatePassword", params);
            if (result > 0) {
                ss.commit();
                return true;
            } else {
                ss.rollback();
                return false;
            }
        } finally {
            ss.close();
        }
    }

    public static boolean checkPassword(String userId, String inputPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            String storedPasswordHash = ss.selectOne("myPage.getPasswordHash", userId);

            if (storedPasswordHash == null) {
                return false; // 비밀번호가 없으면 false 반환
            }

            return BCrypt.checkpw(inputPassword, storedPasswordHash); // 입력된 비밀번호 검증
        } finally {
            ss.close();
        }
    }
}

