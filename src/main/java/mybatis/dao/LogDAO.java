package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.LogVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LogDAO {

    // 로그 기록
    public static int insertLog(LogVO log) {
      SqlSession ss = FactoryService.getFactory().openSession();
      int cnt = ss.insert("log.insertLog", log);
      if (cnt > 0)
        ss.commit();
      else
        ss.rollback();
      ss.close();
      return cnt;
    }

    // 총 게시물 수를 반환
    public static int getTotalCount() {
      SqlSession ss = FactoryService.getFactory().openSession();
      int cnt = ss.selectOne("log.getTotalCount");
      ss.close();

      return cnt;
    }



  public static LogVO[] getLogList(int begin, int end) {
    SqlSession ss = FactoryService.getFactory().openSession();
    LogVO[] ar = null;

    try {
      Map<String, Integer> paramMap = new HashMap<>();
      paramMap.put("begin", begin);
      paramMap.put("end", end);

      List<LogVO> list = ss.selectList("log.getAllLogs", paramMap);
      if (list != null && !list.isEmpty()) {
        ar = new LogVO[list.size()];
        list.toArray(ar);
      }
    } finally {
      ss.close();
    }
    return ar;
  }

  public static LogVO[] searchLogs(String startDate, String endDate, String searchType, String searchKeyword, int begin, int end) {
    SqlSession ss = FactoryService.getFactory().openSession();
    LogVO[] ar = null;

    try {
      Map<String, Object> map = new HashMap<>();
      map.put("startDate", startDate);
      map.put("endDate", endDate);
      map.put("searchType", searchType);
      map.put("searchKeyword", searchKeyword);
      map.put("offset", begin);
      map.put("limit", end);

      List<LogVO> list = ss.selectList("log.searchLogs", map);
      if (list != null && !list.isEmpty()) {
        ar = new LogVO[list.size()];
        list.toArray(ar);
      }
    } finally {
      ss.close();
    }
    return ar;
  }

  public static int getFilteredCount(String startDate, String endDate, String searchType, String searchKeyword) {
    SqlSession ss = FactoryService.getFactory().openSession();

    Map<String, Object> map = new HashMap<>();
    map.put("startDate", startDate);
    map.put("endDate", endDate);
    map.put("searchType", searchType);
    map.put("searchKeyword", searchKeyword);

    int cnt = ss.selectOne("log.getFilteredCount", map);
    System.out.println("총페이지수=" + cnt);
    ss.close();

    return cnt;
  }


}
