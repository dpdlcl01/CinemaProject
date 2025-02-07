package util;

import mybatis.dao.LogDAO;
import mybatis.vo.LogVO;

import java.util.Objects;

public class LogUtil {

    public static void logChanges(String logType, String adminIdx, String target, String info, String preValue, String curValue) {
        // 이전값과 현재값이 같지 않은 경우
        if ((preValue == null && curValue == null) || !Objects.equals(preValue, curValue)) {
            LogVO log = new LogVO();
            log.setLogType(logType);
            log.setAdminIdx(adminIdx);
            log.setLogTarget(target);
            log.setLogInfo(info);
            log.setLogPreValue(preValue);
            log.setLogCurValue(curValue);
            LogDAO.insertLog(log);
        }
    }
}