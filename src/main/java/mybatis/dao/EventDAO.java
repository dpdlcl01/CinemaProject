package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.EventVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class EventDAO {

  // 진행중 이벤트 게시물 수를 반환
  public static int getTotalEventCount() {
    SqlSession ss = FactoryService.getFactory().openSession();
    int cnt = ss.selectOne("event.totalEventCount", "EVENT");
    ss.close();

    return cnt;
  }

  // 지난 이벤트 게시물 수를 반환
  public static int getTotalPastEventCount() {
    SqlSession ss = FactoryService.getFactory().openSession();
    int cnt = ss.selectOne("event.totalPastEventCount", "EVENT");
    ss.close();

    return cnt;
  }

  // 진행중인 이벤트 목록 반환
  public static EventVO[] getEventList(int offset, int pageSize) {

    EventVO[] ar = null;

    HashMap<String, String> map = new HashMap<>();
    map.put("offset", String.valueOf(offset));
    map.put("pageSize", String.valueOf(pageSize));

    SqlSession ss = FactoryService.getFactory().openSession();
    List<EventVO> list = ss.selectList("event.getEventList", map);

    if (list != null && !list.isEmpty()) {
      ar = new EventVO[list.size()];
      list.toArray(ar);
    }
    ss.close();

    return ar;
  }

  // 지난 이벤트 목록 반환
  public static EventVO[] getPastEventList(int offset, int pageSize) {

    EventVO[] ar = null;

    HashMap<String, String> map = new HashMap<>();
    map.put("offset", String.valueOf(offset));
    map.put("pageSize", String.valueOf(pageSize));

    SqlSession ss = FactoryService.getFactory().openSession();
    List<EventVO> list = ss.selectList("event.getPastEventList", map);

    if (list != null && !list.isEmpty()) {
      ar = new EventVO[list.size()];
      list.toArray(ar);
    }
    ss.close();

    return ar;
  }

  // 지난 이벤트 이름 검색 게시물 수 반환
  public static int getSearchTotalPastEventCount(String keyword) {
    SqlSession ss = FactoryService.getFactory().openSession();
    int cnt = ss.selectOne("SearchPastEventCount", keyword);
    ss.close();

    return cnt;
  }

  // 지난 이벤트 이름 검색 목록 반환
  public static EventVO[] searchPastEvent(int offset, int pageSize, String keyword) {

    EventVO[] ar = null;

    HashMap<String, String> map = new HashMap<>();
    map.put("offset", String.valueOf(offset));
    map.put("pageSize", String.valueOf(pageSize));
    map.put("keyword", keyword);

    SqlSession ss = FactoryService.getFactory().openSession();
    List<EventVO> list = ss.selectList("event.searchPastEvent", map);

    if (list != null && !list.isEmpty()) {
      ar = new EventVO[list.size()];
      list.toArray(ar);
    }
    ss.close();

    return ar;
  }

  // idx값으로 이벤트 검색
  public static EventVO searchBoardIdxEvent(int boardIdx) {
    EventVO vo = null;

    SqlSession ss = FactoryService.getFactory().openSession();
    vo = ss.selectOne("searchBoardIdxEvent", boardIdx);
    ss.close();

    return vo;
  }
}
