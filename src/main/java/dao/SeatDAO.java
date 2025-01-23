package dao;

import mybatis.service.FactoryService;
import vo.SeatVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class SeatDAO {

    // 특정 상영관의 사용 가능한 좌석 목록 조회
    public static SeatVO[] getAvailableSeats(String screenIdx, String timetableIdx, String screenType, String ageGroup, String dayOfWeek, String timeOfDay) {
        SeatVO[] seats = null;

        HashMap<String, Object> map = new HashMap<>();
        map.put("screenIdx", screenIdx);     // 상영관 ID
        map.put("timetableIdx", timetableIdx); // 시간표 ID
        map.put("screenType", screenType);   // 상영관 유형
        map.put("ageGroup", ageGroup);       // 연령대
        map.put("dayOfWeek", dayOfWeek);     // 요일
        map.put("timeOfDay", timeOfDay);     // 시간대

        SqlSession ss = FactoryService.getFactory().openSession();
        List<SeatVO> list = ss.selectList("seat.getAvailableSeats", map);
        if (list != null && !list.isEmpty()) {
            seats = new SeatVO[list.size()];
            list.toArray(seats);
        }
        ss.close();
        return seats;
    }

    // 특정 좌석의 상태 업데이트 (예: 예약됨, 임시 확보 등)
    public static boolean updateSeatStatus(String seatIdx, String seatStatus) {
        boolean isUpdated = false;

        HashMap<String, Object> map = new HashMap<>();
        map.put("seatIdx", seatIdx);       // 좌석 ID
        map.put("seatStatus", seatStatus); // 변경할 상태

        SqlSession ss = FactoryService.getFactory().openSession();
        try {
            int result = ss.update("seat.updateSeatStatus", map);
            if (result > 0) {
                isUpdated = true;
                ss.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return isUpdated;
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

    // 특정 좌석의 가격 정보 가져오기
    public static int getSeatPrice(String screenType, String ageGroup, String dayOfWeek, String timeOfDay) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("screenType", screenType);
        map.put("ageGroup", ageGroup);
        map.put("dayOfWeek", dayOfWeek);
        map.put("timeOfDay", timeOfDay);

        SqlSession ss = FactoryService.getFactory().openSession();
        Integer price = ss.selectOne("seat.getSeatPrice", map);
        ss.close();
        return price != null ? price : 0;
    }
}
