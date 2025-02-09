package mybatis.dao;

import mybatis.service.FactoryService;
import mybatis.vo.PriceVO;
import mybatis.vo.SeatVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SeatDAO {
    public static int delSeat(String seatIdx) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int result = ss.delete("seat.delSeat", seatIdx);
        if(result > 0) {
            ss.commit();
        }else {

            ss.rollback();
        }
        ss.close();
        return result;

    }

    // 특정 상영관의 사용 가능한 좌석 목록 조회
    public static SeatVO[] getAllSeats(String screenIdx, String timetableIdx) {
        SeatVO[] seats = null;

        HashMap<String, Object> map = new HashMap<>();
        map.put("screenIdx", screenIdx);
        map.put("timetableIdx", timetableIdx);

    SqlSession ss = FactoryService.getFactory().openSession();
    List<SeatVO> list = ss.selectList("seat.availableSeats", map);
    if (list != null && !list.isEmpty()) {
      seats = new SeatVO[list.size()];
      list.toArray(seats);
    }
    ss.close();
    return seats;
  }

    // 특정 좌석의 가격 정보 가져오기
    public static PriceVO getSeatPrice(String screenType, String ageGroup, int dayOfWeek, int timeOfDay) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("screenType", screenType);
        map.put("ageGroup", ageGroup);
        map.put("dayOfWeek", dayOfWeek);
        map.put("timeOfDay", timeOfDay);

        PriceVO priceVO = null;

        SqlSession ss = FactoryService.getFactory().openSession();
        priceVO = ss.selectOne("seat.getSeatPrice", map);
        ss.close();

        if (priceVO == null) {
            System.out.println("데이터가 조회되지 않음 (null 반환)");
            return null;
        }
        System.out.println("조회된 가격: " + priceVO);
        return priceVO;

    }

    // 좌석 예약 insert
    public static int insertSeatStatus(String timetableIdx, int seatIdx) {
        Map<String, Object> map = new HashMap<>();
        map.put("timetableIdx", timetableIdx);
        map.put("seatStatus", 2); // 예약 상태 (2)
        map.put("seatIdx", seatIdx);

        SqlSession ss = FactoryService.getFactory().openSession();
        int result = ss.insert("seat.insertSeatStatus", map);

        if (result > 0) {
            ss.commit(); // 성공 시 commit 호출
            System.out.println("DAO에서 좌석 예약 성공: timetableIdx=" + timetableIdx + ", seatIdx=" + seatIdx);
        } else {
            ss.rollback();
            System.out.println("좌석 예약 실패");
        }

        ss.close(); // 세션 닫기
        return result;
    }


    // 예매-좌석 매핑 데이터 저장
    public static boolean saveReservationSeatMapping(String reservationIdx, String seatIdx, String priceIdx) {
        boolean isSaved = false;

        HashMap<String, Object> map = new HashMap<>();
        map.put("reservationIdx", reservationIdx); // 예매 ID
        map.put("seatIdx", seatIdx);               // 좌석 ID
        map.put("priceIdx", priceIdx);             // 가격 설정 ID

        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            int result = ss.insert("seat.saveReservationSeatMapping", map);
            if (result > 0) {
                isSaved = true;
                ss.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return isSaved;
    }

    // 좌석 예약 delete
    public static int deleteExpiredReservations() {
        Map<String, Object> map = new HashMap<>();

        SqlSession ss = FactoryService.getFactory().openSession();
        int result = ss.delete("seat.deleteExpiredReservations", map);
        if(result > 0) {
            ss.commit();
            System.out.println("만료된 예약 " + result + "건 삭제");
        } else {
            ss.rollback();
        }
        ss.close();
        return result;
    }

}
