package util;

import mybatis.dao.LogDAO;
import mybatis.vo.LogVO;

import java.util.Objects;

public class LogUtil {

    public static void logChanges(String logType, String adminIdx, String target, String info, String preValue, String curValue) {
        // 이전값과 현재값이 같지 않은 경우
        if (!Objects.equals(preValue, curValue)) {
            LogVO log = new LogVO();
            log.setLogType(logType);
            log.setAdminIdx(adminIdx);
            log.setLogTarget(target);
            log.setLogInfo(info);
            log.setLogPreValue(preValue);
            log.setLogCurValue(curValue);

            //디버깅용
            System.out.println("LogType" + logType);
            System.out.println("AdminIdx" + adminIdx);
            System.out.println("Target" + target);
            System.out.println("Info" + info);
            System.out.println("PreValue" + preValue);
            System.out.println("CurValue" + curValue);

            LogDAO.insertLog(log);
        } else {
            LogVO log = new LogVO();
            log.setLogType(logType);
            log.setAdminIdx(adminIdx);
            log.setLogTarget(target);
            log.setLogInfo(info);
            log.setLogPreValue(preValue);
            log.setLogCurValue(curValue);

            //디버깅용
            System.out.println("LogType" + logType);
            System.out.println("AdminIdx" + adminIdx);
            System.out.println("Target" + target);
            System.out.println("Info" + info);
            System.out.println("PreValue" + preValue);
            System.out.println("CurValue" + curValue);

            LogDAO.insertLog(log);
        }
    }
}
