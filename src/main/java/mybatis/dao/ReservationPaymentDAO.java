package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.*;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReservationPaymentDAO {

  // 유저의 쿠폰 리스트 조회
  public static List<CouponVO> userCouponList(String userIdx) {

    List<CouponVO> couponList = null;

    SqlSession ss = FactoryService.getFactory().openSession();
    couponList = ss.selectList("reservationPayment.getUserCouponList", userIdx);

    ss.close();
    return couponList;
  }

  public static ReservationTableVO insertReservation(ReservationTableVO reservation) {

    SqlSession ss = FactoryService.getFactory().openSession();
    try {
      // 1️⃣ 예약 정보 INSERT (reservationIdx & customReservationIdx 자동 생성)
      int result = ss.insert("reservationPayment.insertReservation", reservation);
      ss.commit();

      if (result > 0) {
        // 2️⃣ 방금 생성된 reservationIdx 기반으로 전체 데이터 가져오기
        ReservationTableVO insertedReservation = ss.selectOne("reservationPayment.getInsertedReservation", reservation.getReservationIdx());
        return insertedReservation; // 생성된 reservationIdx 및 customReservationIdx 반환
      }
      return null;
    } catch (Exception e) {
      e.printStackTrace();
      ss.rollback();
      return null;
    } finally {
      ss.close();
    }
  }

  public static boolean updateSeatStatus(String timetableIdx, String[] seatIdxList) {

    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      Map<String, Object> params = new HashMap<>();
      params.put("timetableIdx", timetableIdx);
      params.put("seatIdxList", seatIdxList);

      int result = ss.update("reservationPayment.updateSeatStatus", params);
      ss.commit();
      return result > 0;
    } catch (Exception e) {
      e.printStackTrace();
      ss.rollback();
      return false;
    } finally {
      ss.close();
    }
  }

  // 변경된 seatStatusIdx 값 받아오기
  public static String[] getUpdatedSeatStatusIdx(String timetableIdx, String[] seatIdxList) {

    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      Map<String, Object> params = new HashMap<>();
      params.put("timetableIdx", timetableIdx);
      params.put("seatIdxList", seatIdxList);

      List<String> seatStatusList = ss.selectList("reservationPayment.getUpdatedSeatStatusIdx", params);

      return seatStatusList.toArray(new String[seatStatusList.size()]);
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    } finally {
      ss.close();
    }
  }

  // 예약 좌석 매핑 테이블 추가
  public static boolean insertReservationSeatMapping(String reservationIdx, String[] seatIdxList, String[] seatStatusIdxList,
                                                     int adultCount, int studentCount, String adultPriceIdx, String studentPriceIdx) {
    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      List<ReservationSeatMappingVO> seatMappings = new ArrayList<>();

      // 좌석 리스트 개수만큼 반복하여 성인/청소년 가격 적용
      for (int i = 0; i < seatIdxList.length; i++) {
        ReservationSeatMappingVO mapping = new ReservationSeatMappingVO();
        mapping.setReservationIdx(reservationIdx);
        mapping.setSeatStatusIdx(seatStatusIdxList[i]);

        if (i < adultCount) {
          mapping.setPriceIdx(adultPriceIdx); // 성인 가격 적용
        } else {
          mapping.setPriceIdx(studentPriceIdx); // 청소년 가격 적용
        }
        seatMappings.add(mapping);
      }

      // Mybatis에 전달할 데이터
      Map<String, Object> params = new HashMap<>();
      params.put("seatMappings", seatMappings);

      int result = ss.insert("reservationPayment.insertReservationSeats", params);
      ss.commit();
      return result > 0;
    } catch (Exception e) {
      e.printStackTrace();
      ss.rollback();
      return false;
    } finally {
      ss.close();
    }
  }

  // 결제 정보 payment 테이블에 저장
  public static boolean insertPayment(ReservationPaymentVO payment, String totalDiscount) {

    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      payment.setPaymentDiscount(totalDiscount); // 총 할인 금액 적용

      int result = ss.insert("reservationPayment.insertPayment", payment);
      ss.commit();
      return result > 0;
    } catch (Exception e) {
      e.printStackTrace();
      ss.rollback();
      return false;
    } finally {
      ss.close();
    }
  }

  // 유저 테이블 포인트 차감
  public static boolean updateUserPointUsage(String userIdx, String pointDiscount, double getPointValue) {

    SqlSession ss = FactoryService.getFactory().openSession();

    int getPoint = (int) getPointValue;

    try {
      Map<String, Object> params = new HashMap<>();
      params.put("pointValue", pointDiscount);
      params.put("getPoint", getPoint);
      params.put("userIdx", userIdx);

      int result = ss.update("reservationPayment.updateUserPoint", params);
      ss.commit();
      return result > 0;
    } catch (Exception e) {
      e.printStackTrace();
      ss.rollback();
      return false;
    } finally {
      ss.close();
    }
  }

  // 포인트 테이블 포인트 사용내역, 적립내역 추가 추가
  public static boolean insertPointUsage(ReservationPointVO point) {

    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      int result = ss.insert("reservationPayment.insertPointUsage", point);
      ss.commit();
      return result > 0;
    } catch (Exception e) {
      e.printStackTrace();
      ss.rollback();
      return false;
    } finally {
      ss.close();
    }
  }

  // 쿠폰 사용시 쿠폰 stauts = 1 로 변경
  public static boolean updateCouponStatus(String couponIdx, String userIdx) {

    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      Map<String, Object> params = new HashMap<>();
      params.put("couponIdx", couponIdx);
      params.put("userIdx", userIdx);
      int result = ss.update("reservationPayment.updateCouponStatus", params);
      ss.commit();
      return result > 0;
    } catch (Exception e) {
      e.printStackTrace();
      ss.rollback();
      return false;
    } finally {
      ss.close();
    }
  }

  // 해당 예매내역 가져오기
  public static ReservationDetailVO getReservationDetail(String userIdx, String reservationIdx) {

    SqlSession ss = FactoryService.getFactory().openSession();

    Map<String, Object> params = new HashMap<>();
    params.put("userIdx", userIdx);
    params.put("reservationIdx", reservationIdx);

    ReservationDetailVO vo = ss.selectOne("reservationPayment.getReservationsByUserIdx", params);

    ss.close();

    return vo;
  }

  // 영화 관람 기록 추가
  public static boolean insertWatchedMovie(WatchedMovieVO watchedMovie) {

    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      int result = ss.insert("reservationPayment.insertWatchedMovie", watchedMovie);
      ss.commit();
      return result > 0;
    } catch (Exception e) {
      e.printStackTrace();
      ss.rollback();
      return false;
    } finally {
      ss.close();
    }
  }
}