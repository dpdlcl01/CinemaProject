package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.LogVO;
import org.apache.ibatis.session.SqlSession;

public class LogDAO {

    // 로그 기록
    public static int insertLog(String logType, String adminIdx, String logTarget,
                        String logInfo, String logPreValue, String logCurValue){

        LogVO lvo = new LogVO();
        lvo.setLogType(logType);
        lvo.setAdminIdx(adminIdx);
        lvo.setLogTarget(logTarget);
        lvo.setLogInfo(logInfo);
        lvo.setLogPreValue(logPreValue);
        lvo.setLogCurValue(logCurValue);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("log.insertLog", lvo);
        if (cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();
        return cnt;
    }

}
