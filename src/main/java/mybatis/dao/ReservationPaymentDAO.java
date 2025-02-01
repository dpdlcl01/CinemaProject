package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.CouponVO;
import mybatis.vo.MovieVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ReservationPaymentDAO {

  // 유저의 쿠폰 리스트 조회
  public static List<CouponVO> userCouponList(String userIdx) {
    List<CouponVO> couponList = null;

    SqlSession ss = FactoryService.getFactory().openSession();
    couponList = ss.selectList("reservationPayment.getUserCouponList", userIdx);

    ss.close();
    return couponList;
  }

}