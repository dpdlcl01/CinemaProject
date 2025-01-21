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
    public static BoardVO[] getList(String bType, int begin, int end) {
        BoardVO[] ar = null;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("bType", bType);
        map.put("begin", begin);// String.valueOf(begin)
        map.put("end", end);

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
}










