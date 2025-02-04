package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.PointVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class PointDAO {
    // 사용자 포인트 조회
    public static PointVO[] getList(String userIdx, int begin, int end) {
        PointVO[] ar = null;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("userIdx", userIdx); // 사용자 ID
        map.put("begin", begin);     // 시작 인덱스
        map.put("end", end);         // 끝 인덱스

        SqlSession ss = FactoryService.getFactory().openSession();
        List<PointVO> list = ss.selectList("point.userPoint", map);
        if(list != null && !list.isEmpty()) {
            ar = new PointVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }

    // 사용 가능 포인트 계산
    public static int availablePoints(String userIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        Integer points = ss.selectOne("point.availablePoints", userIdx);
        ss.close();
        return points != null ? points : 0;
    }

    // VIP 선정 포인트 계산
    public static int vipPoints(String userIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        Integer points = ss.selectOne("point.vipPoints", userIdx);
        ss.close();
        return points != null ? points : 0;
    }

    // 등급 계산 로직 추가
    public static String calculateGrade(int vipPoints) {
        if (vipPoints >= 20000) {
            return "VVIP";
        } else if (vipPoints >= 13000) {
            return "VIP";
        } else {
            return "Basic";
        }
    }

    // 포인트 내역 조회 (기간 필터 포함)
    public static PointVO[] getListWithDate(String userIdx, String startDate, String endDate) {
        PointVO[] ar = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String, Object> map = new HashMap<>();
        map.put("userIdx", userIdx);
        map.put("startDate", startDate);
        map.put("endDate", endDate);

        List<PointVO> list = ss.selectList("point.getPointList", map);
        ss.close();

        if (list != null && !list.isEmpty()) {
            ar = new PointVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

}