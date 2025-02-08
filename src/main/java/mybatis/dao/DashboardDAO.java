package mybatis.dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class DashboardDAO {

  public static List<Map<String, Object>> getTop5MoviesByRes() {
    SqlSession ss = FactoryService.getFactory().openSession();
    List<Map<String, Object>> list = ss.selectList("dashboard.getTop5MoviesByRes");
    ss.close();

    // movieReservationRate를 Double로 변환하여 반환
    return list.stream().map(movie -> {
      Object reservationRate = movie.get("movieReservationRate");
      if (reservationRate instanceof Number) {
        movie.put("movieReservationRate", ((Number) reservationRate).doubleValue());
      }
      return movie;
    }).collect(Collectors.toList());
  }

  public static List<Map<String, Object>> getTotalRevenueByTheater() {
    SqlSession ss = FactoryService.getFactory().openSession();
    List<Map<String, Object>> list = ss.selectList("dashboard.getTotalRevenueByTheater");
    ss.close();

    return list;
  }

  public static List<Map<String, Object>> getMonthlyActiveUsers() {
    SqlSession ss = FactoryService.getFactory().openSession();
    List<Map<String, Object>> list = ss.selectList("dashboard.getMonthlyActiveUsers");
    ss.close();

    return list;
  }
}
