package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.PaymentVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

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
    public static PaymentVO[] totalPayment(){

        SqlSession ss = FactoryService.getFactory().openSession();
        List<PaymentVO> list = ss.selectList("payment.totalSelect");
        ss.close();
        PaymentVO[] ar = new PaymentVO[list.size()];
        list.toArray(ar);

        return ar;

    }


}
