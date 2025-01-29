package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.ProductDetailVO;
import mybatis.vo.ReservationDetailVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class MyReservationDAO {

  public static List<ReservationDetailVO> getReservationDetail(int userIdx, String selectedYear, String selectedMonth) {

    SqlSession ss = FactoryService.getFactory().openSession();

    HashMap<String, String> map = new HashMap<>();
    map.put("userIdx", String.valueOf(userIdx));
    map.put("selectedYear", selectedYear);
    map.put("selectedMonth", selectedMonth);
    List<ReservationDetailVO> list = ss.selectList("myReservation.getReservationsByUserIdx", map);

    ss.close();

    return list;
  }

  public static List<ReservationDetailVO> getCancelReservationDetail(int userIdx, String selectedYear, String selectedMonth) {

    SqlSession ss = FactoryService.getFactory().openSession();

    HashMap<String, String> map = new HashMap<>();
    map.put("userIdx", String.valueOf(userIdx));
    map.put("selectedYear", selectedYear);
    map.put("selectedMonth", selectedMonth);
    List<ReservationDetailVO> list = ss.selectList("myReservation.getCancelReservationsByUserIdx", map);

    ss.close();

    return list;
  }

  public static List<ProductDetailVO> getPurchaseHistory(int userIdx, String selectedYear, String selectedMonth) {

    SqlSession ss = FactoryService.getFactory().openSession();

    HashMap<String, String> map = new HashMap<>();
    map.put("userIdx", String.valueOf(userIdx));
    map.put("selectedYear", selectedYear);
    map.put("selectedMonth", selectedMonth);
    List<ProductDetailVO> list = ss.selectList("myReservation.getPurchaseHistory", map);

    ss.close();

    return list;
  }
}
