package mybatis.dao;

import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import mybatis.vo.UserVO;

import java.util.HashMap;
import java.util.Map;

public class LoginDAO {

  // 로그인 검증
  public static boolean usercheck(String userId, String userPassword) {
    SqlSession ss = FactoryService.getFactory().openSession();


    Map<String, String> map = new HashMap<>();
    map.put("userId", userId);
    map.put("userPassword", userPassword);


    int cnt = ss.selectOne("login.usercheck", map);
//        System.out.println("count" + cnt);
    ss.close();

    return cnt > 0;
  }

  // 비회원 로그인 검증
  public static UserVO nonMembercheck(String userName, String userEmail) {
    SqlSession ss = FactoryService.getFactory().openSession();

    Map<String, String> map = new HashMap<>();
    map.put("userName", userName);
    map.put("userEmail", userEmail);

    UserVO userVO = ss.selectOne("login.nonMemberCheck", map);
    ss.close();

    return userVO;  // 비회원 정보가 있으면 UserVO 반환, 없으면 null
  }

  // 비회원 정보 DB에 추가
  public static boolean addNonMember(String userName, String userEmail, String userAuthPassword) {
    SqlSession ss = FactoryService.getFactory().openSession();

    // 파라미터를 Map 형태로 전달
    Map<String, Object> map = new HashMap<>();
    map.put("userName", userName);
    map.put("userEmail", userEmail);
    map.put("userAuthPassword", userAuthPassword);

    int cnt = ss.insert("login.addNonMember", map);
    if (cnt > 0) {
      ss.commit();
    } else {
      ss.rollback();
    }
    ss.close();

    return cnt > 0;  // 성공적으로 삽입되었으면 true
  }



  // 유저 정보 가져오기
  public static UserVO getUserInfo(String userId) {
    SqlSession ss = FactoryService.getFactory().openSession();

    Map<String, String> map = new HashMap<>();
    map.put("userId", userId);

    UserVO userVO = ss.selectOne("login.getUserInfo", map);
    ss.close();

    return userVO;
  }
}