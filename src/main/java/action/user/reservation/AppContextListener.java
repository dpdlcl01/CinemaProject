package action.user.reservation;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ReservationExpirationScheduler.start();
        System.out.println("예약 만료 스케줄러 시작됨");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ReservationExpirationScheduler.shutdown();
        System.out.println("예약 만료 스케줄러 종료됨");
    }
}
