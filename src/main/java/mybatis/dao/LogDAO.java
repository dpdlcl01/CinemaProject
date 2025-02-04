package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.LogVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LogDAO {

  // 총 게시물 수를 반환
  public static int getTotalCount() {

    SqlSession ss = FactoryService.getFactory().openSession();
    int cnt = ss.selectOne("logManagement.getTotalCount");
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

      List<LogVO> list = ss.selectList("logManagement.getAllLogs", paramMap);
      if (list != null && !list.isEmpty()) {
        ar = new LogVO[list.size()];
        list.toArray(ar);

        System.out.println("Query Result: " + list.size());
        for (LogVO log : list) {
          System.out.println("Log Data: " + log.getLogIdx() + ", " + log.getLogInfo());
        }
      }
    } finally {
      ss.close();
    }
    return ar;
  }

}
