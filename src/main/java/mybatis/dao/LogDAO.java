package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.LogVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class LogDAO {

  public static List<LogVO> getLogList() {

    SqlSession ss = FactoryService.getFactory().openSession();

    List<LogVO> list = ss.selectList("logManagement.getAllLogs");

    ss.close();
    return list;
  }
}
