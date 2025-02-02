package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.PaymentVO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PaymentDAO {




    public static int getTotalPaymentCount() {
        SqlSession ss = null;
        int count = 0;
        try {
            ss = FactoryService.getFactory().openSession();
            count = ss.selectOne("payment.getTotalCount");
        } finally {
            if (ss != null) ss.close();
        }
        return count;
    }

    public static List<PaymentVO> getPaymentListByPage(int cPage, int numPerPage) {
        SqlSession ss = null;
        List<PaymentVO> payments = new ArrayList<>();
        try {
            ss = FactoryService.getFactory().openSession();
            Map<String, Object> params = new HashMap<>();
            params.put("offset", (cPage - 1) * numPerPage);
            params.put("limit", numPerPage);
            payments = ss.selectList("payment.selectByPage", params);
        } finally {
            if (ss != null) ss.close();
        }
        return payments;
    }

    public static PaymentVO[] searchPayment(String userId){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<PaymentVO> list = ss.selectList("payment.searchSelect",userId);
        ss.close();
        PaymentVO[] ar = new PaymentVO[list.size()];
        list.toArray(ar);
        return ar;
    }


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
    public static PaymentVO[] totalPayment() {
        SqlSession ss = null;
        PaymentVO[] ar = new PaymentVO[0]; // 기본적으로 빈 배열 반환

        try {
            ss = FactoryService.getFactory().openSession();
            List<PaymentVO> list = ss.selectList("payment.totalSelect");

            if (list != null && !list.isEmpty()) {
                ar = list.toArray(new PaymentVO[0]);
            }
        } catch (Exception e) {
            System.err.println("결제 내역 조회 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (ss != null) {
                ss.close(); // 세션 닫기
            }
        }

        return ar;
    }



}
