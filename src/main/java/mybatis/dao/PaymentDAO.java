package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.PaymentVO;
import org.apache.ibatis.session.SqlSession;

public class PaymentDAO {


    public static int insertPayment(PaymentVO vo) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("payment.insertPayment", vo);

        if (cnt > 0) {
            ss.commit();

        }else{
            ss.rollback();
        }

        ss.close();

        return cnt;
    }
}
