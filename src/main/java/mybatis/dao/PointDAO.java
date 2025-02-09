package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.PointVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class PointDAO {
    // 사용자 포인트 조회
    public static PointVO[] getList(String userIdx, int startIdx, int numPerPage) {
        PointVO[] ar = null;
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("userIdx", userIdx); // 사용자 ID
        map.put("startIdx", startIdx);     // 시작 인덱스
        map.put("numPerPage", numPerPage);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<PointVO> list = ss.selectList("point.userPoint", map);
        if(list != null && !list.isEmpty()) {
            ar = new PointVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }

    public static int getFilteredCount(String userIdx, String startDate, String endDate) {
        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String, Object> map = new HashMap<>();
        map.put("userIdx", userIdx);
        map.put("startDate", startDate);
        map.put("endDate", endDate);

        int count = ss.selectOne("point.filteredCount", map);
        ss.close();
        return count;
    }

    public static int getTotalCount(String userIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int count = ss.selectOne("point.userPointCount", userIdx);
        ss.close();
        return count;
    }

    // 비페이징용 (전체 조회, AJAX에서 사용) : 3개 인자
    public static PointVO[] getListWithDateRange(String userIdx, String startDate, String endDate) {
        PointVO[] ar = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String, Object> map = new HashMap<>();
        map.put("userIdx", userIdx);
        map.put("startDate", startDate);
        map.put("endDate", endDate);

        // 페이징 없이 전체 데이터를 조회하는 쿼리 호출
        List<PointVO> list = ss.selectList("point.getPointListByRangeNoPaging", map);
        ss.close();

        if (list != null && !list.isEmpty()) {
            ar = new PointVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    // 페이징용 : 5개 인자
    public static PointVO[] getListWithDateRange(String userIdx, String startDate, String endDate, int startIdx, int numPerPage) {
        PointVO[] ar = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String, Object> map = new HashMap<>();
        map.put("userIdx", userIdx);
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        map.put("startIdx", startIdx);
        map.put("numPerPage", numPerPage);

        // LIMIT과 OFFSET이 적용된 페이징 쿼리 호출
        List<PointVO> list = ss.selectList("point.getPointListByRange", map);
        ss.close();

        if (list != null && !list.isEmpty()) {
            ar = new PointVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    // 전체 포인트 내역 조회
    public static PointVO[] getAllPoints(String userIdx) {
        PointVO[] ar = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String, Object> map = new HashMap<>();
        map.put("userIdx", userIdx);

        List<PointVO> list = ss.selectList("point.getAllPointList", map);
        ss.close();

        if (list != null && !list.isEmpty()) {
            ar = new PointVO[list.size()];
            list.toArray(ar);
        }
        return ar;
    }

    // paymentSource별로 포인트 조회
    public static PointVO getUserPointBySource(String userIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        PointVO pointVO = null;

        try {
            pointVO = ss.selectOne("point.userPointBySource", userIdx);
        } finally {
            ss.close();
        }
        return pointVO;
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
}