package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.BoardVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class BoardDAO {

    //총 게시물 수를 반환
    public static int getTotalCount(String bType, String keyword, String region, String theater) {
        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String, Object> map = new HashMap<>();
        map.put("bType", bType);

        // 검색어, 지역, 극장 조건이 있는 경우
        if (keyword != null && !keyword.isEmpty()) {
            map.put("keyword", keyword);
        }
        if (region != null && !region.isEmpty()) {
            map.put("region", region);
        }
        if (theater != null && !theater.isEmpty()) {
            map.put("theater", theater);
        }

        int cnt = ss.selectOne("board.totalCount", map);
        ss.close();

        return cnt;
    }

    // 목록
    public static BoardVO[] getList(String bType, int begin, int end, String keyword, String region, String theater) {
        BoardVO[] ar = null;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("bType", bType);
        map.put("begin", begin);// String.valueOf(begin)
        map.put("end", end);

        // 검색어, 지역, 극장 값이 있을 때만 Map에 추가
        if (keyword != null && !keyword.isEmpty()) {
            map.put("keyword", keyword);
        }
        if (region != null && !region.isEmpty()) {
            map.put("region", region);
        }
        if (theater != null && !theater.isEmpty()) {
            map.put("theater", theater);
        }

        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = ss.selectList("board.list", map);
        if (list != null && !list.isEmpty()) {
            ar = new BoardVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }

    //원하는 게시물 검색
    public static BoardVO getBoard(String boardId) {
        SqlSession ss = FactoryService.getFactory().openSession();
        BoardVO board = ss.selectOne("board.getBoard", boardId);
        ss.close();
        return board;
    }

    //이전 게시물
    public static BoardVO getPreviousBoard(String bType, String boardIdx, String keyword, String region, String theater) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("bType", bType);
        map.put("boardIdx", boardIdx);

        // 검색어, 지역, 극장 값이 있을 때만 Map에 추가
        if (keyword != null && !keyword.isEmpty()) {
            map.put("keyword", keyword);
        }
        if (region != null && !region.isEmpty()) {
            map.put("region", region);
        }
        if (theater != null && !theater.isEmpty()) {
            map.put("theater", theater);
        }

        SqlSession ss = FactoryService.getFactory().openSession();
        BoardVO pboard = ss.selectOne("board.getPreviousBoard", map);
        ss.close();
        return pboard;
    }

    //다음 게시물
    public static BoardVO getNextBoard(String bType, String boardIdx, String keyword, String region, String theater) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("bType", bType);
        map.put("boardIdx", boardIdx);

        // 검색어, 지역, 극장 값이 있을 때만 Map에 추가
        if (keyword != null && !keyword.isEmpty()) {
            map.put("keyword", keyword);
        }
        if (region != null && !region.isEmpty()) {
            map.put("region", region);
        }
        if (theater != null && !theater.isEmpty()) {
            map.put("theater", theater);
        }

        SqlSession ss = FactoryService.getFactory().openSession();
        BoardVO nboard = ss.selectOne("board.getNextBoard", map);
        ss.close();
        return nboard;
    }

    //이벤트를 포함한 총 게시물 수를 반환
    public static int getAllTotalCount(String bType, String keyword, String region, String theater) {
        SqlSession ss = FactoryService.getFactory().openSession();

        HashMap<String, Object> map = new HashMap<>();

        if (bType != null && !bType.isEmpty()) {
            map.put("bType", bType);
        }
        // 검색어, 지역, 극장 조건이 있는 경우
        if (keyword != null && !keyword.isEmpty()) {
            map.put("keyword", keyword);
        }
        if (region != null && !region.isEmpty()) {
            map.put("region", region);
        }
        if (theater != null && !theater.isEmpty()) {
            map.put("theater", theater);
        }

        int cnt = ss.selectOne("board.totalAllCount", map);
        ss.close();

        return cnt;
    }

    // 이벤트를 포함한 목록
    public static BoardVO[] getAllList(String bType, int begin, int end, String keyword, String region, String theater) {
        BoardVO[] ar = null;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("begin", begin);// String.valueOf(begin)
        map.put("end", end);

        if (bType != null && !bType.isEmpty()) {
            map.put("bType", bType);
        }
        // 검색어, 지역, 극장 값이 있을 때만 Map에 추가
        if (keyword != null && !keyword.isEmpty()) {
            map.put("keyword", keyword);
        }
        if (region != null && !region.isEmpty()) {
            map.put("region", region);
        }
        if (theater != null && !theater.isEmpty()) {
            map.put("theater", theater);
        }

        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = ss.selectList("board.AllList", map);
        if (list != null && !list.isEmpty()) {
            ar = new BoardVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }

    //(이벤트를 포함한)이전 게시물
    public static BoardVO getAllPreviousBoard(String bType, String boardIdx, String keyword, String region, String theater) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("boardIdx", boardIdx);

        if (bType != null && !bType.isEmpty()) {
            map.put("bType", bType);
        }
        // 검색어, 지역, 극장 값이 있을 때만 Map에 추가
        if (keyword != null && !keyword.isEmpty()) {
            map.put("keyword", keyword);
        }
        if (region != null && !region.isEmpty()) {
            map.put("region", region);
        }
        if (theater != null && !theater.isEmpty()) {
            map.put("theater", theater);
        }

        SqlSession ss = FactoryService.getFactory().openSession();
        BoardVO pboard = ss.selectOne("board.getAllPreviousBoard", map);
        ss.close();
        return pboard;
    }

    //(이벤트를 포함한)다음 게시물
    public static BoardVO getAllNextBoard(String bType, String boardIdx, String keyword, String region, String theater) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("boardIdx", boardIdx);

        if (bType != null && !bType.isEmpty()) {
            map.put("bType", bType);
        }
        // 검색어, 지역, 극장 값이 있을 때만 Map에 추가
        if (keyword != null && !keyword.isEmpty()) {
            map.put("keyword", keyword);
        }
        if (region != null && !region.isEmpty()) {
            map.put("region", region);
        }
        if (theater != null && !theater.isEmpty()) {
            map.put("theater", theater);
        }

        SqlSession ss = FactoryService.getFactory().openSession();
        BoardVO nboard = ss.selectOne("board.getAllNextBoard", map);
        ss.close();
        return nboard;
    }

    // 선택된 항목 종료
    public static int endNotices(List<Integer> boardIdxList) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.update("board.endNotices", boardIdxList);

        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }
        ss.close();
        return cnt;
    }

    // 선택된 항목 게시
    public static int startNotices(List<Integer> boardIdxList) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.update("board.startNotices", boardIdxList);

        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }
        ss.close();
        return cnt;
    }

    //theaterIdx 가져오기
    public static String getTheaterIdx(String theater) {
        SqlSession ss = FactoryService.getFactory().openSession();
        String theaterIdx = ss.selectOne("board.getTheaterIdx", theater);
        ss.close();
        return theaterIdx;
    }

    //저장
    public static int addNotice(String adminIdx, String theaterIdx, String boardType, String boardTitle,
                                String boardContent, String boardExpDate, String boardStatus) {
        HashMap<String, String> map = new HashMap<>();
        map.put("adminIdx", adminIdx);
        map.put("theaterIdx", theaterIdx);
        map.put("boardType", boardType);
        map.put("boardTitle", boardTitle);
        map.put("boardContent", boardContent);
        map.put("boardExpDate", boardExpDate);
        map.put("boardStatus", boardStatus);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("board.add", map);
        if (cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();
        return cnt;
    }

}










