package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.MovieVO;
import mybatis.vo.PaymentVO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PaymentDAO {

    // 관리자 화면에서 전체 결제 내역 개수 반환
    public static int countPayments(String searchType, String searchValue,
                            String paymentMonth, String paymentStatus, String paymentType) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);
        map.put("paymentMonth", paymentMonth);
        map.put("paymentStatus", paymentStatus);
        map.put("paymentType", paymentType);

        SqlSession ss = FactoryService.getFactory().openSession();
        int count = ss.selectOne("payment.countPayments", map);
        ss.close();

        return count;
    }

    // 결제 내역 목록 반환
    public static PaymentVO[] getPaymentList(String searchType, String searchValue,
                             String paymentMonth, String paymentStatus, String paymentType, int begin, int limit) {
        PaymentVO[] paymentArray = null;

        HashMap<String, Object> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);
        map.put("paymentMonth", paymentMonth);
        map.put("paymentStatus", paymentStatus);
        map.put("paymentType", paymentType);
        map.put("begin", begin);
        map.put("limit", limit);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<PaymentVO> list = ss.selectList("payment.getPaymentList", map);
        if (list != null && !list.isEmpty()) {
            paymentArray = new PaymentVO[list.size()];
            list.toArray(paymentArray);
        }
        ss.close();

        return paymentArray;
    }


    // 결제 idx를 받아서 해당 결제 상세 정보 가져오기 (관리자 결제 상세 조회)
    public static PaymentVO getPaymentByIdx(String paymentIdx){
        PaymentVO pvo = null;
        SqlSession ss = FactoryService.getFactory().openSession();
        pvo = ss.selectOne("payment.getPaymentByIdx", paymentIdx);
        ss.close();
        return pvo;
    }



    public static int insertPayment(PaymentVO vo,int totalAmount,int userIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("payment.insertPayment", vo);

        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }
        if(totalAmount>0){

        int paymentIdx = Integer.parseInt(vo.getPaymentIdx());// 자동 증가된 paymentIdx 가져오기

        HashMap<String,Integer> map = new HashMap<>();
        map.put("paymentIdx",paymentIdx);
        map.put("pointSource",(int)(totalAmount*0.1));
        map.put("userIdx",userIdx);

        cnt = ss.insert("point.insertPoint", map);
        ss.commit();
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
