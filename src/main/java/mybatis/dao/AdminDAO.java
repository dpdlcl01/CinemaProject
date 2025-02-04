package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.LogVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class AdminDAO {

    public static List<Map<String,String>> getTheaterList() {

        SqlSession ss = FactoryService.getFactory().openSession();

        List<Map<String,String>> ar = ss.selectList("admin.getTheaterList");

        ss.close();
        return ar;
    }
}