package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.TheaterVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TheaterAdminDAO {

    // 총 게시물 수를 반환
    public static int getTotalCount() {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("theater.getTotalCount");
        ss.close();
        return cnt;
    }

    // 전체 극장 조회
    public static TheaterVO[] getTheaterList(int offset, int limit) {
        SqlSession ss = FactoryService.getFactory().openSession();
        TheaterVO[] ar = null;
        try {
            Map<String, Integer> paramMap = new HashMap<>();
            paramMap.put("offset", offset);
            paramMap.put("limit", limit);

            List<TheaterVO> list = ss.selectList("theater.getTheaterList", paramMap);
            if (list != null && !list.isEmpty()) {
                ar = new TheaterVO[list.size()];
                list.toArray(ar);
            } else {
                ar = new TheaterVO[0];
            }
        } finally {
            ss.close();
        }
        return ar;
    }

    // 검색 조건에 맞는 극장 정보 개수 조회 (검색 페이징용)
    public static int getFilteredCount(String searchType, String searchKeyword) {
        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("searchType", searchType);
            paramMap.put("searchKeyword", searchKeyword);

            int count = ss.selectOne("theater.getFilteredCount", paramMap);
            return count;
        } finally {
            ss.close();
        }
    }

    // 검색 조건과 페이징에 맞는 극장 정보 조회
    public static TheaterVO[] searchTheater(String searchType, String searchKeyword, int offset, int limit) {
        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("searchType", searchType);
            paramMap.put("searchKeyword", searchKeyword);
            paramMap.put("offset", offset);
            paramMap.put("limit", limit);

            List<TheaterVO> list = ss.selectList("theater.searchTheater", paramMap);
            TheaterVO[] arr;
            if (list != null && !list.isEmpty()) {
                arr = new TheaterVO[list.size()];
                list.toArray(arr);
            } else {
                arr = new TheaterVO[0];
            }
            return arr;
        } finally {
            ss.close();
        }
    }

    // 극장 정보 업데이트 메서드
    public static boolean updateTheater(TheaterVO theaterVO) {
        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            int cnt = ss.update("theater.updateTheater", theaterVO);
            ss.commit();
            return cnt > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            ss.close();
        }
    }

}
