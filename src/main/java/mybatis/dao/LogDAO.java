package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.LogVO;
import org.apache.ibatis.session.SqlSession;

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

}
