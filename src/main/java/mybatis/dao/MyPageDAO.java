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
        UserVO uvo = ss.selectOne("myPage.getUser", id);
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

    public static boolean checkPassword(String userId, String oldPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();
        Map<String, String> params = new HashMap<>();
        params.put("userId", userId);
        params.put("oldPassword", oldPassword);

        Integer count = ss.selectOne("myPage.checkPassword", params);
        ss.close();
        return count != null && count > 0;
    }

    // 새 비밀번호 업데이트
    public static boolean updatePassword(String userId, String newPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();
        Map<String, String> params = new HashMap<>();
        params.put("userId", userId);
        params.put("newPassword", newPassword);

        int result = ss.update("myPage.updatePassword", params);
        if (result > 0) {
            ss.commit(); // 변경 사항 반영
            ss.close();
            return true;
        }
        ss.rollback(); // 실패 시 롤백
        ss.close();
        return false;
    }
}

