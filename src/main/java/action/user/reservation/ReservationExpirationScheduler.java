package action.user.reservation;

import mybatis.dao.SeatDAO;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class ReservationExpirationScheduler {
    private static final ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();

    public static void start() {
        scheduler.scheduleAtFixedRate(() -> {
            try {
                SeatDAO.deleteExpiredReservations();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }, 0, 1, TimeUnit.MINUTES);  // 1분마다 실행
    }

    public static void shutdown() {
        scheduler.shutdown();
    }
}
