package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.AdminVO;
import mybatis.vo.UserVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminManagementDAO {

  public static int getTotalCount(String searchType, String searchKeyword,
                                  String adminStatus, String adminLevel) {

    SqlSession ss = FactoryService.getFactory().openSession();

    HashMap<String, Object> map = new HashMap<>();
    map.put("searchType", searchType);
    map.put("searchKeyword", searchKeyword);
    map.put("adminStatus", adminStatus);
    map.put("adminLevel", adminLevel);

    int cnt = ss.selectOne("adminManagement.getTotalCount", map);
    ss.close();

    return cnt;
  }

  public static AdminVO[] getNonSuperAdmin(String searchType, String searchKeyword,
                                           String adminStatus, String adminLevel,
                                           int begin, int end) {

    SqlSession ss = FactoryService.getFactory().openSession();
    AdminVO[] ar = null;

    HashMap<String, Object> map = new HashMap<>();
    map.put("searchType", searchType);
    map.put("searchKeyword", searchKeyword);
    map.put("adminStatus", adminStatus);
    map.put("adminLevel", adminLevel);
    map.put("begin", begin);
    map.put("end", end);

    List<AdminVO> list = ss.selectList("adminManagement.getNonSuperAdmin", map);
    if (list != null && !list.isEmpty()) {
      ar = new AdminVO[list.size()];
      list.toArray(ar);
    }
    ss.close();

    return ar;
  }

  public static AdminVO getAdminByIdx(String adminIdx) {
    SqlSession ss = FactoryService.getFactory().openSession();
    AdminVO vo = null;

    try {
      vo = ss.selectOne("adminManagement.getAdminByIdx", adminIdx);
      if (vo == null) {
        System.out.println("DB에서 해당 adminIdx(" + adminIdx + ")를 찾을 수 없습니다.");
      } else {
        System.out.println("DB에서 가져온 사용자 정보: " + vo.toString());
      }
    } catch (Exception e) {
      System.out.println("getUserById 오류 발생: " + e.getMessage());
      e.printStackTrace();
    } finally {
      ss.close();
    }

    return vo;
  }

  public static boolean updateAdmin(AdminVO adminVO) {
    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      int cnt = ss.update("adminManagement.updateAdmin", adminVO);
      ss.commit();
      return cnt > 0;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    } finally {
      ss.close();
    }
  }

  public static boolean insertAdmin(AdminVO adminVO) {
    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      int cnt = ss.insert("adminManagement.insertAdmin", adminVO);
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
