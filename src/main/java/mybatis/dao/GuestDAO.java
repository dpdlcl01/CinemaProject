package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.ReservationDetailVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class GuestDAO {

  public static int getSearchGuest(String userName, String userBirth, String userEmail, String userAuthPassword) {

    SqlSession ss = FactoryService.getFactory().openSession();

    HashMap<String, String> map = new HashMap<>();
    map.put("userName", userName);
    map.put("userBirth", userBirth);
    map.put("userEmail", userEmail);
    map.put("userAuthPassword", userAuthPassword);

    Integer cnt = ss.selectOne("guest.selectGuestIdx", map);
    ss.close();

    // if문으로 null 확인
    if (cnt == null) {
      cnt = 0;
    }

    return cnt;
  }

  public static List<ReservationDetailVO> getReservationDetail(int guestIdx) {

    SqlSession ss = FactoryService.getFactory().openSession();
    List<ReservationDetailVO> list = ss.selectList("guest.getReservationsByUserIdx", guestIdx);

    ss.close();

    return list;
  }
}