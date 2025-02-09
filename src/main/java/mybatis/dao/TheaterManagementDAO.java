package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.TheaterManagementVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TheaterManagementDAO {

    public static TheaterManagementVO[] getTheaterScreenList(int begin, int end) {
        SqlSession ss = FactoryService.getFactory().openSession();
        TheaterManagementVO[] ar = null;

        try {
            Map<String, Integer> map = new HashMap<>();
            map.put("begin", begin);
            map.put("end", end);

            List<TheaterManagementVO> list = ss.selectList("theaterManagement.getTheaterScreenList", map);
            if (list != null && !list.isEmpty()) {
                ar = new TheaterManagementVO[list.size()];
                list.toArray(ar);
            }
        } finally {
            ss.close();
        }

        System.out.println(ar[0].getScreenName());

        return ar;
    }

    public static int getTheaterScreenListCount() {
        SqlSession ss = FactoryService.getFactory().openSession();
        int count = 0;

        count = ss.selectOne("theaterManagement.getTheaterScreenCount");
        ss.close();
        return count;
    }

    public static TheaterManagementVO[] searchTheaterScreenList(String searchType, String searchKeyword, int begin, int end) {
        SqlSession ss = FactoryService.getFactory().openSession();
        TheaterManagementVO[] ar = null;

        try {
            Map<String, Object> map = new HashMap<>();
            map.put("searchType", searchType);
            map.put("searchKeyword", searchKeyword);
            map.put("offset", begin);
            map.put("limit", end);

            List<TheaterManagementVO> list = ss.selectList("theaterManagement.searchTheaterScreenList", map);
            if (list != null && !list.isEmpty()) {
                ar = new TheaterManagementVO[list.size()];
                list.toArray(ar);
            }
        } finally {
            ss.close();
        }
        return ar;
    }

    public static int searchTheaterScreenCount(String searchType, String searchKeyword) {
        SqlSession ss = FactoryService.getFactory().openSession();

        Map<String, Object> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchKeyword", searchKeyword);

        int cnt = ss.selectOne("theaterManagement.searchTheaterScreenCount", map);
        ss.close();

        return cnt;
    }

    public static TheaterManagementVO getTheaterByIdx(String theaterIdx, String screenIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();

        Map<String, String>map = new HashMap<>();
        map.put("theaterIdx", theaterIdx);
        map.put("screenIdx", screenIdx);

        TheaterManagementVO vo = ss.selectOne("theaterManagement.getTheaterByIdx", map);
        ss.close();

        return vo;
    }

    // 업데이트
    public static boolean updateTheater(TheaterManagementVO vo) {
        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            int updatedRows = ss.update("updateTheater", vo);
            ss.commit();
            return updatedRows > 0;  // 성공 여부 반환
        } finally {
            ss.close();
        }
    }

}