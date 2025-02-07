package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.mindrot.jbcrypt.BCrypt;

import java.util.HashMap;
import java.util.Map;

public class UserDAO {

    public static boolean checkPassword(String userId, String userPassword) {
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            // 데이터베이스에서 암호화된 비밀번호 가져오기
            String hashedPassword = ss.selectOne("user.getPasswordByUserId", userId);
            System.out.println("DAO: hashedPassword = " + hashedPassword);

            // BCrypt로 입력된 비밀번호와 비교
            if (hashedPassword != null) {
                return BCrypt.checkpw(userPassword, hashedPassword);
            }
            return false;
        } finally {
            ss.close();
        }
    }

    // 사용자 상태 업데이트
    public static boolean updateUserStatus(String userId) {
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            int result = ss.update("user.updateUserStatus", userId);
            ss.commit();
            return result > 0;
        } finally {
            ss.close();
        }
    }

    // 사용자 정보 조회 (필요 시 사용)
    public static UserVO getUserById(String userId) {
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            return ss.selectOne("user.getUserById", userId);
        } finally {
            ss.close();
        }
    }
}

