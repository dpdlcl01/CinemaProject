package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.BoardVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class BoardDAO {

    //총 게시물 수를 반환
    public static int getTotalCount(String bType) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.selectOne("board.totalCount", bType);
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
        if(keyword != null && !keyword.isEmpty()){
            map.put("keyword", keyword);
        }
        if(region != null && !region.isEmpty()){
            map.put("region", region);
        }
        if(theater != null && !theater.isEmpty()){
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

    //저장
    public static int add(String adminIdx, String theatherIdx, String boardType,
                          String boardTitle, String boardContent, String boardRegDate) {
        HashMap<String, String> map = new HashMap<>();
        map.put("adminIdx", adminIdx);
        map.put("theatherIdx", theatherIdx);
        map.put("boardType", boardType);
        map.put("boardTitle", boardTitle);
        map.put("boardContent", boardContent);
        map.put("boardRegDate", boardRegDate);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("board.add", map);
        if (cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();
        return cnt;
    }

    //원하는 게시물 검색
    public static BoardVO getBoard(String boardId) {
        SqlSession ss = FactoryService.getFactory().openSession();
        BoardVO board = ss.selectOne("board.getBoard", boardId);
        ss.close();
        return board;
    }

    //이전 게시물
    public static BoardVO getPreviousBoard(String boardId) {
        SqlSession ss = FactoryService.getFactory().openSession();
        BoardVO pboard = ss.selectOne("board.getPreviousBoard", boardId);
        ss.close();
        return pboard;
    }

    //다음 게시물
    public static BoardVO getNextBoard(String boardId) {
        SqlSession ss = FactoryService.getFactory().openSession();
        BoardVO nboard = ss.selectOne("board.getNextBoard", boardId);
        ss.close();
        return nboard;
    }
}










