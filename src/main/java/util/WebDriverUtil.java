package util;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import javax.servlet.ServletContext;
import java.io.File;

public class WebDriverUtil {
    private static WebDriver driver;

    public static WebDriver getDriver(ServletContext context) {
        if (driver == null) {
            synchronized (WebDriverUtil.class) { // 멀티쓰레드 환경에서 안전하게 동기화
                if (driver == null) {
                    // `WEB-INF/driver/chromedriver.exe`의 실제 경로 찾기
                    String driverPath = context.getRealPath("/WEB-INF/driver/chromedriver.exe");

                    File driverFile = new File(driverPath);
                    if (!driverFile.exists()) {
                        throw new RuntimeException("ChromeDriver가 존재하지 않습니다: " + driverPath);
                    }

                    System.setProperty("webdriver.chrome.driver", driverPath);
                    driver = new ChromeDriver();
                }
            }
        }
        return driver;
    }

    public static void quitDriver() {
        if (driver != null) {
            synchronized (WebDriverUtil.class) {
                if (driver != null) { // 다시 한 번 체크
                    try {
                        driver.quit();
                    } catch (Exception e) {
                        System.out.println("WebDriver 종료 중 오류 발생: " + e.getMessage());
                    } finally {
                        driver = null; // 드라이버 객체 초기화
                    }
                }
            }
        }
    }
}
